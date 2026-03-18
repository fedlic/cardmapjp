-- ============================================================
-- Region: Tanukikoji/Susukino (Sapporo)
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'ac000000-0000-0000-0000-000000000001',
  'Tanukikoji/Susukino', '狸小路・すすきの', 'Sapporo', 'Hokkaido',
  43.05630000, 141.35070000, 14, true
);

-- ============================================================
-- Sapporo Shop 1: Pokemon Center Sapporo
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'ac000000-0000-0000-0000-000000000101',
  'ポケモンセンターサッポロ', 'Pokemon Center Sapporo',
  'ac000000-0000-0000-0000-000000000001',
  '北海道札幌市中央区北5条西4-7 大丸札幌店8階', 'Daimaru Sapporo 8F, Kita 5-jo Nishi 4-7, Chuo-ku, Sapporo, Hokkaido 060-0005',
  ST_MakePoint(141.3508, 43.0687)::geography,
  '{"cash","visa","mastercard","ic","qr"}',
  false, true, true, false, false, false, false, false,
  true, 4.2, 350,
  '011-232-3212', 'https://www.pokemon.co.jp/shop/pokecen/sapporo/',
  'The official Pokemon Center on the 8th floor of Daimaru department store, directly connected to JR Sapporo Station. Sells sealed Pokemon TCG packs, boxes, decks, and official accessories. Tax-free shopping available for purchases over 5,000 yen with passport. Limited Sapporo-exclusive Pokemon merch.',
  '• 10:00-20:00 daily (follows Daimaru Sapporo hours)
  • TCG cards are kept behind the counter -- ask staff to see them
  • Tax-free shopping over 5,000 yen with passport
  • Sapporo-exclusive Pokemon merch available
  • Staff may use translation apps to help foreign visitors
  • No singles -- sealed products and accessories only'
);

-- ============================================================
-- Sapporo Shop 2: Card Labo Sapporo
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ac000000-0000-0000-0000-000000000102',
  'カードラボ 札幌店', 'Card Labo Sapporo',
  'ac000000-0000-0000-0000-000000000001',
  '北海道札幌市中央区南2条西1-5 丸大ビル4階', 'Marudai Bldg 4F, Minami 2-jo Nishi 1-5, Chuo-ku, Sapporo, Hokkaido 060-0062',
  ST_MakePoint(141.3557, 43.0589)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, false, false, false,
  true, 3.8, 250,
  '011-596-0520', 'https://www.c-labo.jp/shop/sapporo/', 'sappo_labo',
  'A major chain card shop in the same building as Animate and Lashinban, near Odori Station. Has a 64-seat duel space. Good selection of singles including Pokemon, with original packs (oripa) and gacha machines. Prices are generally fair.',
  '• 12:00-21:00 daily (buy-back until 20:30)
  • 64-seat duel space available
  • Walk from Odori Station exit 36
  • Same building as Animate and Lashinban for anime goods browsing
  • Strong oripa and gacha machine selection'
);

-- ============================================================
-- Sapporo Shop 3: TC Batoloco Sapporo Tanukikoji
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ac000000-0000-0000-0000-000000000103',
  'トーナメントセンター バトロコ 札幌狸小路', 'TC Batoloco Sapporo Tanukikoji',
  'ac000000-0000-0000-0000-000000000001',
  '北海道札幌市中央区南3条西4丁目12-1 MEGAドン・キホーテ札幌狸小路本店4F', 'MEGA Don Quijote Sapporo Tanukikoji 4F, Minami 3-jo Nishi 4-12-1, Chuo-ku, Sapporo, Hokkaido 060-0063',
  ST_MakePoint(141.3507, 43.0563)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, false, false, false,
  true, 3.7, 200,
  '011-218-0120', 'https://bato-loco.com/1806info/', 'batoloco_sappor',
  'Located on the 4th floor of the MEGA Don Quijote building in Tanukikoji shopping arcade. Known for having one of the largest duel/battle spaces in Sapporo with daily tournaments. Singles prices tend to be slightly higher than competitors.',
  '• Mon-Fri 13:00-22:00, Sat/Sun/Holidays 10:00-22:00
  • One of the largest battle spaces in Sapporo
  • Daily tournaments held
  • Don Quijote downstairs is open late -- great tourist stop
  • About 3 minutes walk from the Tanukikoji tram stop'
);

