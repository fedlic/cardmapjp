import { NextRequest, NextResponse } from 'next/server';
import { createServerClient } from '@/lib/supabase/server';
import { generateShopSummary } from '@/lib/claude';

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const { id } = await params;

  // TODO: Add admin authentication check
  const authHeader = request.headers.get('authorization');
  if (!authHeader || authHeader !== `Bearer ${process.env.SUPABASE_SERVICE_ROLE_KEY}`) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const supabase = createServerClient();

  try {
    // Get shop info
    const { data: shop, error: shopError } = await supabase
      .from('shops')
      .select('name_en, google_place_id')
      .eq('id', id)
      .single();

    if (shopError || !shop) {
      return NextResponse.json({ error: 'Shop not found' }, { status: 404 });
    }

    // Get cached reviews
    const { data: cache } = await supabase
      .from('google_reviews_cache')
      .select('reviews')
      .eq('shop_id', id)
      .order('fetched_at', { ascending: false })
      .limit(1)
      .single();

    const reviews = cache?.reviews as { text: string }[] | undefined;
    if (!reviews || reviews.length === 0) {
      return NextResponse.json(
        { error: 'No cached reviews found. Fetch reviews first.' },
        { status: 400 }
      );
    }

    const reviewTexts = reviews
      .map((r) => r.text)
      .filter(Boolean)
      .slice(0, 20);

    const result = await generateShopSummary(shop.name_en, reviewTexts);

    // Update shop with AI-generated content
    const { error: updateError } = await supabase
      .from('shops')
      .update({
        ai_summary: result.ai_summary,
        visitor_tips: result.visitor_tips,
        ai_summary_updated_at: new Date().toISOString(),
      })
      .eq('id', id);

    if (updateError) throw updateError;

    return NextResponse.json(result);
  } catch (error) {
    console.error('Error generating summary:', error);
    return NextResponse.json(
      { error: 'Failed to generate summary' },
      { status: 500 }
    );
  }
}
