-- ============================================================
-- Seed: West & South Japan (Kumamoto, Naha/Okinawa, Niigata, Kanazawa)
-- ============================================================

-- ============================================================
-- Region: Kumamoto
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'ba000000-0000-0000-0000-000000000001',
  'Kumamoto', '熊本', 'Kumamoto', 'Kumamoto',
  32.79000000, 130.70900000, 14, true
);

-- ============================================================
-- Region: Naha/Okinawa
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'bb000000-0000-0000-0000-000000000001',
  'Naha/Okinawa', '那覇・沖縄', 'Naha', 'Okinawa',
  26.22570000, 127.69450000, 13, true
);

-- ============================================================
-- Region: Niigata Station
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'bc000000-0000-0000-0000-000000000001',
  'Niigata Station', '新潟駅', 'Niigata', 'Niigata',
  37.91280000, 139.05980000, 14, true
);

-- ============================================================
-- Region: Kanazawa
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'bd000000-0000-0000-0000-000000000001',
  'Kanazawa', '金沢', 'Kanazawa', 'Ishikawa',
  36.57820000, 136.64770000, 14, true
);

-- ============================================================
-- KUMAMOTO SHOPS
-- ============================================================

-- ============================================================
-- Kumamoto Shop 1: Card Labo Kumamoto
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ba000000-0000-0000-0000-000000000101',
  'カードラボ 熊本店', 'Card Labo Kumamoto',
  'ba000000-0000-0000-0000-000000000001',
  '熊本県熊本市西区春日3丁目15-26 アミュプラザくまもと6F', 'Amu Plaza Kumamoto 6F, 3-15-26 Kasuga, Nishi-ku, Kumamoto-shi, Kumamoto 860-0047',
  ST_MakePoint(130.6886, 32.7897)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.7, 200,
  '096-288-2661', 'https://www.c-labo.jp/shop/kumamoto/', 'kumamoto_clabo',
  'Major chain card shop directly connected to JR Kumamoto Station inside Amu Plaza on the 6th floor. 100 duel seats and reliable stock of Pokemon singles and sealed product. Lottery-based sales for popular new releases.',
  '• Open 10:00-21:00 (buyback 10:00-20:00)
  • Directly inside Amu Plaza Kumamoto at JR Kumamoto Station -- easiest access for visitors
  • 100 duel seats available
  • Cash, credit cards, IC cards accepted
  • Lottery sales for new popular releases -- check Twitter for announcements'
);

-- ============================================================
-- Kumamoto Shop 2: You-ING Kumamoto Kamitori
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ba000000-0000-0000-0000-000000000102',
  '遊ING 熊本上通り店', 'You-ING Kumamoto Kamitori',
  'ba000000-0000-0000-0000-000000000001',
  '熊本県熊本市中央区上通町6-15 t-fourビル 4F・5F', 't-four Building 4F/5F, 6-15 Kamitori-cho, Chuo-ku, Kumamoto-shi, Kumamoto 860-0845',
  ST_MakePoint(130.7089, 32.8040)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  true, 3.8, 180,
  '096-223-5010', 'https://youing.net/kamitoori/', 'youing_k_pokeka',
  'Located on the Kamitori shopping arcade in downtown Kumamoto with 128+ duel seats across two floors. Has a dedicated Pokemon card Twitter account. Late closing time at 22:00 is great for evening shopping.',
  '• Weekdays 12:00-22:00, Weekends/Holidays 10:00-22:00
  • On the Kamitori (upper street) shopping arcade -- one of Kumamoto''s main shopping areas
  • 128+ duel seats on two floors (4F & 5F)
  • About 15 min by tram from Kumamoto Station
  • Dedicated Pokemon card account on Twitter for stock updates'
);

