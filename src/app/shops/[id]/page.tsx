import { cache } from 'react';
import type { Metadata } from 'next';
import { createServerClient } from '@/lib/supabase/server';
import HeroSection from '@/components/ShopDetail/HeroSection';
import AISummary from '@/components/ShopDetail/AISummary';
import InventoryGrid from '@/components/ShopDetail/InventoryGrid';
import InfoSection from '@/components/ShopDetail/InfoSection';
import ReviewList from '@/components/ShopDetail/ReviewList';
import type { Shop, ShopRow, ShopInventory, Review } from '@/types';

export const revalidate = 1800; // 30 min ISR cache

interface PageProps {
  params: Promise<{ id: string }>;
}

const getShop = cache(async (id: string) => {
  const supabase = createServerClient();
  const { data, error } = await supabase
    .from('shops_with_coords')
    .select('*')
    .eq('id', id)
    .single();
  if (error || !data) return null;
  return data as ShopRow;
});

export async function generateStaticParams() {
  const supabase = createServerClient();
  const { data } = await supabase
    .from('shops_with_coords')
    .select('id')
    .eq('is_active', true);
  return (data ?? []).map((row) => ({ id: row.id }));
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { id } = await params;
  const row = await getShop(id);
  if (!row) return { title: 'Shop Not Found' };

  const title = `${row.name_en} — CardMapJP`;
  const description = row.ai_summary
    ? row.ai_summary.slice(0, 160)
    : `Find Pokémon cards at ${row.name_en} (${row.name_jp}) in Japan. Directions, hours, inventory & reviews.`;

  return {
    title,
    description,
    openGraph: {
      title,
      description,
      type: 'website',
    },
  };
}

export default async function ShopDetailPage({ params }: PageProps) {
  const { id } = await params;
  const supabase = createServerClient();

  const [row, inventoryResult, reviewsResult] = await Promise.all([
    getShop(id),
    supabase
      .from('shop_inventory')
      .select('*')
      .eq('shop_id', id)
      .order('category'),
    supabase
      .from('reviews')
      .select('*')
      .eq('shop_id', id)
      .order('created_at', { ascending: false }),
  ]);

  if (!row) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="text-center">
          <p className="text-lg font-semibold">Shop not found</p>
          <a href="/" className="text-sm text-[#E3350D] hover:underline mt-2 inline-block">
            Back to map
          </a>
        </div>
      </div>
    );
  }

  const shop: Shop = { ...row, location: { lat: row.lat, lng: row.lng } };
  const inventory = (inventoryResult.data as ShopInventory[]) || [];
  const reviews = (reviewsResult.data as Review[]) || [];

  return (
    <div className="max-w-2xl mx-auto px-4 py-6 space-y-6">
      <a
        href="/"
        className="text-sm text-[#E3350D] hover:underline inline-block mb-2"
      >
        &larr; Back to map
      </a>

      <HeroSection shop={shop} />
      <AISummary summary={shop.ai_summary} tips={shop.visitor_tips} />
      <InventoryGrid inventory={inventory} />
      <InfoSection shop={shop} />
      <ReviewList reviews={reviews} />
    </div>
  );
}
