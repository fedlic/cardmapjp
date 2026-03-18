export interface TransitInfo {
  line: string;
  station: string;
  detail: string;
}

export interface TipItem {
  title: string;
  body: string;
}

export interface RegionConfig {
  slug: string;
  name_en: string;
  name_jp: string;
  city: string;
  prefecture: string;
  region_id: string;
  center: { lat: number; lng: number };
  meta_title: string;
  meta_description: string;
  og_description: string;
  hero_subtitle: string;
  why_paragraphs: string[];
  getting_there: TransitInfo[];
  tips: TipItem[];
}

export const REGION_CONFIGS: Record<string, RegionConfig> = {
  akihabara: {
    slug: 'akihabara',
    name_en: 'Akihabara',
    name_jp: '秋葉原',
    city: 'Tokyo',
    prefecture: 'Tokyo',
    region_id: 'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
    center: { lat: 35.6984, lng: 139.7731 },
    meta_title: 'Best Pokemon Card Shops in Akihabara, Tokyo (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 78+ Pokemon card shops in Akihabara, Tokyo. Find booster boxes, rare singles, PSA graded cards, vintage packs & English cards. Maps, hours, prices and tips for foreign visitors.',
    og_description:
      '78+ Pokemon card shops in Akihabara. Booster boxes, rare singles, graded cards & more. English-friendly guide for collectors.',
    hero_subtitle: "The ultimate guide for foreign collectors visiting Tokyo's card paradise",
    why_paragraphs: [
      "Akihabara (秋葉原) in central Tokyo is the world's largest concentration of Pokemon card shops. Within a 10-minute walk from Akihabara Station, you'll find over 78 shops selling everything from the latest booster boxes to vintage Base Set holos and PSA-graded slabs. Most shops are located along Chuo-dori and in the side streets between the station and Suehirocho.",
      "Whether you're hunting for Japanese-exclusive art rares, sealed vintage product, or graded investment pieces, Akihabara has it all — often at prices significantly below international market value.",
    ],
    getting_there: [
      {
        line: 'JR Yamanote Line',
        station: 'Akihabara Station (Electric Town exit)',
        detail: 'The main loop line connecting Shibuya, Shinjuku, Ikebukuro, and Tokyo Station.',
      },
      {
        line: 'Tokyo Metro Hibiya Line',
        station: 'Akihabara Station',
        detail: 'Direct from Roppongi and Ginza.',
      },
      {
        line: 'TX Tsukuba Express',
        station: 'Akihabara Station',
        detail: 'From Tsukuba and northern suburbs.',
      },
      {
        line: 'From Narita Airport',
        station: '',
        detail:
          'Take the JR Narita Express to Tokyo Station, then transfer to JR Yamanote Line (2 stops). About 80 minutes total.',
      },
      {
        line: 'From Haneda Airport',
        station: '',
        detail:
          'Take the Keikyu Line to Shinagawa, then transfer to JR Yamanote Line. About 40 minutes total.',
      },
    ],
    tips: [
      {
        title: 'Tax-free shopping',
        body: 'Most larger shops offer tax-free purchases for tourists (passport required, minimum spend usually 5,000 yen).',
      },
      {
        title: 'Payment',
        body: 'Cash is still king at smaller shops. Larger stores accept credit cards and IC cards (Suica/Pasmo).',
      },
      {
        title: 'Best time to visit',
        body: 'Weekday mornings (11am-1pm) are quietest. Weekends and holidays are very crowded, especially at popular shops.',
      },
      {
        title: 'English support',
        body: 'Many shops have English-speaking staff. Look for the "English OK" badge in our listings below.',
      },
      {
        title: 'Condition grading',
        body: 'Japanese shops grade condition strictly. "Near Mint" in Japan is often better than NM in Western markets.',
      },
      {
        title: 'Prices',
        body: 'Cards are priced individually in display cases. Prices are final — haggling is not common in Japanese card shops.',
      },
    ],
  },

  nipponbashi: {
    slug: 'nipponbashi',
    name_en: 'Nipponbashi',
    name_jp: '日本橋',
    city: 'Osaka',
    prefecture: 'Osaka',
    region_id: 'b1000000-0000-0000-0000-000000000001',
    center: { lat: 34.659, lng: 135.5055 },
    meta_title: 'Best Pokemon Card Shops in Nipponbashi, Osaka (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 20+ Pokemon card shops in Nipponbashi (Den Den Town), Osaka. Booster boxes, rare singles, graded cards, vintage packs & English cards. Tips for foreign visitors.',
    og_description:
      '20+ Pokemon card shops in Nipponbashi, Osaka. Den Den Town guide for collectors with maps, hours & English support info.',
    hero_subtitle: "Osaka's legendary Den Den Town — the Kansai collector's paradise",
    why_paragraphs: [
      "Nipponbashi (日本橋), often called \"Den Den Town,\" is Osaka's answer to Akihabara and the largest card shopping district in western Japan. Stretching along Sakai-suji street south of Namba, this vibrant area is packed with dedicated Pokemon card shops, retro game stores, and anime goods retailers.",
      "Den Den Town offers a more relaxed shopping experience than Akihabara, with generally lower prices and fewer crowds. Many shops here specialize in competitive singles and rare Japanese-exclusive cards that are harder to find even in Tokyo. The area is also famous for its excellent food — combine your card hunting with Osaka's legendary street food scene.",
    ],
    getting_there: [
      {
        line: 'Osaka Metro Sakaisuji Line',
        station: 'Ebisucho Station (Exit 1-A)',
        detail: 'The most convenient station, right in the heart of Den Den Town.',
      },
      {
        line: 'Osaka Metro Midosuji Line',
        station: 'Namba Station',
        detail: 'Walk east along Nansan-dori. About 10 minutes walk.',
      },
      {
        line: 'Nankai Railway',
        station: 'Namba Station',
        detail: 'Direct from Kansai Airport. About 45 minutes by Nankai Rapid.',
      },
      {
        line: 'From Kansai Airport',
        station: '',
        detail:
          'Take Nankai Rapid to Namba, then walk east or transfer to Sakaisuji Line. About 50 minutes total.',
      },
      {
        line: 'From Shin-Osaka',
        station: '',
        detail:
          'Take Midosuji Line south to Namba (about 15 minutes), then walk east.',
      },
    ],
    tips: [
      {
        title: 'Tax-free shopping',
        body: 'Major chain shops like Card Labo and Dragon Star offer tax-free for tourists. Bring your passport.',
      },
      {
        title: 'Payment',
        body: 'More shops accept credit cards than in Tokyo. IC cards (ICOCA/Suica) widely accepted at larger stores.',
      },
      {
        title: 'Best time to visit',
        body: 'Weekday afternoons are quietest. Avoid weekends if possible — Den Den Town gets very crowded.',
      },
      {
        title: 'Combine with food',
        body: "Dotonbori and Shinsekai are both walking distance. Plan lunch around your card shopping for the full Osaka experience.",
      },
      {
        title: 'Bargain hunting',
        body: 'Prices tend to be slightly lower than Akihabara. Check junk bins (ジャンク) for hidden gems at 10-50 yen each.',
      },
      {
        title: 'Opening hours',
        body: 'Most shops open at 11am-12pm and close around 8-9pm. Some smaller shops may close earlier on weekdays.',
      },
    ],
  },

  osu: {
    slug: 'osu',
    name_en: 'Osu',
    name_jp: '大須',
    city: 'Nagoya',
    prefecture: 'Aichi',
    region_id: 'c1000000-0000-0000-0000-000000000001',
    center: { lat: 35.1593, lng: 136.906 },
    meta_title: 'Best Pokemon Card Shops in Osu, Nagoya (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 15+ Pokemon card shops in Osu Shopping Street, Nagoya. Booster boxes, rare singles, graded cards & vintage packs. Tips for foreign visitors.',
    og_description:
      '15+ Pokemon card shops in Osu, Nagoya. Shopping street guide for collectors with maps, hours & tips.',
    hero_subtitle: "Nagoya's vibrant Osu Shopping Street — Central Japan's card collecting hub",
    why_paragraphs: [
      "Osu (大須) is Nagoya's most exciting shopping district and the heart of the city's card collecting scene. The covered Osu Shopping Street (大須商店街) stretches across multiple blocks near Osu Kannon Temple, mixing traditional shops with modern card stores, electronics retailers, and quirky boutiques.",
      "While smaller than Akihabara or Den Den Town, Osu offers a unique charm with its temple district atmosphere and tightly packed shopping arcades. Card shops here often carry inventory that has already sold out in Tokyo and Osaka, making it a worthwhile stop for serious collectors. Nagoya's central location between Tokyo and Osaka also makes it an easy day trip on the Shinkansen.",
    ],
    getting_there: [
      {
        line: 'Nagoya Subway Tsurumai Line',
        station: 'Kamimaezu Station (Exit 9)',
        detail: 'Closest station to Osu Shopping Street. 1 minute walk.',
      },
      {
        line: 'Nagoya Subway Meijo Line',
        station: 'Kamimaezu Station',
        detail: 'Transfer point from Sakae area.',
      },
      {
        line: 'Nagoya Subway Tsurumai Line',
        station: 'Osu Kannon Station (Exit 2)',
        detail: 'Alternative station, near Osu Kannon Temple. 3 minute walk to shops.',
      },
      {
        line: 'From Nagoya Station',
        station: '',
        detail:
          'Take the Higashiyama Line to Sakae, transfer to Meijo Line to Kamimaezu. About 15 minutes total.',
      },
      {
        line: 'From Chubu Centrair Airport',
        station: '',
        detail:
          'Take Meitetsu Limited Express to Nagoya Station (30 min), then subway as above. About 50 minutes total.',
      },
    ],
    tips: [
      {
        title: 'Tax-free shopping',
        body: 'Larger chain stores offer tax-free. Smaller independent shops may not, so ask before purchasing.',
      },
      {
        title: 'Payment',
        body: 'Cash preferred at smaller shops. Larger stores accept credit cards and IC cards (manaca/Suica).',
      },
      {
        title: 'Best time to visit',
        body: 'Weekday mornings are quietest. The shopping street gets lively on weekends with street performers and food stalls.',
      },
      {
        title: 'Covered arcades',
        body: 'Most of Osu Shopping Street is covered, making it a great rainy-day activity. Card shops are clustered in the eastern section.',
      },
      {
        title: 'Osu Kannon Temple',
        body: "Start your visit at Osu Kannon Temple, then walk through the shopping arcade. Monthly flea markets (18th and 28th) sometimes have vintage card sellers.",
      },
      {
        title: 'Day trip friendly',
        body: "Nagoya is 1h40m from Tokyo and 50min from Osaka by Shinkansen. Osu is easily doable as a day trip.",
      },
    ],
  },

  'tenjin-hakata': {
    slug: 'tenjin-hakata',
    name_en: 'Tenjin / Hakata',
    name_jp: '天神・博多',
    city: 'Fukuoka',
    prefecture: 'Fukuoka',
    region_id: 'f1000000-0000-0000-0000-000000000001',
    center: { lat: 33.592, lng: 130.399 },
    meta_title: 'Best Pokemon Card Shops in Tenjin & Hakata, Fukuoka (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 15+ Pokemon card shops in Tenjin and Hakata, Fukuoka. Booster boxes, rare singles, graded cards & vintage packs. Tips for foreign visitors.',
    og_description:
      "15+ Pokemon card shops in Fukuoka's Tenjin & Hakata. Collector's guide with maps, hours & English support info.",
    hero_subtitle: "Kyushu's gateway city — Fukuoka's growing card collecting scene",
    why_paragraphs: [
      "Tenjin (天神) and Hakata (博多) form the twin commercial hearts of Fukuoka, Japan's largest city in Kyushu. While smaller than Tokyo or Osaka's card districts, Fukuoka's card shop scene is rapidly growing and offers a unique advantage: proximity to international flights from across Asia, making it a popular first stop for collectors from Korea, Taiwan, and Southeast Asia.",
      "Card shops in Fukuoka are concentrated in the Tenjin underground shopping area and around Hakata Station. The city is famous for its incredibly convenient airport (just 5 minutes by subway to Hakata Station), excellent ramen, and friendly atmosphere. Card hunters will find competitive prices and occasionally unique regional inventory not available elsewhere.",
    ],
    getting_there: [
      {
        line: 'Fukuoka City Subway Kuko Line',
        station: 'Tenjin Station',
        detail: 'Central Tenjin area. Directly connected to Tenjin Underground City shopping mall.',
      },
      {
        line: 'Fukuoka City Subway Kuko Line',
        station: 'Hakata Station',
        detail: 'JR Shinkansen terminal. Major shopping area with card shops nearby.',
      },
      {
        line: 'From Fukuoka Airport',
        station: '',
        detail:
          'Take the subway from Fukuoka Airport Station to Tenjin (11 min) or Hakata (5 min). One of Japan\'s most convenient airports.',
      },
      {
        line: 'From Osaka/Tokyo',
        station: '',
        detail:
          'Shinkansen to Hakata Station: ~2h15m from Osaka, ~5h from Tokyo. Or fly — many domestic flights available.',
      },
    ],
    tips: [
      {
        title: 'Tax-free shopping',
        body: 'Most shops in Tenjin and Canal City offer tax-free purchases for tourists with passport.',
      },
      {
        title: 'Payment',
        body: 'Credit cards widely accepted in Tenjin area. Smaller shops near Hakata may prefer cash.',
      },
      {
        title: 'Best time to visit',
        body: 'Weekday afternoons are best. The Tenjin area is busiest on weekends and during lunch hours.',
      },
      {
        title: 'Airport convenience',
        body: "Fukuoka Airport is just 5 minutes from Hakata by subway. You can card shop right up until your flight — perfect for last-minute finds.",
      },
      {
        title: 'Korean visitors',
        body: 'Many shops have Korean-speaking staff due to high Korean tourist traffic. Some shops display prices in Korean won.',
      },
      {
        title: 'Canal City',
        body: 'Canal City Hakata mall has several card/hobby shops and is walking distance from Hakata Station. Good for combining card shopping with general sightseeing.',
      },
    ],
  },
};

export const ALL_REGION_SLUGS = Object.keys(REGION_CONFIGS);

export function getRegionConfig(slug: string): RegionConfig | undefined {
  return REGION_CONFIGS[slug];
}
