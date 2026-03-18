'use client';

import { useState, useMemo } from 'react';
import { Input } from '@/components/ui/input';
import ShopCard from './ShopCard';
import ShopFilters, { type Filters } from './ShopFilters';
import type { Shop } from '@/types';

interface ShopSidebarProps {
  shops: Shop[];
  selectedShopId: string | null;
  onSelectShop: (shop: Shop) => void;
}

const emptyFilters: Filters = {
  english_staff: false,
  psa_graded: false,
  booster_box: false,
  singles: false,
  beginner_friendly: false,
  vintage: false,
};

export default function ShopSidebar({
  shops,
  selectedShopId,
  onSelectShop,
}: ShopSidebarProps) {
  const [search, setSearch] = useState('');
  const [filters, setFilters] = useState<Filters>(emptyFilters);

  const filtered = useMemo(() => {
    return shops.filter((shop) => {
      if (search) {
        const q = search.toLowerCase();
        if (
          !shop.name_en.toLowerCase().includes(q) &&
          !shop.name_jp.includes(q)
        )
          return false;
      }
      if (filters.english_staff && !shop.english_staff) return false;
      if (filters.psa_graded && !shop.sells_psa_graded) return false;
      if (filters.booster_box && !shop.sells_booster_box) return false;
      if (filters.singles && !shop.sells_singles) return false;
      if (filters.beginner_friendly && !shop.beginner_friendly) return false;
      if (filters.vintage && !shop.sells_vintage) return false;
      return true;
    });
  }, [shops, search, filters]);

  return (
    <div className="flex flex-col h-full bg-white">
      <div className="p-3 border-b">
        <h2 className="font-bold text-lg mb-2">
          Card Shops
          <span className="text-sm font-normal text-muted-foreground ml-2">
            {filtered.length} shops
          </span>
        </h2>
        <Input
          placeholder="Search shops..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="h-9"
        />
      </div>

      <ShopFilters filters={filters} onChange={setFilters} />

      <div className="flex-1 overflow-y-auto p-3 space-y-2">
        {filtered.length === 0 ? (
          <p className="text-sm text-muted-foreground text-center py-8">
            No shops match your filters.
          </p>
        ) : (
          filtered.map((shop) => (
            <ShopCard
              key={shop.id}
              shop={shop}
              selected={shop.id === selectedShopId}
              onClick={() => onSelectShop(shop)}
            />
          ))
        )}
      </div>
    </div>
  );
}
