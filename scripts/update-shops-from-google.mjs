#!/usr/bin/env node
/**
 * Discover and refresh card shops from Google Places API (New).
 *
 * Usage:
 *   node scripts/update-shops-from-google.mjs --dry-run
 *   node scripts/update-shops-from-google.mjs --apply
 *
 * Env vars (reads from .env.local):
 *   NEXT_PUBLIC_GOOGLE_MAPS_API_KEY
 *   SUPABASE_SERVICE_ROLE_KEY
 *   NEXT_PUBLIC_SUPABASE_URL
 */

import { mkdirSync, readFileSync, writeFileSync } from 'fs';
import { dirname, resolve } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(__dirname, '..');
const dryRun = !process.argv.includes('--apply');
const reportOnly = process.argv.includes('--report-only');
const maxNewPerRegion = Number(readArg('--max-new-per-region') ?? 4);

const DAY_MAP = {
  0: 'sunday',
  1: 'monday',
  2: 'tuesday',
  3: 'wednesday',
  4: 'thursday',
  5: 'friday',
  6: 'saturday',
};

const KNOWN_CARD_SHOP_TERMS = [
  'card',
  'tcg',
  'trading card',
  'pokemon',
  'pokémon',
  'ポケモン',
  'ポケカ',
  'カード',
  'トレカ',
  'カードラボ',
  'フルコンプ',
  'magi',
  'ドラゴンスター',
  '晴れる屋',
  'ホビーステーション',
  'イエローサブマリン',
  '竜星',
  'clove',
  'big magic',
  'hareruya',
  'mint',
  '193',
  'paо',
  'pao',
  'ブックオフ',
  'bookoff',
];

function readArg(name) {
  const index = process.argv.indexOf(name);
  if (index === -1) return null;
  return process.argv[index + 1] ?? null;
}

function loadEnv() {
  const envPath = resolve(repoRoot, '.env.local');
  const envContent = readFileSync(envPath, 'utf-8');
  const env = {};
  let currentKey = null;
  let currentVal = '';

  for (const line of envContent.split('\n')) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith('#')) continue;
    const match = trimmed.match(/^([A-Z0-9_]+)=(.*)/);
    if (match) {
      if (currentKey) env[currentKey] = cleanEnvValue(currentVal);
      currentKey = match[1];
      currentVal = match[2];
    } else if (currentKey) {
      currentVal += trimmed;
    }
  }

  if (currentKey) env[currentKey] = cleanEnvValue(currentVal);
  return env;
}

function cleanEnvValue(value) {
  return value.replace(/^['"]|['"]$/g, '');
}

const env = loadEnv();
const GOOGLE_API_KEY = env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;
const SUPABASE_URL = env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = env.SUPABASE_SERVICE_ROLE_KEY;

if (!GOOGLE_API_KEY || !SUPABASE_URL || !SUPABASE_KEY) {
  console.error('Missing env vars');
  process.exit(1);
}

function normalizeName(name) {
  return (name ?? '')
    .toLowerCase()
    .normalize('NFKC')
    .replace(/[()\[\]【】（）「」『』]/g, ' ')
    .replace(/\s+/g, '')
    .trim();
}

function distanceMeters(a, b) {
  const earth = 6371000;
  const lat1 = toRad(a.lat);
  const lat2 = toRad(b.lat);
  const dLat = toRad(b.lat - a.lat);
  const dLng = toRad(b.lng - a.lng);
  const h =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(lat1) * Math.cos(lat2) * Math.sin(dLng / 2) ** 2;
  return 2 * earth * Math.asin(Math.sqrt(h));
}

function toRad(value) {
  return (value * Math.PI) / 180;
}

function convertPeriods(periods) {
  if (!periods?.length) return null;
  const hours = {};

  for (const period of periods) {
    const dayName = DAY_MAP[period.open?.day];
    if (!dayName || period.open.hour === undefined) continue;
    const openTime = `${String(period.open.hour).padStart(2, '0')}:${String(period.open.minute ?? 0).padStart(2, '0')}`;
    const closeTime = period.close?.hour === undefined
      ? '23:59'
      : `${String(period.close.hour).padStart(2, '0')}:${String(period.close.minute ?? 0).padStart(2, '0')}`;
    hours[dayName] = { open: openTime, close: closeTime };
  }

  return Object.keys(hours).length ? hours : null;
}

function isLikelyCardShop(place) {
  const haystack = normalizeName([
    place.displayName?.text,
    place.formattedAddress,
    ...(place.types ?? []),
  ].join(' '));
  return KNOWN_CARD_SHOP_TERMS.some((term) => haystack.includes(normalizeName(term)));
}

function buildQueries(region) {
  return [
    `${region.name_jp} ポケモンカードショップ`,
    `${region.name_jp} トレカショップ`,
    `${region.name_en} Pokemon card shop`,
    `${region.city} ${region.name_jp} カードラボ フルコンプ ホビーステーション`,
  ];
}

async function supabaseFetch(path) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/${path}`, {
    headers: {
      apikey: SUPABASE_KEY,
      Authorization: `Bearer ${SUPABASE_KEY}`,
    },
  });

  if (!res.ok) {
    throw new Error(`Supabase fetch error ${res.status}: ${await res.text()}`);
  }

  return res.json();
}

async function supabasePatch(table, id, body) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/${table}?id=eq.${id}`, {
    method: 'PATCH',
    headers: {
      apikey: SUPABASE_KEY,
      Authorization: `Bearer ${SUPABASE_KEY}`,
      'Content-Type': 'application/json',
      Prefer: 'return=minimal',
    },
    body: JSON.stringify(body),
  });

  if (!res.ok) {
    throw new Error(`Supabase patch error ${res.status}: ${await res.text()}`);
  }
}

