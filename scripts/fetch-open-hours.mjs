#!/usr/bin/env node
/**
 * Fetch opening hours from Google Places API (New) and update Supabase.
 *
 * Usage: node scripts/fetch-open-hours.mjs
 *
 * Env vars (reads from .env.local):
 *   NEXT_PUBLIC_GOOGLE_MAPS_API_KEY
 *   SUPABASE_SERVICE_ROLE_KEY
 *   NEXT_PUBLIC_SUPABASE_URL
 */

import { readFileSync } from 'fs';
import { resolve, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

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
    // Continuation of multiline value
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

const DAY_MAP = {
  0: 'sunday',
  1: 'monday',
  2: 'tuesday',
  3: 'wednesday',
  4: 'thursday',
  5: 'friday',
  6: 'saturday',
};

function convertPeriods(periods) {
  // Google Places API (New) regularOpeningHours.periods format:
  // { open: { day: 0-6, hour: 10, minute: 0 }, close: { day: 0-6, hour: 20, minute: 0 } }
  const hours = {};
  for (const period of periods) {
    const dayName = DAY_MAP[period.open.day];
    if (!dayName) continue;
    const openTime = `${String(period.open.hour).padStart(2, '0')}:${String(period.open.minute).padStart(2, '0')}`;
    const closeTime = period.close
      ? `${String(period.close.hour).padStart(2, '0')}:${String(period.close.minute).padStart(2, '0')}`
      : '23:59';
    hours[dayName] = { open: openTime, close: closeTime };
  }
  return hours;
}

async function fetchPlaceHours(placeId) {
  const url = `https://places.googleapis.com/v1/places/${placeId}?fields=regularOpeningHours&key=${GOOGLE_API_KEY}`;
  const res = await fetch(url);
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`Google API error ${res.status}: ${text}`);
  }
  const data = await res.json();
  if (!data.regularOpeningHours?.periods) return null;
  return convertPeriods(data.regularOpeningHours.periods);
}

async function updateShop(id, openHours) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/shops?id=eq.${id}`, {
    method: 'PATCH',
    headers: {
      'apikey': SUPABASE_KEY,
      'Authorization': `Bearer ${SUPABASE_KEY}`,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal',
    },
    body: JSON.stringify({ open_hours: openHours }),
  });
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`Supabase update error ${res.status}: ${text}`);
  }
}

async function main() {
  // Fetch all shops with google_place_id
  const res = await fetch(
    `${SUPABASE_URL}/rest/v1/shops?select=id,name_en,google_place_id&google_place_id=not.is.null&order=name_en&limit=300`,
    {
      headers: {
        'apikey': SUPABASE_KEY,
        'Authorization': `Bearer ${SUPABASE_KEY}`,
      },
    }
  );
  const shops = await res.json();
  console.log(`Found ${shops.length} shops with google_place_id`);

  let success = 0;
  let noHours = 0;
  let errors = 0;

  for (let i = 0; i < shops.length; i++) {
    const shop = shops[i];
    const progress = `[${i + 1}/${shops.length}]`;
    try {
      const hours = await fetchPlaceHours(shop.google_place_id);
      if (hours && Object.keys(hours).length > 0) {
        await updateShop(shop.id, hours);
        console.log(`${progress} ✓ ${shop.name_en} — ${Object.keys(hours).length} days`);
        success++;
      } else {
        console.log(`${progress} - ${shop.name_en} — no hours available`);
        noHours++;
      }
    } catch (err) {
      console.error(`${progress} ✗ ${shop.name_en} — ${err.message}`);
      errors++;
    }
    // Small delay to avoid rate limiting
    if (i % 10 === 9) await new Promise((r) => setTimeout(r, 200));
  }

  console.log(`\nDone! Success: ${success}, No hours: ${noHours}, Errors: ${errors}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
