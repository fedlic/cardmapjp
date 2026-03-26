'use client';

import { useRouter, useSearchParams, usePathname } from 'next/navigation';
import { useCallback, useRef, useEffect } from 'react';
import { Search, X, Navigation } from 'lucide-react';
import type { GeoStatus } from '@/hooks/useGeolocation';

const FILTERS = [
  { key: 'open', label: 'Open Now' },
  { key: 'en', label: 'EN Staff' },
  { key: 'psa', label: 'PSA' },
  { key: 'box', label: 'BOX' },
  { key: 'beginner', label: 'Beginner' },
] as const;

export type FilterKey = (typeof FILTERS)[number]['key'];

export function getActiveFilters(searchParams: URLSearchParams): Set<FilterKey> {
  const active = new Set<FilterKey>();
  for (const f of FILTERS) {
    if (searchParams.get(f.key) === '1') active.add(f.key);
  }
  return active;
}

interface FilterBarProps {
  searchQuery: string;
  onSearchChange: (query: string) => void;
  nearMeActive: boolean;
  nearMeStatus: GeoStatus;
  onNearMeToggle: () => void;
}

export default function FilterBar({
  searchQuery,
  onSearchChange,
  nearMeActive,
  nearMeStatus,
  onNearMeToggle,
}: FilterBarProps) {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();
  const active = getActiveFilters(searchParams);
  const inputRef = useRef<HTMLInputElement>(null);

  const toggle = useCallback((key: FilterKey) => {
    const params = new URLSearchParams(searchParams.toString());
    if (params.get(key) === '1') {
      params.delete(key);
    } else {
      params.set(key, '1');
    }
    const qs = params.toString();
    router.push(qs ? `${pathname}?${qs}` : pathname, { scroll: false });
  }, [router, pathname, searchParams]);

  // Focus input when user starts typing anywhere (if not already focused on an input)
  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (
        e.key === '/' &&
        !e.metaKey &&
        !e.ctrlKey &&
        document.activeElement?.tagName !== 'INPUT' &&
        document.activeElement?.tagName !== 'TEXTAREA'
      ) {
        e.preventDefault();
        inputRef.current?.focus();
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, []);

  return (
    <div className="bg-white border-b border-gray-100">
      {/* Search input */}
      <div className="px-4 pt-2 pb-1">
        <div className="relative">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 size-4 text-gray-400" />
          <input
            ref={inputRef}
            type="text"
            placeholder="Search shops..."
            value={searchQuery}
            onChange={(e) => onSearchChange(e.target.value)}
            className="w-full pl-9 pr-8 py-2 text-sm rounded-full border border-gray-200 bg-gray-50 focus:bg-white focus:border-gray-300 focus:outline-none transition-colors"
          />
          {searchQuery && (
            <button
              onClick={() => onSearchChange('')}
              className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
            >
              <X className="size-4" />
            </button>
          )}
        </div>
      </div>

      {/* Filter pills */}
      <div className="flex gap-2 px-4 py-2 overflow-x-auto scrollbar-hide">
        {/* Near Me button */}
        <button
          onClick={onNearMeToggle}
          className={`shrink-0 rounded-full text-[13px] font-medium transition-colors select-none flex items-center gap-1 ${
            nearMeActive
              ? 'bg-[#E3350D] text-white px-4 py-1.5'
              : 'bg-white text-gray-500 border border-gray-200 px-4 py-1.5 hover:border-gray-400'
          }`}
        >
          <Navigation className={`size-3.5 ${nearMeStatus === 'loading' ? 'animate-pulse' : ''}`} />
          Near Me
        </button>

        {FILTERS.map(({ key, label }) => {
          const isActive = active.has(key);
          return (
            <button
              key={key}
              onClick={() => toggle(key)}
              className={`shrink-0 rounded-full text-[13px] font-medium transition-colors select-none ${
                isActive
                  ? 'bg-[#E3350D] text-white px-4 py-1.5'
                  : 'bg-white text-gray-500 border border-gray-200 px-4 py-1.5 hover:border-gray-400'
              }`}
            >
              {label}
            </button>
          );
        })}
      </div>
    </div>
  );
}
