'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import ReviewForm from './ReviewForm';
import type { Review, GoogleReview } from '@/types';

interface ReviewListProps {
  reviews: Review[];
  shopId: string;
  googleReviews?: GoogleReview[];
}

function StarRating({ rating }: { rating: number }) {
  return (
    <div className="flex text-[#FFCB05]">
      {Array.from({ length: 5 }, (_, i) => (
        <span key={i}>{i < rating ? '\u2605' : '\u2606'}</span>
      ))}
    </div>
  );
}

function GoogleReviewCard({ review }: { review: GoogleReview }) {
  const date = new Date(review.time * 1000);
  return (
    <div className="bg-white rounded-lg border border-gray-100 p-4 shadow-sm">
      <div className="flex items-start gap-3">
        {review.profile_photo_url && (
          <img
            src={review.profile_photo_url}
            alt=""
            className="w-8 h-8 rounded-full shrink-0"
            referrerPolicy="no-referrer"
            loading="lazy"
          />
        )}
        <div className="min-w-0 flex-1">
          <div className="flex items-center gap-2 mb-1">
            <span className="text-sm font-medium text-gray-900 truncate">{review.author_name}</span>
            <span className="text-xs text-gray-400">
              {review.relative_time_description || date.toLocaleDateString()}
            </span>
          </div>
          <StarRating rating={review.rating} />
          {review.text && (
            <p className="text-sm mt-2 text-gray-600">{review.text}</p>
          )}
        </div>
      </div>
    </div>
  );
}

function UserReviewCard({ review }: { review: Review }) {
  return (
    <div className="bg-white rounded-lg border border-gray-100 p-4 shadow-sm">
      <div className="flex items-center gap-2 mb-2">
        <StarRating rating={review.rating} />
        {review.visited_at && (
          <span className="text-xs text-gray-400">
            Visited {new Date(review.visited_at).toLocaleDateString()}
          </span>
        )}
      </div>
      {review.comment_en && (
        <p className="text-sm text-gray-700">{review.comment_en}</p>
      )}
    </div>
  );
}

export default function ReviewList({ reviews, shopId, googleReviews: initialGoogleReviews = [] }: ReviewListProps) {
  const [userId, setUserId] = useState<string | null>(null);
  const [googleReviews, setGoogleReviews] = useState<GoogleReview[]>(initialGoogleReviews);
  const [tab, setTab] = useState<'google' | 'user'>(initialGoogleReviews.length > 0 ? 'google' : 'user');

  useEffect(() => {
    const supabase = createClient();
    supabase.auth.getUser().then(({ data: { user } }) => {
      setUserId(user?.id ?? null);
    });

    // Auto-fetch reviews if cache is empty (fire-and-forget, non-blocking)
    if (initialGoogleReviews.length === 0) {
      fetch('/api/admin/fetch-reviews', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ shop_id: shopId }),
      })
        .then((res) => res.json())
        .then((data) => {
          if (data.count > 0) {
            // Reload from Supabase cache
            supabase
              .from('google_reviews_cache')
              .select('reviews')
              .eq('shop_id', shopId)
              .order('fetched_at', { ascending: false })
              .limit(1)
              .maybeSingle()
              .then(({ data: cached }) => {
                if (cached?.reviews) {
                  setGoogleReviews(cached.reviews as GoogleReview[]);
                  setTab('google');
                }
              });
          }
        })
        .catch(() => {});
    }
  }, [shopId, initialGoogleReviews.length]);

  const handleSignIn = () => {
    const supabase = createClient();
    supabase.auth.signInWithOAuth({
      provider: 'google',
      options: { redirectTo: `${window.location.origin}/auth/callback?next=${window.location.pathname}` },
    });
  };

  const hasGoogle = googleReviews.length > 0;

  return (
    <div>
      <h2 className="font-semibold text-lg text-gray-900 mb-3">Reviews</h2>

      {hasGoogle && (
        <div className="flex gap-2 mb-4">
          <button
            onClick={() => setTab('google')}
            className={`text-sm font-medium px-3 py-1.5 rounded-full transition-colors ${
              tab === 'google' ? 'bg-[#E3350D] text-white' : 'bg-gray-100 text-gray-500'
            }`}
          >
            Google ({googleReviews.length})
          </button>
          <button
            onClick={() => setTab('user')}
            className={`text-sm font-medium px-3 py-1.5 rounded-full transition-colors ${
              tab === 'user' ? 'bg-[#E3350D] text-white' : 'bg-gray-100 text-gray-500'
            }`}
          >
            User ({reviews.length})
          </button>
        </div>
      )}

      {(!hasGoogle || tab === 'user') && (
        <div className="space-y-3">
          {userId ? (
            <ReviewForm shopId={shopId} userId={userId} />
          ) : (
            <p className="text-sm text-gray-500 mb-3">
              <button onClick={handleSignIn} className="text-[#E3350D] hover:underline">Sign in with Google</button>
              {' '}to leave a review.
            </p>
          )}
          {reviews.length === 0 ? (
            <p className="text-sm text-gray-400">No reviews yet. Be the first!</p>
          ) : (
            reviews.map((review) => <UserReviewCard key={review.id} review={review} />)
          )}
        </div>
      )}

      {hasGoogle && tab === 'google' && (
        <div className="space-y-3">
          {googleReviews.map((review, i) => (
            <GoogleReviewCard key={`${review.author_name}-${i}`} review={review} />
          ))}
          <div className="flex items-center justify-center gap-1.5 pt-2 pb-1">
            <svg viewBox="0 0 24 24" className="w-4 h-4" aria-hidden="true">
              <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92a5.06 5.06 0 0 1-2.2 3.32v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.1z"/>
              <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
              <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
              <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
            </svg>
            <span className="text-xs text-gray-400">Powered by Google</span>
          </div>
        </div>
      )}
    </div>
  );
}
