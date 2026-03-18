-- ============================================================
-- Region: Osu (Nagoya)
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'c1000000-0000-0000-0000-000000000001',
  'Osu', '大須', 'Nagoya', 'Aichi',
  35.15930000, 136.90600000, 16, true
);

-- ============================================================
-- Shop 1: Card Labo Nagoya Osu
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000101',
  'カードラボ 名古屋大須店', 'Card Labo Nagoya Osu',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須3-30-40 万松寺ビル1F', 'Manshouji Building 1F, 3-30-40 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90565, 35.15878)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true, true,
  3.5, 200,
  '052-263-0601', 'https://www.c-labo.jp/shop/nagoyaoosu/', 'oosu_clabo',
  'Major card shop chain on Banshoji-dori Street with strong buyback prices. Located on the ground floor for easy access. One of the most established card shops in the Osu shopping district.',
  '• Daily 11:00-20:00
  • Located on Banshoji-dori Street — easy to find
  • 3-minute walk from Kamimaezu Station Exit 9
  • Strong buyback prices
  • Has a 2nd store nearby in the same area'
);

-- ============================================================
-- Shop 2: Hobby Station Nagoya Osu Main Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000102',
  'ホビーステーション 名古屋大須本店', 'Hobby Station Nagoya Osu Main Store',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須3-32-23 Zeque大須 6F', 'Zeque Osu 6F, 3-32-23 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90602, 35.15862)::geography,
  6, '6F',
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  3.6, 180,
  '052-242-5252', 'https://www.hbst.net/shop/16/', 'hbst_nagoya',
  'Chain store with 4 locations in Nagoya. Singles from as low as 50 yen. Free play space on upper floors with AC and vending machines. Daily tournaments held.',
  '• Weekdays 12:00-21:00, Weekends/Holidays 11:00-20:00
  • Singles from 50 yen — budget-friendly
  • Free play space with AC and vending machines
  • Daily tournaments
  • 4 locations in Nagoya (this is the main one)'
);

-- ============================================================
-- Shop 3: Hobby Station Osu Banshoji-dori
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000103',
  'ホビーステーション 大須万松寺通店', 'Hobby Station Osu Banshoji-dori',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須3-31-2', '3-31-2 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90571, 35.15883)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  3.5, 150,
  '052-228-0322', 'https://www.hbst.net/shop/48/', 'hbst_bansyoji',
  'Located along the main Banshoji-dori shopping arcade. Ground floor visibility makes it easy to find and a good first stop on your Osu card shop crawl.',
  '• Weekdays 12:00-21:00, Weekends/Holidays 11:00-20:00
  • On the main Banshoji-dori shopping arcade — easy to spot
  • Good first stop for card shopping in Osu'
);

-- ============================================================
-- Shop 4: Amenity Dream Osu
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_english_cards,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000104',
  'アメニティードリーム 大須店', 'Amenity Dream Osu',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須3-30-60 OSU301ビル2F', 'OSU301 Building 2F, 3-30-60 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90505, 35.15837)::geography,
  2, '2F',
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  3.7, 200,
  '052-261-7548', 'https://amenitydream.co.jp/shop/aichi-osu/', 'amenity_osu',
  'Well-known TCG chain with strong selection of MTG alongside Pokemon. Hosts official tournaments regularly. 2-minute walk from Kamimaezu Station Exit 8.',
  '• Daily 11:00-20:00
  • 2-minute walk from Kamimaezu Station Exit 8
  • Carries English cards in some titles
  • Hosts official tournaments regularly'
);

-- ============================================================
-- Shop 5: Yellow Submarine Nagoya GAMESHOP
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_english_cards, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000105',
  'イエローサブマリン 名古屋GAMESHOP', 'Yellow Submarine Nagoya GAMESHOP',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須3-11-19 OAシステムプラザ大須ビル6F', 'OA System Plaza Osu Building 6F, 3-11-19 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90712, 35.15995)::geography,
  6, '6F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  3.6, 180,
  '052-238-3012', 'https://yellowsubmarine.co.jp/', 'ys_nagoyagame',
  'On 6F of OA System Plaza building (NextPro is on 5F). Established national chain. Also carries board games, miniatures, and RPG supplies alongside Pokemon cards.',
  '• Daily 11:00-20:00
  • 6F of OA System Plaza building (NextPro on 5F — visit both)
  • Also carries board games, miniatures, and RPG supplies
  • Established national chain with reliable inventory'
);

