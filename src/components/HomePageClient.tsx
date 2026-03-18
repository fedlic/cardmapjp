'use client';

import { useState, useCallback, useMemo } from 'react';
import { useSearchParams } from 'next/navigation';
import dynamic from 'next/dynamic';
import { Map, List } from 'lucide-react';
import ShopSidebar from '@/components/ShopSidebar';
import ShopFilters, { type Filters } from '@/components/ShopFilters';
import { useShopPreferences } from '@/hooks/useShopPreferences';
import { useGeolocation } from '@/hooks/useGeolocation';
import { REGION_CENTERS } from '@/lib/regions';
import { cn } from '@/lib/utils';
import type { MapBounds } from '@/components/ShopMap';
import type { Shop } from '@/types';

const ShopMap = dynamic(() => import('@/components/ShopMap'), { ssr: false });

interface HomePageClientProps {
  shops: Shop[];
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

export default function HomePageClient({ shops }: HomePageClientProps) {
  const searchParams = useSearchParams();
  const [selectedShop, setSelectedShop] = useState<Shop | null>(null);
  const [mapBounds, setMapBounds] = useState<MapBounds | null>(null);
  const [showMap, setShowMap] = useState(false);
  const [mapLoaded, setMapLoaded] = useState(false);
  const [filters, setFilters] = useState<Filters>(emptyFilters);
  const preferences = useShopPreferences();
  const { position: userLocation, status: geoStatus, error: geoError, requestLocation } = useGeolocation();

  const regionParam = searchParams.get('region');
  const regionCenter = useMemo(() => {
    if (!regionParam) return null;
    return REGION_CENTERS[regionParam] ?? null;
  }, [regionParam]);

  const handleSelectShop = useCallback((shop: Shop | null) => {
    setSelectedShop(shop);
  }, []);

  const handleBoundsChange = useCallback((bounds: MapBounds) => {
    setMapBounds(bounds);
  }, []);

  const handleShowMap = useCallback(() => {
    setShowMap(true);
    setMapLoaded(true);
  }, []);

  // Render map if: desktop always, or mobile when toggled (keep alive after first render)
  const shouldRenderMap = mapLoaded || !showMap; // always render on desktop via CSS

  return (
    <div className="h-[calc(100vh-44px)] flex flex-col md:flex-row relative">
      {/* Map — hidden on mobile by default, full on desktop */}
      <div className={cn(
        'md:flex-1 md:h-full relative',
        showMap ? 'h-full' : 'hidden md:block'
      )}>
        <ShopMap
          shops={shops}
          selectedShop={selectedShop}
          onSelectShop={handleSelectShop}
          onBoundsChange={handleBoundsChange}
          userLocation={userLocation}
          initialCenter={regionCenter}
          initialZoom={regionCenter ? 15 : undefined}
          className="w-full h-full"
        />
        {/* Close map button — mobile only */}
        {showMap && (
          <button
            className="md:hidden absolute top-4 right-4 z-[1000] bg-[#16213e] text-white rounded-full px-4 py-2.5 shadow-lg flex items-center gap-2 text-sm font-medium border border-white/10"
            onClick={() => setShowMap(false)}
          >
            <List className="size-4" />
            Show List
          </button>
        )}
      </div>

      {/* Sidebar — hidden when map is open on mobile */}
      <div className={cn(
        'md:h-full md:w-[380px] md:border-l border-border overflow-hidden',
        showMap ? 'hidden md:block' : 'h-full'
      )}>
        <ShopSidebar
          shops={shops}
          selectedShopId={selectedShop?.id ?? null}
          onSelectShop={(shop) => setSelectedShop(shop)}
          preferences={preferences}
          mapBounds={showMap ? mapBounds : null}
          filters={filters}
          onFiltersChange={setFilters}
          userLocation={userLocation}
          geoStatus={geoStatus}
          geoError={geoError}
          onRequestLocation={requestLocation}
        />
      </div>

      {/* Show Map FAB — mobile only, when list is shown */}
      {!showMap && (
        <button
          className="md:hidden fixed bottom-16 right-4 z-50 bg-[#E3350D] text-white rounded-full px-5 py-3 shadow-lg flex items-center gap-2 text-sm font-semibold"
          onClick={handleShowMap}
        >
          <Map className="size-4" />
          Map
        </button>
      )}

      {/* Fixed bottom filter bar — mobile only */}
      {!showMap && (
        <div className="md:hidden fixed bottom-0 left-0 right-0 z-40 bg-[#16213e]/95 backdrop-blur-sm border-t border-white/10 safe-area-inset-bottom">
          <ShopFilters filters={filters} onChange={setFilters} />
        </div>
      )}
    </div>
  );
}
