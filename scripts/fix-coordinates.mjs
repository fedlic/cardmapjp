#!/usr/bin/env node
/**
 * Fix shop coordinates by fetching precise lat/lng from Google Places API.
 *
 * Usage: node scripts/fix-coordinates.mjs [--dry-run]
 *
 * Reads google_place_id from each shop and fetches the exact location
 * from Google Places API (New), then updates the PostGIS geometry in Supabase.
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

async function fetchPlaceLocation(placeId) {
  const url = `https://places.googleapis.com/v1/places/${placeId}?fields=location&key=${GOOGLE_API_KEY}`;
  const res = await fetch(url);
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`Google API error ${res.status}: ${text}`);
  }
  const data = await res.json();
  if (!data.location) return null;
  return { lat: data.location.latitude, lng: data.location.longitude };
}

async function updateShopLocation(id, lat, lng) {
  // Update the PostGIS geometry point
  // We use the RPC approach or raw SQL via PostgREST
  // Since we can't run raw SQL, we update using a point format that Supabase accepts
  const point = `SRID=4326;POINT(${lng} ${lat})`;
  const res = await fetch(`${SUPABASE_URL}/rest/v1/shops?id=eq.${id}`, {
    method: 'PATCH',
    headers: {
      'apikey': SUPABASE_KEY,
      'Authorization': `Bearer ${SUPABASE_KEY}`,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal',
    },
    body: JSON.stringify({ location: point }),
  });
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`Supabase update error ${res.status}: ${text}`);
  }
}

async function main() {
  console.log(dryRun ? '=== DRY RUN ===' : '=== Updating coordinates ===');

  // Fetch all shops with google_place_id
  const res = await fetch(
    `${SUPABASE_URL}/rest/v1/shops?select=id,name_en,location,google_place_id&google_place_id=not.is.null&order=name_en&limit=300`,
    {
      headers: {
        'apikey': SUPABASE_KEY,
        'Authorization': `Bearer ${SUPABASE_KEY}`,
      },
    }
  );
  const shops = await res.json();
  console.log(`Found ${shops.length} shops with google_place_id\n`);

  let updated = 0;
  let skipped = 0;
  let errors = 0;

  for (let i = 0; i < shops.length; i++) {
    const shop = shops[i];
    const progress = `[${i + 1}/${shops.length}]`;
    try {
      const loc = await fetchPlaceLocation(shop.google_place_id);
      if (!loc) {
        console.log(`${progress} - ${shop.name_en} — no location from API`);
        skipped++;
        continue;
      }

      if (dryRun) {
        console.log(`${progress} ${shop.name_en} — would update to lat=${loc.lat.toFixed(7)}, lng=${loc.lng.toFixed(7)}`);
      } else {
        await updateShopLocation(shop.id, loc.lat, loc.lng);
        console.log(`${progress} OK ${shop.name_en} — lat=${loc.lat.toFixed(7)}, lng=${loc.lng.toFixed(7)}`);
      }
      updated++;
    } catch (err) {
      console.error(`${progress} ERR ${shop.name_en} — ${err.message}`);
      errors++;
    }
    // Rate limiting: Google Places API allows 600 QPM
    if (i % 10 === 9) await new Promise((r) => setTimeout(r, 200));
  }

  console.log(`\nDone! Updated: ${updated}, Skipped: ${skipped}, Errors: ${errors}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
