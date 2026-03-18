'use client';

import { useCallback } from 'react';
import {
  APIProvider,
  Map,
  AdvancedMarker,
  InfoWindow,
  useAdvancedMarkerRef,
} from '@vis.gl/react-google-maps';
import { DEFAULT_CENTER, DEFAULT_ZOOM, GOOGLE_MAPS_API_KEY } from '@/lib/google-maps';
import type { Shop } from '@/types';

interface ShopMapProps {
  shops: Shop[];
  selectedShop: Shop | null;
  onSelectShop: (shop: Shop | null) => void;
  className?: string;
}

function ShopPin({
  shop,
  isSelected,
  onClick,
}: {
  shop: Shop;
  isSelected: boolean;
  onClick: () => void;
}) {
  const [markerRef, marker] = useAdvancedMarkerRef();

  return (
    <>
      <AdvancedMarker
        ref={markerRef}
        position={shop.location}
        onClick={onClick}
      >
        <div
          className={`w-8 h-8 rounded-full flex items-center justify-center text-white text-xs font-bold shadow-lg transition-transform ${
            isSelected ? 'scale-125 bg-[#E3350D]' : 'bg-[#E3350D]/80 hover:bg-[#E3350D]'
          }`}
        >
          🃏
        </div>
      </AdvancedMarker>
      {isSelected && marker && (
        <InfoWindow anchor={marker} onCloseClick={() => onClick()}>
          <div className="p-1 max-w-[200px]">
            <h3 className="font-bold text-sm">{shop.name_en}</h3>
            <p className="text-xs text-gray-500">{shop.name_jp}</p>
            {shop.google_rating && (
              <p className="text-xs mt-1">
                <span className="text-yellow-500">★</span> {shop.google_rating}
                <span className="text-gray-400 ml-1">
                  ({shop.google_review_count})
                </span>
              </p>
            )}
            <a
              href={`/shops/${shop.id}`}
              className="text-xs text-[#E3350D] hover:underline mt-1 inline-block"
            >
              View Details →
            </a>
          </div>
        </InfoWindow>
      )}
    </>
  );
}

export default function ShopMap({
  shops,
  selectedShop,
  onSelectShop,
  className,
}: ShopMapProps) {
  const handleMarkerClick = useCallback(
    (shop: Shop) => {
      onSelectShop(selectedShop?.id === shop.id ? null : shop);
    },
    [selectedShop, onSelectShop]
  );

  return (
    <APIProvider apiKey={GOOGLE_MAPS_API_KEY}>
      <Map
        className={className}
        defaultCenter={DEFAULT_CENTER}
        defaultZoom={DEFAULT_ZOOM}
        mapId="cardmapjp-main"
        gestureHandling="greedy"
        disableDefaultUI={false}
        zoomControl={true}
        streetViewControl={false}
        mapTypeControl={false}
        fullscreenControl={false}
      >
        {shops.map((shop) => (
          <ShopPin
            key={shop.id}
            shop={shop}
            isSelected={selectedShop?.id === shop.id}
            onClick={() => handleMarkerClick(shop)}
          />
        ))}
      </Map>
    </APIProvider>
  );
}