-- ============================================================
-- Kumamoto Shop 3: Card Shop @Home Kumamoto
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ba000000-0000-0000-0000-000000000103',
  'カードショップ＠ほ～む。熊本店', 'Card Shop @Home Kumamoto',
  'ba000000-0000-0000-0000-000000000001',
  '熊本県熊本市中央区水前寺5-24-12', '5-24-12 Suizenji, Chuo-ku, Kumamoto-shi, Kumamoto 862-0950',
  ST_MakePoint(130.7350, 32.7909)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  true, 4.0, 150,
  '096-240-2545', 'https://www.cardshop-athome.com/kmmt_guide.php', 'AThome_kumamoto',
  'Near the Suizenji area with uniquely late hours open until 1:00 AM every day. Daily tournaments across all card games. Good option for late evening card shopping.',
  '• Mon-Fri 14:00-25:00 (1AM), Sat-Sun 10:00-25:00, Holidays 12:00-25:00
  • Near Suizenji Park area (famous tourist spot)
  • Open until 1:00 AM -- great for night-owl card shoppers
  • Near JR Shin-Suizenji or Minami-Kumamoto stations
  • Daily tournaments available'
);

-- ============================================================
-- Kumamoto Shop 4: Lotus Kumamoto Shimotori
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ba000000-0000-0000-0000-000000000104',
  'ロータス 熊本下通店', 'Lotus Kumamoto Shimotori',
  'ba000000-0000-0000-0000-000000000001',
  '熊本県熊本市中央区下通1丁目', 'Shimotori 1-chome, Chuo-ku, Kumamoto-shi, Kumamoto',
  ST_MakePoint(130.7085, 32.8005)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  3.9, 100,
  'Lotus_Shimotori',
  'Located on the Shimotori shopping arcade in Kumamoto''s main nightlife area. Very late night hours open until 1 AM on weekdays and 3 AM on weekends. Known for high-rarity oripa.',
  '• Weekdays 15:00-01:00, Weekends 15:00-03:00, closed Mondays
  • On the Shimotori (lower street) shopping arcade -- Kumamoto''s main nightlife area
  • Very late hours -- perfect for night-owl card enthusiasts
  • Known for high-rarity oripa (original packs)
  • Walkable from Kumamoto Castle area'
);

-- ============================================================
-- Kumamoto Shop 5: Toreca Oukoku (Trading Card Kingdom)
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone,
  ai_summary, visitor_tips)
VALUES (
  'ba000000-0000-0000-0000-000000000105',
  'トレカ王国', 'Toreca Oukoku (Trading Card Kingdom)',
  'ba000000-0000-0000-0000-000000000001',
  '熊本県熊本市東区東町3丁目3-3', '3-3-3 Higashimachi, Higashi-ku, Kumamoto-shi, Kumamoto',
  ST_MakePoint(130.7523, 32.7854)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  true, 4.2, 120,
  '096-285-1214',
  'Located in Higashi-ku on the east side of Kumamoto. Known for excellent card condition and highly rated by collectors. Open until midnight.',
  '• Open 12:00-24:00 (midnight), year-round
  • Known for excellent card condition -- popular with collectors
  • Open until midnight for late-night browsing
  • Not near the station -- taxi or bus recommended
  • Strong vintage card selection'
);

-- ============================================================
-- Kumamoto Shop 6: MUGEN TABLE GAMES
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ba000000-0000-0000-0000-000000000106',
  'MUGEN TABLE GAMES', 'MUGEN TABLE GAMES',
  'ba000000-0000-0000-0000-000000000001',
  '熊本県熊本市中央区琴平1-12-7 グランシティ琴平 102', 'Gran City Kotohira 102, 1-12-7 Kotohira, Chuo-ku, Kumamoto-shi, Kumamoto',
  ST_MakePoint(130.7155, 32.7852)::geography,
  '{"cash"}',
  true, true, true, true,
  true, 4.5, 80,
  '096-245-6295', 'mugenmtg',
  'Small, cozy independent shop about 5-6 min walk from Minami-Kumamoto Station. Primarily an MTG shop that also carries Pokemon cards. Very high Google ratings due to friendly atmosphere.',
  '• Check Twitter @mugenmtg for current hours
  • Small independent shop -- very friendly atmosphere
  • About 5-6 min walk from Minami-Kumamoto Station
  • Primarily MTG focused but carries Pokemon cards
  • Daily tournaments -- cash only'
);

-- ============================================================
-- NAHA / OKINAWA SHOPS
-- ============================================================

