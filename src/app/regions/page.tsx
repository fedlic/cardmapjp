import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';

const REGIONS = [
  { name: 'Akihabara', city: 'Tokyo', status: 'live' as const, shops: 78, href: '/regions/akihabara' },
  { name: 'Shibuya', city: 'Tokyo', status: 'coming' as const },
  { name: 'Shinjuku', city: 'Tokyo', status: 'coming' as const },
  { name: 'Ikebukuro', city: 'Tokyo', status: 'coming' as const },
  { name: 'Nipponbashi', city: 'Osaka', status: 'coming' as const },
  { name: 'Osu', city: 'Nagoya', status: 'coming' as const },
  { name: 'Teramachi', city: 'Kyoto', status: 'coming' as const },
  { name: 'Tenjin', city: 'Fukuoka', status: 'coming' as const },
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
              {region.status === 'live' && (
                <a
                  href={(region as { href?: string }).href ?? '/'}
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
