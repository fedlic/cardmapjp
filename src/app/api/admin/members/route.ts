import { NextResponse } from 'next/server';
import { createServerClient } from '@/lib/supabase/server';

export async function GET() {
  const supabase = createServerClient();

  const [authResult, reviewsResult, bannedResult] = await Promise.all([
    supabase.auth.admin.listUsers({ perPage: 1000 }),
    supabase.from('reviews').select('user_id'),
    supabase.from('banned_users').select('user_id'),
  ]);

  if (authResult.error) {
    return NextResponse.json({ error: authResult.error.message }, { status: 500 });
  }

  const bannedSet = new Set((bannedResult.data ?? []).map((b) => b.user_id));

  const countMap: Record<string, number> = {};
  for (const r of reviewsResult.data ?? []) {
    countMap[r.user_id] = (countMap[r.user_id] || 0) + 1;
  }

  const result = authResult.data.users.map((u) => ({
    id: u.id,
    email: u.email ?? '',
    full_name: u.user_metadata?.full_name ?? null,
    avatar_url: u.user_metadata?.avatar_url ?? null,
    created_at: u.created_at,
    last_sign_in_at: u.last_sign_in_at ?? null,
    review_count: countMap[u.id] || 0,
    is_banned: bannedSet.has(u.id),
  }));

  return NextResponse.json(result);
}
