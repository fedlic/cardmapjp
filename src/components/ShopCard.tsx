import Link from 'next/link';
import type { Shop } from '@/types';

interface ShopCardProps {
  shop: Shop;
  isOpen?: boolean;
  distance?: number | null;
}

function formatDist(km: number): string {
  if (km < 1) return `${Math.round(km * 1000)}m`;
  return km < 10 ? `${km.toFixed(1)}km` : `${Math.round(km)}km`;
}

function formatWalkTime(km: number): string {
  const minutes = Math.round(km / 0.08); // ~80m/min walking
  return `${minutes} min walk`;
}

export default function ShopCard({ shop, isOpen, distance }: ShopCardProps) {
  const closed = shop.is_closed;

  return (
    <Link href={`/shops/${shop.id}`} className="block">
      <div className={`rounded-[10px] shadow-sm border border-gray-100 p-4 pl-5 relative overflow-hidden transition-shadow ${closed ? 'bg-gray-50 opacity-60' : 'bg-white hover:shadow-md'}`}>
        {/* Left color bar */}
        <div className={`absolute left-0 top-0 bottom-0 w-1 ${closed ? 'bg-red-300' : isOpen === undefined ? 'bg-gray-200' : isOpen ? 'bg-green-400' : 'bg-gray-300'}`} />

        {/* Row 1: Name + Rating */}
        <div className="flex items-start justify-between gap-2">
          <div className="min-w-0 flex-1">
            <h3 className={`font-bold text-[16px] truncate ${closed ? 'text-gray-400 line-through' : 'text-gray-900'}`}>{shop.name_en}</h3>
            <p className="text-[12px] text-gray-400 truncate mt-0.5">{shop.name_jp}</p>
          </div>
          {shop.google_rating && (
            <div className="flex items-center gap-1 shrink-0">
              <span className="text-[#FFCB05] text-lg leading-none">&#9733;</span>
              <span className="font-bold text-sm text-gray-900">{shop.google_rating}</span>
            </div>
          )}
        </div>

        {/* Row 2: Badges */}
        <div className="flex flex-wrap gap-1.5 mt-2">
          {closed && (
            <span className="inline-block text-[9px] font-medium rounded px-1.5 py-0.5 bg-red-100 text-red-700">
              Permanently Closed
            </span>
          )}
          {!closed && isOpen && (
            <span className="inline-block text-[9px] font-medium rounded px-1.5 py-0.5 bg-[#DCFCE7] text-[#15803D]">
              Open
            </span>
          )}
          {shop.english_staff && (
            <span className="inline-block text-[9px] font-medium rounded px-1.5 py-0.5 bg-[#DBEAFE] text-[#1D4ED8]">
              EN Staff
            </span>
          )}
          {shop.sells_psa_graded && (
            <span className="inline-block text-[9px] font-medium rounded px-1.5 py-0.5 bg-[#EDE9FE] text-[#5B21B6]">
              PSA
            </span>
          )}
          {shop.sells_booster_box && (
            <span className="inline-block text-[9px] font-medium rounded px-1.5 py-0.5 bg-[#FEF3C7] text-[#92400E]">
              BOX
            </span>
          )}
          {shop.beginner_friendly && (
            <span className="inline-block text-[9px] font-medium rounded px-1.5 py-0.5 bg-[#CCFBF1] text-[#0F766E]">
              Beginner
            </span>
          )}
        </div>

        {/* Row 3: Distance */}
        {distance != null && (
          <div className="mt-2 text-right">
            <span className="text-[11px] text-gray-400">
              {formatWalkTime(distance)} ({formatDist(distance)})
            </span>
          </div>
        )}
      </div>
    </Link>
  );
}
