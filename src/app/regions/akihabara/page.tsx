import type { Metadata } from 'next';
import { createServerClient } from '@/lib/supabase/server';
import { Badge } from '@/components/ui/badge';
import { Card, CardContent } from '@/components/ui/card';
import type { ShopRow } from '@/types';

export const revalidate = 3600; // 1 hour

export const metadata: Metadata = {
  title: 'Best Pokemon Card Shops in Akihabara, Tokyo (2025 Guide) | CardMapJP',
  description:
    'Complete guide to 78+ Pokemon card shops in Akihabara, Tokyo. Find booster boxes, rare singles, PSA graded cards, vintage packs & English cards. Maps, hours, prices and tips for foreign visitors.',
  openGraph: {
    title: 'Best Pokemon Card Shops in Akihabara, Tokyo | CardMapJP',
    description:
      '78+ Pokemon card shops in Akihabara. Booster boxes, rare singles, graded cards & more. English-friendly guide for collectors.',
    type: 'website',
    url: 'https://cardmapjp.vercel.app/regions/akihabara',
  },
};

const SHOP_COLUMNS = [
  'id', 'name_en', 'name_jp', 'address_en',
  'google_rating', 'google_review_count',
  'english_staff', 'beginner_friendly',
  'sells_singles', 'sells_booster_box', 'sells_psa_graded',
  'sells_oripa', 'sells_english_cards', 'sells_vintage',
  'open_hours', 'ai_summary',
].join(',');

