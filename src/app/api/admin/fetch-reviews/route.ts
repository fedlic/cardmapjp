import { NextRequest, NextResponse } from 'next/server';
import { createServerClient } from '@/lib/supabase/server';

const CACHE_TTL_DAYS = 7;
const BATCH_SIZE = 10;

interface PlaceReview {
  authorAttribution?: { displayName?: string; photoUri?: string };
  rating?: number;
  text?: { text?: string };
  relativePublishTimeDescription?: string;
  publishTime?: string;
}

async function fetchReviewsFromPlacesAPI(
  googlePlaceId: string,
  apiKey: string
): Promise<{ reviews: PlaceReview[]; rating?: number; userRatingCount?: number; error?: string }> {
  const res = await fetch(
    `https://places.googleapis.com/v1/places/${googlePlaceId}`,
    {
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': apiKey,
        'X-Goog-FieldMask': 'reviews,rating,userRatingCount',
        Referer: 'https://cardmapjp.vercel.app/',
      },
    }
  );

  const data = await res.json();
  if (data.error) {
    return { reviews: [], error: data.error.message };
  }
  return { reviews: data.reviews ?? [], rating: data.rating, userRatingCount: data.userRatingCount };
}

async function searchPlaceAndFetchReviews(
  shopName: string,
  lat: number,
  lng: number,
  apiKey: string
): Promise<{ placeId: string | null; reviews: PlaceReview[]; rating?: number; userRatingCount?: number; error?: string }> {
  const query = `${shopName} pokemon card shop`;
  const body = {
    textQuery: query,
    locationBias: {
      circle: { center: { latitude: lat, longitude: lng }, radius: 300.0 },
    },
    maxResultCount: 1,
    languageCode: 'en',
  };

  const res = await fetch('https://places.googleapis.com/v1/places:searchText', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': apiKey,
      'X-Goog-FieldMask': 'places.id,places.reviews,places.rating,places.userRatingCount',
      Referer: 'https://cardmapjp.vercel.app/',
    },
    body: JSON.stringify(body),
  });

  const data = await res.json();
  if (data.error) {
    return { placeId: null, reviews: [], error: data.error.message };
  }

  const place = data.places?.[0];
  if (!place) {
    return { placeId: null, reviews: [] };
  }

  return { placeId: place.id, reviews: place.reviews ?? [], rating: place.rating, userRatingCount: place.userRatingCount };
}

function transformReviews(placeReviews: PlaceReview[]) {
  return placeReviews.map((r) => ({
    author_name: r.authorAttribution?.displayName ?? 'Anonymous',
    rating: r.rating ?? 0,
    text: r.text?.text ?? '',
    time: r.publishTime ? Math.floor(new Date(r.publishTime).getTime() / 1000) : 0,
    profile_photo_url: r.authorAttribution?.photoUri ?? null,
    relative_time_description: r.relativePublishTimeDescription ?? null,
  }));
}

