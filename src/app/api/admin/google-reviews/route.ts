import { NextRequest, NextResponse } from 'next/server';
import { createServerClient } from '@/lib/supabase/server';

// Save reviews + place_id from client-side Google API calls
export async function POST(request: NextRequest) {
  const { shop_id, google_place_id, reviews } = await request.json();

  if (!shop_id) {
    return NextResponse.json({ error: 'shop_id is required' }, { status: 400 });
  }

  const supabase = createServerClient();

  // Update google_place_id on shop if provided
  if (google_place_id) {
    await supabase
      .from('shops')
      .update({ google_place_id })
      .eq('id', shop_id);
  }

  // Save reviews if provided
  if (reviews && Array.isArray(reviews)) {
    const placeId = google_place_id || 'unknown';
    const { error: upsertError } = await supabase
      .from('google_reviews_cache')
      .upsert(
        {
          shop_id,
          google_place_id: placeId,
          reviews,
          fetched_at: new Date().toISOString(),
        },
        { onConflict: 'shop_id' }
      );

    if (upsertError) {
      return NextResponse.json({ error: upsertError.message }, { status: 500 });
    }
  }

  return NextResponse.json({ success: true, count: reviews?.length ?? 0 });
}
