import { createServerClient } from '@/lib/supabase/server';
import FeedClient from '@/components/FeedClient';
import type { Post } from '@/types/sns';
import type { Metadata } from 'next';

export const revalidate = 60;

export const metadata: Metadata = {
  title: 'Community Feed | CardMapJP',
  description: 'See what Pokemon card collectors are finding at shops across Japan.',
};

export default async function FeedPage() {
  const supabase = createServerClient();

  const [postsResult, shopsResult] = await Promise.all([
    supabase
      .from('posts_with_details')
      .select('*')
      .order('created_at', { ascending: false })
      .limit(50),
    supabase
      .from('shops_with_coords')
      .select('id, name_en, name_jp')
      .eq('is_active', true)
      .order('name_en'),
  ]);

  const posts = (postsResult.data ?? []) as Post[];
  const shops = (shopsResult.data ?? []) as { id: string; name_en: string; name_jp: string }[];

  return <FeedClient initialPosts={posts} shops={shops} />;
}
