'use client';

import { Heart, CheckCircle } from 'lucide-react';
import { Badge } from '@/components/ui/badge';

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

const FILTER_OPTIONS: { key: keyof Filters; label: string; icon?: React.ReactNode; activeClass?: string }[] = [
  { key: 'favorites_only', label: 'Favorites', icon: <Heart className="size-3" />, activeClass: 'bg-rose-500 hover:bg-rose-600 text-white' },
  { key: 'visited_only', label: 'Visited', icon: <CheckCircle className="size-3" />, activeClass: 'bg-emerald-500 hover:bg-emerald-600 text-white' },
  { key: 'english_staff', label: 'English Staff' },
  { key: 'psa_graded', label: 'PSA Graded' },
  { key: 'booster_box', label: 'Booster Boxes' },
  { key: 'singles', label: 'Singles' },
  { key: 'beginner_friendly', label: 'Beginner Friendly' },
  { key: 'vintage', label: 'Vintage' },
];

export default function ShopFilters({ filters, onChange }: ShopFiltersProps) {
  const toggle = (key: keyof Filters) => {
    onChange({ ...filters, [key]: !filters[key] });
  };

  return (
    <div className="flex flex-wrap gap-2 p-3">
      {FILTER_OPTIONS.map(({ key, label, icon, activeClass }) => (
        <Badge
          key={key}
          variant={filters[key] ? 'default' : 'outline'}
          className={`cursor-pointer select-none transition-colors ${
            filters[key]
              ? activeClass ?? 'bg-[#E3350D] hover:bg-[#c42d0b] text-white'
              : 'hover:bg-gray-100'
          }`}
          onClick={() => toggle(key)}
        >
          <span className="flex items-center gap-1">
            {icon}
            {label}
          </span>
        </Badge>
      ))}
    </div>
  );
}
