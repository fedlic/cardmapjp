import type { ShopInventory } from '@/types';
import {
  CATEGORY_LABELS,
  CATEGORY_ICONS,
  AVAILABILITY_COLORS,
  AVAILABILITY_LABELS,
} from '@/types';

interface InventoryGridProps {
  inventory: ShopInventory[];
}

function formatPrice(min: number | null, max: number | null): string {
  if (!min && !max) return '';
  if (min && max) return `¥${min.toLocaleString()} - ¥${max.toLocaleString()}`;
  if (min) return `from ¥${min.toLocaleString()}`;
  return `up to ¥${max!.toLocaleString()}`;
}

export default function InventoryGrid({ inventory }: InventoryGridProps) {
  if (inventory.length === 0) return null;

  return (
    <div>
      <h2 className="font-semibold text-lg text-gray-900 mb-3">What&apos;s in Stock</h2>
      <div className="grid grid-cols-2 gap-3">
        {inventory.map((item) => (
          <div key={item.id} className="bg-white rounded-lg border border-gray-100 p-3 shadow-sm">
            <div className="text-2xl mb-1">{CATEGORY_ICONS[item.category]}</div>
            <h3 className="font-medium text-sm text-gray-900">{CATEGORY_LABELS[item.category]}</h3>
            <span className={`inline-block mt-1 text-[10px] font-medium rounded px-1.5 py-0.5 ${AVAILABILITY_COLORS[item.availability]}`}>
              {AVAILABILITY_LABELS[item.availability]}
            </span>
            {(item.price_range_min || item.price_range_max) && (
              <p className="text-xs text-gray-400 mt-1">{formatPrice(item.price_range_min, item.price_range_max)}</p>
            )}
            {item.notes_en && (
              <p className="text-xs text-gray-400 mt-1 line-clamp-2">{item.notes_en}</p>
            )}
          </div>
        ))}
      </div>
    </div>
  );
}