-- ============================================================
-- Naha Shop 1: Pokemon Card Specialty Shop Ocean
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'bb000000-0000-0000-0000-000000000101',
  'ポケモンカード専門店 Ocean 本店', 'Pokemon Card Specialty Shop Ocean (Main Store)',
  'bb000000-0000-0000-0000-000000000001',
  '沖縄県那覇市田原3-1-12 第2丸元ビル202', 'Dai-2 Marumoto Building 202, 3-1-12 Tahara, Naha-shi, Okinawa 901-0156',
  ST_MakePoint(127.6726, 26.1979)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  true, 4.3, 150,
  'OceanPkc',
  'Okinawa''s only dedicated Pokemon card specialty shop. Near Oroku Station on the Yui Rail monorail. Official gym battles held regularly with a play space. Very popular on weekends.',
  '• Weekdays 12:00-22:00, Weekends/Holidays 11:00-20:00
  • Okinawa''s only Pokemon card specialty shop
  • Near Oroku Station on the Yui Rail monorail
  • Official gym battles (tournaments) held regularly
  • Can be crowded on weekends -- go early
  • Also has a 2nd store in Awase'
);

-- ============================================================
-- Naha Shop 2: TSUTAYA Card Stadium Naha Shintoshin
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'bb000000-0000-0000-0000-000000000102',
  'TSUTAYA那覇新都心店 カードスタジアム', 'TSUTAYA Card Stadium Naha Shintoshin',
  'bb000000-0000-0000-0000-000000000001',
  '沖縄県那覇市おもろまち4-2-8', '4-2-8 Omoromachi, Naha-shi, Okinawa 900-0006',
  ST_MakePoint(127.6945, 26.2257)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.5, 120,
  '098-860-1316', 'http://www.tsutaya-ns.jp/', 'cardstadium_ns',
  'Located on the 2nd floor of TSUTAYA bookstore near Omoromachi Station. Only official Pokemon card tournament-certified shop in the Shintoshin (new city center) area. Near DFS T Galleria and San-A Main Place mall.',
  '• Trading card floor (2F): 10:00-22:00, year-round
  • 4 min walk from Omoromachi Station (Yui Rail)
  • Official Pokemon card tournament venue
  • Near DFS T Galleria and San-A Main Place -- combine with shopping
  • Inside TSUTAYA bookstore -- easy to find'
);

-- ============================================================
-- Naha Shop 3: Toreca Shop Shima
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'bb000000-0000-0000-0000-000000000103',
  'トレカショップshima', 'Toreca Shop Shima',
  'bb000000-0000-0000-0000-000000000001',
  '沖縄県浦添市城間3-3-8 島尻ビル202', 'Shimajiri Building 202, 3-3-8 Gusukuma, Urasoe-shi, Okinawa',
  ST_MakePoint(127.7152, 26.2445)::geography,
  '{"cash"}',
  true, true, true, true, true, true,
  true, 4.0, 80,
  'torekashima',
  'Beloved local independent shop established for over 10 years in Urasoe (just north of Naha). A 2nd store opened in Uruma in 2025. Short opening hours so plan carefully.',
  '• Open 15:00-21:00
  • Established 10+ year local shop -- very popular with locals
  • Located in Urasoe (just north of Naha)
  • Short opening hours -- plan your visit carefully
  • Not accessible by monorail -- taxi recommended
  • Check Twitter for schedule changes'
);

-- ============================================================
-- Naha Shop 4: Card Box Chatan
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'bb000000-0000-0000-0000-000000000104',
  'カードボックス 北谷店', 'Card Box Chatan',
  'bb000000-0000-0000-0000-000000000001',
  '沖縄県中頭郡北谷町美浜9-8 シーサイドスクエア1F-C', 'Seaside Square 1F-C, 9-8 Mihama, Chatan-cho, Nakagami-gun, Okinawa 904-0115',
  ST_MakePoint(127.7619, 26.3268)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  true, 3.8, 100,
  '050-1284-7021', 'https://cardbox.online/shop/detail/4226/',
  'Located in Chatan''s American Village area (Mihama), a major tourist destination. 12 duel seats for free play. Some English communication may be possible informally due to nearby US military base.',
  '• Weekdays 14:00-20:00, Weekends/Holidays 12:00-20:00, closed Wednesdays
  • In Chatan''s American Village area -- a major tourist destination
  • 12 duel seats for free play
  • About 30 min by taxi from Naha
  • Near US military base -- some informal English communication possible
  • Combine with American Village sightseeing'
);

