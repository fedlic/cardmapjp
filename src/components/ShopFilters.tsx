'use client';

import { Badge } from '@/components/ui/badge';

export interface Filters {
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

const FILTER_OPTIONS: { key: keyof Filters; label: string }[] = [
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
      {FILTER_OPTIONS.map(({ key, label }) => (
        <Badge
          key={key}
          variant={filters[key] ? 'default' : 'outline'}
          className={`cursor-pointer select-none transition-colors ${
            filters[key]
              ? 'bg-[#E3350D] hover:bg-[#c42d0b] text-white'
              : 'hover:bg-gray-100'
          }`}
          onClick={() => toggle(key)}
        >
          {label}
        </Badge>
      ))}
    </div>
  );
}
