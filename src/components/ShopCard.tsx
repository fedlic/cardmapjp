'use client';

import { memo } from 'react';
import { Heart, CheckCircle, Footprints } from 'lucide-react';
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

function formatDist(km: number): string {
  if (km < 1) return `${Math.round(km * 1000)}m`;
  return km < 10 ? `${km.toFixed(1)}km` : `${Math.round(km)}km`;
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
      className={cn(
        'cursor-pointer transition-all hover:shadow-lg relative overflow-hidden',
        selected ? 'ring-2 ring-[#E3350D]' : ''
      )}
      onClick={() => onSelect(shop)}
    >
      {/* Left color bar */}
      <div className="absolute left-0 top-0 bottom-0 w-1 bg-emerald-500" />

      <CardContent className="p-4 pl-5">
        {/* Row 1: Name + Rating */}
        <div className="flex items-start justify-between gap-2">
          <div className="min-w-0">
            <h3 className="font-bold text-base truncate">{shop.name_en}</h3>
            <p className="text-xs text-muted-foreground truncate">{shop.name_jp}</p>
          </div>
          <div className="flex items-center gap-2 shrink-0">
            {distance != null && (
              <span className="flex items-center gap-1 text-xs text-muted-foreground">
                <Footprints className="size-3" />
                {formatDist(distance)}
              </span>
            )}
            {shop.google_rating && (
              <div className="flex items-center gap-1">
                <span className="text-[#FFCB05] text-lg leading-none">★</span>
                <span className="font-bold text-sm">{shop.google_rating}</span>
              </div>
            )}
          </div>
        </div>

        {/* Row 2: Badges */}
        <div className="flex flex-wrap gap-1.5 mt-2.5">
          {shop.english_staff && (
            <Badge className="bg-[#FFCB05]/20 text-[#FFCB05] border-[#FFCB05]/30 text-xs">
              EN Staff
            </Badge>
          )}
          {shop.sells_psa_graded && (
            <Badge variant="outline" className="text-xs">PSA</Badge>
          )}
          {shop.sells_booster_box && (
            <Badge variant="outline" className="text-xs">BOX</Badge>
          )}
          {shop.beginner_friendly && (
            <Badge variant="outline" className="text-xs">Beginner</Badge>
          )}
          {shop.sells_vintage && (
            <Badge variant="outline" className="text-xs">Vintage</Badge>
          )}
          {shop.sells_english_cards && (
            <Badge variant="outline" className="text-xs">EN Cards</Badge>
          )}
        </div>

        {/* Row 3: Address + Actions */}
        <div className="flex items-center justify-between mt-2.5">
          <p className="text-xs text-muted-foreground truncate flex-1">
            {shop.address_en}
          </p>
          {(onToggleFavorite || onToggleVisited) && (
            <div className="flex items-center gap-1 ml-2 shrink-0">
              {onToggleFavorite && (
                <button
                  onClick={(e) => { e.stopPropagation(); onToggleFavorite(shop.id); }}
                  className={cn(
                    'p-1.5 rounded transition-colors',
                    isFavorite ? 'text-rose-500' : 'text-muted-foreground hover:text-rose-500'
                  )}
                  title={isFavorite ? 'Remove from favorites' : 'Add to favorites'}
                >
                  <Heart className={cn('size-4', isFavorite && 'fill-current')} />
                </button>
              )}
              {onToggleVisited && (
                <button
                  onClick={(e) => { e.stopPropagation(); onToggleVisited(shop.id); }}
                  className={cn(
                    'p-1.5 rounded transition-colors',
                    isVisited ? 'text-emerald-500' : 'text-muted-foreground hover:text-emerald-500'
                  )}
                  title={isVisited ? 'Mark as not visited' : 'Mark as visited'}
                >
                  <CheckCircle className={cn('size-4', isVisited && 'fill-current')} />
                </button>
              )}
            </div>
          )}
        </div>
      </CardContent>
    </Card>
  );
});
