-- ============================================================
-- Kanto Suburbs: Yokohama, Omiya, Chiba, Machida, Tachikawa
-- Pokemon Card Shop Seed Data
-- ============================================================

-- ============================================================
-- Region: Yokohama Station
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'e1000000-0000-0000-0000-000000000001',
  'Yokohama Station', '横浜駅', 'Yokohama', 'Kanagawa',
  35.46620000, 139.62210000, 15, true
);

-- ============================================================
-- Region: Omiya Station
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'e2000000-0000-0000-0000-000000000001',
  'Omiya Station', '大宮駅', 'Saitama', 'Saitama',
  35.90300000, 139.62900000, 15, true
);

-- ============================================================
-- Region: Chiba Station
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'e3000000-0000-0000-0000-000000000001',
  'Chiba Station', '千葉駅', 'Chiba', 'Chiba',
  35.61070000, 140.11370000, 15, true
);

-- ============================================================
-- Region: Machida Station
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'e4000000-0000-0000-0000-000000000001',
  'Machida Station', '町田駅', 'Machida', 'Tokyo',
  35.54240000, 139.44550000, 15, true
);

-- ============================================================
-- Region: Tachikawa Station
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'e5000000-0000-0000-0000-000000000001',
  'Tachikawa Station', '立川駅', 'Tachikawa', 'Tokyo',
  35.69710000, 139.41330000, 15, true
);


-- ############################################################
--  YOKOHAMA SHOPS (8 shops)
-- ############################################################

-- ============================================================
-- Yokohama Shop 1: Card Shop Ryusei no PAO Yokohama
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e1000000-0000-0000-0000-000000000101',
  'カードショップ竜星のPAO 横浜店', 'Card Shop Ryusei no PAO Yokohama',
  'e1000000-0000-0000-0000-000000000001',
  '神奈川県横浜市西区南幸1-5-39 太洋ビル6F', 'Taiyo Building 6F, 1-5-39 Minamiosaiwai, Nishi-ku, Yokohama 220-0005',
  ST_MakePoint(139.6187, 35.4650)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.8, 250,
  '045-577-4380', 'https://pao-toreka.com/shop/yokohama.html', 'PAOtoreka_yoko',
  'Large PAO chain store 2 min from Yokohama Station south-west exit. Daily Pokemon gym battles at 17:00. Tablet search system for finding specific singles. Well-stocked with current and recent sets.',
  '• Daily 10:00-20:00, year-round
  • 2 min walk from Yokohama Station (Sotetsu Line side)
  • Daily Pokemon gym battles at 17:00
  • Tablet search available for singles inventory
  • Good first stop for Yokohama card shopping'
);

-- ============================================================
-- Yokohama Shop 2: Fullcomp Yokohama
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e1000000-0000-0000-0000-000000000102',
  'フルコンプ 横浜店', 'Fullcomp Yokohama',
  'e1000000-0000-0000-0000-000000000001',
  '神奈川県横浜市西区南幸2-8-9 ブライト横浜ビル2F', 'Bright Yokohama Building 2F, 2-8-9 Minamiosaiwai, Nishi-ku, Yokohama 220-0005',
  ST_MakePoint(139.6149, 35.4636)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.7, 200,
  '045-314-2652', 'https://www.fullcomp.jp/yokohama/', 'fullcomp_yoko',
  'National TCG chain about 8 min walk from Yokohama Station west exit. Sells Pokemon card singles, booster boxes, and original packs (oripa). Duel space available for casual and tournament play.',
  '• Weekdays 13:00-21:00, Sat/Sun/Holidays 11:00-21:00
  • 8 min walk from Yokohama Station west exit
  • Duel space available
  • Oripa (original packs) available
  • Buyback accepted until 30 min before closing'
);

-- ============================================================
-- Yokohama Shop 3: Hobby Station Yokohama
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e1000000-0000-0000-0000-000000000103',
  'ホビーステーション 横浜店', 'Hobby Station Yokohama',
  'e1000000-0000-0000-0000-000000000001',
  '神奈川県横浜市西区南幸2-16-20 オーチュー横浜ビル9F', 'Ochu Yokohama Building 9F, 2-16-20 Minamiosaiwai, Nishi-ku, Yokohama 220-0005',
  ST_MakePoint(139.6133, 35.4629)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.9, 280,
  '045-577-3899', 'https://www.hbst.net/shop/21/', 'hbstyokohama2',
  'Major TCG chain store on 9F, 5 min walk from Yokohama Station. Well-organized singles with duel space. Good for beginners with regular tournament events across all major TCG titles.',
  '• Weekdays 12:00-21:00, Sat/Sun/Holidays 10:00-20:00
  • 5 min walk from Yokohama Station
  • Located on 9F — take the elevator
  • Duel space with regular tournament events
  • Well-organized singles inventory'
);

-- ============================================================
-- Yokohama Shop 4: Toreka Park Yokohama Nishiguchi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e1000000-0000-0000-0000-000000000104',
  'トレカパーク 横浜西口店', 'Toreka Park Yokohama Nishiguchi',
  'e1000000-0000-0000-0000-000000000001',
  '神奈川県横浜市西区岡野1-12-14 石川ビル3F', 'Ishikawa Building 3F, 1-12-14 Okano, Nishi-ku, Yokohama 220-0073',
  ST_MakePoint(139.6108, 35.4621)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.8, 200,
  '045-316-4605', 'https://www.furu1.net/shop/shop0140.html', 'torepa_hamanisi',
  'Operated by Furuichi (used bookstore chain). Best supply/accessories selection near Yokohama Station. Friendly staff and beginner-welcoming atmosphere. About 10 min walk from west exit.',
  '• Mon-Thu 11:00-21:00, Fri-Sun/Holidays 10:00-21:00
  • 10 min walk from Yokohama Station west exit via Okano intersection
  • Best accessories and supply selection in Yokohama
  • Beginner-friendly atmosphere with helpful staff
  • Run by Furuichi chain (used bookstores)'
);

