import type { ShopRow } from '@/types';

interface RegionInfo {
  name_en: string;
  name_jp: string;
  slug: string;
}

// ショップスポットライト
export function shopSpotlight(shop: ShopRow, region: RegionInfo): string {
  const tags: string[] = [];
  if (shop.english_staff) tags.push('EN Staff');
  if (shop.sells_psa_graded) tags.push('PSA Graded');
  if (shop.sells_vintage) tags.push('Vintage');
  if (shop.sells_english_cards) tags.push('EN Cards');
  if (shop.sells_oripa) tags.push('Oripa');
  if (shop.beginner_friendly) tags.push('Beginner OK');

  const rating = shop.google_rating ? `⭐ ${shop.google_rating}` : '';
  const tagLine = tags.length > 0 ? tags.slice(0, 3).join(' / ') : '';

  const lines = [
    `📍 ${shop.name_en}`,
    shop.name_jp ? `（${shop.name_jp}）` : '',
    '',
    `${region.name_en}, Japan`,
    rating,
    tagLine,
    '',
    `👉 https://cardmapjp.vercel.app/shops/${shop.id}`,
    '',
    '#PokemonTCG #ポケカ #CardMapJP #Pokemon',
  ];

  return lines.filter(Boolean).join('\n');
}

// エリアまとめ
export function areaSummary(region: RegionInfo, shopCount: number, topShops: ShopRow[]): string {
  const topList = topShops
    .slice(0, 3)
    .map((s, i) => `${i + 1}. ${s.name_en}${s.google_rating ? ` ⭐${s.google_rating}` : ''}`)
    .join('\n');

  return [
    `🗾 ${region.name_en}（${region.name_jp}）のポケカショップ`,
    '',
    `${shopCount} shops found!`,
    '',
    topList,
    '',
    `👉 https://cardmapjp.vercel.app/regions/${region.slug}`,
    '',
    '#PokemonTCG #ポケカ #CardMapJP',
  ].join('\n');
}

// 統計ツイート
export function statsTweet(totalShops: number, totalRegions: number, enStaffCount: number): string {
  return [
    `🃏 CardMapJP Stats`,
    '',
    `📍 ${totalShops} Pokemon card shops`,
    `🗾 ${totalRegions} areas across Japan`,
    `🇬🇧 ${enStaffCount} shops with English staff`,
    '',
    `Find your nearest shop 👇`,
    `https://cardmapjp.vercel.app`,
    '',
    '#PokemonTCG #ポケカ #CardMapJP #Pokemon #Japan',
  ].join('\n');
}
