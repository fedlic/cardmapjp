import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';

interface RegionItem {
  name: string;
  slug: string;
  city: string;
  status: 'live' | 'coming';
  shops?: number;
  hasLandingPage?: boolean;
}

const REGIONS: RegionItem[] = [
  // Tokyo
  { name: 'Akihabara', slug: 'akihabara', city: 'Tokyo', status: 'live', shops: 78, hasLandingPage: true },
  { name: 'Ikebukuro', slug: 'ikebukuro', city: 'Tokyo', status: 'live', shops: 12 },
  { name: 'Shibuya', slug: 'shibuya', city: 'Tokyo', status: 'live', shops: 10 },
  { name: 'Shinjuku', slug: 'shinjuku', city: 'Tokyo', status: 'live', shops: 8 },
  { name: 'Nakano', slug: 'nakano', city: 'Tokyo', status: 'live', shops: 8 },
  { name: 'Tachikawa', slug: 'tachikawa', city: 'Tokyo', status: 'live', shops: 7 },
  { name: 'Machida', slug: 'machida', city: 'Tokyo', status: 'live', shops: 6 },
  // Kanto
  { name: 'Yokohama', slug: 'yokohama', city: 'Kanagawa', status: 'live', shops: 8 },
  { name: 'Omiya', slug: 'omiya', city: 'Saitama', status: 'live', shops: 7 },
  { name: 'Chiba', slug: 'chiba', city: 'Chiba', status: 'live', shops: 7 },
  // Kansai
  { name: 'Nipponbashi', slug: 'nipponbashi', city: 'Osaka', status: 'live', shops: 20, hasLandingPage: true },
  { name: 'Teramachi / Kawaramachi', slug: 'kyoto', city: 'Kyoto', status: 'live', shops: 11 },
  { name: 'Sannomiya', slug: 'kobe', city: 'Kobe', status: 'live', shops: 10 },
  // Chubu
  { name: 'Osu', slug: 'osu', city: 'Nagoya', status: 'live', shops: 15, hasLandingPage: true },
  { name: 'Niigata', slug: 'niigata', city: 'Niigata', status: 'live', shops: 6 },
  { name: 'Kanazawa', slug: 'kanazawa', city: 'Kanazawa', status: 'live', shops: 5 },
  // Kyushu / Okinawa
  { name: 'Tenjin / Hakata', slug: 'tenjin-hakata', city: 'Fukuoka', status: 'live', shops: 15, hasLandingPage: true },
  { name: 'Kumamoto', slug: 'kumamoto', city: 'Kumamoto', status: 'live', shops: 6 },
  { name: 'Naha', slug: 'naha', city: 'Okinawa', status: 'live', shops: 6 },
  // Chugoku
  { name: 'Hiroshima', slug: 'hiroshima', city: 'Hiroshima', status: 'live', shops: 10 },
  { name: 'Okayama', slug: 'okayama', city: 'Okayama', status: 'live', shops: 7 },
  // Tohoku / Hokkaido
  { name: 'Sapporo', slug: 'sapporo', city: 'Hokkaido', status: 'live', shops: 11 },
  { name: 'Sendai', slug: 'sendai', city: 'Miyagi', status: 'live', shops: 11 },
];

export default function RegionsPage() {
  return (
    <div className="max-w-3xl mx-auto px-4 py-8">
      <h1 className="text-2xl font-bold mb-2">Regions</h1>
      <p className="text-muted-foreground mb-6">
        Explore Pokemon card shopping districts across Japan.
      </p>

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        {REGIONS.map((region) => (
          <Card
            key={region.slug}
            className={
              region.status === 'live'
                ? 'border-[#E3350D] shadow-md'
                : 'opacity-60'
            }
          >
            <CardContent className="p-5">
              <div className="flex items-start justify-between">
                <div>
                  <h2 className="font-semibold text-lg">{region.name}</h2>
                  <p className="text-sm text-muted-foreground">{region.city}</p>
                </div>
                {region.status === 'live' ? (
                  <Badge className="bg-[#E3350D] text-white">
                    {region.shops} shops
                  </Badge>
                ) : (
                  <Badge variant="outline">Coming Soon</Badge>
                )}
              </div>
              {region.status === 'live' && (
                <div className="flex items-center gap-3 mt-3">
                  <a
                    href={`/?region=${region.slug}`}
                    className="text-sm text-[#E3350D] hover:underline"
                  >
                    View on Map →
                  </a>
                  {region.hasLandingPage && (
                    <a
                      href={`/regions/${region.slug}`}
                      className="text-sm text-muted-foreground hover:underline"
                    >
                      Guide
                    </a>
                  )}
                </div>
              )}
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
}
