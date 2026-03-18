'use client';

import { useState, useCallback, useMemo } from 'react';
import { useSearchParams } from 'next/navigation';
import dynamic from 'next/dynamic';
import ShopSidebar from '@/components/ShopSidebar';
import { useShopPreferences } from '@/hooks/useShopPreferences';
import { useGeolocation } from '@/hooks/useGeolocation';
import { REGION_CENTERS } from '@/lib/regions';
import type { MapBounds } from '@/components/ShopMap';
import type { Shop } from '@/types';

const ShopMap = dynamic(() => import('@/components/ShopMap'), { ssr: false });

interface HomePageClientProps {
  shops: Shop[];
}

export default function HomePageClient({ shops }: HomePageClientProps) {
  const searchParams = useSearchParams();
  const [selectedShop, setSelectedShop] = useState<Shop | null>(null);
  const [mapBounds, setMapBounds] = useState<MapBounds | null>(null);
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

  return (
    <div className="h-[calc(100vh-52px)] flex flex-col md:flex-row">
      {/* Map */}
      <div className="h-1/2 md:h-full md:flex-1 relative">
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
      </div>

      {/* Sidebar */}
      <div className="h-1/2 md:h-full md:w-[380px] border-t md:border-t-0 md:border-l overflow-hidden">
        <ShopSidebar
          shops={shops}
          selectedShopId={selectedShop?.id ?? null}
          onSelectShop={(shop) => setSelectedShop(shop)}
          preferences={preferences}
          mapBounds={mapBounds}
          userLocation={userLocation}
          geoStatus={geoStatus}
          geoError={geoError}
          onRequestLocation={requestLocation}
        />
      </div>
    </div>
  );
}
