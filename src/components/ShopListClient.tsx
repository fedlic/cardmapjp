'use client';

import { useState, useMemo, useCallback } from 'react';
import { useSearchParams } from 'next/navigation';
import dynamic from 'next/dynamic';
import { MapPin, X } from 'lucide-react';
import FilterBar, { getActiveFilters } from '@/components/FilterBar';
import ShopCard from '@/components/ShopCard';
import { useInfiniteScroll } from '@/hooks/useInfiniteScroll';
import { useGeolocation } from '@/hooks/useGeolocation';
import { haversineKm } from '@/lib/geo';
import { REGION_CENTERS } from '@/lib/regions';
import type { Shop, OpenHours } from '@/types';

function normalizeForSearch(str: string): string {
  return str.toLowerCase().replace(/[\s\u3000]+/g, '');
}

const GoogleMapView = dynamic(() => import('@/components/GoogleMapView'), {
  ssr: false,
  loading: () => (
    <div className="w-full h-full flex items-center justify-center bg-gray-50">
      <div className="text-sm text-gray-400">Loading map...</div>
    </div>
  ),
});

function isShopOpenNow(hours: OpenHours | null): boolean | undefined {
  if (!hours) return undefined;
  // Use Japan time since all shops are in Japan
  const now = new Date(new Date().toLocaleString('en-US', { timeZone: 'Asia/Tokyo' }));
  const days = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'];
  const today = days[now.getDay()];
  const slot = hours[today];
  if (!slot || !slot.open || !slot.close) return false;
  const currentTime = `${String(now.getHours()).padStart(2, '0')}:${String(now.getMinutes()).padStart(2, '0')}`;
  // Handle overnight hours (e.g., open: "18:00", close: "02:00")
  if (slot.close < slot.open) {
    return currentTime >= slot.open || currentTime <= slot.close;
  }
  return currentTime >= slot.open && currentTime <= slot.close;
}

interface ShopListClientProps {
  shops: Shop[];
}

export default function ShopListClient({ shops }: ShopListClientProps) {
  const searchParams = useSearchParams();
  const [showMap, setShowMap] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const { position: userLocation, status: geoStatus, requestLocation, clearLocation } = useGeolocation();
  const nearMeActive = userLocation !== null;

  const handleNearMeToggle = useCallback(() => {
    if (nearMeActive) {
      clearLocation();
    } else {
      requestLocation();
    }
  }, [nearMeActive, clearLocation, requestLocation]);

  const regionParam = searchParams.get('region');
  const regionCenter = useMemo(() => {
    if (!regionParam) return null;
    return REGION_CENTERS[regionParam] ?? null;
  }, [regionParam]);

  const activeFilters = useMemo(() => getActiveFilters(searchParams), [searchParams]);

  const filtered = useMemo(() => {
    let list = shops;

    // Text search across name_ja, name_en, and address
    if (searchQuery.trim()) {
      const q = normalizeForSearch(searchQuery);
      list = list.filter((s) => {
        const nameJp = s.name_jp ? normalizeForSearch(s.name_jp) : '';
        const nameEn = s.name_en ? normalizeForSearch(s.name_en) : '';
        const address = s.address_jp ? normalizeForSearch(s.address_jp) : '';
        return nameJp.includes(q) || nameEn.includes(q) || address.includes(q);
      });
    }

    if (activeFilters.has('open')) {
      list = list.filter((s) => isShopOpenNow(s.open_hours ?? null) === true);
    }
    if (activeFilters.has('en')) {
      list = list.filter((s) => s.english_staff);
    }
    if (activeFilters.has('psa')) {
      list = list.filter((s) => s.sells_psa_graded);
    }
    if (activeFilters.has('box')) {
      list = list.filter((s) => s.sells_booster_box);
    }
    if (activeFilters.has('beginner')) {
      list = list.filter((s) => s.beginner_friendly);
    }

    if (regionParam) {
      list = list.filter((s) => s.region_id === regionParam);
    }

    return list.map((shop) => ({
      shop,
      isOpen: isShopOpenNow(shop.open_hours ?? null),
      distance: userLocation
        ? haversineKm(userLocation.lat, userLocation.lng, shop.location.lat, shop.location.lng)
        : null,
    }));
  }, [shops, activeFilters, regionParam, userLocation, searchQuery]);

  const sorted = useMemo(() => {
    const items = [...filtered];
    if (userLocation) {
      items.sort((a, b) => (a.distance ?? Infinity) - (b.distance ?? Infinity));
    }
    return items;
  }, [filtered, userLocation]);

  const { visibleItems, sentinelRef, hasMore } = useInfiniteScroll({
    items: sorted,
    pageSize: 20,
  });

  const toggleMap = useCallback(() => setShowMap((v) => !v), []);

  return (
    <div className="min-h-[calc(100vh-48px)]">
      {/* Sticky filter bar */}
      <div className="sticky top-0 z-30">
        <FilterBar
          searchQuery={searchQuery}
          onSearchChange={setSearchQuery}
          nearMeActive={nearMeActive}
          nearMeStatus={geoStatus}
          onNearMeToggle={handleNearMeToggle}
        />
      </div>

      {/* Map toggle + map area */}
      {showMap && (
        <div className="h-[40vh] relative">
          <GoogleMapView
            shops={filtered.map((f) => f.shop)}
            initialCenter={regionCenter}
            initialZoom={regionCenter ? 15 : undefined}
          />
          <button
            onClick={toggleMap}
            className="absolute top-3 right-3 z-20 bg-white rounded-full p-2 shadow-md"
          >
            <X className="size-4 text-gray-600" />
          </button>
        </div>
      )}

      {/* Shop count + map toggle */}
      <div className="px-4 py-3 flex items-center justify-between border-b border-gray-100">
        <span className="text-sm text-gray-500">
          {filtered.length} shops{userLocation ? ' nearby' : ''}
        </span>
        <button
          onClick={toggleMap}
          className="flex items-center gap-1.5 text-sm font-medium text-[#E3350D]"
        >
          <MapPin className="size-4" />
          {showMap ? 'Hide Map' : 'Show Map'}
        </button>
      </div>

      {/* Shop list */}
      <div className="px-4 py-3 space-y-3 pb-20">
        {sorted.length === 0 ? (
          <p className="text-sm text-gray-400 text-center py-12">
            No shops match your filters.
          </p>
        ) : (
          <>
            {visibleItems.map(({ shop, isOpen, distance }) => (
              <ShopCard
                key={shop.id}
                shop={shop}
                isOpen={isOpen ?? undefined}
                distance={distance}
              />
            ))}
            {hasMore && (
              <div ref={sentinelRef} className="flex justify-center py-4">
                <div className="w-5 h-5 border-2 border-gray-200 border-t-[#E3350D] rounded-full animate-spin" />
              </div>
            )}
          </>
        )}
      </div>
    </div>
  );
}