-- ============================================================
-- Sapporo Shop 4: Yellow Submarine Sapporo GAME SHOP
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ac000000-0000-0000-0000-000000000104',
  'イエローサブマリン 札幌GAME SHOP', 'Yellow Submarine Sapporo GAME SHOP',
  'ac000000-0000-0000-0000-000000000001',
  '北海道札幌市中央区南3条西4丁目12-1 MEGAドン・キホーテ札幌狸小路本店4F', 'MEGA Don Quijote Sapporo Tanukikoji 4F, Minami 3-jo Nishi 4-12-1, Chuo-ku, Sapporo, Hokkaido 060-0063',
  ST_MakePoint(141.3507, 43.0563)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, false, true, false, false,
  true, 3.9, 200,
  '011-213-6003', 'https://yellowsubmarine.co.jp/shop/%E6%9C%AD%E5%B9%8Cgame-shop/', 'YS_SAPPORO1',
  'On the same 4th floor as Batoloco inside the MEGA Don Quijote building. Strong selection of modern Pokemon singles including SAR and alternate art cards at reasonable prices. A well-known national chain so quality is consistent.',
  '• Mon-Thu 11:00-21:00, Fri-Sun/Holidays 10:00-21:00
  • Same floor as Batoloco in Don Quijote building
  • Strong SAR and alternate art card selection
  • Some reviewers report helpful service toward foreign customers
  • Also carries MTG, Yu-Gi-Oh, and other TCGs'
);

-- ============================================================
-- Sapporo Shop 5: MINT Sapporo
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'ac000000-0000-0000-0000-000000000105',
  'ミント 札幌店', 'MINT Sapporo',
  'ac000000-0000-0000-0000-000000000001',
  '北海道札幌市中央区南3条西4丁目12-1 MEGAドン・キホーテ札幌狸小路本店4F', 'MEGA Don Quijote Sapporo Tanukikoji 4F, Minami 3-jo Nishi 4-12-1, Chuo-ku, Sapporo, Hokkaido 060-0063',
  ST_MakePoint(141.3507, 43.0563)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true, true, true,
  true, 3.7, 180,
  '011-241-6636', 'https://mint-web.jp/?pid=144516844',
  'Japan''s largest trading card specialty chain. Also on the 4th floor of Don Quijote Tanukikoji. Carries both Japanese and some English cards, PSA graded cards, and vintage sealed product. Great for collectors looking for specific chase cards or graded items.',
  '• 11:00-21:00 daily
  • Carries English cards and PSA graded cards
  • Vintage sealed product available
  • Online store (mint-mall.net) lets you browse inventory before visiting
  • Same 4F floor as Batoloco and Yellow Submarine'
);

-- ============================================================
-- Sapporo Shop 6: Amenity Dream Sapporo
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'ac000000-0000-0000-0000-000000000106',
  'アメニティードリーム 札幌店', 'Amenity Dream Sapporo',
  'ac000000-0000-0000-0000-000000000001',
  '北海道札幌市中央区南3条西3-11 N・MESSEビル B1F', 'N-MESSE Bldg B1F, Minami 3-jo Nishi 3-11, Chuo-ku, Sapporo, Hokkaido 060-0063',
  ST_MakePoint(141.3525, 43.0566)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, false, false, false,
  true, 3.6, 150,
  '011-596-9059', 'https://amenitydream.co.jp/shop/hokkaido-sapporo/',
  'Basement-level shop about 2 minutes walk from Susukino Station exit 1. Known for relatively affordable singles prices and competitive buy-back rates. A well-regarded national TCG chain.',
  '• 12:00-21:00 daily
  • About 2 minutes from Susukino Station exit 1
  • Known for affordable singles and competitive buy-back rates
  • Basement location -- look for building entrance on street level
  • Take stairs or elevator down to B1F'
);

