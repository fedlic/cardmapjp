'use client';

import { useState, useEffect, useMemo, useCallback } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Badge } from '@/components/ui/badge';
import { Card, CardContent } from '@/components/ui/card';
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from '@/components/ui/dialog';
import { useDebounce } from '@/hooks/useDebounce';
import type { ShopRow, OpenHours } from '@/types';

const BOOL_FIELDS = [
  { key: 'english_staff', label: 'English Staff' },
  { key: 'beginner_friendly', label: 'Beginner Friendly' },
  { key: 'sells_singles', label: 'Sells Singles' },
  { key: 'sells_booster_box', label: 'Sells Booster Box' },
  { key: 'sells_sealed_pack', label: 'Sells Sealed Pack' },
  { key: 'sells_psa_graded', label: 'Sells PSA Graded' },
  { key: 'sells_oripa', label: 'Sells Oripa' },
  { key: 'sells_english_cards', label: 'Sells English Cards' },
  { key: 'sells_vintage', label: 'Sells Vintage' },
  { key: 'sells_raw_rare', label: 'Sells Raw Rare' },
  { key: 'atm_nearby', label: 'ATM Nearby' },
  { key: 'is_active', label: 'Active' },
] as const;

const DAYS = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];
const DAY_SHORT: Record<string, string> = {
  monday: 'Mon', tuesday: 'Tue', wednesday: 'Wed', thursday: 'Thu',
  friday: 'Fri', saturday: 'Sat', sunday: 'Sun',
};

type FormData = Record<string, unknown>;

function emptyForm(): FormData {
  return {
    name_en: '', name_jp: '', address_en: '', address_jp: '',
    lat: 35.6984, lng: 139.7731,
    phone: '', website_url: '', twitter_handle: '',
    english_staff: false, beginner_friendly: false,
    sells_singles: false, sells_booster_box: false, sells_sealed_pack: false,
    sells_psa_graded: false, sells_oripa: false, sells_english_cards: false,
    sells_vintage: false, sells_raw_rare: false, atm_nearby: false,
    is_active: true, payment_methods: [],
    open_hours: null, region_id: '',
  };
}

function shopToForm(shop: ShopRow): FormData {
  return { ...shop };
}

