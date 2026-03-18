'use client';

import { useState, useMemo, useCallback } from 'react';
import { Input } from '@/components/ui/input';
import ShopCard from './ShopCard';
import ShopFilters, { type Filters } from './ShopFilters';
import { useDebounce } from '@/hooks/useDebounce';
import type { Shop } from '@/types';

type SortKey = 'name' | 'rating';

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
  const [sortKey, setSortKey] = useState<SortKey>('name');
  const debouncedSearch = useDebounce(search, 200);

  const handleSelectShop = useCallback(
    (shop: Shop) => onSelectShop(shop),
    [onSelectShop]
  );

  const filtered = useMemo(() => {
    const list = shops.filter((shop) => {
      if (debouncedSearch) {
        const q = debouncedSearch.toLowerCase();
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

    if (sortKey === 'rating') {
      list.sort((a, b) => (b.google_rating ?? 0) - (a.google_rating ?? 0));
    } else {
      list.sort((a, b) => a.name_en.localeCompare(b.name_en));
    }

    return list;
  }, [shops, debouncedSearch, filters, sortKey]);

  return (
    <div className="flex flex-col h-full bg-white">
      <div className="p-3 border-b">
        <div className="flex items-center justify-between mb-2">
          <h2 className="font-bold text-lg">
            Card Shops
            <span className="text-sm font-normal text-muted-foreground ml-2">
              {filtered.length} shops
            </span>
          </h2>
          <select
            value={sortKey}
            onChange={(e) => setSortKey(e.target.value as SortKey)}
            className="text-xs border rounded px-2 py-1 bg-white"
          >
            <option value="name">Name</option>
            <option value="rating">Rating</option>
          </select>
        </div>
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
              onSelect={handleSelectShop}
            />
          ))
        )}
      </div>
    </div>
  );
}
