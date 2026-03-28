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
  userLocation?: { lat: number; lng: number } | null;
}

const redIcon = L.icon({
  iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png',
  iconRetinaUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',
  shadowUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png',
  iconSize: [25, 41],
  iconAnchor: [12, 41],
  popupAnchor: [1, -34],
  shadowSize: [41, 41],
});

// 現在地マーカー（青い丸）
const userIcon = L.divIcon({
  className: '',
  html: `
    <div style="position:relative;width:20px;height:20px;">
      <div style="position:absolute;inset:0;background:#4285F4;border:3px solid white;border-radius:50%;box-shadow:0 2px 6px rgba(0,0,0,0.3);"></div>
      <div style="position:absolute;inset:-8px;background:rgba(66,133,244,0.2);border-radius:50%;animation:pulse 2s infinite;"></div>
    </div>
    <style>@keyframes pulse{0%,100%{transform:scale(1);opacity:1}50%{transform:scale(1.8);opacity:0}}</style>
  `,
  iconSize: [20, 20],
  iconAnchor: [10, 10],
});

export default function GoogleMapView({ shops, initialCenter, initialZoom, userLocation }: GoogleMapViewProps) {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!containerRef.current) return;

    const center = initialCenter ?? DEFAULT_CENTER;
    const zoom = initialZoom ?? DEFAULT_ZOOM;

    const map = L.map(containerRef.current, {
      center: [center.lat, center.lng],
      zoom,
      zoomControl: true,
    });

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
      maxZoom: 19,
    }).addTo(map);

    // 現在地マーカー
    if (userLocation) {
      L.marker([userLocation.lat, userLocation.lng], { icon: userIcon, zIndexOffset: 1000 })
        .bindPopup('<div style="font-family:sans-serif;font-weight:700;font-size:13px;">You are here</div>')
        .addTo(map);
    }

    // ショップマーカー
    shops.forEach((shop) => {
      const marker = L.marker([shop.location.lat, shop.location.lng], { icon: redIcon });
      marker.bindPopup(`
        <div style="min-width:160px;font-family:sans-serif;">
          <div style="font-weight:700;font-size:14px;margin-bottom:2px;">${escapeHtml(shop.name_en)}</div>
          <div style="font-size:12px;color:#6b7280;">${escapeHtml(shop.name_jp ?? '')}</div>
          ${shop.google_rating ? `<div style="font-size:12px;margin-top:4px;"><span style="color:#FFCB05;">&#9733;</span> ${shop.google_rating}</div>` : ''}
          <a href="/shops/${shop.id}" style="font-size:12px;color:#E3350D;text-decoration:none;display:inline-block;margin-top:6px;font-weight:500;">View Details &rarr;</a>
        </div>
      `);
      marker.addTo(map);
    });

    return () => {
      map.remove();
    };
  }, [shops, initialCenter, initialZoom, userLocation]);

  return (
    <div className="relative w-full h-full overflow-hidden">
      <div ref={containerRef} className="w-full h-full" />
    </div>
  );
}

function escapeHtml(str: string): string {
  return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}
