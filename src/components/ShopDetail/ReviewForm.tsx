'use client';

import { useState } from 'react';
import { createClient } from '@/lib/supabase/client';

interface ReviewFormProps {
  shopId: string;
  userId: string;
}

export default function ReviewForm({ shopId, userId }: ReviewFormProps) {
  const [rating, setRating] = useState(0);
  const [hoveredRating, setHoveredRating] = useState(0);
  const [comment, setComment] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (rating === 0) { setError('Please select a rating'); return; }
    setSubmitting(true);
    setError(null);

    const supabase = createClient();
    const { error: insertError } = await supabase.from('reviews').insert({
      shop_id: shopId, user_id: userId, rating,
      comment_en: comment.trim() || null,
      visited_at: new Date().toISOString().split('T')[0],
    });

    setSubmitting(false);
    if (insertError) {
      setError(insertError.message.includes('policy') ? 'Your account has been restricted.' : insertError.message);
      return;
    }
    setSubmitted(true);
  };

  if (submitted) {
    return (
      <div className="rounded-lg bg-green-50 border border-green-200 p-4 text-center">
        <p className="text-sm font-medium text-green-700">Thanks for your review!</p>
      </div>
    );
  }

  const displayRating = hoveredRating || rating;

  return (
    <form onSubmit={handleSubmit} className="rounded-lg border border-gray-200 p-4 space-y-3">
      <h3 className="font-semibold text-sm text-gray-900">Leave a Review</h3>
      <div className="flex items-center gap-1">
        {[1, 2, 3, 4, 5].map((star) => (
          <button key={star} type="button" onClick={() => setRating(star)}
            onMouseEnter={() => setHoveredRating(star)} onMouseLeave={() => setHoveredRating(0)}
            className="text-2xl transition-colors">
            <span className={star <= displayRating ? 'text-[#FFCB05]' : 'text-gray-200'}>&#9733;</span>
          </button>
        ))}
        {rating > 0 && <span className="text-xs text-gray-400 ml-2">{rating}/5</span>}
      </div>
      <textarea value={comment} onChange={(e) => setComment(e.target.value)}
        placeholder="Share your experience (optional)" rows={3}
        className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm resize-none focus:outline-none focus:ring-2 focus:ring-[#E3350D]/30 focus:border-[#E3350D]" />
      {error && <p className="text-xs text-red-500">{error}</p>}
      <button type="submit" disabled={submitting || rating === 0}
        className="bg-[#E3350D] text-white text-sm px-4 py-2 rounded-lg hover:bg-[#c42d0b] transition-colors disabled:opacity-50">
        {submitting ? 'Submitting...' : 'Submit Review'}
      </button>
    </form>
  );
}
