import { NextRequest, NextResponse } from 'next/server';
import { createServerClient } from '@/lib/supabase/server';

const SHOP_LIST_COLUMNS = [
  'id', 'name_jp', 'name_en', 'region_id',
  'address_en', 'lat', 'lng',
  'english_staff', 'beginner_friendly',
  'sells_singles', 'sells_booster_box', 'sells_psa_graded',
  'sells_oripa', 'sells_english_cards', 'sells_vintage',
  'google_rating', 'google_review_count',
  'is_active',
].join(',');

export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url);
  const region_id = searchParams.get('region_id');
  const lat = searchParams.get('lat');
  const lng = searchParams.get('lng');
  const radius_km = searchParams.get('radius_km');

  const supabase = createServerClient();

  try {
    if (lat && lng) {
      const radius = (Number(radius_km) || 2) * 1000;
      const { data, error } = await supabase.rpc('shops_within_radius', {
        p_lat: Number(lat),
        p_lng: Number(lng),
        p_radius: radius,
      });
      if (error) throw error;
      return NextResponse.json(data, {
        headers: { 'Cache-Control': 'public, s-maxage=300, stale-while-revalidate=60' },
      });
    }

    let query = supabase
      .from('shops_with_coords')
      .select(SHOP_LIST_COLUMNS)
      .eq('is_active', true);

    if (region_id) {
      query = query.eq('region_id', region_id);
    }

    const { data, error } = await query.order('name_en');
    if (error) throw error;

    return NextResponse.json(data, {
      headers: { 'Cache-Control': 'public, s-maxage=300, stale-while-revalidate=60' },
    });
  } catch (error) {
    console.error('Error fetching shops:', error);
    return NextResponse.json(
      { error: 'Failed to fetch shops' },
      { status: 500 }
    );
  }
}
