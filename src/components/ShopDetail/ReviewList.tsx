import { Card, CardContent } from '@/components/ui/card';
import type { Review } from '@/types';

interface ReviewListProps {
  reviews: Review[];
}

export default function ReviewList({ reviews }: ReviewListProps) {
  if (reviews.length === 0) {
    return (
      <div>
        <h2 className="font-semibold text-lg mb-3">Reviews</h2>
        <p className="text-sm text-muted-foreground">
          No reviews yet. Be the first to review this shop!
        </p>
      </div>
    );
  }

  return (
    <div>
      <h2 className="font-semibold text-lg mb-3">
        Reviews ({reviews.length})
      </h2>
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
    </div>
  );
}