-- ============================================================
-- Yokohama Shop 5: Card Box Yokohama Nishiguchi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e1000000-0000-0000-0000-000000000105',
  'カードボックス 横浜西口店', 'Card Box Yokohama Nishiguchi',
  'e1000000-0000-0000-0000-000000000001',
  '神奈川県横浜市西区南幸2-12-5 城勘ビル2F', 'Jokan Building 2F, 2-12-5 Minamiosaiwai, Nishi-ku, Yokohama 220-0005',
  ST_MakePoint(139.6142, 35.4631)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.7, 180,
  'https://cardbox.online/shop/detail/5003/', 'CARDBOXYOKOHAMA',
  'Part of the Card Box chain with 3 locations near Yokohama Station. Late closing at 22:00 is convenient for evening visits. Duel space available. 8 min walk from station.',
  '• Mon-Thu 12:00-22:00, Fri 11:00-22:00, Sat/Sun/Holidays 10:00-22:00
  • Late closing at 22:00 — great for evening visits
  • 8 min walk from Yokohama Station
  • Duel space available
  • Buyback service until 20:00'
);

-- ============================================================
-- Yokohama Shop 6: Card Box Yokohama Main Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e1000000-0000-0000-0000-000000000106',
  'カードボックスヨコハマ本店', 'Card Box Yokohama Main Store',
  'e1000000-0000-0000-0000-000000000001',
  '神奈川県横浜市西区南幸2-11-3 プライムメゾン横浜WEST 2F', 'Prime Maison Yokohama WEST 2F, 2-11-3 Minamiosaiwai, Nishi-ku, Yokohama 220-0005',
  ST_MakePoint(139.6138, 35.4633)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.8, 250,
  '045-620-3347', 'https://cardbox.nextone-iga.co.jp/cb_yokohama3/', 'CB_yokohama3',
  'The largest Card Box location in Yokohama, opened March 2023. Biggest card shop in the Yokohama Station area by floor space. Excellent selection of TCG singles across all major titles.',
  '• Mon-Fri 12:00-22:00, Sat/Sun/Holidays 10:00-22:00, year-round
  • Largest card shop by floor space near Yokohama Station
  • Opened March 2023 — modern and spacious
  • Same chain as Nishiguchi branch (separate inventory)
  • Late closing at 22:00'
);

-- ============================================================
-- Yokohama Shop 7: Pokemon Center Yokohama
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, payment_methods,
  sells_booster_box, sells_sealed_pack,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'e1000000-0000-0000-0000-000000000107',
  'ポケモンセンターヨコハマ', 'Pokemon Center Yokohama',
  'e1000000-0000-0000-0000-000000000001',
  '神奈川県横浜市西区高島2-19-12 横浜スカイビル8F', 'Yokohama Sky Building 8F, 2-19-12 Takashima, Nishi-ku, Yokohama 220-0011',
  ST_MakePoint(139.6221, 35.4660)::geography,
  true,
  '{"cash","visa","mastercard","ic"}',
  true, true,
  true, 4.2, 400,
  '045-453-3051', 'https://www.pokemon.co.jp/shop/pokecen/yokohama/',
  'Official Pokemon store inside Sky Building, 3 min from Yokohama Station east exit. Sells sealed Pokemon TCG products (booster packs, starter decks, boxes) plus all Pokemon merchandise. Hosts casual battle events with promo card prizes.',
  '• Daily 10:30-20:30
  • 3 min walk from Yokohama Station east exit (Sky Building 8F)
  • Official Pokemon store — sealed products only (no singles)
  • Casual battle events with promo card prizes
  • Basic English assistance available
  • Always a queue for new releases'
);

-- ============================================================
-- Yokohama Shop 8: Yellow Submarine Yokohama
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'e1000000-0000-0000-0000-000000000108',
  'イエローサブマリン 横浜店', 'Yellow Submarine Yokohama',
  'e1000000-0000-0000-0000-000000000001',
  '神奈川県横浜市西区南幸1-11-2 浜西ビルディング4F', 'Hamanishi Building 4F, 1-11-2 Minamiosaiwai, Nishi-ku, Yokohama 220-0005',
  ST_MakePoint(139.6178, 35.4648)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.6, 200,
  '045-311-2847', 'https://yellowsubmarine.co.jp/',
  'Well-known hobby chain, 4 min from Yokohama Station. Sells TCGs alongside board games, miniatures, and figures. Good for browsing older/vintage cards. A second location at Sotetsu Movil 2F is nearby.',
  '• Mon-Sat 12:00-20:00, Sun/Holidays 11:00-19:00
  • 4 min walk from Yokohama Station
  • Good for vintage card hunting
  • Also carries board games, miniatures, and figures
  • Second branch at Sotetsu Movil 2F nearby'
);


-- ############################################################
--  OMIYA SHOPS (7 shops)
-- ############################################################

-- ============================================================
-- Omiya Shop 1: Hareruya2 Omiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e2000000-0000-0000-0000-000000000101',
  '晴れる屋2 大宮店', 'Hareruya2 Omiya',
  'e2000000-0000-0000-0000-000000000001',
  '埼玉県さいたま市大宮区宮町2-23 イーストゲート大宮ビル A館1F', 'East Gate Omiya Building A-kan 1F, 2-23 Miyacho, Omiya-ku, Saitama 330-0802',
  ST_MakePoint(139.6314, 35.9044)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true, true, true,
  true, 4.0, 350,
  '048-783-4030', 'https://www.hareruya2.com/pages/store_omiya', 'hareruya_oomiya',
  'Japan''s largest Pokemon card specialty chain. Dedicated 100% to Pokemon TCG with massive singles inventory. PSA graded cards and English-language Pokemon cards available. 5 min walk from Omiya Station east exit.',
  '• Weekdays 13:00-22:00, Sat/Sun/Holidays 10:00-21:00
  • #1 recommended shop for serious Pokemon card collectors
  • 5 min walk from Omiya Station east exit
  • PSA graded cards and English cards in stock
  • Excellent buyback prices
  • Online shop ships internationally'
);

