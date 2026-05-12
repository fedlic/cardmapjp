'use client';

import { useState, useMemo } from 'react';
import { Search, X } from 'lucide-react';

interface ShopOption {
  id: string;
  name_en: string;
  name_jp: string;
}

interface ShopPickerProps {
  shops: ShopOption[];
  onSelect: (shop: ShopOption) => void;
  onClose: () => void;
}

export default function ShopPicker({ shops, onSelect, onClose }: ShopPickerProps) {
  const [query, setQuery] = useState('');

  const filtered = useMemo(() => {
    if (!query.trim()) return shops.slice(0, 50);
    const q = query.toLowerCase();
    return shops.filter(
      (s) => s.name_en.toLowerCase().includes(q) || s.name_jp.includes(q)
    ).slice(0, 50);
  }, [shops, query]);

  return (
    <div className="fixed inset-0 bg-black/50 z-50 flex items-end sm:items-center justify-center">
      <div className="bg-white w-full sm:max-w-md sm:rounded-xl rounded-t-xl max-h-[80vh] flex flex-col">
        <div className="flex items-center justify-between p-4 border-b">
          <h3 className="font-semibold">Select Shop</h3>
          <button onClick={onClose} className="p-1">
            <X className="size-5 text-gray-500" />
          </button>
        </div>
        <div className="px-4 py-3 border-b">
          <div className="relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 size-4 text-gray-400" />
            <input
              type="text"
              placeholder="Search shops..."
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              className="w-full pl-9 pr-3 py-2 text-sm border rounded-lg focus:outline-none focus:ring-2 focus:ring-[#E3350D]/30"
              autoFocus
            />
          </div>
        </div>
        <div className="flex-1 overflow-y-auto">
          {filtered.length === 0 ? (
            <p className="text-sm text-gray-400 text-center py-8">No shops found</p>
          ) : (
            filtered.map((shop) => (
              <button
                key={shop.id}
                onClick={() => onSelect(shop)}
                className="w-full text-left px-4 py-3 hover:bg-gray-50 border-b border-gray-50"
              >
                <p className="text-sm font-medium">{shop.name_en}</p>
                <p className="text-xs text-gray-400">{shop.name_jp}</p>
              </button>
            ))
          )}
        </div>
      </div>
    </div>
  );
}
