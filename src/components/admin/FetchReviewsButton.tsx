'use client';

import { useState } from 'react';

export default function FetchReviewsButton() {
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<{
    total?: number;
    processed?: number;
    skipped?: number;
    success?: number;
    failed?: number;
  } | null>(null);
  const [error, setError] = useState<string | null>(null);

  const handleFetch = async () => {
    setLoading(true);
    setResult(null);
    setError(null);

    try {
      const res = await fetch('/api/admin/fetch-reviews', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ all: true }),
      });

      const data = await res.json();
      if (!res.ok) {
        setError(data.error || 'Failed to fetch reviews');
      } else {
        setResult(data);
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Network error');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="space-y-3">
      <button
        onClick={handleFetch}
        disabled={loading}
        className="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium rounded-lg transition-colors disabled:opacity-50"
      >
        {loading ? 'Fetching reviews...' : 'Fetch Google Reviews'}
      </button>

      {loading && (
        <p className="text-sm text-gray-500">
          This may take a few minutes for all shops. Please wait...
        </p>
      )}

      {result && (
        <div className="text-sm space-y-1">
          <p className="text-green-700">
            Done: {result.success} shops updated, {result.failed} failed, {result.skipped} skipped (fresh cache)
          </p>
          <p className="text-gray-500">
            Processed {result.processed} / {result.total} total shops
          </p>
        </div>
      )}

      {error && <p className="text-sm text-red-600">{error}</p>}
    </div>
  );
}