-- ============================================================
-- Sapporo Shop 7: Full Comp PLAYERS CENTER Sapporo
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ac000000-0000-0000-0000-000000000107',
  'フルコンプ PLAYERS CENTER 札幌駅前店', 'Full Comp PLAYERS CENTER Sapporo Station',
  'ac000000-0000-0000-0000-000000000001',
  '北海道札幌市中央区北4条西2丁目1-25 札幌TRビル8F', 'Sapporo TR Bldg 8F, Kita 4-jo Nishi 2-1-25, Chuo-ku, Sapporo, Hokkaido 060-0004',
  ST_MakePoint(141.3547, 43.0672)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, false, false, false,
  true, 3.8, 200,
  '011-208-2652', 'https://inspire-jp.net/fc-sapporo/', 'fc_sapporo',
  'Located just 1 minute walk from Sapporo subway station. Has a massive 200-seat duel space and hosts frequent tournaments. Opened in late 2023 as Full Comp''s first Hokkaido location. Good selection of Pokemon singles and sealed product.',
  '• Weekdays 11:00-21:00, Sat/Sun/Holidays 10:00-21:00
  • 200-seat duel space with frequent tournaments
  • 1 minute from Sapporo subway station
  • Very convenient if arriving by train at JR Sapporo Station
  • Full Comp''s first Hokkaido location'
);

-- ============================================================
-- Sapporo Shop 8: TC Batoloco Sapporo Odori
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ac000000-0000-0000-0000-000000000108',
  'トーナメントセンター バトロコ 札幌大通', 'TC Batoloco Sapporo Odori',
  'ac000000-0000-0000-0000-000000000001',
  '北海道札幌市中央区南2条西2丁目 Mパークビルディング4階', 'M Park Building 4F, Minami 2-jo Nishi 2, Chuo-ku, Sapporo, Hokkaido 060-0062',
  ST_MakePoint(141.3544, 43.0585)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, false, false, false,
  true, 3.6, 120,
  '011-206-9441', 'https://bato-loco.com/1829info/', 'batoloco_odr',
  'Batoloco''s second Sapporo location, about 2 minutes from Odori Station. Newer and smaller than the Tanukikoji branch. Good duel space for playing.',
  '• Weekdays 14:00-20:00, Sat/Sun/Holidays 10:00-20:00 (buy-back until 19:00)
  • Note shorter weekday hours (opens at 14:00)
  • About 2 minutes from Odori Station
  • Convenient to combine with nearby Card Labo visit'
);

-- ============================================================
-- Sapporo Shop 9: Mandarake Sapporo
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'ac000000-0000-0000-0000-000000000109',
  'まんだらけ 札幌店', 'Mandarake Sapporo',
  'ac000000-0000-0000-0000-000000000001',
  '北海道札幌市中央区南3条西5丁目1-1 ノルベサ2F', 'nORBESA 2F, Minami 3-jo Nishi 5-1-1, Chuo-ku, Sapporo, Hokkaido 060-0063',
  ST_MakePoint(141.3490, 43.0560)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, false, true, false, false,
  3.9, 250,
  '011-207-7773', 'https://www.mandarake.co.jp/dir/spr/',
  'Japan''s most famous secondhand otaku goods chain. Specializes in vintage and rare singles -- some sold as complete sets with sealed product. Great for collectors hunting older Pokemon cards from Base Set era onwards.',
  '• 12:00-20:00 daily (buy-back until 19:30)
  • Located on 2F of nORBESA (building with the Ferris wheel)
  • Specializes in vintage and rare Pokemon cards
  • Surugaya is on 3F of same building -- visit both
  • West end of Tanukikoji arcade'
);

-- ============================================================
-- Sapporo Shop 10: Surugaya Sapporo nORBESA
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ac000000-0000-0000-0000-000000000110',
  '駿河屋 札幌ノルベサ店', 'Surugaya Sapporo nORBESA',
  'ac000000-0000-0000-0000-000000000001',
  '北海道札幌市中央区南3条西5丁目1-1 ノルベサ3F', 'nORBESA 3F, Minami 3-jo Nishi 5-1-1, Chuo-ku, Sapporo, Hokkaido 060-0063',
  ST_MakePoint(141.3490, 43.0560)::geography,
  '{"cash","visa","mastercard","ic","qr"}',
  true, true, true, true, false, true, false, false,
  true, 3.5, 200,
  '011-205-3336', 'https://www.suruga-ya.jp/feature/realstore/sapporo/index.html', 'suruga_norbesa',
  'A major secondhand hobby chain. 3rd floor of nORBESA has a dedicated trading card section with a huge collection of Pokemon TCG including both modern and vintage Japanese sealed booster boxes and singles. Open until 22:00.',
  '• 11:00-22:00 daily (TCG area until 22:00)
  • Open later than most card shops -- great for late-night shopping
  • One floor above Mandarake -- visit both stores easily
  • nORBESA building is at the west end of Tanukikoji arcade
  • Modern and vintage Japanese sealed boxes and singles'
);

