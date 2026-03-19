import HeroSection from './HeroSection';
import AISummary from './AISummary';
import InventoryGrid from './InventoryGrid';
import InfoSection from './InfoSection';
import ReviewList from './ReviewList';
import type { Shop, ShopInventory, Review, GoogleReview } from '@/types';

interface ShopDetailContentProps {
  shop: Shop;
  inventory: ShopInventory[];
  reviews: Review[];
  googleReviews: GoogleReview[];
}

export default function ShopDetailContent({ shop, inventory, reviews, googleReviews }: ShopDetailContentProps) {
  return (
    <div className="max-w-2xl mx-auto pb-24">
      <HeroSection shop={shop} />

      <div className="px-4 py-6 space-y-6">
        <AISummary summary={shop.ai_summary} tips={shop.visitor_tips} />
        {inventory.length > 0 && <InventoryGrid inventory={inventory} />}
        <InfoSection shop={shop} />
        <ReviewList reviews={reviews} shopId={shop.id} googleReviews={googleReviews} />
      </div>

      {/* Fixed bottom CTA */}
      <div className="fixed bottom-0 left-0 right-0 p-4 bg-white border-t border-gray-100 z-40">
        <div className="max-w-2xl mx-auto">
          <a
            href={`https://www.google.com/maps/dir/?api=1&destination=${shop.location.lat},${shop.location.lng}&travelmode=walking`}
            target="_blank"
            rel="noopener noreferrer"
            className="block w-full bg-[#E3350D] hover:bg-[#c42d0b] text-white text-center font-semibold py-3 rounded-lg transition-colors"
          >
            Get Directions
          </a>
        </div>
      </div>
    </div>
  );
}
