'use client';

import { useEffect, useState, useCallback } from 'react';
import dynamic from 'next/dynamic';

const ShopMap = dynamic(() => import('@/components/ShopMap'), { ssr: false });
import ShopSidebar from '@/components/ShopSidebar';
import type { Shop, ShopRow } from '@/types';

function rowToShop(row: ShopRow): Shop {
  return {
    ...row,
    location: { lat: row.lat, lng: row.lng },
  };
}

export default function HomePage() {
  const [shops, setShops] = useState<Shop[]>([]);
  const [selectedShop, setSelectedShop] = useState<Shop | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function fetchShops() {
      try {
        const res = await fetch('/api/shops');
        if (!res.ok) throw new Error('Failed to fetch shops');
        const data: ShopRow[] = await res.json();
        setShops(data.map(rowToShop));
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Something went wrong');
      } finally {
        setLoading(false);
      }
    }
    fetchShops();
  }, []);

  const handleSelectShop = useCallback((shop: Shop | null) => {
    setSelectedShop(shop);
  }, []);

  if (error) {
    return (
      <div className="flex items-center justify-center h-[calc(100vh-52px)]">
        <div className="text-center">
          <p className="text-lg font-semibold text-red-600">Error</p>
          <p className="text-sm text-muted-foreground">{error}</p>
        </div>
      </div>
    );
  }

  return (
    <div className="h-[calc(100vh-52px)] flex flex-col md:flex-row">
      {/* Map */}
      <div className="h-1/2 md:h-full md:flex-1 relative">
        {loading ? (
          <div className="flex items-center justify-center h-full bg-gray-100">
            <div className="text-center">
              <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-[#E3350D] mx-auto" />
              <p className="text-sm text-muted-foreground mt-2">
                Loading map...
              </p>
            </div>
          </div>
        ) : (
          <ShopMap
            shops={shops}
            selectedShop={selectedShop}
            onSelectShop={handleSelectShop}
            className="w-full h-full"
          />
        )}
      </div>

      {/* Sidebar */}
      <div className="h-1/2 md:h-full md:w-[380px] border-t md:border-t-0 md:border-l overflow-hidden">
        <ShopSidebar
          shops={shops}
          selectedShopId={selectedShop?.id ?? null}
          onSelectShop={(shop) => setSelectedShop(shop)}
        />
      </div>
    </div>
  );
}
