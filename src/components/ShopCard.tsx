'use client';

import { Badge } from '@/components/ui/badge';
import { Card, CardContent } from '@/components/ui/card';
import type { Shop } from '@/types';

interface ShopCardProps {
  shop: Shop;
  onClick?: () => void;
  selected?: boolean;
}

export default function ShopCard({ shop, onClick, selected }: ShopCardProps) {
  return (
    <Card
      className={`cursor-pointer transition-shadow hover:shadow-md ${
        selected ? 'ring-2 ring-[#E3350D]' : ''
      }`}
      onClick={onClick}
    >
      <CardContent className="p-4">
        <div className="flex items-start justify-between gap-2">
          <div className="min-w-0">
            <h3 className="font-semibold text-sm truncate">{shop.name_en}</h3>
            <p className="text-xs text-muted-foreground truncate">
              {shop.name_jp}
            </p>
          </div>
          {shop.google_rating && (
            <div className="flex items-center gap-1 shrink-0 text-sm">
              <span className="text-yellow-500">★</span>
              <span className="font-medium">{shop.google_rating}</span>
            </div>
          )}
        </div>

        <div className="flex flex-wrap gap-1 mt-2">
          {shop.english_staff && (
            <Badge variant="secondary" className="text-xs">
              English OK
            </Badge>
          )}
          {shop.beginner_friendly && (
            <Badge variant="secondary" className="text-xs">
              Beginner Friendly
            </Badge>
          )}
          {shop.sells_psa_graded && (
            <Badge variant="outline" className="text-xs">
              PSA Graded
            </Badge>
          )}
          {shop.sells_vintage && (
            <Badge variant="outline" className="text-xs">
              Vintage
            </Badge>
          )}
          {shop.sells_english_cards && (
            <Badge variant="outline" className="text-xs">
              EN Cards
            </Badge>
          )}
          {shop.sells_oripa && (
            <Badge variant="outline" className="text-xs">
              Oripa
            </Badge>
          )}
        </div>

        <p className="text-xs text-muted-foreground mt-2 truncate">
          {shop.address_en}
        </p>
      </CardContent>
    </Card>
  );
}
