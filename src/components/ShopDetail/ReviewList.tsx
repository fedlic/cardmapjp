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

export default function ReviewList({ reviews, shopId, googleReviews = [] }: ReviewListProps) {
  const [userId, setUserId] = useState<string | null>(null);
  const [tab, setTab] = useState<'google' | 'user'>(googleReviews.length > 0 ? 'google' : 'user');

  useEffect(() => {
    const supabase = createClient();
    supabase.auth.getUser().then(({ data: { user } }) => {
      setUserId(user?.id ?? null);
    });
  }, []);

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
        </div>
      )}
    </div>
  );
}
