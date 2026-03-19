'use client';

import { useEffect, useRef, useState } from 'react';
import { setOptions, importLibrary } from '@googlemaps/js-api-loader';
import { MarkerClusterer } from '@googlemaps/markerclusterer';
import { DEFAULT_CENTER, DEFAULT_ZOOM } from '@/lib/google-maps';
import type { Shop } from '@/types';

interface GoogleMapViewProps {
  shops: Shop[];
  initialCenter?: { lat: number; lng: number } | null;
  initialZoom?: number;
}

let optionsSet = false;

export default function GoogleMapView({ shops, initialCenter, initialZoom }: GoogleMapViewProps) {
  const mapRef = useRef<HTMLDivElement>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!mapRef.current) return;

    if (!optionsSet) {
      setOptions({
        key: process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY || '',
        v: 'weekly',
      });
      optionsSet = true;
    }

    (async () => {
      const { Map } = await importLibrary('maps');
      const { Marker } = await importLibrary('marker');

      const map = new Map(mapRef.current!, {
        center: initialCenter ?? DEFAULT_CENTER,
        zoom: initialZoom ?? DEFAULT_ZOOM,
        disableDefaultUI: true,
        zoomControl: true,
        gestureHandling: 'greedy',
      });

      const markers = shops.map((shop) => {
        const marker = new Marker({
          map,
          position: { lat: shop.location.lat, lng: shop.location.lng },
          title: shop.name_en,
        });

        const infoWindow = new google.maps.InfoWindow({
          content: `
            <div style="min-width:160px;font-family:sans-serif;">
              <div style="font-weight:700;font-size:14px;margin-bottom:2px;">${escapeHtml(shop.name_en)}</div>
              <div style="font-size:12px;color:#6b7280;">${escapeHtml(shop.name_jp)}</div>
              ${shop.google_rating ? `<div style="font-size:12px;margin-top:4px;"><span style="color:#FFCB05;">&#9733;</span> ${shop.google_rating}</div>` : ''}
              <a href="/shops/${shop.id}" style="font-size:12px;color:#E3350D;text-decoration:none;display:inline-block;margin-top:6px;font-weight:500;">View Details &rarr;</a>
            </div>
          `,
        });

        marker.addListener('click', () => {
          infoWindow.open({ anchor: marker, map });
        });

        return marker;
      });

      new MarkerClusterer({ map, markers });
      setLoading(false);
    })();
  }, [shops, initialCenter, initialZoom]);

  return (
    <div className="relative w-full h-full overflow-hidden">
      {loading && (
        <div className="absolute inset-0 flex items-center justify-center bg-gray-50 z-10">
          <div className="text-sm text-gray-400">Loading map...</div>
        </div>
      )}
      <div ref={mapRef} className="w-full h-full" />
    </div>
  );
}

function escapeHtml(str: string): string {
  return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}