export default function AdminShopsPage() {
  const [shops, setShops] = useState<ShopRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');
  const debouncedSearch = useDebounce(search, 200);

  const [editOpen, setEditOpen] = useState(false);
  const [deleteOpen, setDeleteOpen] = useState(false);
  const [form, setForm] = useState<FormData>(emptyForm());
  const [editingId, setEditingId] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);
  const [fetchingReviews, setFetchingReviews] = useState<string | null>(null);
  const [reviewMsg, setReviewMsg] = useState<{ id: string; text: string; ok: boolean } | null>(null);
  const [bulkStatus, setBulkStatus] = useState<string | null>(null);
  const [bulkRunning, setBulkRunning] = useState(false);

  const fetchShops = useCallback(async () => {
    const res = await fetch('/api/admin/shops');
    if (res.ok) setShops(await res.json());
    setLoading(false);
  }, []);

  useEffect(() => { fetchShops(); }, [fetchShops]);

  const filtered = useMemo(() => {
    if (!debouncedSearch) return shops;
    const q = debouncedSearch.toLowerCase();
    return shops.filter(
      (s) => s.name_en.toLowerCase().includes(q) || s.name_jp.includes(q)
    );
  }, [shops, debouncedSearch]);

  function openNew() {
    setForm(emptyForm());
    setEditingId(null);
    setEditOpen(true);
  }

  function openEdit(shop: ShopRow) {
    setForm(shopToForm(shop));
    setEditingId(shop.id);
    setEditOpen(true);
  }

  function openDelete(shop: ShopRow) {
    setForm(shopToForm(shop));
    setEditingId(shop.id);
    setDeleteOpen(true);
  }

  function updateField(key: string, value: unknown) {
    setForm((prev) => ({ ...prev, [key]: value }));
  }

  function updateHours(day: string, field: 'open' | 'close', value: string) {
    setForm((prev) => {
      const hours = (prev.open_hours as OpenHours) || {};
      const existing = hours[day] || { open: '', close: '' };
      return {
        ...prev,
        open_hours: { ...hours, [day]: { ...existing, [field]: value } },
      };
    });
  }

  async function handleSave() {
    setSaving(true);
    try {
      const { id, created_at, updated_at, inventory, region, ...body } = form as Record<string, unknown>;
      const url = editingId ? `/api/admin/shops/${editingId}` : '/api/admin/shops';
      const method = editingId ? 'PUT' : 'POST';
      const res = await fetch(url, {
        method,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(body),
      });
      if (res.ok) {
        setEditOpen(false);
        fetchShops();
      }
    } finally {
      setSaving(false);
    }
  }

  async function handleDelete() {
    if (!editingId) return;
    setSaving(true);
    try {
      const res = await fetch(`/api/admin/shops/${editingId}`, { method: 'DELETE' });
      if (res.ok || res.status === 204) {
        setDeleteOpen(false);
        fetchShops();
      }
    } finally {
      setSaving(false);
    }
  }

  const GOOGLE_API_KEY = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY || '';

  // Search Place ID from browser using Google Places Text Search (New)
  async function findPlaceId(shop: ShopRow): Promise<string | null> {
    const query = `${shop.name_jp} ${(shop.address_en || '').split(',')[0]}`;
    const url = 'https://places.googleapis.com/v1/places:searchText';
    const res = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': GOOGLE_API_KEY,
        'X-Goog-FieldMask': 'places.id',
      },
      body: JSON.stringify({
        textQuery: query,
        locationBias: { circle: { center: { latitude: shop.lat, longitude: shop.lng }, radius: 500 } },
        maxResultCount: 1,
      }),
    });
    const data = await res.json();
    return data.places?.[0]?.id || null;
  }

  // Fetch reviews from browser using Google Places (New) API
  async function fetchPlaceReviews(placeId: string) {
    const url = `https://places.googleapis.com/v1/places/${placeId}`;
    const res = await fetch(url, {
      headers: {
        'X-Goog-Api-Key': GOOGLE_API_KEY,
        'X-Goog-FieldMask': 'reviews',
      },
    });
    const data = await res.json();
    if (!data.reviews) return [];
    // Convert to our GoogleReview format
    return data.reviews.map((r: { authorAttribution?: { displayName?: string; photoUri?: string }; rating?: number; text?: { text?: string }; relativePublishTimeDescription?: string; publishTime?: string }) => ({
      author_name: r.authorAttribution?.displayName || 'Anonymous',
      rating: r.rating || 0,
      text: r.text?.text || '',
      time: r.publishTime ? Math.floor(new Date(r.publishTime).getTime() / 1000) : 0,
      profile_photo_url: r.authorAttribution?.photoUri || '',
      relative_time_description: r.relativePublishTimeDescription || '',
    }));
  }

  async function fetchGoogleReviews(shopId: string) {
    setFetchingReviews(shopId);
    setReviewMsg(null);
    try {
      const shop = shops.find((s) => s.id === shopId);
      if (!shop) throw new Error('Shop not found');

      // Step 1: Find Place ID if missing
      let placeId = shop.google_place_id;
      if (!placeId) {
        placeId = await findPlaceId(shop);
        if (!placeId) {
          setReviewMsg({ id: shopId, text: 'Place not found on Google', ok: false });
          return;
        }
      }

      // Step 2: Fetch reviews from Google
      const reviews = await fetchPlaceReviews(placeId);

      // Step 3: Save to DB via our API
      const res = await fetch('/api/admin/google-reviews', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ shop_id: shopId, google_place_id: placeId, reviews }),
      });
      const data = await res.json();
      if (res.ok) {
        // Update local state
        shop.google_place_id = placeId;
        setReviewMsg({ id: shopId, text: `${reviews.length} reviews saved`, ok: true });
      } else {
        setReviewMsg({ id: shopId, text: data.error || 'Save failed', ok: false });
      }
    } catch (err) {
      setReviewMsg({ id: shopId, text: String(err), ok: false });
    } finally {
      setFetchingReviews(null);
    }
  }

  async function bulkFetchAll() {
    setBulkRunning(true);
    setBulkStatus('Starting...');
    let success = 0;
    let failed = 0;
    const activeShops = shops.filter((s) => s.is_active);

    for (let i = 0; i < activeShops.length; i++) {
      const shop = activeShops[i];
      setBulkStatus(`${i + 1}/${activeShops.length}: ${shop.name_en}`);
      try {
        let placeId = shop.google_place_id;
        if (!placeId) {
          placeId = await findPlaceId(shop);
          if (!placeId) { failed++; continue; }
        }
        const reviews = await fetchPlaceReviews(placeId);
        await fetch('/api/admin/google-reviews', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ shop_id: shop.id, google_place_id: placeId, reviews }),
        });
        shop.google_place_id = placeId;
        success++;
      } catch {
        failed++;
      }
      // Rate limit: 200ms between requests
      await new Promise((r) => setTimeout(r, 200));
    }

    setBulkStatus(`Done! ${success} OK, ${failed} failed`);
    setBulkRunning(false);
  }

  if (loading) {
    return <p className="text-muted-foreground">Loading shops...</p>;
  }

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold">Shops ({shops.length})</h1>
        <div className="flex items-center gap-2">
          <Button
            variant="outline"
            size="sm"
            disabled={bulkRunning}
            onClick={bulkFetchAll}
          >
            {bulkRunning ? 'Running...' : 'Fetch All Reviews'}
          </Button>
          <Button
            className="bg-[#E3350D] hover:bg-[#c42d0b] text-white"
            onClick={openNew}
          >
            + Add Shop
          </Button>
        </div>
      </div>
      {bulkStatus && (
        <p className="text-sm text-muted-foreground bg-gray-50 rounded p-2">{bulkStatus}</p>
      )}

      <Input
        placeholder="Search shops..."
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        className="max-w-sm h-9"
      />

      {/* Table */}
      <div className="border rounded-lg overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-gray-50 border-b">
            <tr>
              <th className="text-left p-3 font-medium">Name</th>
              <th className="text-left p-3 font-medium hidden sm:table-cell">Rating</th>
              <th className="text-left p-3 font-medium hidden md:table-cell">Status</th>
              <th className="text-left p-3 font-medium hidden lg:table-cell">Updated</th>
              <th className="p-3 w-20"></th>
            </tr>
          </thead>
          <tbody>
            {filtered.map((shop) => (
              <tr
                key={shop.id}
                className="border-b hover:bg-gray-50 cursor-pointer"
                onClick={() => openEdit(shop)}
              >
                <td className="p-3">
                  <div className="font-medium">{shop.name_en}</div>
                  <div className="text-xs text-muted-foreground">{shop.name_jp}</div>
                </td>
                <td className="p-3 hidden sm:table-cell">
                  {shop.google_rating ? (
                    <span>★ {shop.google_rating}</span>
                  ) : (
                    <span className="text-muted-foreground">—</span>
                  )}
                </td>
                <td className="p-3 hidden md:table-cell">
                  <Badge
                    variant={shop.is_active ? 'secondary' : 'outline'}
                    className={shop.is_active ? 'bg-green-100 text-green-800' : ''}
                  >
                    {shop.is_active ? 'Active' : 'Inactive'}
                  </Badge>
                </td>
                <td className="p-3 hidden lg:table-cell text-muted-foreground">
                  {new Date(shop.updated_at).toLocaleDateString()}
                </td>
                <td className="p-3" onClick={(e) => e.stopPropagation()}>
                  <div className="flex items-center gap-1">
                    <Button
                      variant="ghost"
                      size="sm"
                      className="text-blue-600 hover:text-blue-700 text-xs"
                      disabled={fetchingReviews === shop.id}
                      onClick={() => fetchGoogleReviews(shop.id)}
                    >
                      {fetchingReviews === shop.id ? 'Fetching...' : 'Reviews'}
                    </Button>
                    <Button
                      variant="ghost"
                      size="sm"
                      className="text-red-600 hover:text-red-700"
                      onClick={() => openDelete(shop)}
                    >
                      Delete
                    </Button>
                  </div>
                  {reviewMsg?.id === shop.id && (
                    <span className={`text-xs ${reviewMsg.ok ? 'text-green-600' : 'text-red-600'}`}>
                      {reviewMsg.text}
                    </span>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Edit / Create Dialog */}
      <Dialog open={editOpen} onOpenChange={setEditOpen}>
        <DialogContent className="max-w-lg max-h-[85vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle>
              {editingId ? 'Edit Shop' : 'New Shop'}
            </DialogTitle>
          </DialogHeader>

          <div className="space-y-4">
            {/* Basic Info */}
            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className="text-xs font-medium text-muted-foreground">Name (EN)</label>
                <Input value={(form.name_en as string) || ''} onChange={(e) => updateField('name_en', e.target.value)} />
              </div>
              <div>
                <label className="text-xs font-medium text-muted-foreground">Name (JP)</label>
                <Input value={(form.name_jp as string) || ''} onChange={(e) => updateField('name_jp', e.target.value)} />
              </div>
            </div>

            <div>
              <label className="text-xs font-medium text-muted-foreground">Address (EN)</label>
              <Input value={(form.address_en as string) || ''} onChange={(e) => updateField('address_en', e.target.value)} />
            </div>
            <div>
              <label className="text-xs font-medium text-muted-foreground">Address (JP)</label>
              <Input value={(form.address_jp as string) || ''} onChange={(e) => updateField('address_jp', e.target.value)} />
            </div>

            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className="text-xs font-medium text-muted-foreground">Latitude</label>
                <Input type="number" step="any" value={(form.lat as number) || ''} onChange={(e) => updateField('lat', parseFloat(e.target.value))} />
              </div>
              <div>
                <label className="text-xs font-medium text-muted-foreground">Longitude</label>
                <Input type="number" step="any" value={(form.lng as number) || ''} onChange={(e) => updateField('lng', parseFloat(e.target.value))} />
              </div>
            </div>

            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className="text-xs font-medium text-muted-foreground">Phone</label>
                <Input value={(form.phone as string) || ''} onChange={(e) => updateField('phone', e.target.value)} />
              </div>
              <div>
                <label className="text-xs font-medium text-muted-foreground">Website</label>
                <Input value={(form.website_url as string) || ''} onChange={(e) => updateField('website_url', e.target.value)} />
              </div>
            </div>

            <div>
              <label className="text-xs font-medium text-muted-foreground">Twitter Handle</label>
              <Input value={(form.twitter_handle as string) || ''} onChange={(e) => updateField('twitter_handle', e.target.value)} />
            </div>

            <div>
              <label className="text-xs font-medium text-muted-foreground">Region ID</label>
              <Input value={(form.region_id as string) || ''} onChange={(e) => updateField('region_id', e.target.value)} />
            </div>

            {/* Booleans */}
            <div>
              <label className="text-xs font-medium text-muted-foreground block mb-2">Features</label>
              <div className="grid grid-cols-2 gap-2">
                {BOOL_FIELDS.map(({ key, label }) => (
                  <label key={key} className="flex items-center gap-2 text-sm cursor-pointer">
                    <input
                      type="checkbox"
                      checked={!!form[key]}
                      onChange={(e) => updateField(key, e.target.checked)}
                      className="rounded"
                    />
                    {label}
                  </label>
                ))}
              </div>
            </div>

            {/* Hours */}
            <div>
              <label className="text-xs font-medium text-muted-foreground block mb-2">Opening Hours</label>
              <div className="space-y-1">
                {DAYS.map((day) => {
                  const hours = (form.open_hours as OpenHours) || {};
                  const slot = hours[day];
                  return (
                    <div key={day} className="grid grid-cols-[60px_1fr_1fr] gap-2 items-center">
                      <span className="text-xs font-medium">{DAY_SHORT[day]}</span>
                      <Input
                        placeholder="10:00"
                        value={slot?.open || ''}
                        onChange={(e) => updateHours(day, 'open', e.target.value)}
                        className="h-8 text-xs"
                      />
                      <Input
                        placeholder="20:00"
                        value={slot?.close || ''}
                        onChange={(e) => updateHours(day, 'close', e.target.value)}
                        className="h-8 text-xs"
                      />
                    </div>
                  );
                })}
              </div>
            </div>
          </div>

          <DialogFooter>
            <Button variant="outline" onClick={() => setEditOpen(false)}>
              Cancel
            </Button>
            <Button
              className="bg-[#E3350D] hover:bg-[#c42d0b] text-white"
              onClick={handleSave}
              disabled={saving}
            >
              {saving ? 'Saving...' : 'Save'}
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>

      {/* Delete Confirmation */}
      <Dialog open={deleteOpen} onOpenChange={setDeleteOpen}>
        <DialogContent className="max-w-sm">
          <DialogHeader>
            <DialogTitle>Delete Shop</DialogTitle>
          </DialogHeader>
          <p className="text-sm">
            Are you sure you want to delete <strong>{form.name_en as string}</strong>?
            This cannot be undone.
          </p>
          <DialogFooter>
            <Button variant="outline" onClick={() => setDeleteOpen(false)}>
              Cancel
            </Button>
            <Button
              variant="destructive"
              onClick={handleDelete}
              disabled={saving}
            >
              {saving ? 'Deleting...' : 'Delete'}
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </div>
  );
}
