import { NextRequest, NextResponse } from 'next/server';
import { createServerClient } from '@/lib/supabase/server';

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
      return NextResponse.json(data);
    }

    let query = supabase
      .from('shops_with_coords')
      .select('*, shop_inventory(*)')
      .eq('is_active', true);

    if (region_id) {
      query = query.eq('region_id', region_id);
    }

    const { data, error } = await query.order('name_en');
    if (error) throw error;

    return NextResponse.json(data);
  } catch (error) {
    console.error('Error fetching shops:', error);
    return NextResponse.json(
      { error: 'Failed to fetch shops' },
      { status: 500 }
    );
  }
}
