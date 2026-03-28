'use client';

import { useEffect, useRef } from 'react';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import { DEFAULT_CENTER, DEFAULT_ZOOM } from '@/lib/google-maps';
import type { Shop } from '@/types';

interface GoogleMapViewProps {
  shops: Shop[];
  initialCenter?: { lat: number; lng: number } | null;
  initialZoom?: number;
}

// Leafletのデフォルトアイコンパスを修正
const defaultIcon = L.icon({
  iconUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png',
  iconRetinaUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png',
  shadowUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png',
  iconSize: [25, 41],
  iconAnchor: [12, 41],
  popupAnchor: [1, -34],
  shadowSize: [41, 41],
});

const redIcon = L.icon({
  iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png',
  iconRetinaUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',
  shadowUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png',
  iconSize: [25, 41],
  iconAnchor: [12, 41],
  popupAnchor: [1, -34],
  shadowSize: [41, 41],
});

export default function GoogleMapView({ shops, initialCenter, initialZoom }: GoogleMapViewProps) {
  const mapRef = useRef<HTMLDivElement>(null);
  const mapInstanceRef = useRef<L.Map | null>(null);

  useEffect(() => {
    if (!mapRef.current || mapInstanceRef.current) return;

    const center = initialCenter ?? DEFAULT_CENTER;
    const zoom = initialZoom ?? DEFAULT_ZOOM;

    const map = L.map(mapRef.current, {
      center: [center.lat, center.lng],
      zoom,
      zoomControl: true,
    });

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
      maxZoom: 19,
    }).addTo(map);

    // マーカーを追加
    shops.forEach((shop) => {
      const marker = L.marker([shop.location.lat, shop.location.lng], { icon: redIcon }).addTo(map);

      const popupContent = `
        <div style="min-width:160px;font-family:sans-serif;">
          <div style="font-weight:700;font-size:14px;margin-bottom:2px;">${escapeHtml(shop.name_en)}</div>
          <div style="font-size:12px;color:#6b7280;">${escapeHtml(shop.name_jp ?? '')}</div>
          ${shop.google_rating ? `<div style="font-size:12px;margin-top:4px;"><span style="color:#FFCB05;">&#9733;</span> ${shop.google_rating}</div>` : ''}
          <a href="/shops/${shop.id}" style="font-size:12px;color:#E3350D;text-decoration:none;display:inline-block;margin-top:6px;font-weight:500;">View Details &rarr;</a>
        </div>
      `;

      marker.bindPopup(popupContent);
    });

    // 店舗があれば全体が見えるように調整
    if (shops.length > 0 && !initialCenter) {
      const bounds = L.latLngBounds(shops.map((s) => [s.location.lat, s.location.lng]));
      map.fitBounds(bounds, { padding: [20, 20], maxZoom: 15 });
    }

    mapInstanceRef.current = map;

    return () => {
      map.remove();
      mapInstanceRef.current = null;
    };
  }, [shops, initialCenter, initialZoom]);

  return (
    <div className="relative w-full h-full overflow-hidden">
      <div ref={mapRef} className="w-full h-full" />
    </div>
  );
}

function escapeHtml(str: string): string {
  return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}
