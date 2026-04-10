import type { MetadataRoute } from 'next';
import { createServerClient } from '@/lib/supabase/server';
import { ALL_REGION_SLUGS } from '@/lib/regions';

const BASE_URL = process.env.NEXT_PUBLIC_APP_URL || 'https://cardmapjp.vercel.app';

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const supabase = createServerClient();

  const { data: shops } = await supabase
    .from('shops_with_coords')
    .select('id, updated_at')
    .eq('is_active', true);

  const shopEntries: MetadataRoute.Sitemap = (shops ?? []).map((shop) => ({
    url: `${BASE_URL}/shops/${shop.id}`,
    lastModified: shop.updated_at,
    changeFrequency: 'weekly',
    priority: 0.8,
  }));

  const regionEntries: MetadataRoute.Sitemap = ALL_REGION_SLUGS.map((slug) => ({
    url: `${BASE_URL}/regions/${slug}`,
    lastModified: new Date().toISOString(),
    changeFrequency: 'monthly' as const,
    priority: 0.9,
  }));

  // Blog posts
  let blogEntries: MetadataRoute.Sitemap = [];
  try {
    const { data: posts } = await supabase
      .from('blog_posts')
      .select('slug, published_at')
      .order('published_at', { ascending: false });

    blogEntries = (posts ?? []).map((post: { slug: string; published_at: string | null }) => ({
      url: `${BASE_URL}/blog/${post.slug}`,
      lastModified: post.published_at ?? new Date().toISOString(),
      changeFrequency: 'monthly' as const,
      priority: 0.7,
    }));
  } catch {
    // ビルド時にSupabaseへ接続できない場合は空配列で継続
  }

  return [
    {
      url: BASE_URL,
      lastModified: new Date().toISOString(),
      changeFrequency: 'daily',
      priority: 1.0,
    },
    {
      url: `${BASE_URL}/regions`,
      lastModified: new Date().toISOString(),
      changeFrequency: 'monthly',
      priority: 0.7,
    },
    {
      url: `${BASE_URL}/blog`,
      lastModified: new Date().toISOString(),
      changeFrequency: 'weekly',
      priority: 0.8,
    },
    ...regionEntries,
    ...blogEntries,
    ...shopEntries,
  ];
}