-- ============================================================
-- Shop 6: Big Magic Nagoya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_english_cards, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000106',
  'BIG MAGIC 名古屋店', 'Big Magic Nagoya',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須4-1-3 名商ビル2F', 'Meisho Building 2F, 4-1-3 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90393, 35.16074)::geography,
  2, '2F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  3.8, 200,
  '052-238-6811', 'https://www.bigweb.co.jp/shop/nagoya', 'bigmagic_nagoya',
  'Primarily known for MTG but also carries Pokemon. 4-minute walk from Yabakcho Station. Strong singles inventory with competitive pricing on Bigweb online store.',
  '• Daily 12:00-21:00
  • 4-minute walk from Yabakcho Station
  • Primarily MTG but good Pokemon selection
  • Check bigweb.co.jp for online inventory'
);

-- ============================================================
-- Shop 7: Surugaya Nagoya Osu TCG & Board Game Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000107',
  '駿河屋 名古屋大須トレカ・ボードゲーム館', 'Surugaya Nagoya Osu TCG & Board Game Store',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須3-16-11', '3-16-11 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90640, 35.15940)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  3.5, 200,
  '052-684-6699', 'https://www.suruga-ya.jp/feature/realstore/osu_tb/index.html', 'surugaya_nagoya',
  'Surugaya''s dedicated TCG/board game branch. Part of the massive used goods chain. Good for vintage finds at competitive prices. Also has separate main store and retro game store nearby.',
  '• Daily 11:00-20:00
  • 5-minute walk from Kamimaezu Station Exit 8
  • Good for vintage Pokemon card hunting
  • Competitive buyback prices
  • Separate from main Surugaya store nearby'
);

-- ============================================================
-- Shop 8: Toreca Camp Osu
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000108',
  'トレカキャンプ 大須店', 'Toreca Camp Osu',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区上前津2-1-4 栗田商会上前津第1ビル 4F・5F', 'Kurita Shokai Kamimaezu Building 1, 4F-5F, 2-1-4 Kamimaezu, Naka-ku, Nagoya, Aichi 460-0013',
  ST_MakePoint(136.90680, 35.15720)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true, true,
  3.8, 250,
  'https://torecacamp-pokemon.com/pages/osu-shop', 'torecacamp',
  'Pokemon card specialist shop. 10-second walk from Kamimaezu Station Exits 4/5. Open late until 22:00. Two floors of Pokemon cards with strong selection of graded cards and oripa.',
  '• Daily 10:00-22:00
  • Literally 10 seconds from Kamimaezu Station Exits 4/5
  • Open late until 10pm — latest in Osu
  • Two floors dedicated to Pokemon cards
  • Strong graded card and oripa selection'
);

-- ============================================================
-- Shop 9: Fullcomp Nagoya Osu
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000109',
  'フルコンプ 名古屋大須店', 'Fullcomp Nagoya Osu',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須3-11-29 ハユネ山田1F', 'Hayune Yamada 1F, 3-11-29 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90690, 35.16000)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  3.5, 150,
  '052-243-2652', 'https://www.fullcomp.jp/', 'fc_nagoya',
  'Located on Akamon-dori Street with a striking red storefront. National chain with 18 locations. Carries Pokemon, Yu-Gi-Oh, and other TCGs.',
  '• Weekdays 12:00-21:00, Weekends 11:00-21:00
  • On Akamon-dori Street — recognizable red storefront
  • National chain with reliable inventory'
);

-- ============================================================
-- Shop 10: Hareruya Osu
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_english_cards,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000110',
  '晴れる屋 大須店', 'Hareruya Osu',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須4-11-5 Z''sビル3F', 'Z''s Building 3F, 4-11-5 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90340, 35.15890)::geography,
  true, 3, '3F',
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true, true, true,
  4.0, 250,
  '052-228-0355', 'https://www.hareruyamtg.com/en/user_data/shop_osu?shop=18', 'hareruya_osu',
  'Japan''s largest MTG specialty chain with a full English website. 2-minute walk from Kamimaezu Station. Primarily MTG but carries Pokemon. Open very late on weekends until 11pm.',
  '• Weekdays 14:00-22:00, Weekends/Holidays 10:00-23:00
  • English website available — most tourist-friendly MTG shop
  • 2-minute walk from Kamimaezu Station
  • Open until 11pm on weekends — latest in Osu
  • Primarily MTG but carries Pokemon cards too'
);

