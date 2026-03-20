'use client';

import { useState } from 'react';

const BATCH_SIZE = 10;

export default function FetchReviewsButton() {
  const [loading, setLoading] = useState(false);
  const [progress, setProgress] = useState<{ done: number; total: number } | null>(null);
  const [result, setResult] = useState<{
    total?: number;
    processed?: number;
    skipped?: number;
    success: number;
    failed: number;
    errors: { name: string; error: string }[];
  } | null>(null);
  const [error, setError] = useState<string | null>(null);

  const handleFetch = async () => {
    setLoading(true);
    setResult(null);
    setError(null);
    setProgress(null);

    try {
      // Step 1: Get list of stale shop IDs
      const listRes = await fetch('/api/admin/fetch-reviews', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ all: true }),
      });

      const listData = await listRes.json();
      if (!listRes.ok) {
        setError(listData.error || 'Failed to get shop list');
        return;
      }

      const { staleIds, total, skipped } = listData as {
        staleIds: string[];
        total: number;
        skipped: number;
      };

      if (staleIds.length === 0) {
        setResult({ total, processed: 0, skipped, success: 0, failed: 0, errors: [] });
        return;
      }

      // Step 2: Process in batches
      let success = 0;
      let failed = 0;
      const errors: { name: string; error: string }[] = [];

      for (let i = 0; i < staleIds.length; i += BATCH_SIZE) {
        const batchIds = staleIds.slice(i, i + BATCH_SIZE);
        setProgress({ done: i, total: staleIds.length });

        try {
          const batchRes = await fetch('/api/admin/fetch-reviews', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ shop_ids: batchIds }),
          });

          const batchData = await batchRes.json();
          if (batchRes.ok) {
            success += batchData.success ?? 0;
            failed += batchData.failed ?? 0;
            if (batchData.results) {
              for (const r of batchData.results) {
                if (r.error) errors.push({ name: r.name, error: r.error });
              }
            }
          } else {
            failed += batchIds.length;
            errors.push({ name: `Batch ${Math.floor(i / BATCH_SIZE) + 1}`, error: batchData.error || 'Batch failed' });
          }
        } catch {
          failed += batchIds.length;
          errors.push({ name: `Batch ${Math.floor(i / BATCH_SIZE) + 1}`, error: 'Network error' });
        }
      }

      setProgress(null);
      setResult({
        total,
        processed: staleIds.length,
        skipped,
        success,
        failed,
        errors,
      });
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

      {loading && progress && (
        <p className="text-sm text-gray-500">
          Processing {progress.done} / {progress.total} shops...
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
          {result.errors.length > 0 && (
            <details className="mt-2">
              <summary className="cursor-pointer text-red-600">Show failed shops ({result.errors.length})</summary>
              <div className="mt-1 max-h-60 overflow-y-auto bg-red-50 rounded p-2 space-y-1">
                {result.errors.slice(0, 30).map((r, i) => (
                  <p key={i} className="text-xs text-red-700">
                    {r.name}: {r.error}
                  </p>
                ))}
                {result.errors.length > 30 && (
                  <p className="text-xs text-red-500">...and {result.errors.length - 30} more</p>
                )}
              </div>
            </details>
          )}
        </div>
      )}

      {error && <p className="text-sm text-red-600">{error}</p>}
    </div>
  );
}
