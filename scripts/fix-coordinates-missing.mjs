#!/usr/bin/env node
/**
 * Fix coordinates for shops WITHOUT google_place_id.
 * Uses Google Places Text Search API to find shops by name + address,
 * then updates both coordinates and google_place_id.
 *
 * Usage: node scripts/fix-coordinates-missing.mjs [--dry-run]
 */

import { readFileSync } from 'fs';
import { resolve, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const dryRun = process.argv.includes('--dry-run');

// Load .env.local
const envPath = resolve(__dirname, '..', '.env.local');
const envContent = readFileSync(envPath, 'utf-8');
const env = {};
let currentKey = null;
let currentVal = '';
for (const line of envContent.split('\n')) {
  const trimmed = line.trim();
  if (!trimmed || trimmed.startsWith('#')) continue;
  const match = trimmed.match(/^([A-Z_]+)=(.*)/);
  if (match) {
    if (currentKey) env[currentKey] = currentVal;
    currentKey = match[1];
    currentVal = match[2];
  } else if (currentKey) {
    currentVal += trimmed;
  }
}
if (currentKey) env[currentKey] = currentVal;

const GOOGLE_API_KEY = env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;
const SUPABASE_URL = env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = env.SUPABASE_SERVICE_ROLE_KEY;

if (!GOOGLE_API_KEY || !SUPABASE_URL || !SUPABASE_KEY) {
  console.error('Missing env vars');
  process.exit(1);
}

async function searchPlace(query) {
  const res = await fetch('https://places.googleapis.com/v1/places:searchText', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': GOOGLE_API_KEY,
      'X-Goog-FieldMask': 'places.id,places.displayName,places.location',
    },
    body: JSON.stringify({
      textQuery: query,
      languageCode: 'ja',
    }),
  });
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`Google API error ${res.status}: ${text}`);
  }
  const data = await res.json();
  if (!data.places || data.places.length === 0) return null;
  const place = data.places[0];
  return {
    placeId: place.id,
    lat: place.location.latitude,
    lng: place.location.longitude,
    displayName: place.displayName?.text || '',
  };
}

async function updateShop(id, placeId, lat, lng) {
  const point = `SRID=4326;POINT(${lng} ${lat})`;
  const body = { location: point };
  if (placeId) body.google_place_id = placeId;

  const res = await fetch(`${SUPABASE_URL}/rest/v1/shops?id=eq.${id}`, {
    method: 'PATCH',
    headers: {
      'apikey': SUPABASE_KEY,
      'Authorization': `Bearer ${SUPABASE_KEY}`,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal',
    },
    body: JSON.stringify(body),
  });
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`Supabase update error ${res.status}: ${text}`);
  }
}

async function main() {
  console.log(dryRun ? '=== DRY RUN ===' : '=== Updating coordinates (missing place_id) ===');

  const res = await fetch(
    `${SUPABASE_URL}/rest/v1/shops?select=id,name_en,name_jp,address_en,address_jp,google_place_id&google_place_id=is.null&is_active=eq.true&order=name_en&limit=100`,
    {
      headers: {
        'apikey': SUPABASE_KEY,
        'Authorization': `Bearer ${SUPABASE_KEY}`,
      },
    }
  );
  const shops = await res.json();
  console.log(`Found ${shops.length} shops without google_place_id\n`);

  let updated = 0;
  let skipped = 0;
  let errors = 0;

  for (let i = 0; i < shops.length; i++) {
    const shop = shops[i];
    const progress = `[${i + 1}/${shops.length}]`;
    // Use Japanese name + address for better search accuracy
    const query = `${shop.name_jp || shop.name_en} ${shop.address_jp || shop.address_en}`;
    try {
      const result = await searchPlace(query);
      if (!result) {
        console.log(`${progress} SKIP ${shop.name_en} — not found`);
        skipped++;
        continue;
      }

      if (dryRun) {
        console.log(`${progress} ${shop.name_en} -> ${result.displayName} lat=${result.lat.toFixed(7)}, lng=${result.lng.toFixed(7)} (${result.placeId})`);
      } else {
        await updateShop(shop.id, result.placeId, result.lat, result.lng);
        console.log(`${progress} OK ${shop.name_en} -> ${result.displayName} lat=${result.lat.toFixed(7)}, lng=${result.lng.toFixed(7)}`);
      }
      updated++;
    } catch (err) {
      console.error(`${progress} ERR ${shop.name_en} — ${err.message}`);
      errors++;
    }
    // Rate limiting
    if (i % 5 === 4) await new Promise((r) => setTimeout(r, 300));
  }

  console.log(`\nDone! Updated: ${updated}, Skipped: ${skipped}, Errors: ${errors}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
