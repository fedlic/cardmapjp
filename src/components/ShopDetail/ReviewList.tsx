'use client';

import { useState, useEffect } from 'react';
import { Card, CardContent } from '@/components/ui/card';
import { createClient } from '@/lib/supabase/client';
import ReviewForm from './ReviewForm';
import type { Review } from '@/types';

interface ReviewListProps {
  reviews: Review[];
  shopId: string;
}

export default function ReviewList({ reviews, shopId }: ReviewListProps) {
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

  return (
    <div>
      <h2 className="font-semibold text-lg mb-3">
        Reviews{reviews.length > 0 && ` (${reviews.length})`}
      </h2>

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
            <Card key={review.id}>
              <CardContent className="p-4">
                <div className="flex items-center gap-2 mb-2">
                  <div className="flex text-yellow-500">
                    {Array.from({ length: 5 }, (_, i) => (
                      <span key={i}>{i < review.rating ? '★' : '☆'}</span>
                    ))}
                  </div>
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
          ))}
        </div>
      )}
    </div>
  );
}
