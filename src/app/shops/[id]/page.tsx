import { createServerClient } from '@/lib/supabase/server';
import HeroSection from '@/components/ShopDetail/HeroSection';
import AISummary from '@/components/ShopDetail/AISummary';
import InventoryGrid from '@/components/ShopDetail/InventoryGrid';
import InfoSection from '@/components/ShopDetail/InfoSection';
import ReviewList from '@/components/ShopDetail/ReviewList';
import type { Shop, ShopRow, ShopInventory, Review } from '@/types';

interface PageProps {
  params: Promise<{ id: string }>;
}

export default async function ShopDetailPage({ params }: PageProps) {
  const { id } = await params;
  const supabase = createServerClient();

  const [shopResult, inventoryResult, reviewsResult] = await Promise.all([
    supabase.from('shops_with_coords').select('*').eq('id', id).single(),
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

  if (shopResult.error || !shopResult.data) {
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

  const row = shopResult.data as ShopRow;
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