-- ============================================================
-- Omiya Shop 2: Hobby Station Omiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e2000000-0000-0000-0000-000000000102',
  'ホビーステーション 大宮店', 'Hobby Station Omiya',
  'e2000000-0000-0000-0000-000000000001',
  '埼玉県さいたま市大宮区宮町1-60 大宮ラクーン5F', 'Omiya Raccoon 5F, 1-60 Miyacho, Omiya-ku, Saitama 330-0802',
  ST_MakePoint(139.6285, 35.9052)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.8, 280,
  '048-648-1077', 'https://www.hbst.net/shop/33/', 'hbst_omiya',
  'Located in Omiya Raccoon entertainment complex, 2 min from Omiya Station east exit. Large duel space. Multiple TCG titles available. Building also has arcades and other entertainment.',
  '• Mon-Fri 12:00-21:00, Sat 10:00-21:00, Sun 10:00-20:00
  • 2 min from Omiya Station east exit
  • Inside Omiya Raccoon entertainment complex (5F)
  • Large duel space for tournaments
  • Building has arcades and other entertainment'
);

-- ============================================================
-- Omiya Shop 3: Card Shop Ryusei no PAO Omiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e2000000-0000-0000-0000-000000000103',
  'カードショップ竜星のPAO 大宮店', 'Card Shop Ryusei no PAO Omiya',
  'e2000000-0000-0000-0000-000000000001',
  '埼玉県さいたま市大宮区宮町2-28 あじせんビルB1F', 'Ajisen Building B1F, 2-28 Miyacho, Omiya-ku, Saitama 330-0802',
  ST_MakePoint(139.6316, 35.9048)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.7, 220,
  '048-657-6280', 'https://pao-toreka.com/shop/omiya.html', 'PAOtoreka_omiya',
  'Basement-level shop, 4 min walk from Omiya Station east exit. Part of the large PAO chain with daily tournaments and events. Good selection of current Pokemon TCG singles.',
  '• Daily 11:00-21:00
  • 4 min walk from Omiya Station east exit
  • Basement-level shop (B1F)
  • Daily tournaments and events
  • No parking — train access recommended'
);

-- ============================================================
-- Omiya Shop 4: Amenity Dream Omiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e2000000-0000-0000-0000-000000000104',
  'アメニティードリーム 大宮店', 'Amenity Dream Omiya',
  'e2000000-0000-0000-0000-000000000001',
  '埼玉県さいたま市大宮区大門町1-69 武蔵屋ビル5F', 'Musashiya Building 5F, 1-69 Daimoncho, Omiya-ku, Saitama 330-0846',
  ST_MakePoint(139.6282, 35.9025)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.6, 180,
  '048-729-5555', 'https://amenitydream.co.jp/shop/saitama-omiya/', 'amenity_omy',
  'TCG specialty chain on 5F near Omiya Station. Good variety of Pokemon, Yu-Gi-Oh, and other card games. Duel space available with regular tournament events.',
  '• Daily 12:00-21:00
  • Near Omiya Station
  • Located on 5F — take the elevator
  • Duel space available
  • Regular tournament events'
);

-- ============================================================
-- Omiya Shop 5: minny Omiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_psa_graded, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  website_url,
  ai_summary, visitor_tips)
VALUES (
  'e2000000-0000-0000-0000-000000000105',
  'minny 大宮店', 'minny Omiya',
  'e2000000-0000-0000-0000-000000000001',
  '埼玉県さいたま市大宮区大門町2-87 島村ビル2F', 'Shimamura Building 2F, 2-87 Daimoncho, Omiya-ku, Saitama 330-0846',
  ST_MakePoint(139.6278, 35.9030)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true, true, true,
  true, 3.9, 250,
  'https://www.iranoan.com/minny-omiya',
  'Impressive 50,000+ card inventory including high-end rare cards, first-edition, and Asian-version cards. Digital gacha oripa available. PSA graded and English cards in stock. Excellent destination for collectors.',
  '• Daily 12:00-20:00, year-round
  • 50,000+ card inventory — one of the largest in Omiya
  • Digital gacha oripa available
  • PSA graded cards and English cards in stock
  • First-edition and Asian-version cards available
  • Great for serious collectors'
);

-- ============================================================
-- Omiya Shop 6: Toreka Z Omiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e2000000-0000-0000-0000-000000000106',
  'トレカZ 大宮店', 'Toreka Z Omiya',
  'e2000000-0000-0000-0000-000000000001',
  '埼玉県さいたま市大宮区仲町1-1 ムサシビル4F', 'Musashi Building 4F, 1-1 Nakacho, Omiya-ku, Saitama 330-0845',
  ST_MakePoint(139.6298, 35.9040)::geography,
  '{"cash"}',
  true, true, true, true,
  true, 3.5, 120,
  'omiyatoreka',
  'Newer shop opened late 2024, specializing in Pokemon and One Piece cards. 1 min from Omiya Station east exit. No elevator — stairs only to 4F.',
  '• Approx. 12:00-20:00 (check Twitter for latest hours)
  • 1 min from Omiya Station east exit
  • Specializes in Pokemon and One Piece cards
  • No elevator — stairs only to 4F
  • Cash only
  • Check Twitter (@omiyatoreka) before visiting'
);

-- ============================================================
-- Omiya Shop 7: Yellow Submarine Omiya Main Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e2000000-0000-0000-0000-000000000107',
  'イエローサブマリン 大宮本店', 'Yellow Submarine Omiya Main Store',
  'e2000000-0000-0000-0000-000000000001',
  '埼玉県さいたま市北区宮原町3-561', '3-561 Miyaharacho, Kita-ku, Saitama 331-0812',
  ST_MakePoint(139.6192, 35.9305)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.9, 300,
  '048-652-7977', 'https://yellowsubmarine.co.jp/', 'YS_HONTEN',
  'Yellow Submarine headquarters/main store in Miyahara. Very large selection across multiple floors covering TCGs, board games, miniatures, and figures. TCG section on 3F. Not at Omiya Station — one stop to Miyahara Station.',
  '• Mon-Sat 12:00-20:00, Sun/Holidays 10:00-19:00
  • Yellow Submarine headquarters — largest branch
  • Not at Omiya Station — take JR one stop to Miyahara Station
  • TCG section on 3F
  • Good for vintage card hunting
  • Also carries board games, miniatures, TRPG supplies'
);