-- ============================================================
-- Sapporo Shop 11: BOOKOFF Sapporo Minami 2-jo
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ac000000-0000-0000-0000-000000000111',
  'ブックオフ 札幌南2条店', 'BOOKOFF Sapporo Minami 2-jo',
  'ac000000-0000-0000-0000-000000000001',
  '北海道札幌市中央区南2条西1-3', 'Minami 2-jo Nishi 1-3, Chuo-ku, Sapporo, Hokkaido 060-0062',
  ST_MakePoint(141.3560, 43.0590)::geography,
  '{"cash","visa","mastercard","ic","qr"}',
  true, true, true, true, false, true, false, false,
  true, 3.5, 180,
  '011-200-5777', 'https://www.bookoff.co.jp/shop/shop20374.html', 'toreka20374',
  'Japan''s biggest secondhand bookstore chain. This central Sapporo location has a dedicated trading card section (''Toreka-kan'') with Pokemon, Yu-Gi-Oh, and One Piece cards. Prices are often lower than specialty card shops.',
  '• 10:00-21:00 daily
  • Dedicated trading card section (Toreka-kan)
  • Prices often lower than specialty card shops -- good budget option
  • Easy to browse casually without pressure
  • Tax-free shopping may be available for tourists'
);

-- ============================================================
-- Sapporo Shop Inventory Data
-- ============================================================