export default async function AkihabaraPage() {
  const supabase = createServerClient();
  const { data } = await supabase
    .from('shops_with_coords')
    .select(SHOP_COLUMNS)
    .eq('is_active', true)
    .order('google_rating', { ascending: false, nullsFirst: false });

  const shops = (data ?? []) as unknown as ShopRow[];
  const englishShops = shops.filter((s) => s.english_staff);
  const topRated = shops.filter((s) => s.google_rating && s.google_rating >= 4.5);

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'ItemList',
    name: 'Best Pokemon Card Shops in Akihabara',
    numberOfItems: shops.length,
    itemListElement: shops.slice(0, 10).map((shop, i) => ({
      '@type': 'ListItem',
      position: i + 1,
      item: {
        '@type': 'Store',
        name: shop.name_en,
        url: `https://cardmapjp.vercel.app/shops/${shop.id}`,
      },
    })),
  };

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      <div className="max-w-3xl mx-auto px-4 py-8">
        {/* Hero */}
        <div className="bg-gradient-to-r from-[#E3350D] to-[#c42d0b] text-white p-8 rounded-xl mb-8">
          <h1 className="text-3xl font-bold">
            Best Pokemon Card Shops in Akihabara
          </h1>
          <p className="text-white/80 mt-2 text-lg">
            The ultimate guide for foreign collectors visiting Tokyo&apos;s card paradise
          </p>
          <div className="flex flex-wrap gap-3 mt-4 text-sm">
            <span className="bg-white/20 rounded-full px-3 py-1">
              {shops.length} Shops
            </span>
            <span className="bg-white/20 rounded-full px-3 py-1">
              {englishShops.length} with English Staff
            </span>
            <span className="bg-white/20 rounded-full px-3 py-1">
              {topRated.length} Top Rated (4.5+)
            </span>
          </div>
          <a
            href="/"
            className="inline-block mt-4 bg-white text-[#E3350D] font-semibold rounded-lg px-5 py-2 text-sm hover:bg-white/90 transition"
          >
            Open Interactive Map
          </a>
        </div>

        {/* Quick intro */}
        <article className="prose prose-sm max-w-none mb-8">
          <h2 className="text-xl font-bold">Why Akihabara for Pokemon Cards?</h2>
          <p>
            Akihabara (秋葉原) in central Tokyo is the world&apos;s largest concentration of Pokemon
            card shops. Within a 10-minute walk from Akihabara Station, you&apos;ll find over {shops.length} shops
            selling everything from the latest booster boxes to vintage Base Set holos and
            PSA-graded slabs. Most shops are located along Chuo-dori and in the side streets
            between the station and Suehirocho.
          </p>
          <p>
            Whether you&apos;re hunting for Japanese-exclusive art rares, sealed vintage product,
            or graded investment pieces, Akihabara has it all &mdash; often at prices significantly
            below international market value.
          </p>

          <h2 className="text-xl font-bold mt-6">Getting to Akihabara</h2>
          <ul>
            <li>
              <strong>JR Yamanote Line</strong> &mdash; Akihabara Station (Electric Town exit).
              The main loop line connecting Shibuya, Shinjuku, Ikebukuro, and Tokyo Station.
            </li>
            <li>
              <strong>Tokyo Metro Hibiya Line</strong> &mdash; Akihabara Station.
              Direct from Roppongi and Ginza.
            </li>
            <li>
              <strong>TX Tsukuba Express</strong> &mdash; Akihabara Station.
              From Tsukuba and northern suburbs.
            </li>
            <li>
              <strong>From Narita Airport</strong> &mdash; Take the JR Narita Express to Tokyo Station,
              then transfer to JR Yamanote Line (2 stops). About 80 minutes total.
            </li>
            <li>
              <strong>From Haneda Airport</strong> &mdash; Take the Keikyu Line to Shinagawa,
              then transfer to JR Yamanote Line. About 40 minutes total.
            </li>
          </ul>

          <h2 className="text-xl font-bold mt-6">Tips for Foreign Visitors</h2>
          <ul>
            <li>
              <strong>Tax-free shopping</strong> &mdash; Most larger shops offer tax-free
              purchases for tourists (passport required, minimum spend usually 5,000 yen).
            </li>
            <li>
              <strong>Payment</strong> &mdash; Cash is still king at smaller shops. Larger
              stores accept credit cards and IC cards (Suica/Pasmo).
            </li>
            <li>
              <strong>Best time to visit</strong> &mdash; Weekday mornings (11am-1pm) are
              quietest. Weekends and holidays are very crowded, especially at popular shops.
            </li>
            <li>
              <strong>English support</strong> &mdash; {englishShops.length} shops have English-speaking
              staff. Look for the &quot;English OK&quot; badge in our listings below.
            </li>
            <li>
              <strong>Condition grading</strong> &mdash; Japanese shops grade condition strictly.
              &quot;Near Mint&quot; in Japan is often better than NM in Western markets.
            </li>
            <li>
              <strong>Prices</strong> &mdash; Cards are priced individually in display cases.
              Prices are final &mdash; haggling is not common in Japanese card shops.
            </li>
          </ul>

          <h2 className="text-xl font-bold mt-6">What You Can Find</h2>
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
                <p className="text-xs text-muted-foreground">{cat.label}</p>
              </div>
            ))}
          </div>
        </article>

        {/* Shop listing */}
        <h2 className="text-xl font-bold mb-4">
          All {shops.length} Pokemon Card Shops in Akihabara
        </h2>

        <div className="space-y-3">
          {shops.map((shop, idx) => (
            <a key={shop.id} href={`/shops/${shop.id}`} className="block">
              <Card className="hover:shadow-md transition-shadow">
                <CardContent className="p-4">
                  <div className="flex items-start justify-between gap-2">
                    <div className="min-w-0">
                      <div className="flex items-center gap-2">
                        <span className="text-xs text-muted-foreground font-mono">
                          #{idx + 1}
                        </span>
                        <h3 className="font-semibold text-sm truncate">
                          {shop.name_en}
                        </h3>
                      </div>
                      <p className="text-xs text-muted-foreground truncate ml-6">
                        {shop.name_jp} &middot; {shop.address_en}
                      </p>
                    </div>
                    {shop.google_rating && (
                      <div className="flex items-center gap-1 shrink-0 text-sm">
                        <span className="text-yellow-500">★</span>
                        <span className="font-medium">{shop.google_rating}</span>
                        {shop.google_review_count && (
                          <span className="text-xs text-muted-foreground">
                            ({shop.google_review_count})
                          </span>
                        )}
                      </div>
                    )}
                  </div>

                  {shop.ai_summary && (
                    <p className="text-xs text-muted-foreground mt-2 line-clamp-2 ml-6">
                      {shop.ai_summary}
                    </p>
                  )}

                  <div className="flex flex-wrap gap-1 mt-2 ml-6">
                    {shop.english_staff && (
                      <Badge variant="secondary" className="text-xs">
                        English OK
                      </Badge>
                    )}
                    {shop.beginner_friendly && (
                      <Badge variant="secondary" className="text-xs">
                        Beginner Friendly
                      </Badge>
                    )}
                    {shop.sells_psa_graded && (
                      <Badge variant="outline" className="text-xs">
                        PSA
                      </Badge>
                    )}
                    {shop.sells_vintage && (
                      <Badge variant="outline" className="text-xs">
                        Vintage
                      </Badge>
                    )}
                    {shop.sells_english_cards && (
                      <Badge variant="outline" className="text-xs">
                        EN Cards
                      </Badge>
                    )}
                  </div>
                </CardContent>
              </Card>
            </a>
          ))}
        </div>

        {/* Bottom CTA */}
        <div className="text-center mt-8 mb-4">
          <a
            href="/"
            className="inline-block bg-[#E3350D] text-white font-semibold rounded-lg px-6 py-3 hover:bg-[#c42d0b] transition"
          >
            Explore All Shops on the Map
          </a>
        </div>
      </div>
    </>
  );
}
