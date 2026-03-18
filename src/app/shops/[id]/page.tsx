import { cache } from 'react';
import type { Metadata } from 'next';
import { createServerClient } from '@/lib/supabase/server';
import HeroSection from '@/components/ShopDetail/HeroSection';
import AISummary from '@/components/ShopDetail/AISummary';
import InventoryGrid from '@/components/ShopDetail/InventoryGrid';
import InfoSection from '@/components/ShopDetail/InfoSection';
import ReviewList from '@/components/ShopDetail/ReviewList';
import type { Shop, ShopRow, ShopInventory, Review, GoogleReview, OpenHours } from '@/types';

export const revalidate = 1800; // 30 min ISR cache

interface PageProps {
  params: Promise<{ id: string }>;
}

const getShop = cache(async (id: string) => {
  const supabase = createServerClient();
  const { data, error } = await supabase
    .from('shops_with_coords')
    .select('*')
    .eq('id', id)
    .single();
  if (error || !data) return null;
  return data as ShopRow;
});

export async function generateStaticParams() {
  const supabase = createServerClient();
  const { data } = await supabase
    .from('shops_with_coords')
    .select('id')
    .eq('is_active', true);
  return (data ?? []).map((row) => ({ id: row.id }));
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { id } = await params;
  const row = await getShop(id);
  if (!row) return { title: 'Shop Not Found' };

  const title = `${row.name_en} | Pokemon Cards Akihabara | CardMapJP`;
  const descParts: string[] = [];
  if (row.open_hours) {
    const mon = row.open_hours['monday'];
    if (mon) descParts.push(`Open ${mon.open}–${mon.close}`);
  }
  if (row.english_staff) descParts.push('English staff available');
  if (row.google_rating) descParts.push(`★${row.google_rating} rating`);
  const descSuffix = descParts.length > 0 ? ` ${descParts.join('. ')}.` : '';
  const description = row.ai_summary
    ? row.ai_summary.slice(0, 140) + descSuffix
    : `Find Pokemon cards at ${row.name_en} (${row.name_jp}) in Akihabara, Tokyo.${descSuffix} Directions, hours, inventory & reviews.`;

  return {
    title,
    description,
    openGraph: {
      title,
      description,
      type: 'website',
      url: `https://cardmapjp.vercel.app/shops/${id}`,
    },
  };
}

const DAY_MAP: Record<string, string> = {
  monday: 'Mo', tuesday: 'Tu', wednesday: 'We', thursday: 'Th',
  friday: 'Fr', saturday: 'Sa', sunday: 'Su',
};

function formatOpeningHours(hours: OpenHours): string[] {
  return Object.entries(hours)
    .filter(([, slot]) => slot !== null)
    .map(([day, slot]) => {
      const abbr = DAY_MAP[day];
      return abbr && slot ? `${abbr} ${slot.open}-${slot.close}` : null;
    })
    .filter((v): v is string => v !== null);
}

const PAYMENT_MAP: Record<string, string> = {
  cash: 'Cash',
  visa: 'Visa',
  mastercard: 'MasterCard',
  ic: 'IC Card',
};

function buildJsonLd(shop: Shop) {
  const ld: Record<string, unknown> = {
    '@context': 'https://schema.org',
    '@type': 'Store',
    name: shop.name_en,
    alternateName: shop.name_jp,
    url: `https://cardmapjp.vercel.app/shops/${shop.id}`,
    geo: {
      '@type': 'GeoCoordinates',
      latitude: shop.location.lat,
      longitude: shop.location.lng,
    },
    address: {
      '@type': 'PostalAddress',
      streetAddress: shop.address_en,
      addressLocality: 'Tokyo',
      addressCountry: 'JP',
    },
  };

  if (shop.phone) ld.telephone = shop.phone;
  if (shop.website_url) ld.sameAs = shop.website_url;
  if (shop.open_hours) ld.openingHours = formatOpeningHours(shop.open_hours);
  if (shop.payment_methods?.length) {
    ld.paymentAccepted = shop.payment_methods
      .map((m) => PAYMENT_MAP[m] || m)
      .join(', ');
  }
  if (shop.google_rating) {
    ld.aggregateRating = {
      '@type': 'AggregateRating',
      ratingValue: shop.google_rating,
      reviewCount: shop.google_review_count ?? 0,
      bestRating: 5,
    };
  }

  return ld;
}

export default async function ShopDetailPage({ params }: PageProps) {
  const { id } = await params;
  const supabase = createServerClient();

  const [row, inventoryResult, reviewsResult, googleReviewsResult] = await Promise.all([
    getShop(id),
    supabase
      .from('shop_inventory')
      .select('*')
      .eq('shop_id', id)
      .order('category'),
    supabase
      .from('reviews')
      .select('*')
      .eq('shop_id', id)
      .order('created_at', { ascending: false }),
    supabase
      .from('google_reviews_cache')
      .select('reviews')
      .eq('shop_id', id)
      .order('fetched_at', { ascending: false })
      .limit(1)
      .maybeSingle(),
  ]);

  if (!row) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="text-center">
          <p className="text-lg font-semibold">Shop not found</p>
          <a href="/" className="text-sm text-[#E3350D] hover:underline mt-2 inline-block">
            Back to map
          </a>
        </div>
      </div>
    );
  }

  const shop: Shop = { ...row, location: { lat: row.lat, lng: row.lng } };
  const inventory = (inventoryResult.data as ShopInventory[]) || [];
  const reviews = (reviewsResult.data as Review[]) || [];
  const googleReviews = (googleReviewsResult.data?.reviews as GoogleReview[]) || [];

  const jsonLd = buildJsonLd(shop);

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      <div className="max-w-2xl mx-auto px-4 py-6 space-y-6">
        <a
          href="/"
          className="text-sm text-[#E3350D] hover:underline inline-block mb-2"
        >
          &larr; Back to map
        </a>

        <HeroSection shop={shop} />
        <AISummary summary={shop.ai_summary} tips={shop.visitor_tips} />
        <InventoryGrid inventory={inventory} />
        <InfoSection shop={shop} />
        <ReviewList reviews={reviews} shopId={id} googleReviews={googleReviews} />
      </div>
    </>
  );
}