-- MINT Sapporo (wide range including graded and English)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ac000000-0000-0000-0000-000000000105', 'single_common', 'in_stock', 20, 500, NULL),
  ('ac000000-0000-0000-0000-000000000105', 'single_rare', 'in_stock', 500, 8000, 'English cards also available'),
  ('ac000000-0000-0000-0000-000000000105', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('ac000000-0000-0000-0000-000000000105', 'single_sar', 'in_stock', 8000, 150000, NULL),
  ('ac000000-0000-0000-0000-000000000105', 'booster_box', 'in_stock', 5200, 8000, 'Current sets available'),
  ('ac000000-0000-0000-0000-000000000105', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('ac000000-0000-0000-0000-000000000105', 'psa_graded', 'in_stock', 5000, 500000, 'PSA graded showcase'),
  ('ac000000-0000-0000-0000-000000000105', 'vintage_pack', 'limited', 30000, 300000, 'Vintage sealed when available'),
  ('ac000000-0000-0000-0000-000000000105', 'oripa', 'in_stock', 500, 10000, 'Various price tiers');

-- Card Labo Sapporo
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ac000000-0000-0000-0000-000000000102', 'single_common', 'in_stock', 20, 500, NULL),
  ('ac000000-0000-0000-0000-000000000102', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('ac000000-0000-0000-0000-000000000102', 'single_sr', 'in_stock', 3000, 40000, NULL),
  ('ac000000-0000-0000-0000-000000000102', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('ac000000-0000-0000-0000-000000000102', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('ac000000-0000-0000-0000-000000000102', 'oripa', 'in_stock', 500, 5000, 'Gacha machines also available');

-- Mandarake Sapporo (vintage focused)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ac000000-0000-0000-0000-000000000109', 'single_rare', 'in_stock', 1000, 20000, 'Curated vintage selection'),
  ('ac000000-0000-0000-0000-000000000109', 'single_sr', 'in_stock', 5000, 100000, NULL),
  ('ac000000-0000-0000-0000-000000000109', 'vintage_pack', 'limited', 50000, 500000, 'Vintage packs when available'),
  ('ac000000-0000-0000-0000-000000000109', 'vintage_box', 'limited', 200000, 2000000, 'Rare sealed vintage boxes');

-- Full Comp PLAYERS CENTER Sapporo
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ac000000-0000-0000-0000-000000000107', 'single_common', 'in_stock', 20, 500, NULL),
  ('ac000000-0000-0000-0000-000000000107', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('ac000000-0000-0000-0000-000000000107', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('ac000000-0000-0000-0000-000000000107', 'booster_box', 'in_stock', 5200, 8000, 'Current sets always available'),
  ('ac000000-0000-0000-0000-000000000107', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('ac000000-0000-0000-0000-000000000107', 'oripa', 'in_stock', 500, 5000, NULL);

-- ============================================================
-- Region: Sendai Station (Sendai)
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'ad000000-0000-0000-0000-000000000001',
  'Sendai Station', '仙台駅', 'Sendai', 'Miyagi',
  38.26030000, 140.88220000, 15, true
);

-- ============================================================
-- Sendai Shop 1: Pokemon Center Tohoku
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'ad000000-0000-0000-0000-000000000101',
  'ポケモンセンタートウホク', 'Pokemon Center Tohoku',
  'ad000000-0000-0000-0000-000000000001',
  '宮城県仙台市青葉区中央1丁目2-3 仙台PARCO本館3F', 'Sendai PARCO Main Bldg 3F, 1-2-3 Chuo, Aoba-ku, Sendai, Miyagi 980-0021',
  ST_MakePoint(140.8822, 38.2603)::geography,
  '{"cash","visa","mastercard","ic","qr"}',
  false, true, true, false, false, false, false, false,
  true, 4.3, 400,
  '022-716-6870', 'https://www.pokemon.co.jp/shop/pokecen/tohoku/',
  'The official Pokemon Center for the Tohoku region, on the 3rd floor of Sendai PARCO (3 minutes from JR Sendai Station west exit). Reopened after a March 2025 renovation with Tohoku festival-inspired interior. Victini is the store mascot. Sells sealed TCG packs, boxes, decks, and official accessories.',
  '• 10:00-20:30 daily (follows Sendai PARCO hours)
  • 3 minutes walk from JR Sendai Station west exit
  • Renovated in March 2025 with Tohoku festival-inspired interior
  • Tax-free shopping over 5,000 yen with passport
  • Tohoku-exclusive Pokemon merch available
  • No singles -- sealed products and accessories only'
);

-- ============================================================
-- Sendai Shop 2: Card Labo Sendai
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ad000000-0000-0000-0000-000000000102',
  'カードラボ 仙台店', 'Card Labo Sendai',
  'ad000000-0000-0000-0000-000000000001',
  '宮城県仙台市青葉区中央4丁目1-1 仙台駅前イービーンズ8F', 'E BeanS 8F, 4-1-1 Chuo, Aoba-ku, Sendai, Miyagi 980-0021',
  ST_MakePoint(140.8791, 38.2586)::geography,
  8, '8F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, false, false, false,
  true, 3.7, 250,
  '022-748-6439', 'https://www.c-labo.jp/shop/sendai/', 'sendai_labo',
  'Located on the 8th floor of E BeanS department store. Claims to be Tohoku''s largest card selection. Has a massive 116-seat duel space after a February 2025 renovation. Carries Pokemon, Yu-Gi-Oh, One Piece, and many other TCGs.',
  '• 10:00-20:00 daily
  • 116-seat duel space (renovated Feb 2025)
  • Tohoku''s largest card selection
  • E BeanS building directly connected to station pedestrian deck
  • MINT is on 1F of same building -- visit both'
);

-- ============================================================
-- Sendai Shop 3: MINT Sendai
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'ad000000-0000-0000-0000-000000000103',
  'ミント 仙台店', 'MINT Sendai',
  'ad000000-0000-0000-0000-000000000001',
  '宮城県仙台市青葉区中央4丁目1-1 EBeanS 1F', 'E BeanS 1F, 4-1-1 Chuo, Aoba-ku, Sendai, Miyagi 980-0021',
  ST_MakePoint(140.8791, 38.2586)::geography,
  1, '1F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true, true, true,
  true, 3.8, 200,
  '022-712-1545', 'https://mint-web.jp/?pid=4244704',
  'Japan''s largest card specialty chain on the 1st floor of E BeanS. Very wide selection including sports cards, Pokemon, and idol cards. Carries PSA graded cards, vintage product, and some English-language cards. Convenient 1st floor location.',
  '• 10:00-20:00 daily
  • 1F of same E BeanS building as Card Labo (8F)
  • Carries English cards and PSA graded cards
  • Vintage sealed product available
  • Directly connected to Sendai Station pedestrian deck'
);

-- ============================================================
-- Sendai Shop 4: Seagull Sendai Station
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ad000000-0000-0000-0000-000000000104',
  'シーガル 仙台駅前店', 'Seagull Sendai Station',
  'ad000000-0000-0000-0000-000000000001',
  '宮城県仙台市青葉区中央3丁目6-1 仙台TRビル地下1階', 'Sendai TR Bldg B1F, 3-6-1 Chuo, Aoba-ku, Sendai, Miyagi 980-0021',
  ST_MakePoint(140.8796, 38.2607)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, false, false, false, false,
  true, 3.7, 200,
  '022-281-9743', 'http://www.seagull-jp.com/shop/sendaiekimae.html', 'seagullhbekimae',
  'Basement-level shop with a large 66-seat duel space where food and drinks are allowed. Open until 22:00 which is later than most card shops. Emphasizes high buy-back prices for valuable cards.',
  '• 10:00-22:00 daily
  • 66-seat duel space (food and drinks allowed)
  • Open until 22:00 -- great for late evening card shopping
  • Near Sendai Station west exit
  • High buy-back prices for valuable cards'
);

-- ============================================================
-- Sendai Shop 5: Full Comp PLAYERS CENTER Sendai
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ad000000-0000-0000-0000-000000000105',
  'フルコンプ PLAYERS CENTER 仙台駅前店', 'Full Comp PLAYERS CENTER Sendai Station',
  'ad000000-0000-0000-0000-000000000001',
  '宮城県仙台市青葉区中央2丁目1-27 Ever-i中央ビル3F', 'Ever-i Chuo Bldg 3F, 2-1-27 Chuo, Aoba-ku, Sendai, Miyagi 980-0021',
  ST_MakePoint(140.8781, 38.2614)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, false, false, false,
  true, 3.7, 180,
  '022-721-2622', 'https://inspire-jp.net/fc-sendai/', 'fc_sendaieki',
  'Full Comp''s Tohoku debut store. Specializes in TCG sales and buy-back with a focus on Pokemon, Yu-Gi-Oh, One Piece, and Duel Masters. Has a duel space and hosts regular events. The chain is well known in Tokyo (Akihabara) for its deep Pokemon card inventory.',
  '• Weekdays 12:00-21:00, Sat/Sun/Holidays 11:00-21:00
  • Full Comp''s Tohoku debut store
  • About 5 minutes walk west of Sendai Station
  • Duel space with regular events
  • Well known in Akihabara for deep Pokemon inventory'
);

-- ============================================================
-- Sendai Shop 6: TC Batoloco Sendai Station East Exit
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ad000000-0000-0000-0000-000000000106',
  'トーナメントセンター バトロコ 仙台駅東口', 'TC Batoloco Sendai Station East Exit',
  'ad000000-0000-0000-0000-000000000001',
  '宮城県仙台市宮城野区榴岡2丁目1-12 KIビル8F', 'KI Bldg 8F, 2-1-12 Tsutsujigaoka, Miyagino-ku, Sendai, Miyagi 983-0852',
  ST_MakePoint(140.8876, 38.2608)::geography,
  8, '8F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, false, false, false,
  true, 3.8, 150,
  '022-794-8952', 'https://bato-loco.com/', 'batoloco_SND',
  'Tournament-focused card shop on the east side of Sendai Station with multiple daily events. 8th floor of the KI Building. Known for competitive play atmosphere.',
  '• Weekdays 12:00-21:00, Sat/Sun/Holidays 10:00-21:00 (buy-back until 20:00)
  • 2 minutes from Sendai Station east exit
  • Tournament-focused with multiple daily events
  • Good if staying at a hotel on the east side of the station'
);

-- ============================================================
-- Sendai Shop 7: Toreka Douraku Sendai Arcade
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ad000000-0000-0000-0000-000000000107',
  'トレカ道楽 仙台駅前アーケード店', 'Toreka Douraku Sendai Arcade',
  'ad000000-0000-0000-0000-000000000001',
  '宮城県仙台市青葉区一番町3丁目10-25', '3-10-25 Ichibancho, Aoba-ku, Sendai, Miyagi 980-0811',
  ST_MakePoint(140.8718, 38.2596)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true, true, false,
  true, 3.9, 200,
  '070-6624-7926', 'Dourakusendai',
  'Located in the Vlandome Ichibancho shopping arcade. Focuses primarily on Pokemon and One Piece cards. Known for a large PSA graded card inventory -- a great shop for graded Pokemon cards.',
  '• Weekdays 11:00-20:00, Sat/Sun/Holidays 11:00-21:00
  • About 3 minutes from Aoba-dori Ichibancho subway station
  • Large PSA graded card inventory
  • Located in covered Vlandome Ichibancho shopping arcade
  • Focuses on Pokemon and One Piece cards'
);

