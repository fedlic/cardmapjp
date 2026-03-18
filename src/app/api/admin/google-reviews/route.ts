import { NextRequest, NextResponse } from 'next/server';
import { createServerClient } from '@/lib/supabase/server';

export async function POST(request: NextRequest) {
  const { shop_id } = await request.json();
  if (!shop_id) {
    return NextResponse.json({ error: 'shop_id is required' }, { status: 400 });
  }

  const supabase = createServerClient();

  // Get shop's google_place_id
  const { data: shop, error: shopError } = await supabase
    .from('shops')
    .select('google_place_id')
    .eq('id', shop_id)
    .single();

  if (shopError || !shop?.google_place_id) {
    return NextResponse.json(
      { error: 'Shop not found or no google_place_id set' },
      { status: 404 }
    );
  }

  const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY;
  if (!apiKey) {
    return NextResponse.json({ error: 'Google Maps API key not configured' }, { status: 500 });
  }

  // Fetch reviews from Google Places API
  const url = `https://maps.googleapis.com/maps/api/place/details/json?place_id=${shop.google_place_id}&fields=reviews&language=en&key=${apiKey}`;
  const res = await fetch(url);
  const json = await res.json();

  if (json.status !== 'OK') {
    return NextResponse.json(
      { error: `Google API error: ${json.status}` },
      { status: 502 }
    );
  }

  const reviews = json.result?.reviews ?? [];

  // Upsert into google_reviews_cache
  const { error: upsertError } = await supabase
    .from('google_reviews_cache')
    .upsert(
      {
        shop_id,
        google_place_id: shop.google_place_id,
        reviews,
        fetched_at: new Date().toISOString(),
      },
      { onConflict: 'shop_id' }
    );

  if (upsertError) {
    return NextResponse.json({ error: upsertError.message }, { status: 500 });
  }

  return NextResponse.json({ success: true, count: reviews.length });
}
