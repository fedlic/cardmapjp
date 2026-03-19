interface RegionItem {
  name: string;
  slug: string;
  city: string;
  status: 'live' | 'coming';
  shops?: number;
  hasLandingPage?: boolean;
}

const REGIONS: RegionItem[] = [
  { name: 'Akihabara', slug: 'akihabara', city: 'Tokyo', status: 'live', shops: 78, hasLandingPage: true },
  { name: 'Ikebukuro', slug: 'ikebukuro', city: 'Tokyo', status: 'live', shops: 12 },
  { name: 'Shibuya', slug: 'shibuya', city: 'Tokyo', status: 'live', shops: 10 },
  { name: 'Shinjuku', slug: 'shinjuku', city: 'Tokyo', status: 'live', shops: 8 },
  { name: 'Nakano', slug: 'nakano', city: 'Tokyo', status: 'live', shops: 8 },
  { name: 'Tachikawa', slug: 'tachikawa', city: 'Tokyo', status: 'live', shops: 7 },
  { name: 'Machida', slug: 'machida', city: 'Tokyo', status: 'live', shops: 6 },
  { name: 'Yokohama', slug: 'yokohama', city: 'Kanagawa', status: 'live', shops: 8 },
  { name: 'Omiya', slug: 'omiya', city: 'Saitama', status: 'live', shops: 7 },
  { name: 'Chiba', slug: 'chiba', city: 'Chiba', status: 'live', shops: 7 },
  { name: 'Nipponbashi', slug: 'nipponbashi', city: 'Osaka', status: 'live', shops: 20, hasLandingPage: true },
  { name: 'Teramachi / Kawaramachi', slug: 'kyoto', city: 'Kyoto', status: 'live', shops: 11 },
  { name: 'Sannomiya', slug: 'kobe', city: 'Kobe', status: 'live', shops: 10 },
  { name: 'Osu', slug: 'osu', city: 'Nagoya', status: 'live', shops: 15, hasLandingPage: true },
  { name: 'Niigata', slug: 'niigata', city: 'Niigata', status: 'live', shops: 6 },
  { name: 'Kanazawa', slug: 'kanazawa', city: 'Kanazawa', status: 'live', shops: 5 },
  { name: 'Tenjin / Hakata', slug: 'tenjin-hakata', city: 'Fukuoka', status: 'live', shops: 15, hasLandingPage: true },
  { name: 'Kumamoto', slug: 'kumamoto', city: 'Kumamoto', status: 'live', shops: 6 },
  { name: 'Naha', slug: 'naha', city: 'Okinawa', status: 'live', shops: 6 },
  { name: 'Hiroshima', slug: 'hiroshima', city: 'Hiroshima', status: 'live', shops: 10 },
  { name: 'Okayama', slug: 'okayama', city: 'Okayama', status: 'live', shops: 7 },
  { name: 'Sapporo', slug: 'sapporo', city: 'Hokkaido', status: 'live', shops: 11 },
  { name: 'Sendai', slug: 'sendai', city: 'Miyagi', status: 'live', shops: 11 },
];

export default function RegionsPage() {
  return (
    <div className="max-w-3xl mx-auto px-4 py-8">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Regions</h1>
      <p className="text-gray-500 mb-6">
        Explore Pokemon card shopping districts across Japan.
      </p>

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
        {REGIONS.map((region) => (
          <div
            key={region.slug}
            className={`bg-white rounded-lg border p-4 shadow-sm ${
              region.status === 'live' ? 'border-gray-200' : 'border-gray-100 opacity-60'
            }`}
          >
            <div className="flex items-start justify-between">
              <div>
                <h2 className="font-semibold text-gray-900">{region.name}</h2>
                <p className="text-sm text-gray-400">{region.city}</p>
              </div>
              {region.status === 'live' && region.shops && (
                <span className="text-xs font-medium bg-[#E3350D] text-white rounded-full px-2.5 py-0.5">
                  {region.shops}
                </span>
              )}
            </div>
            {region.status === 'live' && (
              <div className="flex items-center gap-3 mt-3">
                <a href={`/?region=${region.slug}`} className="text-sm text-[#E3350D] hover:underline font-medium">
                  View on Map
                </a>
                {region.hasLandingPage && (
                  <a href={`/regions/${region.slug}`} className="text-sm text-gray-400 hover:text-gray-600">
                    Guide
                  </a>
                )}
              </div>
            )}
          </div>
        ))}
      </div>
    </div>
  );
}
