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

  ikebukuro: {
    slug: 'ikebukuro',
    name_en: 'Ikebukuro',
    name_jp: '池袋',
    city: 'Tokyo',
    prefecture: 'Tokyo',
    region_id: 'd1000000-0000-0000-0000-000000000001',
    center: { lat: 35.7295, lng: 139.7189 },
    meta_title: 'Best Pokemon Card Shops in Ikebukuro, Tokyo (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 12+ Pokemon card shops in Ikebukuro, Tokyo. Booster boxes, rare singles, graded cards & vintage packs. Tips for foreign visitors.',
    og_description:
      '12+ Pokemon card shops in Ikebukuro, Tokyo. Collector guide with maps, hours & English support info.',
    hero_subtitle: "Tokyo's second otaku district — a growing hub for card collectors",
    why_paragraphs: [
      "Ikebukuro (池袋) is Tokyo's second-largest otaku district after Akihabara, centered around the massive Sunshine City complex and the streets radiating from Ikebukuro Station's east exit. The area has seen rapid growth in card shops, with many major chains opening locations to serve the area's large concentration of anime and gaming fans.",
      "While Akihabara remains the king of card shopping, Ikebukuro offers a less crowded alternative with excellent inventory. The area around Otome Road and Sunshine 60-dori is packed with hobby shops, and several dedicated card stores offer competitive singles pricing. Ikebukuro Station is one of Tokyo's busiest, making it easy to reach from anywhere in the city.",
    ],
    getting_there: [
      { line: 'JR Yamanote Line', station: 'Ikebukuro Station (East exit)', detail: 'Main loop line. Card shops are concentrated on the east side.' },
      { line: 'Tokyo Metro Marunouchi Line', station: 'Ikebukuro Station', detail: 'Direct from Tokyo Station and Shinjuku.' },
      { line: 'Tokyo Metro Yurakucho Line', station: 'Ikebukuro Station', detail: 'Direct from Ginza and Tsukishima.' },
      { line: 'Seibu Ikebukuro Line', station: 'Ikebukuro Station', detail: 'From Saitama suburbs.' },
    ],
    tips: [
      { title: 'Sunshine City', body: 'Several card shops are inside or near Sunshine City complex. Check upper floors for specialty stores.' },
      { title: 'Payment', body: 'Most shops accept credit cards and IC cards. Some smaller stores in side streets are cash-only.' },
      { title: 'Best time', body: 'Weekday mornings are quietest. Avoid weekends when Sunshine City area gets very crowded.' },
      { title: 'Combine with Akihabara', body: 'JR Yamanote Line connects Ikebukuro to Akihabara in about 20 minutes. Easy to visit both in one day.' },
    ],
  },

  shibuya: {
    slug: 'shibuya',
    name_en: 'Shibuya',
    name_jp: '渋谷',
    city: 'Tokyo',
    prefecture: 'Tokyo',
    region_id: 'd3000000-0000-0000-0000-000000000001',
    center: { lat: 35.6621, lng: 139.698 },
    meta_title: 'Best Pokemon Card Shops in Shibuya, Tokyo (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 10+ Pokemon card shops in Shibuya, Tokyo. Booster boxes, rare singles, graded cards & vintage packs. Tips for foreign visitors.',
    og_description:
      '10+ Pokemon card shops in Shibuya, Tokyo. Collector guide with maps, hours & English support info.',
    hero_subtitle: "Tokyo's trendiest district — card shops mixed with fashion and culture",
    why_paragraphs: [
      "Shibuya (渋谷) is one of Tokyo's most iconic neighborhoods, famous for its scramble crossing, Hachiko statue, and vibrant youth culture. Card shops here cater to a younger, trend-conscious clientele, often mixing Pokemon cards with other TCGs and pop culture collectibles.",
      "While not as densely packed with card shops as Akihabara, Shibuya offers a unique shopping experience with stores spread across the area's many department stores and side streets. The recently redeveloped Shibuya Station area includes several new hobby shops, and the surrounding streets of Udagawacho and Center-gai hide some excellent finds.",
    ],
    getting_there: [
      { line: 'JR Yamanote Line', station: 'Shibuya Station (Hachiko exit)', detail: 'Main loop line. Most card shops are on the west/northwest side.' },
      { line: 'Tokyo Metro Ginza Line', station: 'Shibuya Station', detail: 'Direct from Asakusa and Ueno.' },
      { line: 'Tokyo Metro Hanzomon Line', station: 'Shibuya Station', detail: 'Direct from Oshiage (Skytree) area.' },
      { line: 'Tokyu Toyoko Line', station: 'Shibuya Station', detail: 'Direct from Yokohama. About 30 minutes.' },
    ],
    tips: [
      { title: 'Payment', body: 'Card payments widely accepted in Shibuya. Most shops take credit cards and IC cards.' },
      { title: 'Best time', body: 'Weekday mornings are best. Shibuya is extremely crowded on weekends and evenings.' },
      { title: 'Combine areas', body: 'Harajuku is one station away on the Yamanote Line. Some collectors visit both in one trip.' },
      { title: 'Department stores', body: 'Check Shibuya PARCO and Shibuya 109 for hobby floors with card sections.' },
    ],
  },

  shinjuku: {
    slug: 'shinjuku',
    name_en: 'Shinjuku',
    name_jp: '新宿',
    city: 'Tokyo',
    prefecture: 'Tokyo',
    region_id: 'd2000000-0000-0000-0000-000000000001',
    center: { lat: 35.6907, lng: 139.7002 },
    meta_title: 'Best Pokemon Card Shops in Shinjuku, Tokyo (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 8+ Pokemon card shops in Shinjuku, Tokyo. Booster boxes, rare singles, graded cards & vintage packs. Tips for foreign visitors.',
    og_description:
      '8+ Pokemon card shops in Shinjuku, Tokyo. Collector guide with maps, hours & English support info.',
    hero_subtitle: "Tokyo's busiest station area — convenient card shopping for travelers",
    why_paragraphs: [
      "Shinjuku (新宿) is home to the world's busiest train station and one of Tokyo's major commercial hubs. Card shops here benefit from the massive foot traffic and are scattered around both the east and west sides of the station. The Kabukicho and Nishi-Shinjuku areas have several dedicated card stores.",
      "For travelers, Shinjuku is incredibly convenient — it's a major Shinkansen and express train hub, and many hotels are located nearby. Card shops in Shinjuku tend to carry mainstream inventory with good availability of new releases and popular singles. The area is also a great option for evening card shopping, as many stores stay open late.",
    ],
    getting_there: [
      { line: 'JR Yamanote Line', station: 'Shinjuku Station', detail: 'Main loop line. Use East exit for most card shops.' },
      { line: 'Tokyo Metro Marunouchi Line', station: 'Shinjuku Station', detail: 'Direct from Tokyo Station.' },
      { line: 'Odakyu Line', station: 'Shinjuku Station', detail: 'From Hakone and Machida.' },
      { line: 'Keio Line', station: 'Shinjuku Station', detail: 'From western Tokyo suburbs.' },
    ],
    tips: [
      { title: 'Late shopping', body: 'Several card shops in Shinjuku stay open until 9-10pm, perfect for evening browsing.' },
      { title: 'Payment', body: 'All major credit cards and IC cards accepted at most shops.' },
      { title: 'Navigation', body: 'Shinjuku Station is enormous. Use Google Maps to navigate to specific exits — getting lost is common even for locals.' },
      { title: 'Kabukicho', body: 'Some card shops are in the Kabukicho entertainment district. Area is safe but lively at night.' },
    ],
  },

  nakano: {
    slug: 'nakano',
    name_en: 'Nakano',
    name_jp: '中野',
    city: 'Tokyo',
    prefecture: 'Tokyo',
    region_id: 'd4000000-0000-0000-0000-000000000001',
    center: { lat: 35.7078, lng: 139.6655 },
    meta_title: 'Best Pokemon Card Shops in Nakano, Tokyo (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 8+ Pokemon card shops in Nakano, Tokyo. Nakano Broadway guide for Pokemon card collectors with vintage finds and rare singles.',
    og_description:
      '8+ Pokemon card shops in Nakano Broadway, Tokyo. Vintage cards, rare finds & collector guide.',
    hero_subtitle: "Nakano Broadway — Tokyo's hidden gem for serious card collectors",
    why_paragraphs: [
      "Nakano (中野) is famous for Nakano Broadway, a multi-story shopping complex that's become a pilgrimage site for collectors of all kinds. While smaller than Akihabara, Nakano Broadway packs an incredible density of card shops into its narrow corridors, with many specializing in vintage and rare cards.",
      "The complex is particularly known for its vintage card selection and competitive pricing. Serious collectors often prefer Nakano over Akihabara for finding older cards and unique items at fair prices. The intimate shop-in-shop format means you can browse dozens of dealers in a single building.",
    ],
    getting_there: [
      { line: 'JR Chuo Line (Rapid)', station: 'Nakano Station (North exit)', detail: 'Direct from Shinjuku (5 min) and Tokyo Station (20 min).' },
      { line: 'Tokyo Metro Tozai Line', station: 'Nakano Station', detail: 'Direct from Nihonbashi and Otemachi.' },
    ],
    tips: [
      { title: 'Nakano Broadway', body: 'Most card shops are on floors 2-4 of Nakano Broadway. Take the covered shopping street from the station north exit.' },
      { title: 'Vintage specialist', body: 'This area is best for vintage and rare cards. For new releases, Akihabara has better selection.' },
      { title: 'Cash recommended', body: 'Many small shops in Nakano Broadway are cash-only. Bring sufficient yen.' },
      { title: 'From Shinjuku', body: 'Only 5 minutes by JR Chuo Rapid from Shinjuku. Easy to combine both areas in one trip.' },
    ],
  },

  yokohama: {
    slug: 'yokohama',
    name_en: 'Yokohama',
    name_jp: '横浜',
    city: 'Yokohama',
    prefecture: 'Kanagawa',
    region_id: 'e1000000-0000-0000-0000-000000000001',
    center: { lat: 35.4662, lng: 139.6221 },
    meta_title: 'Best Pokemon Card Shops in Yokohama, Kanagawa (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 8+ Pokemon card shops in Yokohama. Booster boxes, rare singles, graded cards & more near Yokohama Station. Tips for foreign visitors.',
    og_description:
      '8+ Pokemon card shops in Yokohama. Collector guide with maps, hours & tips.',
    hero_subtitle: "Japan's second-largest city — great card shops just 30 minutes from Tokyo",
    why_paragraphs: [
      "Yokohama (横浜) is Japan's second-largest city and home to a thriving card shop scene centered around Yokohama Station. As the city that hosts the annual Pokemon World Championships venue and the famous Pikachu Outbreak event, Yokohama has deep connections to the Pokemon community.",
      "Card shops are concentrated around Yokohama Station's west side and in nearby shopping districts. Prices can be slightly lower than central Tokyo, and the shops here tend to be less crowded. Yokohama is easily accessible from Tokyo, making it a great day trip for card collectors.",
    ],
    getting_there: [
      { line: 'JR Tokaido Line', station: 'Yokohama Station', detail: 'About 25 minutes from Tokyo Station.' },
      { line: 'Tokyu Toyoko Line', station: 'Yokohama Station', detail: 'Direct from Shibuya (about 30 minutes).' },
      { line: 'Keikyu Line', station: 'Yokohama Station', detail: 'Direct from Haneda Airport (about 25 minutes).' },
    ],
    tips: [
      { title: 'Pikachu city', body: 'Yokohama hosts the annual Pikachu Outbreak event every August. Card shops often have special inventory during this period.' },
      { title: 'Payment', body: 'Most shops accept credit cards and IC cards (Suica/Pasmo).' },
      { title: 'Combine with sightseeing', body: 'Yokohama Chinatown and Minato Mirai are nearby. Great for a full day out.' },
    ],
  },

  omiya: {
    slug: 'omiya',
    name_en: 'Omiya',
    name_jp: '大宮',
    city: 'Saitama',
    prefecture: 'Saitama',
    region_id: 'e2000000-0000-0000-0000-000000000001',
    center: { lat: 35.903, lng: 139.629 },
    meta_title: 'Best Pokemon Card Shops in Omiya, Saitama (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 7+ Pokemon card shops in Omiya, Saitama. Booster boxes, rare singles & more near Omiya Station. Tips for collectors.',
    og_description:
      '7+ Pokemon card shops in Omiya, Saitama. Collector guide with maps & tips.',
    hero_subtitle: "Saitama's main hub — card shopping north of Tokyo",
    why_paragraphs: [
      "Omiya (大宮) is the commercial center of Saitama City and a major transportation hub north of Tokyo. The area around Omiya Station has developed a solid card shop scene, with several major chains and independent stores catering to the large residential population.",
      "For collectors staying in or passing through Saitama, Omiya offers good card shop options without the crowds of central Tokyo. The station is a Shinkansen stop, making it accessible from across Japan.",
    ],
    getting_there: [
      { line: 'JR Takasaki/Utsunomiya Line', station: 'Omiya Station', detail: 'About 30 minutes from Ueno/Tokyo.' },
      { line: 'JR Keihin-Tohoku Line', station: 'Omiya Station', detail: 'Direct from Akihabara (about 35 minutes).' },
      { line: 'Tobu Urban Park Line', station: 'Omiya Station', detail: 'From eastern Saitama suburbs.' },
    ],
    tips: [
      { title: 'Less crowded', body: 'Omiya shops are generally less crowded than Tokyo, especially on weekdays.' },
      { title: 'Payment', body: 'Major credit cards accepted at chain stores. Bring cash for smaller shops.' },
      { title: 'Railway Museum', body: 'The Railway Museum is nearby — combine card shopping with sightseeing.' },
    ],
  },

  chiba: {
    slug: 'chiba',
    name_en: 'Chiba',
    name_jp: '千葉',
    city: 'Chiba',
    prefecture: 'Chiba',
    region_id: 'e3000000-0000-0000-0000-000000000001',
    center: { lat: 35.6107, lng: 140.1137 },
    meta_title: 'Best Pokemon Card Shops in Chiba (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 7+ Pokemon card shops in Chiba Station area. Booster boxes, rare singles & more. Tips for collectors.',
    og_description:
      '7+ Pokemon card shops in Chiba. Collector guide with maps & tips.',
    hero_subtitle: "Chiba's card shopping district — east of Tokyo with solid selection",
    why_paragraphs: [
      "Chiba (千葉) is the capital of Chiba Prefecture and a major city east of Tokyo. The area around Chiba Station has several card shops offering good inventory at prices that can be more competitive than central Tokyo.",
      "For visitors staying near Narita Airport or Tokyo Disneyland, Chiba's card shops offer a convenient shopping option. The city is well-connected by JR lines and is about 40 minutes from Tokyo Station.",
    ],
    getting_there: [
      { line: 'JR Sobu Line (Rapid)', station: 'Chiba Station', detail: 'About 40 minutes from Tokyo Station.' },
      { line: 'JR Keiyo Line', station: 'Chiba-Minato Station', detail: 'Alternative access from Tokyo/Maihama area.' },
      { line: 'From Narita Airport', station: '', detail: 'JR Narita Express or Keisei Line. About 45 minutes.' },
    ],
    tips: [
      { title: 'Narita connection', body: 'If you have a long layover at Narita, Chiba is reachable in about 45 minutes for a quick card shop visit.' },
      { title: 'Payment', body: 'Most shops accept credit cards. Bring cash as backup for smaller stores.' },
    ],
  },

  machida: {
    slug: 'machida',
    name_en: 'Machida',
    name_jp: '町田',
    city: 'Machida',
    prefecture: 'Tokyo',
    region_id: 'e4000000-0000-0000-0000-000000000001',
    center: { lat: 35.5424, lng: 139.4455 },
    meta_title: 'Best Pokemon Card Shops in Machida, Tokyo (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 6+ Pokemon card shops in Machida. Booster boxes, rare singles & more. Tips for collectors.',
    og_description:
      '6+ Pokemon card shops in Machida, Tokyo. Collector guide with maps & tips.',
    hero_subtitle: "Southwest Tokyo's busy shopping town — card shops near the station",
    why_paragraphs: [
      "Machida (町田) is a bustling commercial hub in southwestern Tokyo, straddling the border with Kanagawa Prefecture. The area around Machida Station is packed with shops, restaurants, and entertainment, including several card shops.",
      "For collectors in the western Tokyo and northern Kanagawa area, Machida offers convenient card shopping without traveling to central Tokyo. The station is served by both JR and Odakyu lines.",
    ],
    getting_there: [
      { line: 'JR Yokohama Line', station: 'Machida Station', detail: 'From Yokohama (about 30 min) or Hachioji.' },
      { line: 'Odakyu Line', station: 'Machida Station', detail: 'From Shinjuku (about 35 min express).' },
    ],
    tips: [
      { title: 'Two stations', body: 'JR Machida and Odakyu Machida stations are a few minutes walk apart. Card shops are between them.' },
      { title: 'Payment', body: 'Major credit cards accepted at most shops.' },
    ],
  },

  tachikawa: {
    slug: 'tachikawa',
    name_en: 'Tachikawa',
    name_jp: '立川',
    city: 'Tachikawa',
    prefecture: 'Tokyo',
    region_id: 'e5000000-0000-0000-0000-000000000001',
    center: { lat: 35.6971, lng: 139.4133 },
    meta_title: 'Best Pokemon Card Shops in Tachikawa, Tokyo (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 7+ Pokemon card shops in Tachikawa. Booster boxes, rare singles & more. Tips for collectors.',
    og_description:
      '7+ Pokemon card shops in Tachikawa, Tokyo. Collector guide with maps & tips.',
    hero_subtitle: "Western Tokyo's commercial center — card shops in the Tama area",
    why_paragraphs: [
      "Tachikawa (立川) is the commercial heart of western Tokyo's Tama area, with a well-developed shopping district around the station. Several major card shop chains have locations here, serving the large residential population of western Tokyo.",
      "The area has grown rapidly and offers a suburban alternative to the crowded card shops of central Tokyo. Tachikawa Station is a major JR hub with easy access from central Tokyo via the Chuo Line.",
    ],
    getting_there: [
      { line: 'JR Chuo Line (Rapid)', station: 'Tachikawa Station', detail: 'About 40 minutes from Shinjuku.' },
      { line: 'JR Nambu Line', station: 'Tachikawa Station', detail: 'From Kawasaki and southern Tama area.' },
      { line: 'Tama Monorail', station: 'Tachikawa-Kita Station', detail: 'From Tama Center and surrounding areas.' },
    ],
    tips: [
      { title: 'IKEA/LaLaport', body: 'The area has major shopping malls. Combine card shopping with general retail.' },
      { title: 'Payment', body: 'Credit cards and IC cards accepted at most shops.' },
    ],
  },

  kyoto: {
    slug: 'kyoto',
    name_en: 'Teramachi / Kawaramachi',
    name_jp: '寺町・河原町',
    city: 'Kyoto',
    prefecture: 'Kyoto',
    region_id: 'aa000000-0000-0000-0000-000000000001',
    center: { lat: 35.0035, lng: 135.7685 },
    meta_title: 'Best Pokemon Card Shops in Kyoto (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 11+ Pokemon card shops in Kyoto. Teramachi and Kawaramachi area. Booster boxes, rare singles, graded cards. Tips for foreign visitors.',
    og_description:
      '11+ Pokemon card shops in Kyoto. Teramachi & Kawaramachi area guide for collectors.',
    hero_subtitle: "Japan's ancient capital — card shops along Teramachi and Kawaramachi",
    why_paragraphs: [
      "Kyoto (京都) may be famous for its temples and traditional culture, but the city also has a thriving card shop scene centered along Teramachi Street and Kawaramachi-dori. These covered shopping arcades in central Kyoto house several dedicated card stores alongside traditional shops and modern retailers.",
      "For tourists visiting Kyoto's famous temples and shrines, the Teramachi/Kawaramachi area offers a perfect pit stop for card hunting. The area is walkable from Kyoto Station and right in the heart of the city's shopping district. Prices can be very competitive compared to Tokyo.",
    ],
    getting_there: [
      { line: 'Hankyu Kyoto Line', station: 'Kawaramachi Station', detail: 'Right in the shopping district. Direct from Osaka-Umeda (about 45 min).' },
      { line: 'Keihan Line', station: 'Gion-Shijo Station', detail: 'Walk west across Shijo Bridge to Kawaramachi.' },
      { line: 'Kyoto City Bus', station: 'Shijo-Kawaramachi', detail: 'Bus 4, 5, 17, 205 from Kyoto Station (about 15 min).' },
      { line: 'From Kyoto Station', station: '', detail: 'Take the subway Karasuma Line to Shijo, then walk east (10 min). Or bus directly.' },
    ],
    tips: [
      { title: 'Covered arcades', body: 'Teramachi and Shinkyogoku are covered shopping streets. Great for rainy day card hunting between temple visits.' },
      { title: 'Payment', body: 'Larger shops accept credit cards. Smaller stores may be cash-only.' },
      { title: 'Combine with sightseeing', body: 'Nishiki Market, Gion, and Kiyomizudera are all walkable from the card shop area.' },
      { title: 'Day trip from Osaka', body: 'Only 15 minutes from Osaka by Shinkansen, or 45 min by Hankyu Line. Easy day trip.' },
    ],
  },

  kobe: {
    slug: 'kobe',
    name_en: 'Sannomiya',
    name_jp: '三宮',
    city: 'Kobe',
    prefecture: 'Hyogo',
    region_id: 'ab000000-0000-0000-0000-000000000001',
    center: { lat: 35.1915, lng: 135.1905 },
    meta_title: 'Best Pokemon Card Shops in Kobe / Sannomiya (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 10+ Pokemon card shops in Kobe Sannomiya area. Booster boxes, rare singles, graded cards. Tips for foreign visitors.',
    og_description:
      '10+ Pokemon card shops in Kobe Sannomiya. Collector guide with maps & tips.',
    hero_subtitle: "Kobe's central district — card shops in the heart of Sannomiya",
    why_paragraphs: [
      "Sannomiya (三宮) is the vibrant commercial heart of Kobe, with card shops scattered around the main station area and nearby shopping arcades. Kobe's international port city character means many shops are used to serving foreign customers.",
      "The card shop scene in Kobe is compact and walkable, making it easy to visit multiple stores in one trip. Combined with Kobe's famous beef, harbor views, and Chinatown, it makes for an excellent card-shopping day trip from Osaka.",
    ],
    getting_there: [
      { line: 'JR Tokaido-Sanyo Line', station: 'Sannomiya Station', detail: 'About 20 minutes from Osaka Station.' },
      { line: 'Hankyu Kobe Line', station: 'Kobe-Sannomiya Station', detail: 'Direct from Osaka-Umeda (about 30 min).' },
      { line: 'Hanshin Line', station: 'Kobe-Sannomiya Station', detail: 'Direct from Osaka-Namba area.' },
      { line: 'From Kansai Airport', station: '', detail: 'Take JR Haruka to Shin-Osaka, then JR to Sannomiya. About 90 minutes total.' },
    ],
    tips: [
      { title: 'Compact area', body: 'All shops are within 10-15 minute walk of Sannomiya Station. Easy to cover in half a day.' },
      { title: 'Payment', body: 'Credit cards accepted at most shops. IC cards (ICOCA) also widely accepted.' },
      { title: 'Kobe beef reward', body: 'Reward yourself after card shopping with famous Kobe beef. Many restaurants near the station.' },
    ],
  },

  sapporo: {
    slug: 'sapporo',
    name_en: 'Sapporo',
    name_jp: '札幌',
    city: 'Sapporo',
    prefecture: 'Hokkaido',
    region_id: 'ac000000-0000-0000-0000-000000000001',
    center: { lat: 43.0563, lng: 141.3507 },
    meta_title: 'Best Pokemon Card Shops in Sapporo, Hokkaido (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 11+ Pokemon card shops in Sapporo. Tanukikoji and Susukino area. Booster boxes, rare singles, graded cards. Tips for foreign visitors.',
    og_description:
      '11+ Pokemon card shops in Sapporo, Hokkaido. Tanukikoji & Susukino area guide.',
    hero_subtitle: "Hokkaido's capital — card shopping along Tanukikoji and Susukino",
    why_paragraphs: [
      "Sapporo (札幌), the capital of Hokkaido, is Japan's northernmost major city and home to a growing card shop scene. Shops are concentrated along the historic Tanukikoji covered shopping arcade and in the Susukino entertainment district, both easily accessible from Sapporo Station.",
      "Sapporo's card shops benefit from less competition than Tokyo, and stock can sometimes include regional exclusives or cards that have sold out elsewhere. The city is a popular tourist destination for its beer, ramen, and snow festivals, making card shopping a perfect complement to your Hokkaido trip.",
    ],
    getting_there: [
      { line: 'Sapporo Subway Namboku Line', station: 'Odori Station / Susukino Station', detail: 'Central area, close to Tanukikoji arcade.' },
      { line: 'Sapporo Subway Tozai Line', station: 'Odori Station', detail: 'Cross-city line connecting east and west.' },
      { line: 'From New Chitose Airport', station: '', detail: 'JR Rapid Airport to Sapporo Station (about 37 minutes).' },
    ],
    tips: [
      { title: 'Tanukikoji arcade', body: 'The covered Tanukikoji arcade stretches 7 blocks. Card shops are mostly in blocks 3-5. Great for rainy/snowy days.' },
      { title: 'Winter shopping', body: 'Sapporo gets heavy snow November-March. The underground walkways connect the subway to many shops.' },
      { title: 'Payment', body: 'Most shops accept credit cards. IC cards (Kitaca/Suica) also work.' },
      { title: 'Ramen reward', body: 'Sapporo is famous for miso ramen. Ramen Alley in Susukino is perfect for post-shopping meals.' },
    ],
  },

  sendai: {
    slug: 'sendai',
    name_en: 'Sendai',
    name_jp: '仙台',
    city: 'Sendai',
    prefecture: 'Miyagi',
    region_id: 'ad000000-0000-0000-0000-000000000001',
    center: { lat: 38.2603, lng: 140.8822 },
    meta_title: 'Best Pokemon Card Shops in Sendai, Miyagi (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 11+ Pokemon card shops in Sendai Station area. Booster boxes, rare singles, graded cards. Tips for foreign visitors.',
    og_description:
      '11+ Pokemon card shops in Sendai, Miyagi. Station area guide for collectors.',
    hero_subtitle: "Tohoku's largest city — card shops around Sendai Station",
    why_paragraphs: [
      "Sendai (仙台), known as the \"City of Trees,\" is the largest city in the Tohoku region and a major Shinkansen stop between Tokyo and northern Japan. Card shops are concentrated around Sendai Station and the nearby Ichibancho shopping arcade.",
      "For travelers heading to northern Japan, Sendai is a convenient stop for card shopping. The city offers a good selection of shops with competitive pricing, and is famous for its gyutan (beef tongue) cuisine and the beautiful Matsushima Bay nearby.",
    ],
    getting_there: [
      { line: 'Tohoku Shinkansen', station: 'Sendai Station', detail: 'About 90 minutes from Tokyo Station by Hayabusa.' },
      { line: 'Sendai Subway Namboku Line', station: 'Sendai Station', detail: 'City subway connecting north and south.' },
      { line: 'From Sendai Airport', station: '', detail: 'Sendai Airport Access Line to Sendai Station (about 25 minutes).' },
    ],
    tips: [
      { title: 'Ichibancho', body: 'The Ichibancho covered shopping arcade near the station has several card shops. Good for rainy day shopping.' },
      { title: 'Payment', body: 'Major credit cards accepted at chain stores. Bring cash for independent shops.' },
      { title: 'Gyutan', body: 'Try Sendai\'s famous beef tongue after card shopping. Many restaurants around the station.' },
      { title: 'Shinkansen stop', body: 'Easy to visit as a stop between Tokyo and Hokkaido on the Shinkansen.' },
    ],
  },

  niigata: {
    slug: 'niigata',
    name_en: 'Niigata',
    name_jp: '新潟',
    city: 'Niigata',
    prefecture: 'Niigata',
    region_id: 'bc000000-0000-0000-0000-000000000001',
    center: { lat: 37.9128, lng: 139.0598 },
    meta_title: 'Best Pokemon Card Shops in Niigata (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 6+ Pokemon card shops in Niigata Station area. Booster boxes, rare singles & more. Tips for collectors.',
    og_description:
      '6+ Pokemon card shops in Niigata. Station area guide for collectors.',
    hero_subtitle: "Japan Sea coast city — card shops in the rice country capital",
    why_paragraphs: [
      "Niigata (新潟) is the largest city on Japan's Sea of Japan coast and the gateway to Sado Island. The card shop scene here is small but growing, with shops concentrated around Niigata Station and the Bandai area.",
      "For travelers visiting Niigata for its famous rice, sake, and ski resorts, the local card shops offer a chance to find cards at non-Tokyo prices. The city is about 2 hours from Tokyo by Joetsu Shinkansen.",
    ],
    getting_there: [
      { line: 'Joetsu Shinkansen', station: 'Niigata Station', detail: 'About 2 hours from Tokyo Station.' },
      { line: 'From Niigata Airport', station: '', detail: 'Airport limousine bus to Niigata Station (about 25 minutes).' },
    ],
    tips: [
      { title: 'Payment', body: 'Major credit cards accepted at chain stores. Smaller shops may prefer cash.' },
      { title: 'Sake & cards', body: 'Niigata is Japan\'s top sake region. Combine card shopping with sake tasting at Ponshukan in the station.' },
    ],
  },

  kanazawa: {
    slug: 'kanazawa',
    name_en: 'Kanazawa',
    name_jp: '金沢',
    city: 'Kanazawa',
    prefecture: 'Ishikawa',
    region_id: 'bd000000-0000-0000-0000-000000000001',
    center: { lat: 36.5782, lng: 136.6477 },
    meta_title: 'Best Pokemon Card Shops in Kanazawa (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 5+ Pokemon card shops in Kanazawa. Booster boxes, rare singles & more. Tips for collectors.',
    og_description:
      '5+ Pokemon card shops in Kanazawa. Collector guide with maps & tips.',
    hero_subtitle: "Historic castle town — card shops in the Hokuriku region",
    why_paragraphs: [
      "Kanazawa (金沢) is a beautiful historic city famous for Kenrokuen Garden and its well-preserved samurai districts. While the card shop scene is small, there are several dedicated stores near the station and in the city center.",
      "For travelers on the Hokuriku Shinkansen route between Tokyo and Osaka/Kyoto, Kanazawa offers a pleasant stop with the opportunity to pick up some cards. The city's compact center makes it easy to combine sightseeing with card shopping.",
    ],
    getting_there: [
      { line: 'Hokuriku Shinkansen', station: 'Kanazawa Station', detail: 'About 2.5 hours from Tokyo, 2 hours from Osaka (via Tsuruga).' },
      { line: 'From Komatsu Airport', station: '', detail: 'Airport bus to Kanazawa Station (about 40 minutes).' },
    ],
    tips: [
      { title: 'Compact city', body: 'Kanazawa\'s card shops are within bus or walking distance from the station.' },
      { title: 'Payment', body: 'Bring cash — smaller shops may not accept cards.' },
      { title: 'Sightseeing combo', body: 'Kenrokuen Garden, Kanazawa Castle, and the 21st Century Museum are all nearby.' },
    ],
  },

  kumamoto: {
    slug: 'kumamoto',
    name_en: 'Kumamoto',
    name_jp: '熊本',
    city: 'Kumamoto',
    prefecture: 'Kumamoto',
    region_id: 'ba000000-0000-0000-0000-000000000001',
    center: { lat: 32.79, lng: 130.709 },
    meta_title: 'Best Pokemon Card Shops in Kumamoto (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 6+ Pokemon card shops in Kumamoto. Booster boxes, rare singles & more. Tips for collectors visiting Kyushu.',
    og_description:
      '6+ Pokemon card shops in Kumamoto. Kyushu collector guide with maps & tips.',
    hero_subtitle: "Kyushu's castle city — card shops in central Kumamoto",
    why_paragraphs: [
      "Kumamoto (熊本) is a vibrant city in central Kyushu, famous for its magnificent castle and mascot Kumamon. The card shop scene is centered around the Kamitori and Shimotori covered shopping arcades in the city center.",
      "For travelers exploring Kyushu, Kumamoto offers a nice selection of card shops at fair prices. The city is easily accessible by Shinkansen from Fukuoka (about 40 minutes) and makes a great stop on a Kyushu road trip.",
    ],
    getting_there: [
      { line: 'Kyushu Shinkansen', station: 'Kumamoto Station', detail: 'About 40 minutes from Hakata (Fukuoka).' },
      { line: 'Kumamoto City Tram', station: 'Torichosuji / Suidocho', detail: 'Tram from station to shopping arcades (about 15 min).' },
      { line: 'From Aso Kumamoto Airport', station: '', detail: 'Airport bus to Kumamoto Station (about 50 minutes).' },
    ],
    tips: [
      { title: 'Shopping arcades', body: 'Kamitori and Shimotori arcades are covered — perfect for rainy Kyushu weather.' },
      { title: 'Payment', body: 'Major credit cards accepted at chain stores. Cash recommended for smaller shops.' },
      { title: 'Castle visit', body: 'Kumamoto Castle is being restored after the 2016 earthquake. Combine castle viewing with card shopping.' },
    ],
  },

  naha: {
    slug: 'naha',
    name_en: 'Naha',
    name_jp: '那覇',
    city: 'Naha',
    prefecture: 'Okinawa',
    region_id: 'bb000000-0000-0000-0000-000000000001',
    center: { lat: 26.2257, lng: 127.6945 },
    meta_title: 'Best Pokemon Card Shops in Naha, Okinawa (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 6+ Pokemon card shops in Naha, Okinawa. Booster boxes, rare singles & more. Tips for foreign visitors.',
    og_description:
      '6+ Pokemon card shops in Naha, Okinawa. Tropical card shopping guide.',
    hero_subtitle: "Japan's tropical paradise — card shops in Okinawa's capital",
    why_paragraphs: [
      "Naha (那覇), the capital of Okinawa Prefecture, is Japan's southernmost major city and a popular tropical vacation destination. While small, the card shop scene is growing, with shops along Kokusai-dori (International Street) and in nearby shopping centers.",
      "For visitors on an Okinawa beach vacation, card shopping in Naha offers a unique tropical twist. The city has direct flights from many Asian cities, and Kokusai-dori is a must-visit shopping street regardless. Card prices can be surprisingly competitive due to lower overhead costs.",
    ],
    getting_there: [
      { line: 'Okinawa Monorail (Yui Rail)', station: 'Makishi Station / Kencho-mae Station', detail: 'Both stations are near Kokusai-dori.' },
      { line: 'From Naha Airport', station: '', detail: 'Yui Rail from Naha Airport to Makishi (about 15 minutes).' },
    ],
    tips: [
      { title: 'Kokusai-dori', body: 'International Street is the main tourist area. Some card shops are on side streets off this main road.' },
      { title: 'Payment', body: 'Tourist-area shops generally accept credit cards. Smaller shops may be cash-only.' },
      { title: 'Heat warning', body: 'Okinawa is hot and humid most of the year. Card shops make great air-conditioned refuges.' },
      { title: 'US military base area', body: 'Some shops near military bases carry English Pokemon cards and American TCGs.' },
    ],
  },

  hiroshima: {
    slug: 'hiroshima',
    name_en: 'Hiroshima',
    name_jp: '広島',
    city: 'Hiroshima',
    prefecture: 'Hiroshima',
    region_id: 'ca000000-0000-0000-0000-000000000001',
    center: { lat: 34.394, lng: 132.4555 },
    meta_title: 'Best Pokemon Card Shops in Hiroshima (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 10+ Pokemon card shops in Hiroshima. Otemachi and Hondori area. Booster boxes, rare singles, graded cards. Tips for foreign visitors.',
    og_description:
      '10+ Pokemon card shops in Hiroshima. Otemachi & Hondori area guide for collectors.',
    hero_subtitle: "Peace city — card shops in Hiroshima's central shopping district",
    why_paragraphs: [
      "Hiroshima (広島) is one of western Japan's major cities, known worldwide for its Peace Memorial Park. The card shop scene is centered around the Hondori covered shopping arcade and the Otemachi area, both easily accessible by Hiroshima's iconic streetcars.",
      "For travelers visiting Hiroshima's historical sites and nearby Miyajima Island, the city's card shops offer a pleasant shopping break. The compact city center is easy to navigate, and card prices tend to be fair.",
    ],
    getting_there: [
      { line: 'Sanyo Shinkansen', station: 'Hiroshima Station', detail: 'About 80 minutes from Osaka, 4 hours from Tokyo.' },
      { line: 'Hiroshima Electric Railway (Streetcar)', station: 'Hondori / Kamiyacho', detail: 'Streetcar from Hiroshima Station to shopping area (about 15 min).' },
      { line: 'From Hiroshima Airport', station: '', detail: 'Airport bus to Hiroshima Station (about 50 minutes).' },
    ],
    tips: [
      { title: 'Hondori arcade', body: 'The covered Hondori shopping arcade is the main card shop area. Easy to find and navigate.' },
      { title: 'Streetcar', body: 'Hiroshima\'s streetcar system is the easiest way to get around. Day passes available.' },
      { title: 'Payment', body: 'Major credit cards accepted at chain stores. IC cards (ICOCA) work on streetcars too.' },
      { title: 'Miyajima combo', body: 'Visit card shops in the morning, then take the ferry to Miyajima Island for the afternoon.' },
    ],
  },

  okayama: {
    slug: 'okayama',
    name_en: 'Okayama',
    name_jp: '岡山',
    city: 'Okayama',
    prefecture: 'Okayama',
    region_id: 'cb000000-0000-0000-0000-000000000001',
    center: { lat: 34.6655, lng: 133.9185 },
    meta_title: 'Best Pokemon Card Shops in Okayama (2025 Guide) | CardMapJP',
    meta_description:
      'Complete guide to 7+ Pokemon card shops in Okayama Station area. Booster boxes, rare singles & more. Tips for collectors.',
    og_description:
      '7+ Pokemon card shops in Okayama. Station area guide for collectors.',
    hero_subtitle: "Land of Momotaro — card shops near Okayama Station",
    why_paragraphs: [
      "Okayama (岡山) is a major transportation hub in western Japan, known for its beautiful Korakuen Garden and the legend of Momotaro (Peach Boy). Card shops are concentrated near Okayama Station and in the Omotecho shopping arcade.",
      "As a major Shinkansen junction between the San'yo and San'in lines, Okayama is a convenient stop for card shopping when traveling through western Japan. The compact city center makes it easy to visit shops between train connections.",
    ],
    getting_there: [
      { line: 'Sanyo Shinkansen', station: 'Okayama Station', detail: 'About 50 minutes from Osaka, 3.5 hours from Tokyo.' },
      { line: 'From Okayama Airport', station: '', detail: 'Airport bus to Okayama Station (about 30 minutes).' },
    ],
    tips: [
      { title: 'Transit hub', body: 'Okayama is a transfer point for trains to Shikoku. Easy to visit during connections.' },
      { title: 'Korakuen Garden', body: 'One of Japan\'s three great gardens is a short walk from the station. Combine with card shopping.' },
      { title: 'Payment', body: 'Major credit cards accepted at chain stores. Bring cash for smaller shops.' },
    ],
  },
};

