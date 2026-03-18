'use client';

import { useCallback, useEffect, useRef, useState } from 'react';
import { DEFAULT_CENTER, DEFAULT_ZOOM } from '@/lib/google-maps';
import type { Shop } from '@/types';
import type { GeoPosition } from '@/hooks/useGeolocation';

import {
  MapContainer,
  TileLayer,
  Marker,
  Popup,
  useMap,
} from 'react-leaflet';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

const defaultIcon = new L.Icon({
  iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',
  shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-shadow.png',
  iconSize: [25, 41],
  iconAnchor: [12, 41],
  popupAnchor: [1, -34],
  shadowSize: [41, 41],
});

const selectedIcon = new L.Icon({
  iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png',
  shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-shadow.png',
  iconSize: [30, 49],
  iconAnchor: [15, 49],
  popupAnchor: [1, -40],
  shadowSize: [41, 41],
});

const userIcon = new L.Icon({
  iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',
  shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-shadow.png',
  iconSize: [25, 41],
  iconAnchor: [12, 41],
  popupAnchor: [1, -34],
  shadowSize: [41, 41],
});

export interface MapBounds {
  north: number;
  south: number;
  east: number;
  west: number;
}

interface ShopMapProps {
  shops: Shop[];
  selectedShop: Shop | null;
  onSelectShop: (shop: Shop | null) => void;
  onBoundsChange?: (bounds: MapBounds) => void;
  userLocation?: GeoPosition | null;
  initialCenter?: { lat: number; lng: number } | null;
  initialZoom?: number;
  className?: string;
}

function FlyToSelected({ shop }: { shop: Shop | null }) {
  const map = useMap();
  useEffect(() => {
    if (shop) {
      map.flyTo([shop.location.lat, shop.location.lng], 17, { duration: 0.5 });
    }
  }, [shop, map]);
  return null;
}

function FlyToUser({ position }: { position: GeoPosition | null }) {
  const map = useMap();
  const hasFlown = useRef(false);
  useEffect(() => {
    if (position && !hasFlown.current) {
      map.flyTo([position.lat, position.lng], 15, { duration: 0.8 });
      hasFlown.current = true;
    }
  }, [position, map]);
  return null;
}

function BoundsTracker({ onChange }: { onChange: (bounds: MapBounds) => void }) {
  const map = useMap();
  const onChangeRef = useRef(onChange);
  onChangeRef.current = onChange;

  useEffect(() => {
    const report = () => {
      const b = map.getBounds();
      onChangeRef.current({
        north: b.getNorth(),
        south: b.getSouth(),
        east: b.getEast(),
        west: b.getWest(),
      });
    };
    report();
    map.on('moveend', report);
    return () => { map.off('moveend', report); };
  }, [map]);
  return null;
}

export default function ShopMap({
  shops,
  selectedShop,
  onSelectShop,
  onBoundsChange,
  userLocation,
  initialCenter,
  initialZoom,
  className,
}: ShopMapProps) {
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
  }, []);

  const selectedShopId = selectedShop?.id ?? null;

  const handleMarkerClick = useCallback(
    (shop: Shop) => {
      onSelectShop(selectedShopId === shop.id ? null : shop);
    },
    [selectedShopId, onSelectShop]
  );

  if (!mounted) {
    return (
      <div className={`${className} bg-gray-100 flex items-center justify-center`}>
        <p className="text-sm text-muted-foreground">Loading map...</p>
      </div>
    );
  }

  return (
    <MapContainer
      center={[initialCenter?.lat ?? DEFAULT_CENTER.lat, initialCenter?.lng ?? DEFAULT_CENTER.lng]}
      zoom={initialZoom ?? DEFAULT_ZOOM}
      className={className}
      style={{ height: '100%', width: '100%' }}
      zoomControl={true}
    >
      <TileLayer
        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
      />
      <FlyToSelected shop={selectedShop} />
      <FlyToUser position={userLocation ?? null} />
      {onBoundsChange && <BoundsTracker onChange={onBoundsChange} />}
      {userLocation && (
        <Marker position={[userLocation.lat, userLocation.lng]} icon={userIcon}>
          <Popup>
            <p className="font-semibold text-sm">You are here</p>
          </Popup>
        </Marker>
      )}
      {shops.map((shop) => {
        const isSelected = selectedShop?.id === shop.id;
        return (
          <Marker
            key={shop.id}
            position={[shop.location.lat, shop.location.lng]}
            icon={isSelected ? selectedIcon : defaultIcon}
            eventHandlers={{
              click: () => handleMarkerClick(shop),
            }}
          >
            <Popup>
              <div className="min-w-[180px]">
                <h3 className="font-bold text-sm">{shop.name_en}</h3>
                <p className="text-xs text-gray-500">{shop.name_jp}</p>
                {shop.google_rating && (
                  <p className="text-xs mt-1">
                    <span className="text-yellow-500">&#9733;</span> {shop.google_rating}
                    <span className="text-gray-400 ml-1">
                      ({shop.google_review_count})
                    </span>
                  </p>
                )}
                <a
                  href={`/shops/${shop.id}`}
                  className="text-xs text-[#E3350D] hover:underline mt-2 inline-block font-medium"
                >
                  View Details &rarr;
                </a>
              </div>
            </Popup>
          </Marker>
        );
      })}
    </MapContainer>
  );
}