-- ============================================================
-- Shop 11: Hareruya2 Osu (Pokemon Specialty)
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, english_staff_days, floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_raw_rare, sells_english_cards, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000111',
  '晴れる屋2 大須店', 'Hareruya2 Osu',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須4-11-5 Z''sビル4F', 'Z''s Building 4F, 4-11-5 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90340, 35.15890)::geography,
  true, 'Always', 4, '4F',
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true, true, true, true, true,
  4.2, 200,
  '052-990-6460', 'https://www.hareruya2.com/pages/store_osu', 'hareruya2osu',
  'Hareruya''s dedicated Pokemon Card Game specialty store. Brand new — opened March 6, 2026. Same building as Hareruya MTG store (one floor above). English website available. Highly recommended for English-speaking visitors.',
  '• Weekdays 12:00-21:00, Weekends/Holidays 10:00-21:00
  • BRAND NEW — opened March 2026
  • #1 recommended for English-speaking Pokemon card collectors
  • Same building as Hareruya MTG (3F) — visit both
  • English website at hareruya2.com
  • Graded cards, English cards, and vintage available
  • Japan-exclusive promo card souvenirs sometimes available'
);

-- ============================================================
-- Shop 12: Toreca Champion Osu
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000112',
  'トレカチャンピオン 大須店', 'Toreca Champion Osu',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須3-11-27', '3-11-27 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90705, 35.16005)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  3.4, 120,
  '052-253-8741', 'http://www.trading-card-champion.com/concept.html',
  'Smaller independent shop with duel space available. Near Kamimaezu Station on Tsurumai Line. Good for a quick browse during your Osu card shop crawl.',
  '• Daily 11:00-20:00
  • Duel space available
  • Smaller independent shop — personal service
  • Near Kamimaezu Station on Tsurumai Line'
);

-- ============================================================
-- Shop 13: NextPro Nagoya Osu
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000113',
  'ネクストプロ 名古屋大須店', 'NextPro Nagoya Osu',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須3-11-19 OAシステムプラザ5F', 'OA System Plaza 5F, 3-11-19 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90712, 35.15995)::geography,
  5, '5F',
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true, true, true,
  3.6, 150,
  'https://nextpro.shop/', 'NextPro0001',
  '5F of OA System Plaza building (Yellow Submarine is on 6F). Carries Yu-Gi-Oh, Pokemon, One Piece, Duel Masters, Weiss Schwarz. Open year-round.',
  '• Weekdays 12:00-21:00 (Fri until 22:00), Weekends/Holidays 10:00-21:00 (Sat until 22:00)
  • 5F of OA System Plaza (Yellow Submarine on 6F — visit both)
  • Multi-TCG shop with Pokemon, Yu-Gi-Oh, One Piece, and more
  • Open year-round with extended Friday/Saturday hours'
);

-- ============================================================
-- Shop 14: TOP CARD Nagoya Osu
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000114',
  'TOP CARD 名古屋大須店', 'TOP CARD Nagoya Osu',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須3-10-24 トラスト赤門通ビル2F', 'Trust Akamon-dori Building 2F, 3-10-24 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90730, 35.16010)::geography,
  2, '2F',
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  3.7, 150,
  '052-212-8989', 'https://top-card.jp/', 'top_card1',
  'Opened December 2023 on Akamon-dori Street. 34-seat tournament space. Carries Pokemon, Yu-Gi-Oh, One Piece, Duel Masters, Dragon Ball, Hololive, Disney Lorcana, and Gundam cards.',
  '• Daily 11:00-21:00
  • On Akamon-dori Street
  • 34-seat tournament space
  • Wide variety of TCG titles including Disney Lorcana'
);

-- ============================================================
-- Shop 15: Replay Nagoya Osu
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'c1000000-0000-0000-0000-000000000115',
  'リプレイ 名古屋大須店', 'Replay Nagoya Osu',
  'c1000000-0000-0000-0000-000000000001',
  '愛知県名古屋市中区大須3-30-1 中日大須ビル2F', 'Chunichi Osu Building 2F, 3-30-1 Osu, Naka-ku, Nagoya, Aichi 460-0011',
  ST_MakePoint(136.90530, 35.15870)::geography,
  2, '2F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  3.6, 150,
  '052-228-3665', 'https://replay052.base.shop/', 'replay_oosu',
  'Pokemon-focused shop with good oripa selection. Sealed product (unopened boxes) often available at competitive prices. Active on X/Twitter with frequent product updates.',
  '• Weekdays 12:00-20:00, Weekends/Holidays 11:00-20:00
  • Pokemon-focused with good oripa selection
  • Competitive prices on sealed products
  • Active on X/Twitter — check for latest stock updates'
);