-- ############################################################
--  CHIBA SHOPS (7 shops)
-- ############################################################

-- ============================================================
-- Chiba Shop 1: Fullcomp Chiba
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e3000000-0000-0000-0000-000000000101',
  'フルコンプ 千葉店', 'Fullcomp Chiba',
  'e3000000-0000-0000-0000-000000000001',
  '千葉県千葉市中央区富士見2-2-3 吉田興業第一ビル3F', 'Yoshida Kogyo Daiichi Building 3F, 2-2-3 Fujimi, Chuo-ku, Chiba 260-0015',
  ST_MakePoint(140.1137, 35.6107)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.8, 280,
  '043-221-2652', 'https://www.fullcomp.jp/chiba/', 'fullcomp_chiba',
  '3 min walk from JR Chiba Station. Has 66-seat duel space, one of the largest in the area. Good selection of Pokemon singles and original pack gacha (oripa). Regular tournaments for all major TCGs.',
  '• Weekdays 13:00-21:00, Sat/Sun/Holidays 11:00-21:00
  • 3 min walk from JR Chiba Station
  • 66-seat duel space — one of largest in Chiba
  • Oripa (original packs) available
  • Regular tournament events
  • Buyback until 30 min before closing'
);

-- ============================================================
-- Chiba Shop 2: Hobby Station Chiba
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e3000000-0000-0000-0000-000000000102',
  'ホビーステーション 千葉店', 'Hobby Station Chiba',
  'e3000000-0000-0000-0000-000000000001',
  '千葉県千葉市中央区富士見2-15-1 ワラビビル8F', 'Warabi Building 8F, 2-15-1 Fujimi, Chuo-ku, Chiba 260-0015',
  ST_MakePoint(140.1169, 35.6096)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.7, 220,
  '043-224-1717', 'https://www.hbst.net/shop/37/', 'HBSTchiba',
  'Located on 8F of Warabi Building. 4 min walk from Keisei Chiba-Chuo Station, about 10 min from JR Chiba Station. Well-organized singles inventory with regular tournament events.',
  '• Weekdays 12:00-21:00, Sat/Sun/Holidays 10:00-20:00
  • 4 min from Keisei Chiba-Chuo Station
  • 10 min walk from JR Chiba Station
  • Located on 8F — take the elevator
  • Well-organized singles inventory
  • Regular tournament events'
);

-- ============================================================
-- Chiba Shop 3: Card Labo Chiba Chuo
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'e3000000-0000-0000-0000-000000000103',
  'カードラボ 千葉中央店', 'Card Labo Chiba Chuo',
  'e3000000-0000-0000-0000-000000000001',
  '千葉県千葉市中央区本千葉町6-9 フェニックスレジデンス千葉中央1F', 'Phoenix Residence Chiba Chuo 1F, 6-9 Honchiba-cho, Chuo-ku, Chiba 260-0014',
  ST_MakePoint(140.1207, 35.6057)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.8, 250,
  '043-306-5090', 'https://www.c-labo.jp/shop/chibatyuuou/',
  'Largest singles selection in the Chiba area. Right outside Keisei Chiba-Chuo Station east exit. Also reachable from JR Chiba Station via the underground C-one passage. Major TCG chain with excellent Pokemon card inventory.',
  '• Weekdays 12:00-21:00, Sat/Sun/Holidays 10:00-20:00
  • Right outside Keisei Chiba-Chuo Station east exit
  • Also reachable from JR Chiba Station via C-one underground passage (10 min)
  • Largest singles selection in the Chiba area
  • Major TCG chain with reliable stock'
);

-- ============================================================
-- Chiba Shop 4: Card Shop Ryusei no PAO Chiba Chuo
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e3000000-0000-0000-0000-000000000104',
  'カードショップ竜星のPAO 千葉中央店', 'Card Shop Ryusei no PAO Chiba Chuo',
  'e3000000-0000-0000-0000-000000000001',
  '千葉県千葉市中央区富士見2-23-8 山野井ビル2F', 'Yamanoi Building 2F, 2-23-8 Fujimi, Chuo-ku, Chiba 260-0015',
  ST_MakePoint(140.1177, 35.6082)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.7, 200,
  '043-205-4680', 'https://pao-toreka.com/shop/chiba.html', 'PAOtoreka_chiba',
  'Part of the PAO chain, about 8 min walk from JR Chiba Station. Tablet search system for finding specific singles. Daily tournaments and events for various TCGs including Pokemon.',
  '• Daily 11:00-21:00
  • 8 min walk from JR Chiba Station
  • Tablet search system for singles
  • Daily tournaments and events
  • Oripa (original packs) available'
);

-- ============================================================
-- Chiba Shop 5: Surugaya Chiba Chuo
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e3000000-0000-0000-0000-000000000105',
  '駿河屋 千葉中央店', 'Surugaya Chiba Chuo',
  'e3000000-0000-0000-0000-000000000001',
  '千葉県千葉市中央区本千葉町2-10', '2-10 Honchiba-cho, Chuo-ku, Chiba 260-0014',
  ST_MakePoint(140.1205, 35.6060)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.5, 300,
  '043-306-8848', 'https://www.suruga-ya.jp/feature/realstore/chiba-chuo/index.html', 'ek_chiba_center',
  'Massive 5-floor building with TCG section on 5F alongside figures and model kits. Also sells retro games, manga, anime goods. Open until 22:00. Good for vintage card hunting alongside other hobby shopping.',
  '• Daily 10:00-22:00, year-round
  • Massive 5-floor hobby store
  • TCG section on 5F
  • Open until 22:00 — latest closing in the area
  • Good for vintage and retro card hunting
  • Also has games, manga, anime goods, and figures'
);

