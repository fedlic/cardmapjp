import { NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';
import { createTwitterClient } from '@/lib/twitter';
import { shopSpotlight, areaSummary, statsTweet } from '@/lib/tweet-templates';
import type { ShopRow } from '@/types';

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!,
);

// Vercel Cronからのリクエストを認証
function isAuthorized(request: Request): boolean {
  const authHeader = request.headers.get('authorization');
  if (authHeader === `Bearer ${process.env.CRON_SECRET}`) return true;
  // Vercel Cronは自動的にこのヘッダーを付与
  return request.headers.get('x-vercel-cron') === '1';
}

// ランダムにツイートタイプを選択（重み付き）
// shop: 60%, area: 25%, stats: 15%
function pickTweetType(): 'shop' | 'area' | 'stats' {
  const r = Math.random();
  if (r < 0.6) return 'shop';
  if (r < 0.85) return 'area';
  return 'stats';
}

async function generateTweet(): Promise<string> {
  const type = pickTweetType();

  if (type === 'shop') {
    // ランダムなショップを1件取得
    const { data: shops } = await supabase
      .from('shops_with_coords')
      .select('*')
      .eq('is_active', true)
      .not('google_rating', 'is', null);

    if (!shops || shops.length === 0) throw new Error('No shops found');

    const shop = shops[Math.floor(Math.random() * shops.length)] as unknown as ShopRow;

    // リージョン情報を取得
    const { data: regions } = await supabase
      .from('regions')
      .select('name_en, name_jp, slug')
      .eq('id', shop.region_id)
      .single();

    const region = regions ?? { name_en: 'Japan', name_jp: '日本', slug: '' };
    return shopSpotlight(shop, region);
  }

  if (type === 'area') {
    // ランダムなリージョンを選択
    const { data: regions } = await supabase
      .from('regions')
      .select('id, name_en, name_jp, slug');

    if (!regions || regions.length === 0) throw new Error('No regions found');

    const region = regions[Math.floor(Math.random() * regions.length)];

    const { data: shops } = await supabase
      .from('shops_with_coords')
      .select('*')
      .eq('region_id', region.id)
      .eq('is_active', true)
      .order('google_rating', { ascending: false, nullsFirst: false })
      .limit(3);

    return areaSummary(region, shops?.length ?? 0, (shops ?? []) as unknown as ShopRow[]);
  }

  // stats
  const { count: totalShops } = await supabase
    .from('shops_with_coords')
    .select('*', { count: 'exact', head: true })
    .eq('is_active', true);

  const { count: enStaffCount } = await supabase
    .from('shops_with_coords')
    .select('*', { count: 'exact', head: true })
    .eq('is_active', true)
    .eq('english_staff', true);

  const { data: regions } = await supabase
    .from('regions')
    .select('id');

  return statsTweet(totalShops ?? 0, regions?.length ?? 0, enStaffCount ?? 0);
}

export async function GET(request: Request) {
  if (!isAuthorized(request)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    const tweetText = await generateTweet();
    const client = createTwitterClient();
    const { data } = await client.v2.tweet(tweetText);

    return NextResponse.json({
      success: true,
      tweet_id: data.id,
      text: tweetText,
    });
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Unknown error';
    console.error('Tweet failed:', message);
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
