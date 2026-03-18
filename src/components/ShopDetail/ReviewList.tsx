'use client';

import { useState, useEffect } from 'react';
import { Card, CardContent } from '@/components/ui/card';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
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
    <div className="flex text-yellow-500">
      {Array.from({ length: 5 }, (_, i) => (
        <span key={i}>{i < rating ? '\u2605' : '\u2606'}</span>
      ))}
    </div>
  );
}

function GoogleReviewCard({ review }: { review: GoogleReview }) {
  const date = new Date(review.time * 1000);
  return (
    <Card>
      <CardContent className="p-4">
        <div className="flex items-start gap-3">
          {review.profile_photo_url && (
            <img
              src={review.profile_photo_url}
              alt=""
              className="w-8 h-8 rounded-full shrink-0"
              referrerPolicy="no-referrer"
            />
          )}
          <div className="min-w-0 flex-1">
            <div className="flex items-center gap-2 mb-1">
              <span className="text-sm font-medium truncate">{review.author_name}</span>
              <span className="text-xs text-muted-foreground">
                {review.relative_time_description || date.toLocaleDateString()}
              </span>
            </div>
            <StarRating rating={review.rating} />
            {review.text && (
              <p className="text-sm mt-2 text-muted-foreground">{review.text}</p>
            )}
          </div>
        </div>
      </CardContent>
    </Card>
  );
}

function UserReviewCard({ review }: { review: Review }) {
  return (
    <Card>
      <CardContent className="p-4">
        <div className="flex items-center gap-2 mb-2">
          <StarRating rating={review.rating} />
          {review.visited_at && (
            <span className="text-xs text-muted-foreground">
              Visited {new Date(review.visited_at).toLocaleDateString()}
            </span>
          )}
        </div>
        {review.comment_en && (
          <p className="text-sm">{review.comment_en}</p>
        )}
      </CardContent>
    </Card>
  );
}

export default function ReviewList({ reviews, shopId, googleReviews = [] }: ReviewListProps) {
  const [userId, setUserId] = useState<string | null>(null);

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

  const userReviewsContent = (
    <>
      {userId ? (
        <div className="mb-4">
          <ReviewForm shopId={shopId} userId={userId} />
        </div>
      ) : (
        <p className="text-sm text-muted-foreground mb-4">
          <a href="#" className="text-[#E3350D] hover:underline" onClick={(e) => {
            e.preventDefault();
            handleSignIn();
          }}>
            Sign in with Google
          </a>
          {' '}to leave a review.
        </p>
      )}

      {reviews.length === 0 ? (
        <p className="text-sm text-muted-foreground">
          No reviews yet. Be the first to review this shop!
        </p>
      ) : (
        <div className="space-y-3">
          {reviews.map((review) => (
            <UserReviewCard key={review.id} review={review} />
          ))}
        </div>
      )}
    </>
  );

  if (!hasGoogle) {
    return (
      <div>
        <h2 className="font-semibold text-lg mb-3">
          Reviews{reviews.length > 0 && ` (${reviews.length})`}
        </h2>
        {userReviewsContent}
      </div>
    );
  }

  return (
    <div>
      <h2 className="font-semibold text-lg mb-3">Reviews</h2>
      <Tabs defaultValue="google">
        <TabsList className="mb-3">
          <TabsTrigger value="google">
            Google Reviews ({googleReviews.length})
          </TabsTrigger>
          <TabsTrigger value="user">
            User Reviews ({reviews.length})
          </TabsTrigger>
        </TabsList>
        <TabsContent value="google">
          <div className="space-y-3">
            {googleReviews.map((review, i) => (
              <GoogleReviewCard key={`${review.author_name}-${i}`} review={review} />
            ))}
          </div>
        </TabsContent>
        <TabsContent value="user">
          {userReviewsContent}
        </TabsContent>
      </Tabs>
    </div>
  );
}