-- ============================================================
-- Chiba Shop 6: Machi Chara Chiba Station Nishiguchi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e3000000-0000-0000-0000-000000000106',
  'まちキャラ 千葉駅西口店', 'Machi Chara Chiba Station Nishiguchi',
  'e3000000-0000-0000-0000-000000000001',
  '千葉県千葉市中央区新千葉2-3-1 シエルブラン千葉駅前1F', 'Ciel Blanc Chiba Ekimae 1F, 2-3-1 Shinchiba, Chuo-ku, Chiba 260-0031',
  ST_MakePoint(140.1085, 35.6122)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true,
  true, 3.6, 150,
  '043-306-5015', 'https://machi-chara.store/real-store/', 'Machi_chibaeki',
  'Primarily a hobby shop (Gunpla, figures) with TCG section. 2 min walk from JR Chiba Station west exit, almost directly connected. Good for casual browsing. Closed on Wednesdays except holidays.',
  '• Weekdays 12:00-20:00, Sat/Sun/Holidays 11:00-19:00
  • Closed Wednesdays (except holidays)
  • 2 min from JR Chiba Station west exit
  • Hobby shop with TCG section
  • Good for casual browsing'
);

-- ============================================================
-- Chiba Shop 7: Chiba Kanteidan Chuo
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e3000000-0000-0000-0000-000000000107',
  '千葉鑑定団 中央店', 'Chiba Kanteidan Chuo',
  'e3000000-0000-0000-0000-000000000001',
  '千葉県千葉市中央区塩田町385-2', '385-2 Shioda-cho, Chuo-ku, Chiba 260-0823',
  ST_MakePoint(140.1335, 35.5917)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.5, 250,
  '043-300-7699', 'https://chuo.chibakan.jp/', 'chuotrc',
  'Large recycle/hobby mega-store with TCG section. Open until midnight. About 100 parking spots for drivers. Not walkable from Chiba Station (about 3km south). UFO catchers, retro games, manga, and more.',
  '• Daily 10:00-24:00, year-round
  • Open until midnight — latest hours of any card shop
  • About 100 parking spots — great for drivers
  • Not walkable from Chiba Station (3km south, drive or bus)
  • Huge variety: TCG, retro games, manga, figures
  • Worth the trip for the massive card selection'
);


-- ############################################################
--  MACHIDA SHOPS (6 shops)
-- ############################################################

-- ============================================================
-- Machida Shop 1: Card Shop Ryusei no PAO Machida
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e4000000-0000-0000-0000-000000000101',
  'カードショップ竜星のPAO 町田店', 'Card Shop Ryusei no PAO Machida',
  'e4000000-0000-0000-0000-000000000001',
  '東京都町田市原町田6-6-14 町田ジョルナB2F', 'Machida Jorna B2F, 6-6-14 Haramachida, Machida 194-0013',
  ST_MakePoint(139.4455, 35.5424)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.7, 250,
  '042-709-4780', 'https://pao-toreka.com/shop/machida.html', 'PAOtoreka_machi',
  'Inside Machida Jorna shopping center B2F, 2 min from JR Machida Station. Largest card inventory in the Machida area with six tablet terminals for searching singles. Convenient location for combining with other shopping.',
  '• Daily 10:30-20:30
  • 2 min from JR Machida Station
  • Inside Machida Jorna shopping center (B2F)
  • Largest card inventory in Machida
  • 6 tablet terminals for singles search
  • Combine with other shopping in Jorna'
);

-- ============================================================
-- Machida Shop 2: Fullcomp Machida
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e4000000-0000-0000-0000-000000000102',
  'フルコンプ 町田店', 'Fullcomp Machida',
  'e4000000-0000-0000-0000-000000000001',
  '東京都町田市原町田6-8-1 町田センタービル外向店舗2F', 'Machida Center Building 2F, 6-8-1 Haramachida, Machida 194-0013',
  ST_MakePoint(139.4466, 35.5422)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.8, 230,
  '042-727-3330', 'https://www.fullcomp.jp/machida/', 'fc_machida',
  '2 min walk from JR Machida Station. Spacious duel space with frequent tournaments. Handles Pokemon, Yu-Gi-Oh, One Piece, and other TCGs. Original pack gacha (oripa) available.',
  '• Weekdays 12:00-21:00, Sat/Sun/Holidays 11:00-21:00
  • 2 min from JR Machida Station
  • Spacious duel space with frequent tournaments
  • Oripa (original packs) available
  • Buyback accepted until 30 min before closing'
);

-- ============================================================
-- Machida Shop 3: Hobby Station Machida
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e4000000-0000-0000-0000-000000000103',
  'ホビーステーション 町田店', 'Hobby Station Machida',
  'e4000000-0000-0000-0000-000000000001',
  '東京都町田市原町田6-13-21 町田アミックスビル3F', 'Machida Amix Building 3F, 6-13-21 Haramachida, Machida 194-0013',
  ST_MakePoint(139.4470, 35.5417)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.7, 200,
  '042-726-7581', 'https://www.hbst.net/shop/13/', 'hbstmachidaver2',
  'On 3F of Amix Building, short walk from JR Machida Station. Reliable major chain with consistent Pokemon TCG stock. Good for singles browsing and regular events.',
  '• Weekdays 12:00-21:00, Sat/Sun/Holidays 10:00-20:00
  • Short walk from JR Machida Station
  • Located on 3F of Amix Building
  • Reliable chain with consistent stock
  • Regular tournament events'
);