-- ============================================================
-- Naha Shop 5: MINT Okinawa
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  website_url,
  ai_summary, visitor_tips)
VALUES (
  'bb000000-0000-0000-0000-000000000105',
  'ミント 沖縄店', 'MINT Okinawa',
  'bb000000-0000-0000-0000-000000000001',
  '沖縄県中頭郡北中城村ライカム1番地 イオンモール沖縄ライカム4F', 'AEON Mall Okinawa Rycom 4F, 1 Rycom, Kitanakagusuku-son, Nakagami-gun, Okinawa 901-2306',
  ST_MakePoint(127.7684, 26.3341)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true, true, true,
  true, 3.9, 150,
  'https://mint-web.jp/?pid=184738985',
  'Inside the massive AEON Mall Okinawa Rycom (one of Japan''s largest malls). 32-seat play space. Carries sports cards, PSA graded items, and English language cards.',
  '• Open 10:00-22:00 (follows AEON Mall hours)
  • Inside AEON Mall Okinawa Rycom -- one of Japan''s largest malls
  • 32-seat play space
  • Carries PSA graded cards and English-language cards -- rare for Okinawa
  • About 25 min drive from Naha
  • Free shuttle buses run from Naha to AEON Rycom'
);

-- ============================================================
-- Naha Shop 6: GEO Naha Shintoshin
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_booster_box, sells_sealed_pack,
  beginner_friendly, google_rating, google_review_count,
  website_url,
  ai_summary, visitor_tips)
VALUES (
  'bb000000-0000-0000-0000-000000000106',
  'ゲオ 那覇新都心店', 'GEO Naha Shintoshin',
  'bb000000-0000-0000-0000-000000000001',
  '沖縄県那覇市おもろまち4-3-22', '4-3-22 Omoromachi, Naha-shi, Okinawa 900-0006',
  ST_MakePoint(127.6939, 26.2263)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true,
  true, 3.4, 200,
  'https://geo-online.co.jp/store/02251/',
  'General entertainment store open 24 hours. Sells sealed Pokemon TCG products only (booster packs, boxes). Not a specialist card shop but useful for picking up packs at odd hours.',
  '• Open 24 hours, year-round
  • 3 min walk from Omoromachi Station (Yui Rail)
  • Open 24 hours -- useful for buying packs at odd hours
  • Sealed product only (booster packs, boxes) -- no singles
  • Right next to TSUTAYA Card Stadium
  • Has parking available'
);

-- ============================================================
-- NIIGATA SHOPS
-- ============================================================

-- ============================================================
-- Niigata Shop 1: Card Labo Niigata
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'bc000000-0000-0000-0000-000000000101',
  'カードラボ 新潟店', 'Card Labo Niigata',
  'bc000000-0000-0000-0000-000000000001',
  '新潟県新潟市中央区東大通1-8-5 アニメ・コミック館2F', 'Anime Comic Kan 2F, 1-8-5 Higashi-Odori, Chuo-ku, Niigata-shi, Niigata 950-0087',
  ST_MakePoint(139.0598, 37.9128)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  true, 3.6, 150,
  '025-282-7100', 'https://www.c-labo.jp/shop/niigata/', 'niigata_labo',
  'Located 5 min walk from JR Niigata Station Bandai Exit inside the Animate building. 36 duel seats. Reliable chain store for Pokemon card singles and sealed product.',
  '• Weekdays 11:00-20:00, Weekends/Holidays 10:00-20:00 (buyback until 19:00)
  • 5 min walk from JR Niigata Station Bandai Exit
  • Inside the Animate building (also has anime/manga shops)
  • 36 duel seats available
  • Bandai Exit area has many one-way streets -- train/bus recommended'
);

-- ============================================================
-- Niigata Shop 2: Tournament Center Batoloco Niigata Bandai
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  website_url,
  ai_summary, visitor_tips)
