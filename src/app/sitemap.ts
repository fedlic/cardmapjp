import type { MetadataRoute } from 'next';
import { createServerClient } from '@/lib/supabase/server';

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

  const regionEntries: MetadataRoute.Sitemap = [
    {
      url: `${BASE_URL}/regions/akihabara`,
      lastModified: new Date().toISOString(),
      changeFrequency: 'monthly',
      priority: 0.9,
    },
  ];

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
    ...regionEntries,
    ...shopEntries,
  ];
}