// POST /api/admin/fetch-reviews
// Body options:
//   { shop_id }        - single shop
//   { shop_ids: [...] } - batch of shops (used by client batching)
//   { all: true }       - returns list of stale shop IDs for client to batch
export async function POST(request: NextRequest) {
  const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;
  if (!apiKey) {
    return NextResponse.json({ error: 'Google Maps API key not configured' }, { status: 500 });
  }

  const body = await request.json();
  const supabase = createServerClient();

  // Single shop fetch
  if (body.shop_id) {
    const { data: shop, error: shopError } = await supabase
      .from('shops_with_coords')
      .select('id, name_en, name_jp, google_place_id, lat, lng')
      .eq('id', body.shop_id)
      .single();

    if (shopError || !shop) {
      return NextResponse.json({ error: 'Shop not found' }, { status: 404 });
    }

    const result = await fetchSingleShopReviews(supabase, shop, apiKey);
    return NextResponse.json(result);
  }

  // Batch fetch for specific shop IDs
  if (body.shop_ids && Array.isArray(body.shop_ids)) {
    const ids = body.shop_ids.slice(0, BATCH_SIZE);
    const { data: shops, error: shopsError } = await supabase
      .from('shops_with_coords')
      .select('id, name_en, name_jp, google_place_id, lat, lng')
      .in('id', ids);

    if (shopsError || !shops) {
      return NextResponse.json({ error: 'Failed to fetch shops' }, { status: 500 });
    }

    let success = 0;
    let failed = 0;
    const results: { name: string; count: number; error?: string }[] = [];

    for (const shop of shops) {
      const result = await fetchSingleShopReviews(supabase, shop, apiKey);
      results.push({ name: shop.name_en, count: result.count ?? 0, error: result.error });
      if (result.error) failed++;
      else success++;

      await new Promise((r) => setTimeout(r, 300));
    }

    return NextResponse.json({ success, failed, results });
  }

  // "all: true" now returns stale shop IDs for client-side batching
  if (body.all) {
    const { data: shops, error: shopsError } = await supabase
      .from('shops_with_coords')
      .select('id, name_en')
      .eq('is_active', true)
      .order('name_en');

    if (shopsError || !shops) {
      return NextResponse.json({ error: 'Failed to fetch shops' }, { status: 500 });
    }

    const { data: cached } = await supabase
      .from('google_reviews_cache')
      .select('shop_id, fetched_at');

    const cacheMap = new Map<string, string>();
    (cached ?? []).forEach((c: { shop_id: string; fetched_at: string }) => {
      cacheMap.set(c.shop_id, c.fetched_at);
    });

    const cutoff = new Date();
    cutoff.setDate(cutoff.getDate() - CACHE_TTL_DAYS);

    const staleShops = shops.filter((shop: { id: string }) => {
      const fetchedAt = cacheMap.get(shop.id);
      if (!fetchedAt) return true;
      return new Date(fetchedAt) < cutoff;
    });

    return NextResponse.json({
      total: shops.length,
      staleIds: staleShops.map((s: { id: string }) => s.id),
      skipped: shops.length - staleShops.length,
    });
  }

  return NextResponse.json({ error: 'Provide shop_id, shop_ids, or all: true' }, { status: 400 });
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function fetchSingleShopReviews(supabase: any, shop: any, apiKey: string) {
  let placeId = shop.google_place_id;
  let placeReviews: PlaceReview[] = [];
  let rating: number | undefined;
  let userRatingCount: number | undefined;

  if (placeId) {
    const result = await fetchReviewsFromPlacesAPI(placeId, apiKey);
    if (result.error) {
      return { error: result.error, count: 0 };
    }
    placeReviews = result.reviews;
    rating = result.rating;
    userRatingCount = result.userRatingCount;
  } else {
    const result = await searchPlaceAndFetchReviews(
      shop.name_en || shop.name_jp,
      shop.lat,
      shop.lng,
      apiKey
    );
    if (result.error) {
      return { error: result.error, count: 0 };
    }
    placeId = result.placeId;
    placeReviews = result.reviews;
    rating = result.rating;
    userRatingCount = result.userRatingCount;

    if (placeId) {
      await supabase.from('shops').update({ google_place_id: placeId }).eq('id', shop.id);
    }
  }

  // Update shop rating info
  if (rating !== undefined || userRatingCount !== undefined) {
    const updateData: Record<string, number> = {};
    if (rating !== undefined) updateData.google_rating = rating;
    if (userRatingCount !== undefined) updateData.google_review_count = userRatingCount;
    await supabase.from('shops').update(updateData).eq('id', shop.id);
  }

  if (!placeReviews.length) {
    return { count: 0, placeId };
  }

  const reviews = transformReviews(placeReviews);

  const { error: upsertError } = await supabase
    .from('google_reviews_cache')
    .upsert(
      {
        shop_id: shop.id,
        google_place_id: placeId,
        reviews,
        fetched_at: new Date().toISOString(),
      },
      { onConflict: 'shop_id' }
    );

  if (upsertError) {
    return { error: upsertError.message, count: 0 };
  }

  return { count: reviews.length, placeId };
}