VALUES (
  'bc000000-0000-0000-0000-000000000102',
  'トーナメントセンター バトロコ 新潟万代店', 'Tournament Center Batoloco Niigata Bandai',
  'bc000000-0000-0000-0000-000000000001',
  '新潟県新潟市中央区万代1-5-1 ラブラ万代4F', 'Lovera Bandai 4F, 1-5-1 Bandai, Chuo-ku, Niigata-shi, Niigata 950-0088',
  ST_MakePoint(139.0614, 37.9157)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  true, 3.8, 120,
  'https://mitsui-shopping-park.com/lovela-bandai/shopguide/2489763.html',
  'Tournament-focused shop inside Lovera Bandai shopping center with a large play area. Popular new releases sold via lottery. About 8 min walk from Niigata Station through the Bandai shopping district.',
  '• Typically 10:00-20:00 (check Lovera Bandai for current hours)
  • Inside Lovera Bandai shopping center
  • About 8 min walk from Niigata Station through Bandai district
  • Tournament-focused with large play area
  • New releases via lottery system for fairness
  • Inside a proper shopping mall with other amenities'
);

-- ============================================================
-- Niigata Shop 3: Furuichi Top Books Niigata Bandai
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'bc000000-0000-0000-0000-000000000103',
  'ふるいちトップブックス 新潟万代', 'Furuichi Top Books Niigata Bandai',
  'bc000000-0000-0000-0000-000000000001',
  '新潟県新潟市中央区幸西3丁目1-6 蔦屋書店新潟万代店内', 'Inside Tsutaya Bookstore Niigata Bandai, 3-1-6 Kosai, Chuo-ku, Niigata-shi, Niigata',
  ST_MakePoint(139.0541, 37.9150)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  true, 3.5, 100,
  '025-249-0066', 'https://www.furu1.net/shop/shop2613.html', 'furu1_niigata',
  'Inside the Tsutaya bookstore in the Bandai area with very long hours. Hosts official Pokemon card tournaments. Friendly staff with good product knowledge.',
  '• Mon-Fri 9:00-22:00, Sat-Sun 8:00-22:00
  • Inside Tsutaya bookstore -- casual and approachable
  • Very long hours (open from 8-9 AM)
  • Hosts official Pokemon card tournaments
  • About 10 min walk from Niigata Station
  • Good for browsing alongside books and media'
);

-- ============================================================
-- Niigata Shop 4: Card Shop Masara Town
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'bc000000-0000-0000-0000-000000000104',
  'カードショップ マサラタウン', 'Card Shop Masara Town (Pallet Town)',
  'bc000000-0000-0000-0000-000000000001',
  '新潟県新潟市東区山木戸6丁目19-5', '6-19-5 Yamakido, Higashi-ku, Niigata-shi, Niigata',
  ST_MakePoint(139.0815, 37.9211)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  true, 4.5, 80,
  '025-250-1745', 'https://masaratown.shop/',
  'Named after Pallet Town from Pokemon! A Pokemon card specialist shop with very late hours until 23:00. Opened June 2024. Very high Google ratings and popular with local Pokemon card fans.',
  '• Weekdays 15:00-23:00, Weekends/Holidays 12:00-23:00
  • Named after Pallet Town (Masara Town) from Pokemon
  • Pokemon card specialist shop -- dedicated selection
  • Very late hours (until 23:00)
  • In Higashi-ku -- not walkable from station, taxi recommended
  • Very high Google ratings -- worth the trip for dedicated fans'
);

-- ============================================================
-- Niigata Shop 5: Card Piece Niigata
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'bc000000-0000-0000-0000-000000000105',
  'カードピース 新潟店', 'Card Piece Niigata',
  'bc000000-0000-0000-0000-000000000001',
  '新潟県新潟市東区江南2丁目6-2 コーポ野沢1F', 'Corp Nozawa 1F, 2-6-2 Konan, Higashi-ku, Niigata-shi, Niigata',
  ST_MakePoint(139.0890, 37.9180)::geography,
  '{"cash"}',
  true, true, true, true, true,
  true, 4.0, 60,
  'cardpiace',
  'Small local independent card shop in Higashi-ku. Good for finding local deals on Pokemon card singles.',
  '• Check Twitter @cardpiace for current hours
  • Small local independent shop
  • In Higashi-ku -- not near station, taxi required
  • Cash only
  • Check Twitter before visiting for hours and closures
  • Good for local deals on singles'
);

