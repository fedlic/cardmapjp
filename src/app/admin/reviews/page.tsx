'use client';

import { useState, useEffect, useMemo, useCallback } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from '@/components/ui/dialog';
import { useDebounce } from '@/hooks/useDebounce';
import type { AdminReview } from '@/types';

export default function AdminReviewsPage() {
  const [reviews, setReviews] = useState<AdminReview[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');
  const debouncedSearch = useDebounce(search, 200);

  const [deleteOpen, setDeleteOpen] = useState(false);
  const [selectedReview, setSelectedReview] = useState<AdminReview | null>(null);
  const [saving, setSaving] = useState(false);

  const fetchReviews = useCallback(async () => {
    const res = await fetch('/api/admin/reviews');
    if (res.ok) setReviews(await res.json());
    setLoading(false);
  }, []);

  useEffect(() => { fetchReviews(); }, [fetchReviews]);

  const filtered = useMemo(() => {
    if (!debouncedSearch) return reviews;
    const q = debouncedSearch.toLowerCase();
    return reviews.filter(
      (r) =>
        (r.shop_name_en ?? '').toLowerCase().includes(q) ||
        (r.user_full_name ?? '').toLowerCase().includes(q) ||
        (r.user_email ?? '').toLowerCase().includes(q) ||
        (r.comment_en ?? '').toLowerCase().includes(q)
    );
  }, [reviews, debouncedSearch]);

  function openDelete(review: AdminReview) {
    setSelectedReview(review);
    setDeleteOpen(true);
  }

  async function handleDelete() {
    if (!selectedReview) return;
    setSaving(true);
    try {
      const res = await fetch(`/api/admin/reviews/${selectedReview.id}`, {
        method: 'DELETE',
      });
      if (res.ok || res.status === 204) {
        setDeleteOpen(false);
        fetchReviews();
      }
    } finally {
      setSaving(false);
    }
  }

  function renderStars(rating: number) {
    return '★'.repeat(rating) + '☆'.repeat(5 - rating);
  }

  if (loading) {
    return <p className="text-muted-foreground">Loading reviews...</p>;
  }

  return (
    <div className="space-y-4">
      <h1 className="text-2xl font-bold">Reviews ({reviews.length})</h1>

      <Input
        placeholder="Search by shop, user, or comment..."
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        className="max-w-sm h-9"
      />

      <div className="border rounded-lg overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-gray-50 border-b">
            <tr>
              <th className="text-left p-3 font-medium">User</th>
              <th className="text-left p-3 font-medium hidden sm:table-cell">Shop</th>
              <th className="text-left p-3 font-medium">Rating</th>
              <th className="text-left p-3 font-medium hidden md:table-cell">Comment</th>
              <th className="text-left p-3 font-medium hidden lg:table-cell">Date</th>
              <th className="p-3 w-20"></th>
            </tr>
          </thead>
          <tbody>
            {filtered.map((review) => (
              <tr key={review.id} className="border-b hover:bg-gray-50">
                <td className="p-3">
                  <div className="font-medium">{review.user_full_name ?? '—'}</div>
                  <div className="text-xs text-muted-foreground">{review.user_email}</div>
                </td>
                <td className="p-3 hidden sm:table-cell">
                  <span className="text-sm">{review.shop_name_en}</span>
                </td>
                <td className="p-3">
                  <span className="text-yellow-500">{renderStars(review.rating)}</span>
                </td>
                <td className="p-3 hidden md:table-cell">
                  <span className="text-muted-foreground line-clamp-1 max-w-[200px] block">
                    {review.comment_en ?? '—'}
                  </span>
                </td>
                <td className="p-3 hidden lg:table-cell text-muted-foreground">
                  {new Date(review.created_at).toLocaleDateString()}
                </td>
                <td className="p-3">
                  <Button
                    variant="ghost"
                    size="sm"
                    className="text-red-600 hover:text-red-700"
                    onClick={() => openDelete(review)}
                  >
                    Delete
                  </Button>
                </td>
              </tr>
            ))}
            {filtered.length === 0 && (
              <tr>
                <td colSpan={6} className="p-6 text-center text-muted-foreground">
                  No reviews found.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

      {/* Delete Confirmation */}
      <Dialog open={deleteOpen} onOpenChange={setDeleteOpen}>
        <DialogContent className="max-w-sm">
          <DialogHeader>
            <DialogTitle>Delete Review</DialogTitle>
          </DialogHeader>
          <p className="text-sm">
            Delete review by <strong>{selectedReview?.user_full_name ?? selectedReview?.user_email}</strong> for{' '}
            <strong>{selectedReview?.shop_name_en}</strong>?
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
