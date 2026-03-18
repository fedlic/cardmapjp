import { Badge } from '@/components/ui/badge';
import type { Shop } from '@/types';

interface HeroSectionProps {
  shop: Shop;
}

export default function HeroSection({ shop }: HeroSectionProps) {
  return (
    <div className="bg-gradient-to-r from-[#E3350D] to-[#c42d0b] text-white p-6 rounded-xl">
      <h1 className="text-2xl font-bold">{shop.name_en}</h1>
      <p className="text-white/80 text-sm mt-1">{shop.name_jp}</p>

      <div className="flex items-center gap-3 mt-3">
        {shop.google_rating && (
          <div className="flex items-center gap-1">
            <span className="text-[#FFCB05] text-lg">★</span>
            <span className="font-bold text-lg">{shop.google_rating}</span>
            {shop.google_review_count && (
              <span className="text-white/70 text-sm">
                ({shop.google_review_count} reviews)
              </span>
            )}
          </div>
        )}
      </div>

      <div className="flex flex-wrap gap-2 mt-4">
        {shop.english_staff && (
          <Badge className="bg-white/20 text-white hover:bg-white/30">
            English Staff {shop.english_staff_days ? `(${shop.english_staff_days})` : ''}
          </Badge>
        )}
        {shop.beginner_friendly && (
          <Badge className="bg-white/20 text-white hover:bg-white/30">
            Beginner Friendly
          </Badge>
        )}
        {shop.sells_english_cards && (
          <Badge className="bg-white/20 text-white hover:bg-white/30">
            English Cards
          </Badge>
        )}
        {shop.sells_vintage && (
          <Badge className="bg-white/20 text-white hover:bg-white/30">
            Vintage
          </Badge>
        )}
        {shop.sells_psa_graded && (
          <Badge className="bg-white/20 text-white hover:bg-white/30">
            PSA Graded
          </Badge>
        )}
      </div>
    </div>
  );
}