-- ============================================================
-- Niigata Shop 6: Otachu Niigata Akamichi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'bc000000-0000-0000-0000-000000000106',
  'おたちゅう 赤道店', 'Otachu Niigata Akamichi',
  'bc000000-0000-0000-0000-000000000001',
  '新潟県新潟市東区中木戸56', '56 Nakakido, Higashi-ku, Niigata-shi, Niigata 950-0886',
  ST_MakePoint(139.0785, 37.9220)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  true, 3.5, 200,
  '025-275-5125', 'https://otakara-akamichi.com/',
  'Large secondhand goods/hobby mega-store carrying Pokemon cards alongside games, figures, and collectibles. Very long hours until 23:30. Fun to browse even if not buying cards.',
  '• Open 10:00-23:30, year-round
  • Large hobby mega-store (similar to Book Off concept)
  • Very long hours -- open until 23:30
  • Pokemon cards alongside games, figures, collectibles
  • In the eastern suburbs -- drive or taxi needed
  • Fun treasure-hunting experience for collectibles'
);

-- ============================================================
-- KANAZAWA SHOPS
-- ============================================================

-- ============================================================
-- Kanazawa Shop 1: Hobby Station Kanazawa
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'bd000000-0000-0000-0000-000000000101',
  'ホビーステーション 金沢店', 'Hobby Station Kanazawa',
  'bd000000-0000-0000-0000-000000000001',
  '石川県金沢市竪町24 BELSEL 3F', 'BELSEL 3F, 24 Tatemachi, Kanazawa-shi, Ishikawa 920-0997',
  ST_MakePoint(136.6530, 36.5595)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  true, 3.8, 180,
  '076-264-1999', 'https://www.hbst.net/shop/36/', 'hbstkanazawa',
  'Located in the Tatemachi shopping street with 150 duel seats. Major national chain with wide Pokemon card selection. Between Kanazawa Castle and the Nagamachi samurai district.',
  '• Open 11:00-20:00, year-round, no holidays
  • In the Tatemachi shopping street -- Kanazawa''s trendy shopping area
  • 150 duel seats -- very large free play space
  • About 15 min walk from Kanazawa Station or bus to Katamachi
  • Between Kanazawa Castle and Nagamachi samurai district -- combine with sightseeing'
);

-- ============================================================
-- Kanazawa Shop 2: Pokemon Center Kanazawa
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_booster_box, sells_sealed_pack,
  beginner_friendly, google_rating, google_review_count,
  website_url,
  ai_summary, visitor_tips)
VALUES (
  'bd000000-0000-0000-0000-000000000102',
  'ポケモンセンターカナザワ', 'Pokemon Center Kanazawa',
  'bd000000-0000-0000-0000-000000000001',
  '石川県金沢市堀川新町3-1 金沢フォーラス5F', 'Kanazawa Forus 5F, 3-1 Horikawa-Shinmachi, Kanazawa-shi, Ishikawa 920-0849',
  ST_MakePoint(136.6477, 36.5782)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true,
  true, 4.3, 300,
  'https://www.pokemon.co.jp/shop/pokecen/kanazawa/',
  'Official Pokemon Center just 1 minute walk from JR Kanazawa Station inside Kanazawa Forus mall. Beautiful Milotic-themed entrance. Sells Kanazawa-exclusive Pokemon merchandise. Official sealed TCG products only.',
  '• Open 10:00-20:00 (follows Kanazawa Forus hours)
  • 1 minute walk from JR Kanazawa Station inside Kanazawa Forus
  • Beautiful Milotic-themed entrance representing Hokuriku
  • Kanazawa-exclusive Pokemon merchandise -- great souvenirs
  • Official sealed TCG products only -- no singles or buyback
  • Expect queues for new product releases
  • A must-visit for Pokemon fans visiting Kanazawa'
);

