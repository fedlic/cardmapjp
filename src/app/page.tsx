import { Suspense } from 'react';
import type { Metadata } from 'next';
import { createServerClient } from '@/lib/supabase/server';
import ShopListClient from '@/components/ShopListClient';
import type { Shop, ShopRow } from '@/types';

export const revalidate = 300;

export const metadata: Metadata = {
  title: 'Pokemon Card Shops in Akihabara, Tokyo | CardMapJP',
  description:
    'Find the best Pokemon card shops in Akihabara, Tokyo. Interactive map with 284+ shops, real-time inventory, English support info, directions, and visitor tips for foreign collectors.',
  openGraph: {
    title: 'Pokemon Card Shops in Akihabara, Tokyo | CardMapJP',
    description:
      'Interactive map of 284+ Pokemon card shops in Japan. Inventory, English staff info, hours & directions.',
    type: 'website',
    url: 'https://cardmapjp.vercel.app',
  },
};

const SHOP_LIST_COLUMNS = [
  'id', 'name_jp', 'name_en', 'region_id',
  'address_en', 'lat', 'lng',
  'english_staff', 'beginner_friendly',
  'sells_singles', 'sells_booster_box', 'sells_psa_graded',
  'sells_oripa', 'sells_english_cards', 'sells_vintage',
  'google_rating', 'google_review_count',
  'open_hours',
  'is_active',
].join(',');

function rowToShop(row: ShopRow): Shop {
  return {
    ...row,
    location: { lat: row.lat, lng: row.lng },
  };
}

export default async function HomePage() {
  const supabase = createServerClient();

  const { data, error } = await supabase
    .from('shops_with_coords')
    .select(SHOP_LIST_COLUMNS)
    .eq('is_active', true)
    .order('name_en');

  if (error) {
    return (
      <div className="flex items-center justify-center h-[calc(100vh-48px)]">
        <div className="text-center">
          <p className="text-lg font-semibold text-red-600">Error</p>
          <p className="text-sm text-gray-500">Failed to load shops</p>
        </div>
      </div>
    );
  }

  const shops = (data as unknown as ShopRow[]).map(rowToShop);

  return (
    <Suspense fallback={
      <div className="px-4 py-6 space-y-3">
        {Array.from({ length: 6 }).map((_, i) => (
          <div key={i} className="bg-gray-100 rounded-[10px] h-24 animate-pulse" />
        ))}
      </div>
    }>
      <ShopListClient shops={shops} />
    </Suspense>
  );
}
