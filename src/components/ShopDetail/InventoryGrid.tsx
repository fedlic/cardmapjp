import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
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
  if (min && max) return `¥${min.toLocaleString()} – ¥${max.toLocaleString()}`;
  if (min) return `from ¥${min.toLocaleString()}`;
  return `up to ¥${max!.toLocaleString()}`;
}

export default function InventoryGrid({ inventory }: InventoryGridProps) {
  if (inventory.length === 0) {
    return (
      <p className="text-sm text-muted-foreground">
        No inventory data available yet.
      </p>
    );
  }

  return (
    <div>
      <h2 className="font-semibold text-lg mb-3">What&apos;s in Stock</h2>
      <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
        {inventory.map((item) => (
          <Card key={item.id} className="hover:shadow-sm transition-shadow">
            <CardContent className="p-3">
              <div className="text-2xl mb-1">
                {CATEGORY_ICONS[item.category]}
              </div>
              <h3 className="font-medium text-sm">
                {CATEGORY_LABELS[item.category]}
              </h3>
              <Badge
                className={`mt-1 text-xs ${AVAILABILITY_COLORS[item.availability]}`}
              >
                {AVAILABILITY_LABELS[item.availability]}
              </Badge>
              {(item.price_range_min || item.price_range_max) && (
                <p className="text-xs text-muted-foreground mt-1">
                  {formatPrice(item.price_range_min, item.price_range_max)}
                </p>
              )}
              {item.notes_en && (
                <p className="text-xs text-muted-foreground mt-1 line-clamp-2">
                  {item.notes_en}
                </p>
              )}
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
}