-- ============================================================
-- Kanazawa Shop 3: TSUTAYA Kanazawa (Trading Card Section)
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'bd000000-0000-0000-0000-000000000103',
  'TSUTAYA 金沢店 トレカ', 'TSUTAYA Kanazawa (Trading Card Section)',
  'bd000000-0000-0000-0000-000000000001',
  '石川県金沢市西念4-25-8', '4-25-8 Sainen, Kanazawa-shi, Ishikawa 920-0024',
  ST_MakePoint(136.6404, 36.5742)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.5, 100,
  '076-260-9602', 'https://store-tsutaya.tsite.jp/store/detail?storeId=3300', 'tsutakanaTCG',
  'The 2nd floor has a dedicated trading card section with 16 duel seats. Long hours from 9 AM to 10 PM. Weekend tournaments. Familiar chain store that is approachable for newcomers.',
  '• Open 9:00-22:00 (buyback 9:00-20:00)
  • About 10 min walk from Kanazawa Station
  • 2nd floor dedicated trading card section with 16 duel seats
  • Long hours (9 AM - 10 PM)
  • Weekend tournaments available
  • Inside a regular TSUTAYA bookstore -- less intimidating for newcomers'
);

-- ============================================================
-- Kanazawa Shop 4: Romanyu Kanazawa Main Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'bd000000-0000-0000-0000-000000000104',
  '浪漫遊 金沢本店', 'Romanyu Kanazawa Main Store',
  'bd000000-0000-0000-0000-000000000001',
  '石川県野々市市御経塚4丁目1番地', '4-1 Okyozuka, Nonoichi-shi, Ishikawa 921-8801',
  ST_MakePoint(136.5961, 36.5349)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  true, 3.7, 200,
  '076-287-5539', 'https://romanyu.com/',
  'Large secondhand hobby mega-store in Nonoichi (just south of Kanazawa). Open until midnight. Carries Pokemon cards alongside games, manga, figures, and retro items. Fun treasure-hunting experience.',
  '• Open 10:00-24:00 (midnight), buyback until 22:00, year-round
  • Large hobby mega-store in Nonoichi (south of Kanazawa)
  • Open until midnight -- great for late-night browsing
  • Pokemon cards alongside games, manga, figures, retro items
  • About 15 min by car/taxi or bus to Okyozuka from Kanazawa Station
  • Fun treasure-hunting experience for collectibles'
);

-- ============================================================
-- Kanazawa Shop 5: Hobby Shop TamTam Kanazawa
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_booster_box, sells_sealed_pack,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'bd000000-0000-0000-0000-000000000105',
  'ホビーショップ タムタム 金沢店', 'Hobby Shop TamTam Kanazawa',
  'bd000000-0000-0000-0000-000000000001',
  '石川県金沢市福久2-58 イオン金沢店3F', 'AEON Kanazawa 3F, 2-58 Fukuhisa, Kanazawa-shi, Ishikawa 920-3126',
  ST_MakePoint(136.6762, 36.5934)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true,
  true, 3.9, 150,
  '076-201-8555', 'https://www.hs-tamtam.jp/shop/kanazawa.html', 'tamtamkanazawa',
  'Massive hobby shop inside AEON Kanazawa. Primarily a model/hobby store that also stocks Pokemon card sealed products (booster boxes, packs). Good for combining with other hobby shopping.',
  '• Open 10:00-21:00, year-round
  • Inside AEON Kanazawa on the 3rd floor
  • Primarily a model/hobby store with Pokemon card sealed products
  • No singles -- sealed product only (booster boxes, packs)
  • In northern suburbs -- bus or taxi from station
  • Call ahead to confirm Pokemon card stock: 076-201-8555'
);

-- ============================================================
-- INVENTORY DATA
-- ============================================================

