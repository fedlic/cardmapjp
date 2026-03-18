import { createServerClient } from '../server';
import type { Shop, ShopRow } from '@/types';

function rowToShop(row: ShopRow): Shop {
  return {
    ...row,
    location: { lat: row.lat, lng: row.lng },
  };
}

export async function getShops(params?: {
  region_id?: string;
  lat?: number;
  lng?: number;
  radius_km?: number;
}) {
  const supabase = createServerClient();

  // Use RPC for distance-based queries with PostGIS
  if (params?.lat && params?.lng) {
    const radius = (params.radius_km || 2) * 1000; // convert to meters
    const { data, error } = await supabase.rpc('shops_within_radius', {
      p_lat: params.lat,
      p_lng: params.lng,
      p_radius: radius,
    });
    if (error) throw error;
    return (data as ShopRow[]).map(rowToShop);
  }

  // Simple query with optional region filter
  let query = supabase
    .from('shops_with_coords')
    .select('*')
    .eq('is_active', true);

  if (params?.region_id) {
    query = query.eq('region_id', params.region_id);
  }

  const { data, error } = await query.order('name_en');
  if (error) throw error;
  return (data as ShopRow[]).map(rowToShop);
}

export async function getShopById(id: string): Promise<Shop | null> {
  const supabase = createServerClient();
  const { data, error } = await supabase
    .from('shops_with_coords')
    .select('*')
    .eq('id', id)
    .single();

  if (error) return null;
  return rowToShop(data as ShopRow);
}
