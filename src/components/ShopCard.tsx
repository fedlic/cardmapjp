'use client';

import { memo } from 'react';
import { Heart, CheckCircle } from 'lucide-react';
import { Badge } from '@/components/ui/badge';
import { Card, CardContent } from '@/components/ui/card';
import { cn } from '@/lib/utils';
import type { Shop } from '@/types';

interface ShopCardProps {
  shop: Shop;
  onSelect: (shop: Shop) => void;
  selected?: boolean;
  distance?: number | null;
  isFavorite?: boolean;
  isVisited?: boolean;
  onToggleFavorite?: (shopId: string) => void;
  onToggleVisited?: (shopId: string) => void;
}

export default memo(function ShopCard({
  shop,
  onSelect,
  selected,
  distance,
  isFavorite,
  isVisited,
  onToggleFavorite,
  onToggleVisited,
}: ShopCardProps) {
  return (
    <Card
      className={`cursor-pointer transition-shadow hover:shadow-md ${
        selected ? 'ring-2 ring-[#E3350D]' : ''
      }`}
      onClick={() => onSelect(shop)}
    >
      <CardContent className="p-4">
        <div className="flex items-start justify-between gap-2">
          <div className="min-w-0">
            <h3 className="font-semibold text-sm truncate">{shop.name_en}</h3>
            <p className="text-xs text-muted-foreground truncate">
              {shop.name_jp}
            </p>
          </div>
          <div className="flex items-center gap-1.5 shrink-0">
            {distance != null && (
              <span className="text-xs text-muted-foreground">
                {distance < 10 ? `${distance.toFixed(1)} km` : `${Math.round(distance)} km`}
              </span>
            )}
            {shop.google_rating && (
              <div className="flex items-center gap-1 text-sm">
                <span className="text-yellow-500">&#9733;</span>
                <span className="font-medium">{shop.google_rating}</span>
              </div>
            )}
          </div>
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

        <div className="flex items-center justify-between mt-2">
          <p className="text-xs text-muted-foreground truncate flex-1">
            {shop.address_en}
          </p>
          {(onToggleFavorite || onToggleVisited) && (
            <div className="flex items-center gap-1 ml-2 shrink-0">
              {onToggleFavorite && (
                <button
                  onClick={(e) => { e.stopPropagation(); onToggleFavorite(shop.id); }}
                  className={cn(
                    'p-1 rounded transition-colors',
                    isFavorite ? 'text-rose-500' : 'text-muted-foreground hover:text-rose-500'
                  )}
                  title={isFavorite ? 'Remove from favorites' : 'Add to favorites'}
                >
                  <Heart className={cn('size-3.5', isFavorite && 'fill-current')} />
                </button>
              )}
              {onToggleVisited && (
                <button
                  onClick={(e) => { e.stopPropagation(); onToggleVisited(shop.id); }}
                  className={cn(
                    'p-1 rounded transition-colors',
                    isVisited ? 'text-emerald-500' : 'text-muted-foreground hover:text-emerald-500'
                  )}
                  title={isVisited ? 'Mark as not visited' : 'Mark as visited'}
                >
                  <CheckCircle className={cn('size-3.5', isVisited && 'fill-current')} />
                </button>
              )}
            </div>
          )}
        </div>
      </CardContent>
    </Card>
  );
});