-- ============================================================
-- Machida Shop 4: Card Shop ADO Machida Ekimae
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_raw_rare, sells_oripa,
  google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e4000000-0000-0000-0000-000000000104',
  'カードショップADO 町田駅前店', 'Card Shop ADO Machida Ekimae',
  'e4000000-0000-0000-0000-000000000001',
  '東京都町田市原町田6-10-19 アロービル4F', 'Arrow Building 4F, 6-10-19 Haramachida, Machida 194-0013',
  ST_MakePoint(139.4462, 35.5420)::geography,
  '{"cash"}',
  true, true, true,
  3.6, 150,
  'ado_tcg',
  'Independent card shop under 1 min from JR Machida Station. Known for high buyback prices and good oripa selection. Smaller and more collector-focused. Closes earlier than other shops.',
  '• Weekdays 13:00-19:30, Sat/Sun/Holidays 12:00-19:00
  • Under 1 min from JR Machida Station
  • Cash only
  • Known for high buyback prices
  • Good oripa (original packs) selection
  • Closes earlier than other shops — plan accordingly
  • Check Twitter (@ado_tcg) for latest hours'
);

-- ============================================================
-- Machida Shop 5: Dragon Star Machida
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e4000000-0000-0000-0000-000000000105',
  'ドラゴンスター 町田店', 'Dragon Star Machida',
  'e4000000-0000-0000-0000-000000000001',
  '東京都町田市原町田4-5-8 MIキューブ町田イースト2F', 'MI Cube Machida East 2F, 4-5-8 Haramachida, Machida 194-0013',
  ST_MakePoint(139.4435, 35.5438)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.8, 180,
  'https://dorasuta.jp/shop/detail?scd=23', 'ds_machida_',
  'Osaka-based TCG chain expanding to Tokyo. Located slightly further from the station near the Odakyu side. Well-known chain with competitive pricing on singles and sealed products.',
  '• Check website/Twitter for latest hours
  • Well-known Osaka-based TCG chain
  • Located near Odakyu side, slightly further from JR station
  • Competitive pricing on singles
  • Check hours before visiting (newer location)'
);

-- ============================================================
-- Machida Shop 6: BOOKOFF Super Bazaar Machida Chuo-dori
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e4000000-0000-0000-0000-000000000106',
  'ブックオフ スーパーバザー 町田中央通り店', 'BOOKOFF Super Bazaar Machida Chuo-dori',
  'e4000000-0000-0000-0000-000000000001',
  '東京都町田市原町田4-4-8', '4-4-8 Haramachida, Machida 194-0013',
  ST_MakePoint(139.4437, 35.5441)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.5, 300,
  'https://www.bookoff.co.jp/shop/shop20424.html', 'bo_machida_tcg',
  'Major used goods chain with a dedicated TCG section and 76-seat battle space. 3 min from Machida Station. Good for budget-friendly card shopping alongside used books, games, and media. Prices tend to be lower than specialty shops.',
  '• Daily 10:00-20:00 (hours may vary)
  • 3 min from Machida Station Terminal exit
  • 76-seat battle space — largest in Machida
  • Budget-friendly prices compared to specialty shops
  • Good for vintage card hunting
  • Also has used books, games, and media'
);


-- ############################################################
--  TACHIKAWA SHOPS (7 shops)
-- ############################################################

-- ============================================================
-- Tachikawa Shop 1: Fullcomp Tachikawa Minamiguchi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e5000000-0000-0000-0000-000000000101',
  'フルコンプ 立川南口店', 'Fullcomp Tachikawa Minamiguchi',
  'e5000000-0000-0000-0000-000000000001',
  '東京都立川市柴崎町3-4-14 霧島ビル3F', 'Kirishima Building 3F, 3-4-14 Shibasakicho, Tachikawa 190-0023',
  ST_MakePoint(139.4133, 35.6971)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.7, 230,
  '042-537-8077', 'https://www.fullcomp.jp/tachikawa/', 'fctachikawa_vg',
  '2 min from JR Tachikawa Station south exit. Duel space available with frequent tournaments. All major TCGs including Pokemon. Oripa available. Buyback service offered.',
  '• Weekdays 12:00-21:00, Sat/Sun/Holidays 11:00-21:00
  • 2 min from JR Tachikawa Station south exit
  • Kirishima Building 3F
  • Duel space with frequent tournaments
  • Oripa (original packs) available
  • Buyback service offered'
);

-- ============================================================
-- Tachikawa Shop 2: BIG Toreka Tachikawa
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone,
  ai_summary, visitor_tips)
VALUES (
  'e5000000-0000-0000-0000-000000000102',
  'TCG専門店 BIGトレカ 立川店', 'BIG Toreka Tachikawa',
  'e5000000-0000-0000-0000-000000000001',
  '東京都立川市柴崎町3-7-26 マスノスクエアタチカワ7F', 'Masuno Square Tachikawa 7F, 3-7-26 Shibasakicho, Tachikawa 190-0023',
  ST_MakePoint(139.4128, 35.6964)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.6, 150,
  '042-512-7090',
  'TCG specialty store on 7F, 1 min from Tachikawa Station south exit. Note the Wednesday closure and late opening at 13:00. Good for dedicated TCG browsing.',
  '• 13:00-20:00, Closed Wednesdays
  • 1 min from Tachikawa Station south exit
  • Located on 7F
  • Closed Wednesdays
  • Opens at 13:00 — plan afternoon visits'
);

-- ============================================================
-- Tachikawa Shop 3: Yellow Submarine Tachikawa
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e5000000-0000-0000-0000-000000000103',
  'イエローサブマリン 立川店', 'Yellow Submarine Tachikawa',
  'e5000000-0000-0000-0000-000000000001',
  '東京都立川市柴崎町3-7-17 N2ビル2F-3F', 'N2 Building 2F-3F, 3-7-17 Shibasakicho, Tachikawa 190-0023',
  ST_MakePoint(139.4129, 35.6966)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.8, 250,
  '042-548-1707', 'https://yellowsubmarine.co.jp/', 'YS_TACHIKAWA',
  'Two floors: 2F is the hobby floor (figures, models), 3F is the game floor (TCGs, board games, TRPG). Well-established chain with reliable inventory. Fridays open until 21:00.',
  '• Mon-Thu 12:00-20:00, Fri 12:00-21:00, Sat/Sun/Holidays 11:00-20:00
  • Short walk from Tachikawa Station south exit
  • Two floors: 2F hobby, 3F TCG/games
  • Good for vintage card hunting
  • Fridays open until 21:00
  • Also carries board games and TRPG supplies'
);

