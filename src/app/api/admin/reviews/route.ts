import { NextResponse } from 'next/server';
import { createServerClient } from '@/lib/supabase/server';

export async function GET() {
  const supabase = createServerClient();

  const [reviewsResult, authResult] = await Promise.all([
    supabase
      .from('reviews')
      .select('*, shops!inner(name_en)')
      .order('created_at', { ascending: false }),
    supabase.auth.admin.listUsers({ perPage: 1000 }),
  ]);

  if (reviewsResult.error) {
    return NextResponse.json({ error: reviewsResult.error.message }, { status: 500 });
  }

  const userMap: Record<string, { email: string; full_name: string | null }> = {};
  for (const u of authResult.data?.users ?? []) {
    userMap[u.id] = {
      email: u.email ?? '',
      full_name: u.user_metadata?.full_name ?? null,
    };
  }

  const result = (reviewsResult.data ?? []).map((r) => ({
    id: r.id,
    shop_id: r.shop_id,
    user_id: r.user_id,
    rating: r.rating,
    english_staff_rating: r.english_staff_rating,
    selection_rating: r.selection_rating,
    comment_en: r.comment_en,
    visited_at: r.visited_at,
    created_at: r.created_at,
    shop_name_en: (r.shops as { name_en: string })?.name_en ?? 'Unknown',
    user_email: userMap[r.user_id]?.email ?? 'Unknown',
    user_full_name: userMap[r.user_id]?.full_name ?? null,
  }));

  return NextResponse.json(result);
}
