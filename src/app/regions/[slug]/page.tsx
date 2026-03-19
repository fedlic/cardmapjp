import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { createServerClient } from '@/lib/supabase/server';
import { ALL_REGION_SLUGS, getRegionConfig } from '@/lib/regions';
import type { ShopRow } from '@/types';

export const revalidate = 3600;

interface PageProps {
  params: Promise<{ slug: string }>;
}

export function generateStaticParams() {
  return ALL_REGION_SLUGS.map((slug) => ({ slug }));
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params;
  const config = getRegionConfig(slug);
  if (!config) return { title: 'Region Not Found' };
  return {
    title: config.meta_title,
    description: config.meta_description,
    openGraph: {
      title: config.meta_title.replace(' | CardMapJP', ''),
      description: config.og_description,
      type: 'website',
      url: `https://cardmapjp.vercel.app/regions/${slug}`,
    },
  };
}

const SHOP_COLUMNS = [
  'id', 'name_en', 'name_jp', 'address_en',
  'google_rating', 'google_review_count',
  'english_staff', 'beginner_friendly',
  'sells_singles', 'sells_booster_box', 'sells_psa_graded',
  'sells_oripa', 'sells_english_cards', 'sells_vintage',
  'open_hours', 'ai_summary',
].join(',');

export default async function RegionPage({ params }: PageProps) {
  const { slug } = await params;
  const config = getRegionConfig(slug);
  if (!config) notFound();

  const supabase = createServerClient();
  const { data } = await supabase
    .from('shops_with_coords')
    .select(SHOP_COLUMNS)
    .eq('region_id', config.region_id)
    .eq('is_active', true)
    .order('google_rating', { ascending: false, nullsFirst: false });

  const shops = (data ?? []) as unknown as ShopRow[];
  const englishShops = shops.filter((s) => s.english_staff);
  const topRated = shops.filter((s) => s.google_rating && s.google_rating >= 4.5);

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'ItemList',
    name: `Best Pokemon Card Shops in ${config.name_en}`,
    numberOfItems: shops.length,
    itemListElement: shops.slice(0, 10).map((shop, i) => ({
      '@type': 'ListItem',
      position: i + 1,
      item: { '@type': 'Store', name: shop.name_en, url: `https://cardmapjp.vercel.app/shops/${shop.id}` },
    })),
  };

  return (
    <>
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />

      <div className="max-w-3xl mx-auto">
        {/* Hero */}
        <div className="bg-[#E3350D] text-white px-4 py-8">
          <a href="/regions" className="text-white/70 text-sm hover:text-white">&larr; All regions</a>
          <h1 className="text-3xl font-bold mt-2">Best Pokemon Card Shops in {config.name_en}</h1>
          <p className="text-white/80 mt-2 text-lg">{config.hero_subtitle}</p>
          <div className="flex flex-wrap gap-2 mt-4 text-sm">
            <span className="bg-white/20 rounded-full px-3 py-1">{shops.length} Shops</span>
            <span className="bg-white/20 rounded-full px-3 py-1">{englishShops.length} EN Staff</span>
            <span className="bg-white/20 rounded-full px-3 py-1">{topRated.length} Top Rated</span>
          </div>
          <a href={`/?region=${slug}`}
            className="inline-block mt-4 bg-white text-[#E3350D] font-semibold rounded-lg px-5 py-2 text-sm hover:bg-white/90 transition">
            Open Interactive Map
          </a>
        </div>

        <div className="px-4 py-8">
          {/* Article */}
          <article className="prose prose-sm max-w-none mb-8">
            <h2 className="text-xl font-bold text-gray-900">Why {config.name_en} for Pokemon Cards?</h2>
            {config.why_paragraphs.map((p, i) => <p key={i} className="text-gray-600">{p}</p>)}

            <h2 className="text-xl font-bold text-gray-900 mt-6">Getting to {config.name_en}</h2>
            <ul className="text-gray-600">
              {config.getting_there.map((t) => (
                <li key={t.line}><span className="font-medium text-gray-900">{t.line}</span>{t.station ? ` - ${t.station}. ` : ' - '}{t.detail}</li>
              ))}
            </ul>

            <h2 className="text-xl font-bold text-gray-900 mt-6">Tips for Foreign Visitors</h2>
            <ul className="text-gray-600">
              {config.tips.map((tip) => (
                <li key={tip.title}><span className="font-medium text-gray-900">{tip.title}</span> - {tip.body}</li>
              ))}
            </ul>

            <h2 className="text-xl font-bold text-gray-900 mt-6">What You Can Find</h2>
            <div className="grid grid-cols-2 sm:grid-cols-3 gap-2 not-prose mt-3">
              {[
                { label: 'Booster Boxes', count: shops.filter((s) => s.sells_booster_box).length },
                { label: 'Singles', count: shops.filter((s) => s.sells_singles).length },
                { label: 'PSA Graded', count: shops.filter((s) => s.sells_psa_graded).length },
                { label: 'Vintage', count: shops.filter((s) => s.sells_vintage).length },
                { label: 'English Cards', count: shops.filter((s) => s.sells_english_cards).length },
                { label: 'Oripa', count: shops.filter((s) => s.sells_oripa).length },
              ].map((cat) => (
                <div key={cat.label} className="bg-gray-50 rounded-lg p-3 text-center">
                  <p className="text-lg font-bold text-[#E3350D]">{cat.count}</p>
                  <p className="text-xs text-gray-400">{cat.label}</p>
                </div>
              ))}
            </div>
          </article>

          {/* Shop listing */}
          <h2 className="text-xl font-bold text-gray-900 mb-4">All {shops.length} Shops in {config.name_en}</h2>
          <div className="space-y-3">
            {shops.map((shop, idx) => (
              <a key={shop.id} href={`/shops/${shop.id}`} className="block">
                <div className="bg-white rounded-lg border border-gray-100 p-4 shadow-sm hover:shadow-md transition-shadow">
                  <div className="flex items-start justify-between gap-2">
                    <div className="min-w-0">
                      <div className="flex items-center gap-2">
                        <span className="text-xs text-gray-300 font-mono">#{idx + 1}</span>
                        <h3 className="font-semibold text-sm text-gray-900 truncate">{shop.name_en}</h3>
                      </div>
                      <p className="text-xs text-gray-400 truncate ml-6">{shop.name_jp} &middot; {shop.address_en}</p>
                    </div>
                    {shop.google_rating && (
                      <div className="flex items-center gap-1 shrink-0 text-sm">
                        <span className="text-[#FFCB05]">&#9733;</span>
                        <span className="font-medium text-gray-900">{shop.google_rating}</span>
                      </div>
                    )}
                  </div>
                  {shop.ai_summary && (
                    <p className="text-xs text-gray-400 mt-2 line-clamp-2 ml-6">{shop.ai_summary}</p>
                  )}
                  <div className="flex flex-wrap gap-1 mt-2 ml-6">
                    {shop.english_staff && <span className="text-[9px] font-medium bg-[#DBEAFE] text-[#1D4ED8] rounded px-1.5 py-0.5">EN Staff</span>}
                    {shop.beginner_friendly && <span className="text-[9px] font-medium bg-[#CCFBF1] text-[#0F766E] rounded px-1.5 py-0.5">Beginner</span>}
                    {shop.sells_psa_graded && <span className="text-[9px] font-medium bg-[#EDE9FE] text-[#5B21B6] rounded px-1.5 py-0.5">PSA</span>}
                    {shop.sells_vintage && <span className="text-[9px] font-medium bg-gray-100 text-gray-500 rounded px-1.5 py-0.5">Vintage</span>}
                    {shop.sells_english_cards && <span className="text-[9px] font-medium bg-gray-100 text-gray-500 rounded px-1.5 py-0.5">EN Cards</span>}
                  </div>
                </div>
              </a>
            ))}
          </div>

          {/* Bottom CTA */}
          <div className="text-center mt-8 mb-4">
            <a href={`/?region=${slug}`}
              className="inline-block bg-[#E3350D] text-white font-semibold rounded-lg px-6 py-3 hover:bg-[#c42d0b] transition">
              Explore All Shops on the Map
            </a>
          </div>
        </div>
      </div>
    </>
  );
}
