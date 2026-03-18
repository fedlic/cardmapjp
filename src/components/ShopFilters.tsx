'use client';

import { Heart, CheckCircle } from 'lucide-react';
import { cn } from '@/lib/utils';

export interface Filters {
  favorites_only: boolean;
  visited_only: boolean;
  english_staff: boolean;
  psa_graded: boolean;
  booster_box: boolean;
  singles: boolean;
  beginner_friendly: boolean;
  vintage: boolean;
}

interface ShopFiltersProps {
  filters: Filters;
  onChange: (filters: Filters) => void;
}

const FILTER_OPTIONS: { key: keyof Filters; label: string; icon?: React.ReactNode }[] = [
  { key: 'favorites_only', label: 'Favorites', icon: <Heart className="size-3" /> },
  { key: 'visited_only', label: 'Visited', icon: <CheckCircle className="size-3" /> },
  { key: 'english_staff', label: 'EN Staff' },
  { key: 'psa_graded', label: 'PSA' },
  { key: 'booster_box', label: 'BOX' },
  { key: 'beginner_friendly', label: 'Beginner' },
  { key: 'singles', label: 'Singles' },
  { key: 'vintage', label: 'Vintage' },
];

export default function ShopFilters({ filters, onChange }: ShopFiltersProps) {
  const toggle = (key: keyof Filters) => {
    onChange({ ...filters, [key]: !filters[key] });
  };

  return (
    <div className="flex gap-2 px-3 py-2.5 overflow-x-auto scrollbar-hide">
      {FILTER_OPTIONS.map(({ key, label, icon }) => (
        <button
          key={key}
          onClick={() => toggle(key)}
          className={cn(
            'shrink-0 flex items-center gap-1.5 rounded-full px-3 py-1.5 text-xs font-medium transition-all select-none',
            filters[key]
              ? 'bg-[#FFCB05] text-[#1a1a2e] font-semibold shadow-sm'
              : 'border border-white/20 text-white/70 hover:border-white/40 hover:text-white'
          )}
        >
          {icon}
          {label}
        </button>
      ))}
    </div>
  );
}