-- ============================================================
-- Tachikawa Shop 4: Amenity Dream Tachikawa
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e5000000-0000-0000-0000-000000000104',
  'アメニティードリーム 立川店', 'Amenity Dream Tachikawa',
  'e5000000-0000-0000-0000-000000000001',
  '東京都立川市柴崎町3-8-1 NACビルB1F', 'NAC Building B1F, 3-8-1 Shibasakicho, Tachikawa 190-0023',
  ST_MakePoint(139.4120, 35.6963)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.7, 200,
  '042-595-7699', 'https://amenitydream.co.jp/shop/tokyo-tachikawa/', 'amenity_tachi',
  'Basement-level TCG specialty shop near Tachikawa-Minami Station (Tama Monorail). Dedicated TCG chain with regular certified tournaments for Pokemon and other games.',
  '• Weekdays 12:00-21:00, Sat/Sun/Holidays 11:00-20:00
  • Near Tachikawa-Minami Station (Tama Monorail)
  • Basement-level shop (B1F)
  • Regular certified tournament events
  • Dedicated TCG chain'
);

-- ============================================================
-- Tachikawa Shop 5: Toreka no Takumi Tachikawa
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_english_cards, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e5000000-0000-0000-0000-000000000105',
  'トレカの匠 立川店', 'Toreka no Takumi Tachikawa',
  'e5000000-0000-0000-0000-000000000001',
  '東京都立川市富士見町2-21-4', '2-21-4 Fujimi-cho, Tachikawa 190-0013',
  ST_MakePoint(139.3997, 35.6967)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  true, 4.1, 180,
  '042-595-7561', 'https://www.toreca-takumi.com/', 'toreca_takumi',
  'Independent specialty shop focused on Pokemon and One Piece cards. Further from station (15 min walk from Tachikawa, 12 min from Nishi-Tachikawa). Has 18-seat play area. English cards and vintage available. Highest rated card shop in Tachikawa.',
  '• 11:30-20:00 (buyback until 19:30), Closed Wed/Thu
  • 15 min walk from Tachikawa Station (12 min from Nishi-Tachikawa)
  • Highest Google rating among Tachikawa card shops
  • English cards and vintage cards available
  • 18-seat play area
  • 1 parking spot available
  • Closed Wed/Thu — check before visiting'
);

-- ============================================================
-- Tachikawa Shop 6: Famikonkun Main Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_english_cards, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'e5000000-0000-0000-0000-000000000106',
  'ファミコンくん 本店', 'Famikonkun Main Store',
  'e5000000-0000-0000-0000-000000000001',
  '東京都立川市曙町2-4-9 小町ビル3F', 'Komachi Building 3F, 2-4-9 Akebono-cho, Tachikawa 190-0012',
  ST_MakePoint(139.4147, 35.6990)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  3.8, 220,
  '042-525-8461', 'https://www.arrive.co.jp/', 'famikonkun_mtg',
  'Veteran card shop known primarily for MTG and Yu-Gi-Oh (including English versions and vintage Asian cards), but also sells Pokemon. Two duel spaces (32 + 16 seats). More collector-oriented.',
  '• Mon-Fri 12:00-20:00, Sat/Sun/Holidays 11:00-20:00
  • Closed Tuesdays and 3rd Monday of each month
  • 3 min from JR Tachikawa Station north exit
  • English cards and vintage Asian cards available
  • Two duel spaces (32 + 16 seats)
  • More collector-oriented — great for rare finds'
);

-- ============================================================
-- Tachikawa Shop 7: Toreka Park MEGA Don Quijote Tachikawa
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'e5000000-0000-0000-0000-000000000107',
  'トレカパーク MEGAドン・キホーテ立川店', 'Toreka Park MEGA Don Quijote Tachikawa',
  'e5000000-0000-0000-0000-000000000001',
  '東京都立川市曙町2-18-18 MEGAドン・キホーテ立川店5F', 'MEGA Don Quijote Tachikawa 5F, 2-18-18 Akebono-cho, Tachikawa 190-0012',
  ST_MakePoint(139.4089, 35.6999)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true,
  true, 3.3, 120,
  '0570-067-701', 'https://www.donki.com/store/shop_tenant.php?shop_id=388&tenant_id=2594',
  'Located inside MEGA Don Quijote discount store on 5F. Extremely long hours (8am-2am) following Don Quijote schedule. Good for sealed product and casual browsing. Tax-free shopping available for tourists with passport.',
  '• 8:00-2:00 (follows Don Quijote hours)
  • Inside MEGA Don Quijote discount store (5F)
  • Extremely long hours — open 8am to 2am
  • Tax-free shopping available for tourists with passport
  • Good for sealed products and casual browsing
  • Combine with discount shopping at Don Quijote'
);


-- ############################################################
--  SHOP INVENTORY DATA
-- ############################################################

-- ============================================================
-- Yokohama Inventory
-- ============================================================

