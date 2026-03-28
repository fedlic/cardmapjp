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
  const markersRef = useRef<L.LayerGroup | null>(null);

  // マップ初期化（1回だけ）
  useEffect(() => {
    if (!mapRef.current || mapInstanceRef.current) return;

    const map = L.map(mapRef.current, {
      center: [DEFAULT_CENTER.lat, DEFAULT_CENTER.lng],
      zoom: DEFAULT_ZOOM,
      zoomControl: true,
    });

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
      maxZoom: 19,
    }).addTo(map);

    markersRef.current = L.layerGroup().addTo(map);
    mapInstanceRef.current = map;

    return () => {
      map.remove();
      mapInstanceRef.current = null;
      markersRef.current = null;
    };
  }, []);

  // センター・ズーム更新
  useEffect(() => {
    const map = mapInstanceRef.current;
    if (!map || !initialCenter) return;
    map.setView([initialCenter.lat, initialCenter.lng], initialZoom ?? 14);
  }, [initialCenter, initialZoom]);

  // マーカー更新
  useEffect(() => {
    const map = mapInstanceRef.current;
    const markerLayer = markersRef.current;
    if (!map || !markerLayer) return;

    markerLayer.clearLayers();

    shops.forEach((shop) => {
      const marker = L.marker([shop.location.lat, shop.location.lng], { icon: redIcon });

      const popupContent = `
        <div style="min-width:160px;font-family:sans-serif;">
          <div style="font-weight:700;font-size:14px;margin-bottom:2px;">${escapeHtml(shop.name_en)}</div>
          <div style="font-size:12px;color:#6b7280;">${escapeHtml(shop.name_jp ?? '')}</div>
          ${shop.google_rating ? `<div style="font-size:12px;margin-top:4px;"><span style="color:#FFCB05;">&#9733;</span> ${shop.google_rating}</div>` : ''}
          <a href="/shops/${shop.id}" style="font-size:12px;color:#E3350D;text-decoration:none;display:inline-block;margin-top:6px;font-weight:500;">View Details &rarr;</a>
        </div>
      `;

      marker.bindPopup(popupContent);
      markerLayer.addLayer(marker);
    });
  }, [shops]);

  return (
    <div className="relative w-full h-full overflow-hidden">
      <div ref={mapRef} className="w-full h-full" />
    </div>
  );
}

function escapeHtml(str: string): string {
  return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}