-- Card Labo Kumamoto (key shop - station-connected chain)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ba000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, 'Standard chain pricing on commons'),
  ('ba000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, 'Good rare singles selection'),
  ('ba000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('ba000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5200, 8000, 'Current sets available'),
  ('ba000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('ba000000-0000-0000-0000-000000000101', 'oripa', 'in_stock', 500, 5000, 'Various price tiers')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- You-ING Kumamoto Kamitori (key shop - large downtown store)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ba000000-0000-0000-0000-000000000102', 'single_common', 'in_stock', 20, 500, NULL),
  ('ba000000-0000-0000-0000-000000000102', 'single_rare', 'in_stock', 500, 8000, 'Wide selection across two floors'),
  ('ba000000-0000-0000-0000-000000000102', 'single_sr', 'in_stock', 3000, 40000, NULL),
  ('ba000000-0000-0000-0000-000000000102', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('ba000000-0000-0000-0000-000000000102', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('ba000000-0000-0000-0000-000000000102', 'oripa', 'in_stock', 500, 10000, 'Popular oripa selection')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Pokemon Card Specialty Shop Ocean (key shop - Okinawa's only Pokemon specialist)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('bb000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 30, 500, NULL),
  ('bb000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 10000, 'Specialist Pokemon selection'),
  ('bb000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('bb000000-0000-0000-0000-000000000101', 'single_sar', 'in_stock', 8000, 120000, NULL),
  ('bb000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5500, 8500, NULL),
  ('bb000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('bb000000-0000-0000-0000-000000000101', 'oripa', 'in_stock', 500, 10000, 'In-store oripa available'),
  ('bb000000-0000-0000-0000-000000000101', 'vintage_pack', 'limited', 30000, 200000, 'Vintage packs occasionally')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- MINT Okinawa (key shop - carries English and PSA graded)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('bb000000-0000-0000-0000-000000000105', 'single_common', 'in_stock', 30, 500, NULL),
  ('bb000000-0000-0000-0000-000000000105', 'single_rare', 'in_stock', 500, 8000, 'English cards available'),
  ('bb000000-0000-0000-0000-000000000105', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('bb000000-0000-0000-0000-000000000105', 'psa_graded', 'in_stock', 5000, 300000, 'PSA graded showcase'),
  ('bb000000-0000-0000-0000-000000000105', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('bb000000-0000-0000-0000-000000000105', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('bb000000-0000-0000-0000-000000000105', 'accessories', 'in_stock', 300, 5000, 'Sleeves, deck boxes, playmats')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Card Labo Niigata (key shop - station-area chain)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('bc000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, NULL),
  ('bc000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, 'Reliable chain selection'),
  ('bc000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('bc000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5200, 8000, 'Current sets available'),
  ('bc000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('bc000000-0000-0000-0000-000000000101', 'oripa', 'in_stock', 500, 5000, 'Various price tiers')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Card Shop Masara Town (key shop - Pokemon specialist with high ratings)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('bc000000-0000-0000-0000-000000000104', 'single_common', 'in_stock', 20, 400, NULL),
  ('bc000000-0000-0000-0000-000000000104', 'single_rare', 'in_stock', 500, 10000, 'Pokemon specialist selection'),
  ('bc000000-0000-0000-0000-000000000104', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('bc000000-0000-0000-0000-000000000104', 'single_sar', 'in_stock', 8000, 120000, NULL),
  ('bc000000-0000-0000-0000-000000000104', 'booster_box', 'in_stock', 5500, 8500, NULL),
  ('bc000000-0000-0000-0000-000000000104', 'oripa', 'in_stock', 500, 10000, 'In-store oripa'),
  ('bc000000-0000-0000-0000-000000000104', 'vintage_pack', 'limited', 30000, 200000, 'Vintage packs when available')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Hobby Station Kanazawa (key shop - largest play space in Kanazawa)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('bd000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, NULL),
  ('bd000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, 'National chain pricing'),
  ('bd000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 40000, NULL),
  ('bd000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('bd000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('bd000000-0000-0000-0000-000000000101', 'oripa', 'in_stock', 500, 5000, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Romanyu Kanazawa (key shop - mega-store with vintage)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('bd000000-0000-0000-0000-000000000104', 'single_common', 'in_stock', 10, 300, 'Bargain pre-owned singles'),
  ('bd000000-0000-0000-0000-000000000104', 'single_rare', 'in_stock', 300, 8000, NULL),
  ('bd000000-0000-0000-0000-000000000104', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('bd000000-0000-0000-0000-000000000104', 'booster_box', 'in_stock', 5500, 8500, NULL),
  ('bd000000-0000-0000-0000-000000000104', 'vintage_pack', 'limited', 30000, 300000, 'Vintage finds in mega-store'),
  ('bd000000-0000-0000-0000-000000000104', 'oripa', 'in_stock', 500, 10000, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;