-- ============================================================
-- Shop Inventory Data for Nagoya Shops
-- ============================================================

-- Card Labo Nagoya Osu
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('c1000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 400, NULL),
  ('c1000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 400, 6000, NULL),
  ('c1000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 40000, NULL),
  ('c1000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('c1000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('c1000000-0000-0000-0000-000000000101', 'psa_graded', 'limited', 5000, 300000, NULL),
  ('c1000000-0000-0000-0000-000000000101', 'oripa', 'in_stock', 500, 10000, NULL);

-- Hareruya2 Osu (Pokemon Specialty)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('c1000000-0000-0000-0000-000000000111', 'single_common', 'in_stock', 20, 500, NULL),
  ('c1000000-0000-0000-0000-000000000111', 'single_rare', 'in_stock', 500, 8000, 'Extensive selection'),
  ('c1000000-0000-0000-0000-000000000111', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('c1000000-0000-0000-0000-000000000111', 'single_sar', 'in_stock', 8000, 150000, NULL),
  ('c1000000-0000-0000-0000-000000000111', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('c1000000-0000-0000-0000-000000000111', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('c1000000-0000-0000-0000-000000000111', 'psa_graded', 'in_stock', 5000, 500000, 'PSA graded showcase'),
  ('c1000000-0000-0000-0000-000000000111', 'vintage_pack', 'limited', 30000, 300000, NULL),
  ('c1000000-0000-0000-0000-000000000111', 'accessories', 'in_stock', 300, 5000, 'Sleeves, deck boxes, playmats');

-- Toreca Camp Osu
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('c1000000-0000-0000-0000-000000000108', 'single_common', 'in_stock', 20, 500, NULL),
  ('c1000000-0000-0000-0000-000000000108', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('c1000000-0000-0000-0000-000000000108', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('c1000000-0000-0000-0000-000000000108', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('c1000000-0000-0000-0000-000000000108', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('c1000000-0000-0000-0000-000000000108', 'psa_graded', 'in_stock', 5000, 300000, 'Graded card showcase'),
  ('c1000000-0000-0000-0000-000000000108', 'oripa', 'in_stock', 500, 10000, 'Popular oripa selection');

-- Surugaya Osu TCG
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('c1000000-0000-0000-0000-000000000107', 'single_common', 'in_stock', 10, 300, 'Bargain pre-owned singles'),
  ('c1000000-0000-0000-0000-000000000107', 'single_rare', 'in_stock', 300, 6000, NULL),
  ('c1000000-0000-0000-0000-000000000107', 'single_sr', 'in_stock', 3000, 40000, NULL),
  ('c1000000-0000-0000-0000-000000000107', 'booster_box', 'in_stock', 5500, 8500, NULL),
  ('c1000000-0000-0000-0000-000000000107', 'vintage_pack', 'limited', 30000, 300000, 'Vintage finds occasionally');

-- Hareruya Osu (MTG focused)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('c1000000-0000-0000-0000-000000000110', 'single_rare', 'in_stock', 500, 5000, 'Primarily MTG, some Pokemon'),
  ('c1000000-0000-0000-0000-000000000110', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('c1000000-0000-0000-0000-000000000110', 'sealed_pack', 'in_stock', 180, 500, NULL);

-- Replay Nagoya Osu
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('c1000000-0000-0000-0000-000000000115', 'single_common', 'in_stock', 20, 400, NULL),
  ('c1000000-0000-0000-0000-000000000115', 'single_rare', 'in_stock', 400, 6000, NULL),
  ('c1000000-0000-0000-0000-000000000115', 'single_sr', 'in_stock', 2000, 30000, NULL),
  ('c1000000-0000-0000-0000-000000000115', 'booster_box', 'in_stock', 5200, 8000, 'Competitive prices on sealed'),
  ('c1000000-0000-0000-0000-000000000115', 'oripa', 'in_stock', 500, 10000, 'Good oripa selection');

-- Big Magic Nagoya
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('c1000000-0000-0000-0000-000000000106', 'single_rare', 'in_stock', 500, 8000, 'Primarily MTG, good Pokemon'),
  ('c1000000-0000-0000-0000-000000000106', 'single_sr', 'in_stock', 3000, 40000, NULL),
  ('c1000000-0000-0000-0000-000000000106', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('c1000000-0000-0000-0000-000000000106', 'vintage_pack', 'limited', 30000, 200000, NULL);
