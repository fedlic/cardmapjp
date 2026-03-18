import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';

interface RegionItem {
  name: string;
  city: string;
  status: 'live' | 'coming';
  shops?: number;
  href?: string;
}

const REGIONS: RegionItem[] = [
  // Tokyo
  { name: 'Akihabara', city: 'Tokyo', status: 'live', shops: 78, href: '/regions/akihabara' },
  { name: 'Ikebukuro', city: 'Tokyo', status: 'live', shops: 12, href: '/regions/ikebukuro' },
  { name: 'Shibuya', city: 'Tokyo', status: 'live', shops: 10, href: '/regions/shibuya' },
  { name: 'Shinjuku', city: 'Tokyo', status: 'live', shops: 8, href: '/regions/shinjuku' },
  { name: 'Nakano', city: 'Tokyo', status: 'live', shops: 8, href: '/regions/nakano' },
  // Kanto
  { name: 'Yokohama', city: 'Kanagawa', status: 'live', shops: 8, href: '/regions/yokohama' },
  { name: 'Omiya', city: 'Saitama', status: 'live', shops: 7, href: '/regions/omiya' },
  { name: 'Chiba', city: 'Chiba', status: 'live', shops: 7, href: '/regions/chiba' },
  { name: 'Machida', city: 'Tokyo', status: 'live', shops: 6, href: '/regions/machida' },
  { name: 'Tachikawa', city: 'Tokyo', status: 'live', shops: 7, href: '/regions/tachikawa' },
  // Kansai
  { name: 'Nipponbashi', city: 'Osaka', status: 'live', shops: 20, href: '/regions/nipponbashi' },
  { name: 'Teramachi / Kawaramachi', city: 'Kyoto', status: 'live', shops: 11, href: '/regions/kyoto' },
  { name: 'Sannomiya', city: 'Kobe', status: 'live', shops: 10, href: '/regions/kobe' },
  // Chubu
  { name: 'Osu', city: 'Nagoya', status: 'live', shops: 15, href: '/regions/osu' },
  { name: 'Niigata', city: 'Niigata', status: 'live', shops: 6, href: '/regions/niigata' },
  { name: 'Kanazawa', city: 'Kanazawa', status: 'live', shops: 5, href: '/regions/kanazawa' },
  // Kyushu / Okinawa
  { name: 'Tenjin / Hakata', city: 'Fukuoka', status: 'live', shops: 15, href: '/regions/tenjin-hakata' },
  { name: 'Kumamoto', city: 'Kumamoto', status: 'live', shops: 6, href: '/regions/kumamoto' },
  { name: 'Naha', city: 'Okinawa', status: 'live', shops: 6, href: '/regions/naha' },
  // Chugoku
  { name: 'Hiroshima', city: 'Hiroshima', status: 'live', shops: 10, href: '/regions/hiroshima' },
  { name: 'Okayama', city: 'Okayama', status: 'live', shops: 7, href: '/regions/okayama' },
  // Tohoku / Hokkaido
  { name: 'Sapporo', city: 'Hokkaido', status: 'live', shops: 11, href: '/regions/sapporo' },
  { name: 'Sendai', city: 'Miyagi', status: 'live', shops: 11, href: '/regions/sendai' },
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
            key={region.name}
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
              {region.status === 'live' && region.href && (
                <a
                  href={region.href}
                  className="text-sm text-[#E3350D] hover:underline mt-3 inline-block"
                >
                  Explore →
                </a>
              )}
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
}
