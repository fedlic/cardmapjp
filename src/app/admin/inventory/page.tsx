'use client';

import { useState, useEffect, useCallback } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import type { ShopRow, ShopInventory, InventoryCategory, Availability } from '@/types';
import { CATEGORY_LABELS, CATEGORY_ICONS, AVAILABILITY_LABELS, AVAILABILITY_COLORS } from '@/types';

const ALL_CATEGORIES = Object.keys(CATEGORY_LABELS) as InventoryCategory[];
const ALL_AVAILABILITIES = Object.keys(AVAILABILITY_LABELS) as Availability[];

interface InventoryForm {
  id?: string;
  category: InventoryCategory;
  availability: Availability;
  price_range_min: string;
  price_range_max: string;
  notes_en: string;
}

function emptyInventory(category: InventoryCategory): InventoryForm {
  return { category, availability: 'unknown', price_range_min: '', price_range_max: '', notes_en: '' };
}

export default function AdminInventoryPage() {
  const [shops, setShops] = useState<ShopRow[]>([]);
  const [selectedShopId, setSelectedShopId] = useState<string>('');
  const [items, setItems] = useState<InventoryForm[]>([]);
  const [loading, setLoading] = useState(false);
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  useEffect(() => {
    fetch('/api/admin/shops')
      .then((r) => r.json())
      .then((data) => setShops(data));
  }, []);

  const loadInventory = useCallback(async (shopId: string) => {
    if (!shopId) { setItems([]); return; }
    setLoading(true);
    setSaved(false);
    const res = await fetch(`/api/admin/inventory?shop_id=${shopId}`);
    const data: ShopInventory[] = await res.json();

    const formItems: InventoryForm[] = ALL_CATEGORIES.map((cat) => {
      const existing = data.find((d) => d.category === cat);
      if (existing) {
        return {
          id: existing.id,
          category: cat,
          availability: existing.availability,
          price_range_min: existing.price_range_min?.toString() ?? '',
          price_range_max: existing.price_range_max?.toString() ?? '',
          notes_en: existing.notes_en ?? '',
        };
      }
      return emptyInventory(cat);
    });

    setItems(formItems);
    setLoading(false);
  }, []);

  function handleShopChange(shopId: string) {
    setSelectedShopId(shopId);
    loadInventory(shopId);
  }

  function updateItem(idx: number, field: keyof InventoryForm, value: string) {
    setItems((prev) => {
      const copy = [...prev];
      copy[idx] = { ...copy[idx], [field]: value };
      return copy;
    });
    setSaved(false);
  }

  async function handleSave() {
    if (!selectedShopId) return;
    setSaving(true);
    const payload = items
      .filter((item) => item.availability !== 'unknown' || item.id)
      .map((item) => ({
        ...(item.id ? { id: item.id } : {}),
        shop_id: selectedShopId,
        category: item.category,
        availability: item.availability,
        price_range_min: item.price_range_min ? parseInt(item.price_range_min) : null,
        price_range_max: item.price_range_max ? parseInt(item.price_range_max) : null,
        notes_en: item.notes_en || null,
      }));

    const res = await fetch('/api/admin/inventory', {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ items: payload }),
    });

    if (res.ok) setSaved(true);
    setSaving(false);
  }

  return (
    <div className="space-y-4">
      <h1 className="text-2xl font-bold">Inventory Management</h1>

      {/* Shop selector */}
      <div className="flex items-center gap-3">
        <select
          value={selectedShopId}
          onChange={(e) => handleShopChange(e.target.value)}
          className="border rounded-lg px-3 py-2 text-sm bg-white max-w-md w-full"
        >
          <option value="">Select a shop...</option>
          {shops.map((s) => (
            <option key={s.id} value={s.id}>{s.name_en}</option>
          ))}
        </select>
        {selectedShopId && (
          <Button
            className="bg-[#E3350D] hover:bg-[#c42d0b] text-white shrink-0"
            onClick={handleSave}
            disabled={saving}
          >
            {saving ? 'Saving...' : saved ? 'Saved!' : 'Save All'}
          </Button>
        )}
      </div>

      {loading && <p className="text-muted-foreground">Loading inventory...</p>}

      {/* Category grid */}
      {!loading && selectedShopId && (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
          {items.map((item, idx) => (
            <Card key={item.category}>
              <CardContent className="p-4 space-y-3">
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <span>{CATEGORY_ICONS[item.category]}</span>
                    <span className="text-sm font-medium">{CATEGORY_LABELS[item.category]}</span>
                  </div>
                  <Badge className={AVAILABILITY_COLORS[item.availability]}>
                    {AVAILABILITY_LABELS[item.availability]}
                  </Badge>
                </div>

                <select
                  value={item.availability}
                  onChange={(e) => updateItem(idx, 'availability', e.target.value)}
                  className="w-full border rounded px-2 py-1.5 text-sm bg-white"
                >
                  {ALL_AVAILABILITIES.map((a) => (
                    <option key={a} value={a}>{AVAILABILITY_LABELS[a]}</option>
                  ))}
                </select>

                <div className="grid grid-cols-2 gap-2">
                  <div>
                    <label className="text-xs text-muted-foreground">Min Price</label>
                    <Input
                      type="number"
                      placeholder="¥"
                      value={item.price_range_min}
                      onChange={(e) => updateItem(idx, 'price_range_min', e.target.value)}
                      className="h-8 text-xs"
                    />
                  </div>
                  <div>
                    <label className="text-xs text-muted-foreground">Max Price</label>
                    <Input
                      type="number"
                      placeholder="¥"
                      value={item.price_range_max}
                      onChange={(e) => updateItem(idx, 'price_range_max', e.target.value)}
                      className="h-8 text-xs"
                    />
                  </div>
                </div>

                <div>
                  <label className="text-xs text-muted-foreground">Notes</label>
                  <Input
                    placeholder="Notes..."
                    value={item.notes_en}
                    onChange={(e) => updateItem(idx, 'notes_en', e.target.value)}
                    className="h-8 text-xs"
                  />
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      )}

      {!loading && !selectedShopId && (
        <p className="text-muted-foreground text-center py-12">
          Select a shop to manage its inventory.
        </p>
      )}
    </div>
  );
}
