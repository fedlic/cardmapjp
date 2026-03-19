'use client';

import { useRouter, useSearchParams, usePathname } from 'next/navigation';
import { useCallback } from 'react';

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

export default function FilterBar() {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();
  const active = getActiveFilters(searchParams);

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

  return (
    <div className="flex gap-2 px-4 py-2 overflow-x-auto scrollbar-hide bg-white border-b border-gray-100">
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
  );
}
