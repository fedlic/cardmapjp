'use client';

import { useState, useMemo, useCallback, useEffect } from 'react';
import { LocateFixed, Loader2 } from 'lucide-react';
import { Input } from '@/components/ui/input';
import ShopCard from './ShopCard';
import ShopFilters, { type Filters } from './ShopFilters';
import { useDebounce } from '@/hooks/useDebounce';
import { haversineKm } from '@/lib/geo';
import { cn } from '@/lib/utils';
import type { UseShopPreferencesReturn } from '@/hooks/useShopPreferences';
import type { GeoPosition, GeoStatus } from '@/hooks/useGeolocation';
import type { Shop } from '@/types';

type SortKey = 'name' | 'rating' | 'distance';

type ShopWithDistance = Shop & { _distance: number | null };

interface ShopSidebarProps {
  shops: Shop[];
  selectedShopId: string | null;
  onSelectShop: (shop: Shop) => void;
  preferences: UseShopPreferencesReturn;
  userLocation?: GeoPosition | null;
  geoStatus?: GeoStatus;
  geoError?: string | null;
  onRequestLocation?: () => void;
}

const emptyFilters: Filters = {
  favorites_only: false,
  visited_only: false,
  english_staff: false,
  psa_graded: false,
  booster_box: false,
  singles: false,
  beginner_friendly: false,
  vintage: false,
};

export default function ShopSidebar({
  shops,
  selectedShopId,
  onSelectShop,
  preferences,
  userLocation,
  geoStatus = 'idle',
  geoError,
  onRequestLocation,
}: ShopSidebarProps) {
  const [search, setSearch] = useState('');
  const [filters, setFilters] = useState<Filters>(emptyFilters);
  const [sortKey, setSortKey] = useState<SortKey>('name');
  const debouncedSearch = useDebounce(search, 200);

  // Auto-switch to distance sort when location first becomes available
  useEffect(() => {
    if (userLocation && sortKey !== 'distance') {
      setSortKey('distance');
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [userLocation]);

  const handleSelectShop = useCallback(
    (shop: Shop) => onSelectShop(shop),
    [onSelectShop]
  );

  const filtered = useMemo(() => {
    const list: ShopWithDistance[] = shops
      .filter((shop) => {
        if (debouncedSearch) {
          const q = debouncedSearch.toLowerCase();
          if (
            !shop.name_en.toLowerCase().includes(q) &&
            !shop.name_jp.includes(q)
          )
            return false;
        }
        if (filters.favorites_only && !preferences.isFavorite(shop.id)) return false;
        if (filters.visited_only && !preferences.isVisited(shop.id)) return false;
        if (filters.english_staff && !shop.english_staff) return false;
        if (filters.psa_graded && !shop.sells_psa_graded) return false;
        if (filters.booster_box && !shop.sells_booster_box) return false;
        if (filters.singles && !shop.sells_singles) return false;
        if (filters.beginner_friendly && !shop.beginner_friendly) return false;
        if (filters.vintage && !shop.sells_vintage) return false;
        return true;
      })
      .map((shop) => ({
        ...shop,
        _distance: userLocation
          ? haversineKm(userLocation.lat, userLocation.lng, shop.location.lat, shop.location.lng)
          : null,
      }));

    if (sortKey === 'distance' && userLocation) {
      list.sort((a, b) => (a._distance ?? Infinity) - (b._distance ?? Infinity));
    } else if (sortKey === 'rating') {
      list.sort((a, b) => (b.google_rating ?? 0) - (a.google_rating ?? 0));
    } else {
      list.sort((a, b) => a.name_en.localeCompare(b.name_en));
    }

    return list;
  }, [shops, debouncedSearch, filters, sortKey, userLocation, preferences]);

  return (
    <div className="flex flex-col h-full bg-white">
      <div className="p-3 border-b">
        <div className="flex items-center justify-between mb-2">
          <div>
            <h2 className="font-bold text-lg">
              Card Shops
              <span className="text-sm font-normal text-muted-foreground ml-2">
                {filtered.length} shops
              </span>
            </h2>
            {(preferences.favoritesCount > 0 || preferences.visitedCount > 0) && (
              <p className="text-xs text-muted-foreground">
                {preferences.favoritesCount > 0 && `${preferences.favoritesCount} favorited`}
                {preferences.favoritesCount > 0 && preferences.visitedCount > 0 && ' · '}
                {preferences.visitedCount > 0 && `${preferences.visitedCount} visited`}
              </p>
            )}
          </div>
          <div className="flex items-center gap-2">
            {onRequestLocation && (
              <button
                onClick={onRequestLocation}
                disabled={geoStatus === 'loading'}
                className={cn(
                  'flex items-center gap-1 text-xs px-2 py-1 rounded border transition-colors',
                  userLocation
                    ? 'bg-[#E3350D] text-white border-[#E3350D]'
                    : 'hover:bg-gray-100 border-gray-200'
                )}
                title={geoError ?? 'Find shops near me'}
              >
                {geoStatus === 'loading' ? (
                  <Loader2 className="size-3 animate-spin" />
                ) : (
                  <LocateFixed className="size-3" />
                )}
                Near Me
              </button>
            )}
            <select
              value={sortKey}
              onChange={(e) => setSortKey(e.target.value as SortKey)}
              className="text-xs border rounded px-2 py-1 bg-white"
            >
              <option value="name">Name</option>
              <option value="rating">Rating</option>
              <option value="distance" disabled={!userLocation}>Distance</option>
            </select>
          </div>
        </div>
        <Input
          placeholder="Search shops..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="h-9"
        />
        {geoError && geoStatus !== 'success' && (
          <p className="text-xs text-red-500 mt-1">{geoError}</p>
        )}
      </div>

      <ShopFilters filters={filters} onChange={setFilters} />

      <div className="flex-1 overflow-y-auto p-3 space-y-2">
        {filtered.length === 0 ? (
          <p className="text-sm text-muted-foreground text-center py-8">
            No shops match your filters.
          </p>
        ) : (
          filtered.map((shop) => (
            <ShopCard
              key={shop.id}
              shop={shop}
              selected={shop.id === selectedShopId}
              onSelect={handleSelectShop}
              distance={shop._distance}
              isFavorite={preferences.isFavorite(shop.id)}
              isVisited={preferences.isVisited(shop.id)}
              onToggleFavorite={preferences.toggleFavorite}
              onToggleVisited={preferences.toggleVisited}
            />
          ))
        )}
      </div>
    </div>
  );
}