-- ============================================================
-- Sendai Shop 8: Mandai Toreka Sendai Station
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ad000000-0000-0000-0000-000000000108',
  'マンダイトレカ 仙台駅前店', 'Mandai Toreka Sendai Station',
  'ad000000-0000-0000-0000-000000000001',
  '宮城県仙台市青葉区中央1丁目10-10 仙台ロフト2F', 'Sendai Loft 2F, 1-10-10 Chuo, Aoba-ku, Sendai, Miyagi 980-0021',
  ST_MakePoint(140.8803, 38.2623)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, false, false, false,
  true, 3.5, 150,
  '022-395-8526', 'https://shop.mandai-s.jp/stores/14', 'mandaitcg_sd',
  'Located on the 2nd floor of Sendai Loft building, about 3 minutes walk from JR Sendai Station. Part of the Mandai chain specializing in trading cards. Good for Pokemon and One Piece singles.',
  '• 11:00-19:00 daily (buy-back until 18:00)
  • Note early closing time at 19:00
  • About 3 minutes from JR Sendai Station
  • Check their Twitter for daily buy-back price updates'
);

-- ============================================================
-- Sendai Shop 9: Mandai Toreka Sendai Clis Road
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ad000000-0000-0000-0000-000000000109',
  'マンダイトレカ 仙台クリスロード店', 'Mandai Toreka Sendai Clis Road',
  'ad000000-0000-0000-0000-000000000001',
  '宮城県仙台市青葉区中央2丁目5-5 くさのやビル1F', 'Kusanoya Bldg 1F, 2-5-5 Chuo, Aoba-ku, Sendai, Miyagi 980-0021',
  ST_MakePoint(140.8760, 38.2601)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, false, false, false,
  true, 3.6, 130,
  '022-796-6158', 'https://shop.mandai-s.jp/stores/15', 'mandaitcg_cr',
  'Located on the ground floor of Clis Road covered shopping arcade. Better hours than the Sendai Station Mandai branch. Easy to find while walking the arcade. Good for Pokemon and One Piece singles.',
  '• 10:00-21:00 daily
  • Ground floor of Clis Road covered shopping arcade
  • Better hours than the Sendai Station branch
  • Easy to find while walking the arcade'
);