-- Card Shop PAO Yokohama
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e1000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, 'Good current set selection'),
  ('e1000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('e1000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5200, 8000, 'Current sets available'),
  ('e1000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('e1000000-0000-0000-0000-000000000101', 'oripa', 'in_stock', 500, 5000, 'Various price tiers')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Card Box Yokohama Main Store
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e1000000-0000-0000-0000-000000000106', 'single_common', 'in_stock', 20, 500, NULL),
  ('e1000000-0000-0000-0000-000000000106', 'single_rare', 'in_stock', 500, 8000, 'Largest selection in Yokohama'),
  ('e1000000-0000-0000-0000-000000000106', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('e1000000-0000-0000-0000-000000000106', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('e1000000-0000-0000-0000-000000000106', 'sealed_pack', 'in_stock', 180, 500, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Yellow Submarine Yokohama
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e1000000-0000-0000-0000-000000000108', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('e1000000-0000-0000-0000-000000000108', 'single_sr', 'in_stock', 3000, 40000, NULL),
  ('e1000000-0000-0000-0000-000000000108', 'vintage_pack', 'limited', 30000, 300000, 'Vintage packs when available'),
  ('e1000000-0000-0000-0000-000000000108', 'booster_box', 'in_stock', 5500, 8500, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- ============================================================
-- Omiya Inventory
-- ============================================================

-- Hareruya2 Omiya
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e2000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, NULL),
  ('e2000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, 'Extensive Pokemon-only selection'),
  ('e2000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('e2000000-0000-0000-0000-000000000101', 'single_sar', 'in_stock', 8000, 150000, NULL),
  ('e2000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('e2000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('e2000000-0000-0000-0000-000000000101', 'psa_graded', 'in_stock', 5000, 500000, 'PSA graded showcase'),
  ('e2000000-0000-0000-0000-000000000101', 'vintage_pack', 'limited', 30000, 300000, NULL),
  ('e2000000-0000-0000-0000-000000000101', 'accessories', 'in_stock', 300, 5000, 'Sleeves, deck boxes, playmats')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- minny Omiya
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e2000000-0000-0000-0000-000000000105', 'single_common', 'in_stock', 20, 500, NULL),
  ('e2000000-0000-0000-0000-000000000105', 'single_rare', 'in_stock', 500, 10000, '50,000+ card inventory'),
  ('e2000000-0000-0000-0000-000000000105', 'single_sr', 'in_stock', 3000, 60000, NULL),
  ('e2000000-0000-0000-0000-000000000105', 'single_sar', 'in_stock', 8000, 200000, 'First-edition and Asian versions'),
  ('e2000000-0000-0000-0000-000000000105', 'psa_graded', 'in_stock', 5000, 500000, 'High-end graded cards'),
  ('e2000000-0000-0000-0000-000000000105', 'oripa', 'in_stock', 500, 10000, 'Digital gacha oripa'),
  ('e2000000-0000-0000-0000-000000000105', 'vintage_pack', 'limited', 30000, 300000, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Hobby Station Omiya
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e2000000-0000-0000-0000-000000000102', 'single_common', 'in_stock', 20, 400, NULL),
  ('e2000000-0000-0000-0000-000000000102', 'single_rare', 'in_stock', 400, 6000, NULL),
  ('e2000000-0000-0000-0000-000000000102', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('e2000000-0000-0000-0000-000000000102', 'sealed_pack', 'in_stock', 180, 500, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- ============================================================
-- Chiba Inventory
-- ============================================================

-- Fullcomp Chiba
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e3000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, NULL),
  ('e3000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('e3000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 40000, NULL),
  ('e3000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('e3000000-0000-0000-0000-000000000101', 'oripa', 'in_stock', 500, 5000, 'Various oripa available')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Card Labo Chiba Chuo
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e3000000-0000-0000-0000-000000000103', 'single_common', 'in_stock', 20, 500, 'Largest singles selection in Chiba'),
  ('e3000000-0000-0000-0000-000000000103', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('e3000000-0000-0000-0000-000000000103', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('e3000000-0000-0000-0000-000000000103', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('e3000000-0000-0000-0000-000000000103', 'sealed_pack', 'in_stock', 180, 500, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Surugaya Chiba Chuo
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e3000000-0000-0000-0000-000000000105', 'single_common', 'in_stock', 10, 300, 'Bargain pre-owned singles'),
  ('e3000000-0000-0000-0000-000000000105', 'single_rare', 'in_stock', 300, 8000, NULL),
  ('e3000000-0000-0000-0000-000000000105', 'booster_box', 'in_stock', 5500, 8500, NULL),
  ('e3000000-0000-0000-0000-000000000105', 'vintage_pack', 'limited', 30000, 300000, 'Vintage finds occasionally')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- ============================================================
-- Machida Inventory
-- ============================================================

-- Card Shop PAO Machida
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e4000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, 'Largest inventory in Machida'),
  ('e4000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('e4000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('e4000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('e4000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('e4000000-0000-0000-0000-000000000101', 'oripa', 'in_stock', 500, 5000, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Fullcomp Machida
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e4000000-0000-0000-0000-000000000102', 'single_common', 'in_stock', 20, 500, NULL),
  ('e4000000-0000-0000-0000-000000000102', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('e4000000-0000-0000-0000-000000000102', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('e4000000-0000-0000-0000-000000000102', 'oripa', 'in_stock', 500, 5000, 'Popular oripa selection')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- ============================================================
-- Tachikawa Inventory
-- ============================================================

-- Fullcomp Tachikawa
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e5000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, NULL),
  ('e5000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('e5000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('e5000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('e5000000-0000-0000-0000-000000000101', 'oripa', 'in_stock', 500, 5000, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Toreka no Takumi Tachikawa
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e5000000-0000-0000-0000-000000000105', 'single_common', 'in_stock', 20, 500, NULL),
  ('e5000000-0000-0000-0000-000000000105', 'single_rare', 'in_stock', 500, 10000, 'English cards available'),
  ('e5000000-0000-0000-0000-000000000105', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('e5000000-0000-0000-0000-000000000105', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('e5000000-0000-0000-0000-000000000105', 'vintage_pack', 'limited', 30000, 200000, 'Vintage when available')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;

-- Yellow Submarine Tachikawa
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('e5000000-0000-0000-0000-000000000103', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('e5000000-0000-0000-0000-000000000103', 'single_sr', 'in_stock', 3000, 40000, NULL),
  ('e5000000-0000-0000-0000-000000000103', 'booster_box', 'in_stock', 5500, 8500, NULL),
  ('e5000000-0000-0000-0000-000000000103', 'vintage_pack', 'limited', 30000, 300000, 'Vintage card hunting spot')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability, price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max, notes_en = EXCLUDED.notes_en;