async function supabaseInsert(table, body) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/${table}`, {
    method: 'POST',
    headers: {
      apikey: SUPABASE_KEY,
      Authorization: `Bearer ${SUPABASE_KEY}`,
      'Content-Type': 'application/json',
      Prefer: 'return=representation',
    },
    body: JSON.stringify(body),
  });

  if (!res.ok) {
    throw new Error(`Supabase insert error ${res.status}: ${await res.text()}`);
  }

  return res.json();
}

async function searchPlaces(textQuery, region) {
  const res = await fetch('https://places.googleapis.com/v1/places:searchText', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': GOOGLE_API_KEY,
      'X-Goog-FieldMask': [
        'places.id',
        'places.displayName',
        'places.formattedAddress',
        'places.location',
        'places.businessStatus',
        'places.rating',
        'places.userRatingCount',
        'places.websiteUri',
        'places.nationalPhoneNumber',
        'places.regularOpeningHours',
        'places.types',
      ].join(','),
    },
    body: JSON.stringify({
      textQuery,
      languageCode: 'ja',
      regionCode: 'JP',
      maxResultCount: 20,
      locationBias: {
        circle: {
          center: {
            latitude: Number(region.center_lat),
            longitude: Number(region.center_lng),
          },
          radius: 6000,
        },
      },
    }),
  });

  if (!res.ok) {
    throw new Error(`Google search error ${res.status}: ${await res.text()}`);
  }

  const data = await res.json();
  return data.places ?? [];
}

function buildShopPayload(place, region) {
  const lat = place.location.latitude;
  const lng = place.location.longitude;
  const displayName = place.displayName?.text ?? 'Unknown Shop';
  const openHours = convertPeriods(place.regularOpeningHours?.periods);

  return {
    name_jp: displayName,
    name_en: displayName,
    region_id: region.id,
    address_jp: place.formattedAddress ?? '',
    address_en: place.formattedAddress ?? '',
    location: `SRID=4326;POINT(${lng} ${lat})`,
    google_place_id: place.id,
    phone: place.nationalPhoneNumber ?? null,
    website_url: place.websiteUri ?? null,
    open_hours: openHours,
    google_rating: place.rating ?? null,
    google_review_count: place.userRatingCount ?? null,
    is_active: true,
    sells_singles: true,
    sells_sealed_pack: true,
    payment_methods: ['cash'],
  };
}

function buildExistingPatch(place) {
  const lat = place.location.latitude;
  const lng = place.location.longitude;
  const openHours = convertPeriods(place.regularOpeningHours?.periods);
  const patch = {
    location: `SRID=4326;POINT(${lng} ${lat})`,
    google_rating: place.rating ?? null,
    google_review_count: place.userRatingCount ?? null,
    updated_at: new Date().toISOString(),
  };

  if (place.formattedAddress) {
    patch.address_jp = place.formattedAddress;
    patch.address_en = place.formattedAddress;
  }
  if (place.nationalPhoneNumber) patch.phone = place.nationalPhoneNumber;
  if (place.websiteUri) patch.website_url = place.websiteUri;
  if (openHours) patch.open_hours = openHours;

  return patch;
}

async function main() {
  console.log(dryRun ? '=== DRY RUN ===' : '=== APPLYING SHOP UPDATES ===');
  console.log(reportOnly ? 'Report-only mode: existing shops will not be patched.' : '');

  const regions = await supabaseFetch(
    'regions?select=id,name_en,name_jp,city,prefecture,center_lat,center_lng,is_active&is_active=eq.true&order=name_en'
  );
  const existingShops = await supabaseFetch(
    'shops_with_coords?select=id,name_jp,name_en,region_id,google_place_id,is_active,lat,lng,address_en&order=name_en&limit=1000'
  );

  const byPlaceId = new Map(existingShops.filter((shop) => shop.google_place_id).map((shop) => [shop.google_place_id, shop]));
  const foundPlaces = new Map();
  const report = {
    generated_at: new Date().toISOString(),
    dry_run: dryRun,
    regions: regions.length,
    existing_shops: existingShops.length,
    updated_existing: [],
    new_inserted: [],
    new_candidates: [],
    skipped_duplicates: [],
    skipped_low_confidence: [],
    errors: [],
  };

  for (const region of regions) {
    console.log(`\nRegion: ${region.name_en} (${region.name_jp})`);
    const queries = buildQueries(region);

    for (const query of queries) {
      try {
        const places = await searchPlaces(query, region);
        console.log(`  ${query}: ${places.length} results`);

        for (const place of places) {
          if (!place.id || !place.location) continue;
          if (!foundPlaces.has(place.id)) foundPlaces.set(place.id, { place, region });
        }
      } catch (err) {
        report.errors.push({ region: region.name_en, query, error: err.message });
        console.error(`  ERROR ${query}: ${err.message}`);
      }

      await new Promise((resolveDelay) => setTimeout(resolveDelay, 120));
    }
  }

  const newPerRegion = new Map();

  for (const { place, region } of foundPlaces.values()) {
    const loc = { lat: place.location.latitude, lng: place.location.longitude };
    const existingByPlaceId = byPlaceId.get(place.id);

    if (existingByPlaceId) {
      const patch = buildExistingPatch(place);
      report.updated_existing.push({
        id: existingByPlaceId.id,
        name: existingByPlaceId.name_en,
        google_place_id: place.id,
        business_status: place.businessStatus ?? null,
        google_rating: patch.google_rating,
        google_review_count: patch.google_review_count,
      });

      if (!dryRun && !reportOnly) {
        await supabasePatch('shops', existingByPlaceId.id, patch);
      }
      continue;
    }

    const nearest = existingShops
      .filter((shop) => Number.isFinite(Number(shop.lat)) && Number.isFinite(Number(shop.lng)))
      .map((shop) => ({
        shop,
        distance: distanceMeters({ lat: Number(shop.lat), lng: Number(shop.lng) }, loc),
      }))
      .sort((a, b) => a.distance - b.distance)[0];

    const normalizedPlaceName = normalizeName(place.displayName?.text);
    const isSameName = existingShops.some((shop) => {
      const jp = normalizeName(shop.name_jp);
      const en = normalizeName(shop.name_en);
      return jp && (normalizedPlaceName.includes(jp) || jp.includes(normalizedPlaceName)) ||
        en && (normalizedPlaceName.includes(en) || en.includes(normalizedPlaceName));
    });

    if (nearest?.distance < 60 || isSameName) {
      report.skipped_duplicates.push({
        name: place.displayName?.text,
        google_place_id: place.id,
        nearest_name: nearest?.shop.name_en,
        nearest_distance_m: nearest ? Math.round(nearest.distance) : null,
      });
      continue;
    }

    if (!isLikelyCardShop(place)) {
      report.skipped_low_confidence.push({
        name: place.displayName?.text,
        google_place_id: place.id,
        address: place.formattedAddress,
        types: place.types,
      });
      continue;
    }

    const count = newPerRegion.get(region.id) ?? 0;
    const candidate = {
      name: place.displayName?.text,
      google_place_id: place.id,
      region: region.name_en,
      address: place.formattedAddress,
      business_status: place.businessStatus,
      rating: place.rating ?? null,
      review_count: place.userRatingCount ?? null,
      nearest_name: nearest?.shop.name_en ?? null,
      nearest_distance_m: nearest ? Math.round(nearest.distance) : null,
    };

    if (count >= maxNewPerRegion) {
      report.new_candidates.push({ ...candidate, reason: 'max_new_per_region' });
      continue;
    }

    report.new_candidates.push(candidate);
    newPerRegion.set(region.id, count + 1);

    if (!dryRun && !reportOnly) {
      const inserted = await supabaseInsert('shops', buildShopPayload(place, region));
      report.new_inserted.push({
        id: inserted[0]?.id,
        ...candidate,
      });
      console.log(`  INSERT ${place.displayName?.text}`);
    }
  }

  mkdirSync(resolve(repoRoot, 'tmp'), { recursive: true });
  const reportPath = resolve(repoRoot, 'tmp', `shop-update-report-${new Date().toISOString().replace(/[:.]/g, '-')}.json`);
  writeFileSync(reportPath, JSON.stringify(report, null, 2));

  console.log('\nSummary');
  console.log(`  Existing shops seen: ${existingShops.length}`);
  console.log(`  Google places found: ${foundPlaces.size}`);
  console.log(`  Existing updates: ${report.updated_existing.length}`);
  console.log(`  New candidates: ${report.new_candidates.length}`);
  console.log(`  New inserted: ${report.new_inserted.length}`);
  console.log(`  Duplicate skipped: ${report.skipped_duplicates.length}`);
  console.log(`  Low confidence skipped: ${report.skipped_low_confidence.length}`);
  console.log(`  Errors: ${report.errors.length}`);
  console.log(`  Report: ${reportPath}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