-- ============================================================
-- Sendai Shop 10: Pokedou Sendai
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ad000000-0000-0000-0000-000000000110',
  'ポケ堂 仙台店', 'Pokedou Sendai',
  'ad000000-0000-0000-0000-000000000001',
  '宮城県仙台市青葉区一番町3-11-15 仙台フォーラス7F', 'Sendai FORUS 7F, 3-11-15 Ichibancho, Aoba-ku, Sendai, Miyagi 980-0811',
  ST_MakePoint(140.8715, 38.2592)::geography,
  7, '7F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true, true, false,
  true, 3.8, 180,
  '022-748-6088', 'https://pokekadou.official.ec/', 'pokedoutencho_s',
  'Tohoku''s only dedicated Pokemon Card specialty shop -- sells ONLY Pokemon cards. Located on the 7th floor of Sendai FORUS mall. Exceptional knowledge and selection. Staff can accurately appraise every Pokemon card. Also has an online store.',
  '• Weekdays 12:00-20:00, Sat/Sun/Holidays 10:00-20:00
  • ONLY Pokemon cards -- the most specialized shop in Tohoku
  • 1 minute from Hirose-dori subway station
  • Staff with exceptional Pokemon card knowledge
  • Online store available to check inventory beforehand'
);

-- ============================================================
-- Sendai Shop 11: BOOKOFF Sendai Clis Road
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'ad000000-0000-0000-0000-000000000111',
  'ブックオフ 仙台クリスロード店', 'BOOKOFF Sendai Clis Road',
  'ad000000-0000-0000-0000-000000000001',
  '宮城県仙台市青葉区中央2丁目4-10 ガレリアクリスロード1F-4F', 'Galleria Clis Road 1F-4F, 2-4-10 Chuo, Aoba-ku, Sendai, Miyagi 980-0021',
  ST_MakePoint(140.8768, 38.2601)::geography,
  '{"cash","visa","mastercard","ic","qr"}',
  true, true, true, true, false, true, false, false,
  true, 3.4, 200,
  '022-716-7015', 'https://www.bookoff.co.jp/shop/shop20550.html',
  'A large multi-floor BOOKOFF in the Clis Road shopping arcade. Has a trading card section with Pokemon, Yu-Gi-Oh, and more. Prices tend to be cheaper than dedicated card shops. Good budget option.',
  '• 10:00-21:00 daily
  • Multi-floor store in Clis Road shopping arcade
  • About 3 minutes from Hirose-dori Station
  • Prices cheaper than dedicated card shops -- good budget option
  • Tax-free shopping may be available for tourists'
);