export const ALL_REGION_SLUGS = Object.keys(REGION_CONFIGS);

export function getRegionConfig(slug: string): RegionConfig | undefined {
  return REGION_CONFIGS[slug];
}

/** Center coordinates for all 23 regions (used for map navigation) */
export const REGION_CENTERS: Record<string, { lat: number; lng: number }> = {
  akihabara: { lat: 35.6984, lng: 139.7731 },
  ikebukuro: { lat: 35.7295, lng: 139.7109 },
  shibuya: { lat: 35.6580, lng: 139.7016 },
  shinjuku: { lat: 35.6938, lng: 139.7034 },
  nakano: { lat: 35.7074, lng: 139.6659 },
  machida: { lat: 35.5424, lng: 139.4460 },
  tachikawa: { lat: 35.6980, lng: 139.4142 },
  yokohama: { lat: 35.4437, lng: 139.6380 },
  omiya: { lat: 35.9062, lng: 139.6237 },
  chiba: { lat: 35.6131, lng: 140.1134 },
  nipponbashi: { lat: 34.6595, lng: 135.5054 },
  kyoto: { lat: 35.0048, lng: 135.7670 },
  kobe: { lat: 34.6932, lng: 135.1956 },
  osu: { lat: 35.1584, lng: 136.9066 },
  niigata: { lat: 37.9161, lng: 139.0364 },
  kanazawa: { lat: 36.5613, lng: 136.6562 },
  'tenjin-hakata': { lat: 33.5902, lng: 130.3986 },
  kumamoto: { lat: 32.8032, lng: 130.7079 },
  naha: { lat: 26.3344, lng: 127.6809 },
  hiroshima: { lat: 34.3955, lng: 132.4596 },
  okayama: { lat: 34.6551, lng: 133.9195 },
  sapporo: { lat: 43.0621, lng: 141.3544 },
  sendai: { lat: 38.2601, lng: 140.8826 },
};
