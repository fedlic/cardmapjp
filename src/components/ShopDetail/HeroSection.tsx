import type { Shop } from '@/types';

interface HeroSectionProps {
  shop: Shop;
}

export default function HeroSection({ shop }: HeroSectionProps) {
  return (
    <div className="bg-[#E3350D] text-white px-4 py-6">
      <a href="/" className="text-white/70 text-sm hover:text-white transition-colors">
        &larr; All shops
      </a>
      <h1 className="text-2xl font-bold mt-2">{shop.name_en}</h1>
      <p className="text-white/70 text-sm mt-1">{shop.name_jp}</p>

      <div className="flex items-center gap-3 mt-3">
        {shop.google_rating && (
          <div className="flex items-center gap-1">
            <span className="text-[#FFCB05] text-lg">&#9733;</span>
            <span className="font-bold text-lg">{shop.google_rating}</span>
            {shop.google_review_count != null && (
              <span className="text-white/60 text-sm">({shop.google_review_count})</span>
            )}
          </div>
        )}
      </div>

      <div className="flex flex-wrap gap-2 mt-3">
        {shop.english_staff && (
          <span className="text-xs bg-white/20 rounded-full px-3 py-1">
            EN Staff {shop.english_staff_days ? `(${shop.english_staff_days})` : ''}
          </span>
        )}
        {shop.beginner_friendly && (
          <span className="text-xs bg-white/20 rounded-full px-3 py-1">Beginner Friendly</span>
        )}
        {shop.sells_english_cards && (
          <span className="text-xs bg-white/20 rounded-full px-3 py-1">English Cards</span>
        )}
        {shop.sells_vintage && (
          <span className="text-xs bg-white/20 rounded-full px-3 py-1">Vintage</span>
        )}
        {shop.sells_psa_graded && (
          <span className="text-xs bg-white/20 rounded-full px-3 py-1">PSA Graded</span>
        )}
      </div>
    </div>
  );
}