-- ============================================================
-- Sendai Shop Inventory Data
-- ============================================================

-- MINT Sendai (wide range including graded and English)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ad000000-0000-0000-0000-000000000103', 'single_common', 'in_stock', 20, 500, NULL),
  ('ad000000-0000-0000-0000-000000000103', 'single_rare', 'in_stock', 500, 8000, 'English cards also available'),
  ('ad000000-0000-0000-0000-000000000103', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('ad000000-0000-0000-0000-000000000103', 'single_sar', 'in_stock', 8000, 150000, NULL),
  ('ad000000-0000-0000-0000-000000000103', 'booster_box', 'in_stock', 5200, 8000, 'Current sets available'),
  ('ad000000-0000-0000-0000-000000000103', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('ad000000-0000-0000-0000-000000000103', 'psa_graded', 'in_stock', 5000, 500000, 'PSA graded showcase'),
  ('ad000000-0000-0000-0000-000000000103', 'vintage_pack', 'limited', 30000, 300000, NULL);

-- Card Labo Sendai
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ad000000-0000-0000-0000-000000000102', 'single_common', 'in_stock', 20, 500, NULL),
  ('ad000000-0000-0000-0000-000000000102', 'single_rare', 'in_stock', 500, 8000, 'Tohoku''s largest selection'),
  ('ad000000-0000-0000-0000-000000000102', 'single_sr', 'in_stock', 3000, 40000, NULL),
  ('ad000000-0000-0000-0000-000000000102', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('ad000000-0000-0000-0000-000000000102', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('ad000000-0000-0000-0000-000000000102', 'oripa', 'in_stock', 500, 5000, NULL);

-- Pokedou Sendai (Pokemon specialist)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ad000000-0000-0000-0000-000000000110', 'single_common', 'in_stock', 20, 500, 'Pokemon-only specialist'),
  ('ad000000-0000-0000-0000-000000000110', 'single_rare', 'in_stock', 500, 10000, 'Expert curation'),
  ('ad000000-0000-0000-0000-000000000110', 'single_sr', 'in_stock', 3000, 60000, NULL),
  ('ad000000-0000-0000-0000-000000000110', 'single_sar', 'in_stock', 8000, 200000, NULL),
  ('ad000000-0000-0000-0000-000000000110', 'psa_graded', 'in_stock', 5000, 300000, 'Graded Pokemon cards'),
  ('ad000000-0000-0000-0000-000000000110', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('ad000000-0000-0000-0000-000000000110', 'vintage_pack', 'limited', 30000, 500000, 'Vintage packs when available'),
  ('ad000000-0000-0000-0000-000000000110', 'oripa', 'in_stock', 500, 10000, 'Pokemon-focused oripa');

-- Toreka Douraku Sendai Arcade (graded specialist)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ad000000-0000-0000-0000-000000000107', 'single_rare', 'in_stock', 500, 10000, NULL),
  ('ad000000-0000-0000-0000-000000000107', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('ad000000-0000-0000-0000-000000000107', 'psa_graded', 'in_stock', 5000, 500000, 'Large PSA graded inventory'),
  ('ad000000-0000-0000-0000-000000000107', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('ad000000-0000-0000-0000-000000000107', 'vintage_pack', 'limited', 30000, 300000, NULL),
  ('ad000000-0000-0000-0000-000000000107', 'oripa', 'in_stock', 500, 10000, NULL);
