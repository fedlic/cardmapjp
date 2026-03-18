'use client';

import { useState, useCallback } from 'react';
import dynamic from 'next/dynamic';
import ShopSidebar from '@/components/ShopSidebar';
import type { Shop } from '@/types';

const ShopMap = dynamic(() => import('@/components/ShopMap'), { ssr: false });

interface HomePageClientProps {
  shops: Shop[];
}

export default function HomePageClient({ shops }: HomePageClientProps) {
  const [selectedShop, setSelectedShop] = useState<Shop | null>(null);

  const handleSelectShop = useCallback((shop: Shop | null) => {
    setSelectedShop(shop);
  }, []);

  return (
    <div className="h-[calc(100vh-52px)] flex flex-col md:flex-row">
      {/* Map */}
      <div className="h-1/2 md:h-full md:flex-1 relative">
        <ShopMap
          shops={shops}
          selectedShop={selectedShop}
          onSelectShop={handleSelectShop}
          className="w-full h-full"
        />
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
