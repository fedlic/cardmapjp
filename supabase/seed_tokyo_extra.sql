-- ============================================================
-- Seed: Tokyo Extra Regions
-- Ikebukuro, Shinjuku, Shibuya, Nakano
-- 4 regions, 38 shops total
-- ============================================================

-- ============================================================
-- Region: Ikebukuro
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'd1000000-0000-0000-0000-000000000001',
  'Ikebukuro', '池袋', 'Tokyo', 'Tokyo',
  35.72950000, 139.71890000, 15, true
);

-- ============================================================
-- Region: Shinjuku
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'd2000000-0000-0000-0000-000000000001',
  'Shinjuku', '新宿', 'Tokyo', 'Tokyo',
  35.69070000, 139.70020000, 15, true
);

-- ============================================================
-- Region: Shibuya
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'd3000000-0000-0000-0000-000000000001',
  'Shibuya', '渋谷', 'Tokyo', 'Tokyo',
  35.66210000, 139.69800000, 15, true
);

-- ============================================================
-- Region: Nakano
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'd4000000-0000-0000-0000-000000000001',
  'Nakano', '中野', 'Tokyo', 'Tokyo',
  35.70780000, 139.66550000, 15, true
);


-- ============================================================
-- IKEBUKURO SHOPS (12)
-- ============================================================

-- ============================================================
-- Shop 1: Pokemon Center Mega Tokyo
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'd1000000-0000-0000-0000-000000000101',
  'ポケモンセンター メガトウキョー', 'Pokemon Center Mega Tokyo',
  'd1000000-0000-0000-0000-000000000001',
  '東京都豊島区東池袋3-1-2 サンシャインシティ アルパ2F', 'Sunshine City Alpa 2F, 3-1-2 Higashi-Ikebukuro, Toshima-ku, Tokyo 170-6002',
  ST_MakePoint(139.7188, 35.7292)::geography,
  true,
  '{"cash","visa","mastercard","ic","qr_pay"}',
  false, true, true, false, false, false,
  4.3, 2500,
  '03-5927-9290', 'https://www.pokemon.co.jp/shop/pokecen/megatokyo/',
  'The flagship Pokemon Center in Ikebukuro''s Sunshine City mall. Sells official Pokemon TCG products at retail price including booster packs, decks, and accessories. Also has a Pokemon Card Station on the same floor for events and casual play. No singles available.',
  '• 10:00-20:00 daily
  • Inside Sunshine City Alpa 2F -- combine with other mall shopping
  • Arrive early on new set release days as lines form quickly
  • No singles -- sealed products and accessories only
  • English-speaking staff available
  • Pokemon Card Station on same floor for free play and events'
);

-- ============================================================
-- Shop 2: Card Secret Ikebukuro
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd1000000-0000-0000-0000-000000000102',
  'カードシークレット 池袋', 'Card Secret Ikebukuro',
  'd1000000-0000-0000-0000-000000000001',
  '東京都豊島区東池袋1-23-9 THE KINDAI 10 IKEBUKURO 4F', 'THE KINDAI 10 IKEBUKURO 4F, 1-23-9 Higashi-Ikebukuro, Toshima-ku, Tokyo 170-0013',
  ST_MakePoint(139.7138, 35.7318)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  4.2, 400,
  'https://cardsecret.jp/en', 'card_secret',
  'A popular Pokemon TCG shop among Tokyo players. Hosts tournaments for up to 64 players including shop tournaments and Championship Series events monthly. Many new players debut here alongside strong competitive players. English website available.',
  '• 12:00-21:00 daily
  • 4-minute walk from Ikebukuro Station
  • Hosts up to 64-player tournaments -- check schedule online
  • Lots of tables for free play
  • English website at cardsecret.jp/en
  • PSA graded cards and vintage stock available'
);

-- ============================================================
-- Shop 3: Trading Card Shop LAMB
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_english_cards,
  google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd1000000-0000-0000-0000-000000000103',
  'トレカショップLAMB', 'Trading Card Shop LAMB',
  'd1000000-0000-0000-0000-000000000001',
  '東京都豊島区東池袋1-3-7 吉田ビル', 'Yoshida Building, 1-3-7 Higashi-Ikebukuro, Toshima-ku, Tokyo 170-0013',
  ST_MakePoint(139.7118, 35.7312)::geography,
  true,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true, true,
  4.4, 350,
  'torekaLAMB',
  'Just 1 minute from Ikebukuro Station East Exit. Multi-floor layout with a huge Pokemon selection plus mystery oripa packs on 1F and duel space with weekly tournaments on 3F. English-speaking staff available. One of the top-rated card shops in the area.',
  '• Weekdays 13:00-22:00, Weekends/Holidays 12:00-22:00
  • CLOSED TUESDAYS
  • 1 minute from Ikebukuro Station East Exit
  • English-speaking staff happy to help foreign visitors
  • 1F: Pokemon cards and oripa, 3F: duel space
  • English cards available'
);

-- ============================================================
-- Shop 4: Card Labo Ikebukuro
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd1000000-0000-0000-0000-000000000104',
  'カードラボ 池袋店', 'Card Labo Ikebukuro',
  'd1000000-0000-0000-0000-000000000001',
  '東京都豊島区東池袋1-20-6 プラザイン池袋 4F', 'Plaza Inn Ikebukuro 4F, 1-20-6 Higashi-Ikebukuro, Toshima-ku, Tokyo 170-0013',
  ST_MakePoint(139.7135, 35.7322)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  3.8, 280,
  'https://www.c-labo.jp/shop/ikebukuro/', 'ikebukuro_labo',
  'Major national chain card shop with a large play space and regular tournaments. Handles multiple TCGs including Pokemon, Yu-Gi-Oh, and others. Good for buying singles and sealed products at fair and consistent prices.',
  '• 10:00-21:00 daily
  • 5-minute walk from Ikebukuro Station East Exit
  • Large play space with regular tournaments
  • Major chain -- reliable pricing and stock
  • Multiple TCG titles available'
);

-- ============================================================
-- Shop 5: Fullcomp Ikebukuro
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'd1000000-0000-0000-0000-000000000105',
  'フルコンプ 池袋店', 'Fullcomp Ikebukuro',
  'd1000000-0000-0000-0000-000000000001',
  '東京都豊島区東池袋1-29-7 サンリッチビル4F', 'Sunrich Building 4F, 1-29-7 Higashi-Ikebukuro, Toshima-ku, Tokyo 170-0013',
  ST_MakePoint(139.7155, 35.7305)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  3.7, 200,
  '03-5951-2652', 'https://www.fullcomp.jp/ikebukuro/',
  'Part of the Fullcomp chain with 17 stores nationwide. Specializes in TCG buying and selling with both current and older Pokemon card sets. Play space available. Open every day of the year.',
  '• Weekdays 13:00-21:00, Weekends/Holidays 11:00-21:00
  • 8-minute walk from Ikebukuro Station East Exit
  • Part of 17-store nationwide chain
  • Current and vintage Pokemon sets available
  • Open 365 days a year'
);

-- ============================================================
-- Shop 6: Yellow Submarine Ikebukuro Game Shop
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd1000000-0000-0000-0000-000000000106',
  'イエローサブマリン 池袋ゲームショップ', 'Yellow Submarine Ikebukuro Game Shop',
  'd1000000-0000-0000-0000-000000000001',
  '東京都豊島区東池袋1-15-2 音羽ビル6F', 'Otowa Building 6F, 1-15-2 Higashi-Ikebukuro, Toshima-ku, Tokyo 170-0013',
  ST_MakePoint(139.7130, 35.7328)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  3.9, 250,
  '03-5953-5808', 'YS_IKEBUKURO',
  'Well-known chain for TCG and board games. 24 seats of play space. Handles multiple card game titles alongside Pokemon. Also sells board games, TRPG supplies, and hobby items.',
  '• Mon-Sat 12:00-21:00, Sun/Holidays 11:00-20:00
  • 5-minute walk from JR Ikebukuro Station
  • 24-seat play space
  • Also stocks board games and TRPG supplies
  • Multiple TCG titles available'
);

-- ============================================================
-- Shop 7: MINT GAMES Ikebukuro
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage, sells_english_cards,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd1000000-0000-0000-0000-000000000107',
  'MINT GAMES 池袋店', 'MINT GAMES Ikebukuro',
  'd1000000-0000-0000-0000-000000000001',
  '東京都豊島区東池袋1-50-35 池袋P''PARCO 2F', 'Ikebukuro P''PARCO 2F, 1-50-35 Higashi-Ikebukuro, Toshima-ku, Tokyo 170-0013',
  ST_MakePoint(139.7145, 35.7295)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  4.0, 300,
  '03-6907-3308', 'https://mint-web.jp/?pid=173081678', 'MintGames_IKB',
  'Japan''s largest TCG specialty chain. This location in P''PARCO features 64 seats of play space and carries both Pokemon TCG and sports cards (MLB, NBA). Good selection of graded cards and English-language cards. Clean, well-organized department store atmosphere.',
  '• 11:00-21:00 daily
  • Inside P''PARCO department store -- clean atmosphere
  • 64-seat play space
  • English and PSA graded cards available
  • Also carries MLB/NBA sports cards
  • Japan''s largest TCG chain'
);

-- ============================================================
-- Shop 8: Card Rush Ikebukuro
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd1000000-0000-0000-0000-000000000108',
  'カードラッシュ 池袋店', 'Card Rush Ikebukuro',
  'd1000000-0000-0000-0000-000000000001',
  '東京都豊島区東池袋1-13-10 岡安園5F', 'Okayasuen Building 5F, 1-13-10 Higashi-Ikebukuro, Toshima-ku, Tokyo 170-0013',
  ST_MakePoint(139.7126, 35.7330)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  3.8, 220,
  'https://www.cardrush-pokemon.jp/', 'cardrush_ikebuk',
  'Known for discount cases with cards at up to 50% off. One of Japan''s largest Pokemon card online retailers with a physical store. 3-minute walk from Ikebukuro Station Exit 35. Great for finding deals on singles.',
  '• Weekdays 13:00-21:00, Weekends/Holidays 11:00-21:00
  • 3-minute walk from Ikebukuro Station Exit 35
  • Famous discount cases -- up to 50% off
  • Major online retailer with physical presence
  • Great for budget singles shopping'
);

-- ============================================================
-- Shop 9: Dragon Star Ikebukuro
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd1000000-0000-0000-0000-000000000109',
  'ドラゴンスター 池袋店', 'Dragon Star Ikebukuro',
  'd1000000-0000-0000-0000-000000000001',
  '東京都豊島区東池袋1-30-6 セイコーサンシャインビルXII 4F', 'Seiko Sunshine Building XII 4F, 1-30-6 Higashi-Ikebukuro, Toshima-ku, Tokyo 170-0013',
  ST_MakePoint(139.7157, 35.7303)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  3.9, 260,
  '03-6907-3307', 'https://dorasuta.jp/shop/detail?scd=17', 'ds_ikebukur0',
  'Flagship store of the Dragon Star chain with a massive 116-seat duel space -- one of the largest in Tokyo. Hosts large-scale tournaments regularly. Handles Yu-Gi-Oh, Pokemon, One Piece and more.',
  '• Weekdays 13:00-21:00, Sat 10:00-21:00, Sun/Holidays 10:00-20:00
  • 4-minute walk from Ikebukuro Station Exit 29
  • Massive 116-seat duel space -- one of Tokyo''s largest
  • Regular large-scale tournaments
  • Multiple TCG titles available'
);

-- ============================================================
-- Shop 10: Toreka Samurai Ikebukuro Main Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd1000000-0000-0000-0000-000000000110',
  'トレカ侍 池袋本店', 'Toreka Samurai Ikebukuro Main Store',
  'd1000000-0000-0000-0000-000000000001',
  '東京都豊島区東池袋1-7-12 湖月ビル2F', 'Kogetsu Building 2F, 1-7-12 Higashi-Ikebukuro, Toshima-ku, Tokyo 170-0013',
  ST_MakePoint(139.7122, 35.7335)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  3.7, 180,
  'https://www.torekazamurai.com/', 'TorekaZamurai',
  'Popular local card shop just 2 minutes from Ikebukuro Station. Famous for booster boxes and singles. Also has a second store nearby at 1-32-5 Higashi-Ikebukuro (Okuma Building 2F).',
  '• Weekdays 12:00-20:00, Weekends/Holidays 11:00-20:00
  • 2-minute walk from Ikebukuro Station
  • Second branch nearby (1-32-5 Higashi-Ikebukuro)
  • Good for booster boxes and oripa
  • Vintage cards available'
);

-- ============================================================
-- Shop 11: Fukufuku Toreka Ikebukuro
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd1000000-0000-0000-0000-000000000111',
  '福福トレカ 池袋ポケモンカード専門店', 'Fukufuku Toreka Ikebukuro Pokemon Card Specialty Store',
  'd1000000-0000-0000-0000-000000000001',
  '東京都豊島区東池袋1-22-14 六花ビル3F', 'Rikka Building 3F, 1-22-14 Higashi-Ikebukuro, Toshima-ku, Tokyo 170-0013',
  ST_MakePoint(139.7137, 35.7320)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  3.9, 200,
  '03-5904-8840', 'https://fukufukutoreka.com/', 'fukufuku_ikb',
  'A dedicated Pokemon card specialty store. Focuses exclusively on Pokemon TCG with a deep inventory of singles, graded cards, and oripa. Can get crowded with entry lottery system on busy days.',
  '• Weekdays 13:00-21:00, Weekends/Holidays 10:00-21:00
  • 1-minute walk from Ikebukuro Station Exit 29
  • Pokemon card specialist -- focused inventory
  • PSA graded cards and oripa available
  • Entry lottery system may be in effect on busy days'
);

-- ============================================================
-- Shop 12: BOOKOFF Ikebukuro Sunshine 60-dori
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd1000000-0000-0000-0000-000000000112',
  'BOOKOFF 池袋サンシャイン60通り店', 'BOOKOFF Ikebukuro Sunshine 60-dori',
  'd1000000-0000-0000-0000-000000000001',
  '東京都豊島区東池袋1-22-10 ヒューマックスパビリオン 2-3F', 'HUMAX Pavilion 2-3F, 1-22-10 Higashi-Ikebukuro, Toshima-ku, Tokyo 170-0013',
  ST_MakePoint(139.7140, 35.7319)::geography,
  '{"cash","visa","mastercard","ic","qr_pay"}',
  true, true, true, true,
  3.5, 400,
  '03-5953-2325', 'https://www.bookoff.co.jp/shop/shop20422.html', 'SS60_ikebukuo',
  'Large BOOKOFF secondhand store with a trading card section. Great for budget-friendly hunting with cheap bulk cards and occasionally underpriced rare cards. Inventory varies daily -- best for treasure hunters willing to dig through bins.',
  '• 10:00-22:00 daily
  • On Sunshine 60 street near Sunshine City
  • Budget-friendly -- cheap bulk and underpriced finds
  • Inventory changes daily -- treasure hunting spot
  • Also sells used books, games, and electronics
  • No booster boxes -- singles and packs only'
);


-- ============================================================
-- SHINJUKU SHOPS (8)
-- ============================================================

-- ============================================================
-- Shop 1: Fullcomp Shinjuku South Exit
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd2000000-0000-0000-0000-000000000101',
  'フルコンプ 新宿南口店', 'Fullcomp Shinjuku South Exit',
  'd2000000-0000-0000-0000-000000000001',
  '東京都新宿区西新宿1-18-6 須田ビル3F', 'Suda Building 3F, 1-18-6 Nishi-Shinjuku, Shinjuku-ku, Tokyo 160-0023',
  ST_MakePoint(139.6985, 35.6886)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  3.7, 200,
  '03-5320-2652', 'https://www.fullcomp.jp/shinjuku/', 'fc_shinjuku',
  '2-minute walk from JR/Keio/Odakyu Shinjuku Station South Exit. Part of the Fullcomp chain handling multiple TCG titles with buying and selling of new and used cards. Good mid-range prices. Open 365 days a year.',
  '• Weekdays 12:00-21:00, Weekends/Holidays 11:00-21:00
  • 2-minute walk from Shinjuku Station South Exit
  • Part of nationwide chain -- reliable pricing
  • Open 365 days a year
  • Current and vintage cards available'
);

-- ============================================================
-- Shop 2: Amenity Dream Shinjuku
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd2000000-0000-0000-0000-000000000102',
  'アメニティードリーム 新宿店', 'Amenity Dream Shinjuku',
  'd2000000-0000-0000-0000-000000000001',
  '東京都新宿区西新宿7-1-8 ヒノデビル4F', 'Hinode Building 4F, 7-1-8 Nishi-Shinjuku, Shinjuku-ku, Tokyo 160-0023',
  ST_MakePoint(139.6985, 35.6937)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  3.8, 250,
  '03-5330-3033', 'https://amenitydream.co.jp/shop/tokyo-shinjuku/', 'amenity_shin',
  'Known for stocking nearly every TCG title with very up-to-date inventory of latest releases. 48-seat duel space for free play and tournaments. Practically at the Nishi-Shinjuku Station D5 exit. Great for finding niche or newly released products.',
  '• 12:00-21:00 daily
  • 0-minute walk from Nishi-Shinjuku Station D5 exit
  • 48-seat duel space
  • Stocks nearly every TCG title
  • Great for latest releases and niche products'
);

-- ============================================================
-- Shop 3: Yellow Submarine Shinjuku Game Shop
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_english_cards,
  google_rating, google_review_count,
  phone,
  ai_summary, visitor_tips)
VALUES (
  'd2000000-0000-0000-0000-000000000103',
  'イエローサブマリン 新宿ゲームショップ', 'Yellow Submarine Shinjuku Game Shop',
  'd2000000-0000-0000-0000-000000000001',
  '東京都新宿区西新宿1-16-11 AIビル2F', 'AI Building 2F, 1-16-11 Nishi-Shinjuku, Shinjuku-ku, Tokyo 160-0023',
  ST_MakePoint(139.6978, 35.6900)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  3.8, 200,
  '03-3345-0208',
  'Veteran hobby shop chain handling a wide range of TCGs including Magic: The Gathering, Yu-Gi-Oh, Pokemon, One Piece, and more. Also sells board games and tabletop RPG supplies. Good for browsing multiple game titles in one visit.',
  '• Mon-Sat 12:00-20:00, Sun 11:00-19:00
  • Near Shinjuku Station West Exit
  • Multiple TCG titles and board games
  • Note earlier closing on Sundays (7 PM)
  • English cards available'
);

-- ============================================================
-- Shop 4: Ryusei no Arashi Shinjuku
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd2000000-0000-0000-0000-000000000104',
  '竜星の嵐 新宿店', 'Ryusei no Arashi Shinjuku',
  'd2000000-0000-0000-0000-000000000001',
  '東京都新宿区西新宿1-18-1 小川ビル5F', 'Ogawa Building 5F, 1-18-1 Nishi-Shinjuku, Shinjuku-ku, Tokyo 160-0023',
  ST_MakePoint(139.6982, 35.6888)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  4.0, 280,
  '03-4363-7565', 'arashitokyo7',
  'Huge 80-seat play space with free open play. Late closing time (10 PM) makes it great for evening visits. Hosts official Pokemon card game tournaments. Very close to Shinjuku Station South Exit.',
  '• Weekdays 12:00-22:00, Weekends/Holidays 10:00-22:00
  • Near Shinjuku Station South Exit
  • 80-seat play space -- one of Shinjuku''s largest
  • Open until 10 PM -- great for evening visits
  • Buy-back counter closes at 9 PM
  • Official Pokemon tournaments'
);

-- ============================================================
-- Shop 5: MINT Shinjuku
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage, sells_english_cards,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd2000000-0000-0000-0000-000000000105',
  'スポーツカード＆カードゲームショップ MINT 新宿店', 'MINT Shinjuku',
  'd2000000-0000-0000-0000-000000000001',
  '東京都新宿区新宿3-1-26 新宿マルイアネックス7F', 'Shinjuku Marui Annex 7F, 3-1-26 Shinjuku, Shinjuku-ku, Tokyo 160-0022',
  ST_MakePoint(139.7032, 35.6897)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  4.1, 350,
  '03-3356-7500', 'https://mint-web.jp/?pid=32810736', 'mintshinjuku',
  'Japan''s premier TCG and sports card chain. Located inside Shinjuku Marui Annex department store (7F) with a polished retail environment. Carries both Japanese and English Pokemon cards plus PSA graded cards. Also has MLB/NBA sports cards.',
  '• 11:00-20:00 daily
  • Inside Shinjuku Marui Annex 7F
  • 2-minute walk from Shinjuku-sanchome Station C4 exit
  • Japanese and English Pokemon cards
  • PSA graded cards available
  • Also carries MLB/NBA sports cards'
);

-- ============================================================
-- Shop 6: HMV Trading Card Shop Shinjuku
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd2000000-0000-0000-0000-000000000106',
  'HMVトレカショップ新宿店', 'HMV Trading Card Shop Shinjuku',
  'd2000000-0000-0000-0000-000000000001',
  '東京都新宿区新宿3-30-13 新宿マルイ本館8F', 'Shinjuku Marui Main Building 8F, 3-30-13 Shinjuku, Shinjuku-ku, Tokyo 160-0022',
  ST_MakePoint(139.7010, 35.6907)::geography,
  '{"cash","visa","mastercard","ic","qr_pay"}',
  true, true, true, true,
  3.8, 150,
  'LE_Tradingcard',
  'Renovated and reopened in May 2025 inside Shinjuku Marui Main Building 8F within HMV record shop. Over 20,000 items in stock including new packs and used singles. 16-seat duel space with official tournaments.',
  '• 11:00-21:00 daily
  • Inside Shinjuku Marui Main Building 8F (within HMV)
  • Over 20,000 items in stock
  • 16-seat duel space with official tournaments
  • Department store location -- easy to find'
);

-- ============================================================
-- Shop 7: Surugaya Shinjuku Marui Annex
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd2000000-0000-0000-0000-000000000107',
  '駿河屋 新宿マルイアネックス店', 'Surugaya Shinjuku Marui Annex',
  'd2000000-0000-0000-0000-000000000001',
  '東京都新宿区新宿3-1-26 新宿マルイアネックス5F', 'Shinjuku Marui Annex 5F, 3-1-26 Shinjuku, Shinjuku-ku, Tokyo 160-0022',
  ST_MakePoint(139.7032, 35.6897)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  3.6, 180,
  '03-6380-0015', 'https://www.suruga-ya.jp/feature/realstore/shinjuku_maruiannex/index.html', 'suruga_shinjuku',
  'Japan''s famous secondhand retailer. This branch is in the same building as MINT Shinjuku (Marui Annex), just 2 floors below. Sells used TCG singles, figures, games, and more at competitive prices. Great for bargain hunting vintage cards.',
  '• Mon-Sat 11:00-21:00, Sun/Holidays 11:00-20:30
  • Inside Shinjuku Marui Annex 5F (same building as MINT on 7F)
  • Near Shinjuku-sanchome Station
  • Secondhand retailer -- competitive used card prices
  • Great for vintage card bargain hunting
  • Also sells figures, games, and other hobby items'
);

-- ============================================================
-- Shop 8: BOOKOFF PLUS Shinjuku Station West Exit
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_sealed_pack, sells_vintage,
  google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd2000000-0000-0000-0000-000000000108',
  'BOOKOFF PLUS 新宿駅西口店', 'BOOKOFF PLUS Shinjuku Station West Exit',
  'd2000000-0000-0000-0000-000000000001',
  '東京都新宿区西新宿1-13-7 大和家ビル', 'Yamatoya Building, 1-13-7 Nishi-Shinjuku, Shinjuku-ku, Tokyo 160-0023',
  ST_MakePoint(139.6975, 35.6910)::geography,
  '{"cash","visa","mastercard","ic","qr_pay"}',
  true, true, true,
  3.5, 350,
  'bookoff_tcg',
  'Large BOOKOFF PLUS store near Shinjuku Station West Exit with a trading card section. Good for cheap bulk and used singles. Prices generally lower than specialty card shops. Open late until 11 PM.',
  '• 10:00-23:00 daily
  • Near Shinjuku Station West Exit
  • Budget-friendly used singles
  • Open late until 11 PM
  • Also sells books, games, CDs, and electronics
  • No booster boxes -- singles and packs only'
);


-- ============================================================
-- SHIBUYA SHOPS (10)
-- ============================================================

-- ============================================================
-- Shop 1: Pokemon Center Shibuya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'd3000000-0000-0000-0000-000000000101',
  'ポケモンセンターシブヤ', 'Pokemon Center Shibuya',
  'd3000000-0000-0000-0000-000000000001',
  '東京都渋谷区宇田川町15-1 渋谷PARCO 6F', 'Shibuya PARCO 6F, 15-1 Udagawa-cho, Shibuya-ku, Tokyo 150-0042',
  ST_MakePoint(139.6980, 35.6621)::geography,
  true,
  '{"cash","visa","mastercard","ic","qr_pay"}',
  false, true, true, false, false, false,
  4.3, 2000,
  '03-5422-3522', 'https://www.pokemon.co.jp/shop/pokecen/shibuya/',
  'Official Pokemon Center on 6F of Shibuya PARCO. Sells booster packs, starter decks, accessories, and exclusive Pokemon merchandise at retail prices. No singles. Always crowded on weekends and new release days.',
  '• 10:00-21:00 daily
  • Shibuya PARCO 6F -- 5-minute walk from Shibuya Station
  • From 10-11 AM only Spain-zaka entrance open (lower floors still closed)
  • No singles -- sealed products and accessories only
  • English-speaking staff available
  • Plan for queues on weekends and release days'
);

-- ============================================================
-- Shop 2: Pokemon Card Lounge (SHIBUYA TSUTAYA)
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd3000000-0000-0000-0000-000000000102',
  'ポケモンカードラウンジ (SHIBUYA TSUTAYA)', 'Pokemon Card Lounge (SHIBUYA TSUTAYA)',
  'd3000000-0000-0000-0000-000000000001',
  '東京都渋谷区宇田川町21-6 SHIBUYA TSUTAYA 5F', 'SHIBUYA TSUTAYA 5F, 21-6 Udagawa-cho, Shibuya-ku, Tokyo 150-0042',
  ST_MakePoint(139.6997, 35.6610)::geography,
  true,
  '{"visa","mastercard","ic"}',
  false, false, true,
  4.5, 500,
  '03-6837-3000', 'https://shibuyatsutaya.tsite.jp/pokemoncardlounge/', 'PCGL_Shibuya',
  'An official Pokemon Card Lounge on 5F of SHIBUYA TSUTAYA, right across from Shibuya Scramble Crossing. 82 seats with complimentary drinks and snacks. Loaner decks available so you can play empty-handed. CASHLESS PAYMENT ONLY. A unique play experience rather than a shop.',
  '• 10:00-22:30 daily
  • SHIBUYA TSUTAYA 5F -- across from Scramble Crossing
  • CASHLESS PAYMENT ONLY
  • 82 seats (78 floor + 4 private room)
  • Complimentary drinks and snacks while playing
  • Loaner decks available -- play even empty-handed
  • Focus on playing, not buying singles'
);

-- ============================================================
-- Shop 3: MINT Shibuya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage, sells_english_cards,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd3000000-0000-0000-0000-000000000103',
  'スポーツカード＆カードゲームショップ MINT 渋谷店', 'MINT Shibuya',
  'd3000000-0000-0000-0000-000000000001',
  '東京都渋谷区宇田川町15-1 渋谷PARCO B1F', 'Shibuya PARCO B1F, 15-1 Udagawa-cho, Shibuya-ku, Tokyo 150-0042',
  ST_MakePoint(139.6980, 35.6621)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  4.0, 300,
  '03-6277-5205', 'https://mint-web.jp/?pid=39086084', 'mint_shibuya',
  'Located in the basement of Shibuya PARCO -- same building as Pokemon Center Shibuya upstairs. Japan''s largest TCG chain. Carries Pokemon TCG singles, sealed products, graded cards, and English-language cards. Also has sports cards.',
  '• 11:00-21:00 daily
  • Shibuya PARCO B1F -- visit both MINT (B1F) and Pokemon Center (6F) in one trip
  • PSA graded cards and English cards available
  • Also carries MLB/NBA sports cards
  • Japan''s largest TCG chain'
);

-- ============================================================
-- Shop 4: Fullcomp Shibuya East Exit
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'd3000000-0000-0000-0000-000000000104',
  'フルコンプ 渋谷東口店', 'Fullcomp Shibuya East Exit',
  'd3000000-0000-0000-0000-000000000001',
  '東京都渋谷区渋谷2-22-11 渋谷フランセ奥野ビル4F', 'Shibuya France Okuno Building 4F, 2-22-11 Shibuya, Shibuya-ku, Tokyo 150-0002',
  ST_MakePoint(139.7036, 35.6590)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  3.7, 180,
  '03-5468-2652', 'https://www.fullcomp.jp/shibuya/',
  'Fullcomp chain branch on the east side of Shibuya Station. 36 seats of play space. Handles Yu-Gi-Oh, Battle Spirits, Pokemon, and Vanguard. Open year-round. Less touristy than the Hachiko side.',
  '• Weekdays 13:00-21:00, Weekends/Holidays 11:00-21:00
  • Shibuya Station East Exit side
  • 36-seat play space
  • Open year-round
  • Multiple TCG titles available'
);

-- ============================================================
-- Shop 5: Card Kingdom Shibuya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'd3000000-0000-0000-0000-000000000105',
  'カードキングダム 渋谷店', 'Card Kingdom Shibuya',
  'd3000000-0000-0000-0000-000000000001',
  '東京都渋谷区渋谷2-22-7 共栄ビル4F', 'Kyoei Building 4F, 2-22-7 Shibuya, Shibuya-ku, Tokyo 150-0002',
  ST_MakePoint(139.7032, 35.6592)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  4.1, 200,
  '03-6419-7382', 'https://cardkingdom.jp/shibuya/',
  'Unique late-night hours -- open until 11 PM on weekdays and Fridays. Great for evening card game sessions. 3-minute walk from Ginza Line Shibuya Station. Note very limited weekday hours (opens at 5 PM Mon-Thu).',
  '• Mon-Thu 17:00-23:00, Fri 12:00-23:00, Sat 10:00-22:00, Sun/Holidays 10:00-21:00
  • 3-minute walk from Ginza Line Shibuya Station
  • Open until 11 PM -- great for late evening
  • Limited weekday hours (opens 5 PM Mon-Thu)
  • Plan visits for Friday-Sunday if possible'
);

-- ============================================================
-- Shop 6: Shogun City Stars Shibuya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage, sells_english_cards,
  google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd3000000-0000-0000-0000-000000000106',
  'Shogun City Stars 渋谷店', 'Shogun City Stars Shibuya',
  'd3000000-0000-0000-0000-000000000001',
  '東京都渋谷区宇田川町12-11 渋谷Uビル 1F/4F', 'Shibuya U Building 1F/4F, 12-11 Udagawa-cho, Shibuya-ku, Tokyo 150-0042',
  ST_MakePoint(139.6985, 35.6618)::geography,
  true,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true, true,
  4.2, 150,
  'ShogunCityStars',
  'Trading card shop specializing in Pokemon and One Piece cards. Known for PSA graded cards and vintage items. Targets both Japanese collectors and foreign visitors. English-friendly with social media in both languages.',
  '• 13:00-20:00 (hours may vary -- check X/Twitter)
  • Near Shibuya PARCO
  • English-friendly -- targets foreign visitors
  • PSA graded cards and vintage items
  • Buy-back counter closes 1 hour before store closing
  • Check @ShogunCityStars on X for latest hours'
);

-- ============================================================
-- Shop 7: TierOne Shibuya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd3000000-0000-0000-0000-000000000107',
  'ティアワン 渋谷', 'TierOne Shibuya',
  'd3000000-0000-0000-0000-000000000001',
  '東京都渋谷区神南1-11-4 FPG links JINNAN 3F', 'FPG links JINNAN 3F, 1-11-4 Jinnan, Shibuya-ku, Tokyo 150-0041',
  ST_MakePoint(139.6988, 35.6630)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  3.9, 120,
  'TierOneshibuya',
  '5-minute walk from Shibuya Station. Focuses on Pokemon and One Piece cards. Has beginner-friendly pre-built decks for sale. Singles tend to be affordably priced. Closed Mondays and opens late on weekdays.',
  '• Tue-Fri 15:00-20:00, Sat-Sun 12:00-20:00
  • CLOSED MONDAYS
  • 5-minute walk from Shibuya Station
  • Beginner-friendly with pre-built decks
  • Affordable singles pricing
  • Opens late on weekdays (3 PM) -- plan accordingly'
);

-- ============================================================
-- Shop 8: Tournament Center Batoloco Shibuya Center-gai
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd3000000-0000-0000-0000-000000000108',
  'TC バトロコ 渋谷センター街', 'Tournament Center Batoloco Shibuya Center-gai',
  'd3000000-0000-0000-0000-000000000001',
  '東京都渋谷区宇田川町31-3 第三田小ビル6F', 'Daisan Tago Building 6F, 31-3 Udagawa-cho, Shibuya-ku, Tokyo 150-0042',
  ST_MakePoint(139.6975, 35.6612)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  3.8, 180,
  'https://bato-loco.com/1825info/', 'batoloco_4282',
  'Tournament-focused card shop in Shibuya''s famous Center-gai street. Handles Yu-Gi-Oh, Duel Masters, Pokemon, One Piece, Vanguard, and more. Regular official tournaments. Also has a satellite location at MAGNET by SHIBUYA109 5F.',
  '• Weekdays 13:00-21:00, Weekends/Holidays 11:00-21:00
  • In Shibuya''s famous Center-gai street
  • Tournament-focused with regular official events
  • Satellite location at MAGNET by SHIBUYA109 5F (10:00-21:00)
  • Multiple TCG titles available'
);

-- ============================================================
-- Shop 9: Hareruya Shibuya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_english_cards,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd3000000-0000-0000-0000-000000000109',
  '晴れる屋 渋谷店', 'Hareruya Shibuya',
  'd3000000-0000-0000-0000-000000000001',
  '東京都渋谷区渋谷3-10-14 長崎堂ビル8F', 'Nagasakido Building 8F, 3-10-14 Shibuya, Shibuya-ku, Tokyo 150-0002',
  ST_MakePoint(139.7015, 35.6577)::geography,
  true,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  4.0, 250,
  '03-6419-7783', 'https://www.hareruyamtg.com/en/user_data/shop_shibuya?shop=27', 'hareruya_shibya',
  'Japan''s largest TCG retailer, primarily known for Magic: The Gathering but also carries Pokemon cards. 24 free play seats and stays open very late (11 PM). English website and some English-speaking staff. Sister brand ''Hareruya 2'' specializes in Pokemon.',
  '• Weekdays 15:00-23:00, Weekends/Holidays 11:00-23:00
  • 3-minute walk from Shibuya Station
  • Open very late until 11 PM
  • 24 free play seats
  • English website and English-speaking staff
  • Primarily MTG but also carries Pokemon cards'
);

-- ============================================================
-- Shop 10: Card Kingdom Shibuya 109-Yoko
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  website_url,
  ai_summary, visitor_tips)
VALUES (
  'd3000000-0000-0000-0000-000000000110',
  'カードキングダム 渋谷109ヨコ店', 'Card Kingdom Shibuya 109-Yoko',
  'd3000000-0000-0000-0000-000000000001',
  '東京都渋谷区道玄坂2-29-8 道玄坂センタービルB1F', 'Dogenzaka Center Building B1F, 2-29-8 Dogenzaka, Shibuya-ku, Tokyo 150-0043',
  ST_MakePoint(139.6962, 35.6595)::geography,
  -1, 'B1F',
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  3.9, 120,
  'https://cardkingdom.jp/',
  'A second Card Kingdom location in Shibuya, near the iconic SHIBUYA109 building. Located in the basement level. More casual-focused than the main Shibuya branch.',
  '• Hours vary -- check website before visiting
  • Near SHIBUYA109 building
  • Basement level location
  • More casual-focused than main Shibuya branch
  • Check cardkingdom.jp for current hours'
);


-- ============================================================
-- NAKANO SHOPS (8)
-- ============================================================

-- ============================================================
-- Shop 1: Mandarake Card-kan Nakano
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd4000000-0000-0000-0000-000000000101',
  'まんだらけ カード館 中野店', 'Mandarake Card-kan Nakano',
  'd4000000-0000-0000-0000-000000000001',
  '東京都中野区中野5-52-15 中野ブロードウェイ2F', 'Nakano Broadway 2F, 5-52-15 Nakano, Nakano-ku, Tokyo 164-0001',
  ST_MakePoint(139.6655, 35.7078)::geography,
  2, '2F',
  '{"cash","visa","mastercard"}',
  true, true, true,
  4.1, 500,
  '03-3228-0007', 'https://www.mandarake.co.jp/dir/nkn/card/', 'mandarakecard',
  'The legendary Mandarake card department in Nakano Broadway. Specializes in vintage and rare cards with an incredible selection of old-back (kyuura) Pokemon cards, e-series, VS series, Delta species, Star cards, and modern high-end singles. The go-to destination for vintage Pokemon card collectors.',
  '• 12:00-20:00 daily
  • Nakano Broadway 2F -- right side from entrance
  • THE destination for vintage Pokemon cards
  • Binders of affordable cards to browse
  • PSA graded cards available
  • Collector-oriented rather than player-oriented'
);

-- ============================================================
-- Shop 2: Amenity Dream Nakano
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'd4000000-0000-0000-0000-000000000102',
  'アメニティードリーム 中野店', 'Amenity Dream Nakano',
  'd4000000-0000-0000-0000-000000000001',
  '東京都中野区中野5-52-15 中野ブロードウェイ1F', 'Nakano Broadway 1F, 5-52-15 Nakano, Nakano-ku, Tokyo 164-0001',
  ST_MakePoint(139.6655, 35.7078)::geography,
  1, '1F',
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  3.8, 180,
  '03-5380-3811', 'https://amenitydream.co.jp/shop/tokyo-nakano/',
  'TCG specialist inside Nakano Broadway 1F. Known for stocking nearly every TCG title with up-to-date latest releases. 6 free play spaces. Smaller than the Shinjuku branch but has a cozy local shop feel.',
  '• 12:00-20:00 (CLOSED WEDNESDAYS)
  • Nakano Broadway 1F
  • 3-minute walk from JR Nakano Station North Exit
  • Stocks nearly every TCG title
  • 6 free play spaces
  • CLOSED WEDNESDAYS -- plan visits accordingly'
);

-- ============================================================
-- Shop 3: Ryusei no PAO Nakano
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd4000000-0000-0000-0000-000000000103',
  '竜星のPAO 中野店', 'Ryusei no PAO Nakano',
  'd4000000-0000-0000-0000-000000000001',
  '東京都中野区新井1-9-4 S-FIT NAKANO BLD 5F-6F', 'S-FIT NAKANO Building 5F-6F, 1-9-4 Arai, Nakano-ku, Tokyo 165-0026',
  ST_MakePoint(139.6647, 35.7090)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  4.0, 220,
  '03-5942-4680', 'https://pao-toreka.com/shop/nakano.html', 'PAOtoreka_naka',
  'A 2-floor card shop spanning 5F and 6F with one of the best TCG inventories in western Tokyo. 32-seat duel space with regular official tournaments. Not inside Broadway -- located on its own nearby building.',
  '• 11:00-21:00 daily
  • NOT inside Broadway -- separate building nearby
  • 5-minute walk from JR Nakano Station North Exit
  • 2 floors (5F-6F) with 32-seat duel space
  • Regular official tournaments
  • Carries Pokemon, Yu-Gi-Oh, One Piece, and more'
);

-- ============================================================
-- Shop 4: Tri Attack Nakano Broadway
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd4000000-0000-0000-0000-000000000104',
  'トライアタック 中野ブロードウェイ店', 'Tri Attack Nakano Broadway',
  'd4000000-0000-0000-0000-000000000001',
  '東京都中野区中野5-52-15 中野ブロードウェイ B1F', 'Nakano Broadway B1F, 5-52-15 Nakano, Nakano-ku, Tokyo 164-0001',
  ST_MakePoint(139.6655, 35.7078)::geography,
  -1, 'B1F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  4.0, 150,
  'TriANakano_BW',
  'Pokemon card specialty store that opened Feb 2024 in Nakano Broadway B1F. Unique free storage service: pick up to 10 Pokemon cards per day for free from bulk bins (approximately 50,000 cards). Also sells oripa and does buy-back.',
  '• Weekdays 13:00-19:00, Weekends/Holidays 12:00-18:00
  • Nakano Broadway B1F
  • Pokemon card specialist
  • FREE: Pick up to 10 cards/day from 50,000-card bulk bins
  • Oripa and buy-back available
  • Shorter hours than most shops -- plan accordingly'
);

-- ============================================================
-- Shop 5: Freflat Nakano Broadway
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  ai_summary, visitor_tips)
VALUES (
  'd4000000-0000-0000-0000-000000000105',
  'フレフラット 中野ブロードウェイ店', 'Freflat Nakano Broadway',
  'd4000000-0000-0000-0000-000000000001',
  '東京都中野区中野5-52-15 中野ブロードウェイ1F', 'Nakano Broadway 1F, 5-52-15 Nakano, Nakano-ku, Tokyo 164-0001',
  ST_MakePoint(139.6655, 35.7078)::geography,
  1, '1F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  3.8, 80,
  'Small Pokemon card and Pokemon goods shop inside Nakano Broadway 1F. Known for oripa (lottery packs) and collector-oriented items. Hours can change unexpectedly -- always check social media before making a special trip.',
  '• Hours vary -- check social media before visiting
  • Nakano Broadway 1F
  • Oripa and collector-oriented items
  • Vintage cards available
  • Small shop -- hours can change unexpectedly
  • Check X/Twitter for latest hours and stock'
);

-- ============================================================
-- Shop 6: FUN! Fare Nakano Broadway
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'd4000000-0000-0000-0000-000000000106',
  'FUN!ファーレ 中野ブロードウェイ店', 'FUN! Fare Nakano Broadway',
  'd4000000-0000-0000-0000-000000000001',
  '東京都中野区中野5-52-15 中野ブロードウェイ1F', 'Nakano Broadway 1F, 5-52-15 Nakano, Nakano-ku, Tokyo 164-0001',
  ST_MakePoint(139.6655, 35.7078)::geography,
  1, '1F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  4.0, 100,
  'funfare_toreca',
  'Specializes in PSA graded cards, vintage old-back (kyuura) Pokemon cards, and sealed boxes. Great for serious collectors looking for high-end graded slabs.',
  '• 12:00-19:00 (approximate -- check X/Twitter)
  • Nakano Broadway 1F
  • PSA graded cards specialist
  • Vintage old-back and sealed boxes
  • For serious collectors
  • Check @funfare_toreca on X for stock updates and hours'
);

-- ============================================================
-- Shop 7: Kaikai Kiki Card Station
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  ai_summary, visitor_tips)
VALUES (
  'd4000000-0000-0000-0000-000000000107',
  'Kaikai Kiki CARD STATION', 'Kaikai Kiki Card Station',
  'd4000000-0000-0000-0000-000000000001',
  '東京都中野区中野5-52-15 中野ブロードウェイ3F', 'Nakano Broadway 3F, 5-52-15 Nakano, Nakano-ku, Tokyo 164-0001',
  ST_MakePoint(139.6655, 35.7078)::geography,
  3, '3F',
  '{"cash","visa","mastercard"}',
  true, true, true,
  3.7, 60,
  'A unique card shop connected to artist Takashi Murakami''s Kaikai Kiki organization. Located on 3F of Nakano Broadway. You can borrow decks to play even empty-handed. Operates somewhat irregularly (event-driven).',
  '• Hours vary (event-based -- check Nakano Broadway website)
  • Nakano Broadway 3F
  • Connected to Takashi Murakami''s Kaikai Kiki
  • Loaner decks available -- play empty-handed
  • Irregular/event-driven schedule -- confirm before visiting
  • Unique art x TCG crossover experience'
);

-- ============================================================
-- Shop 8: magi Nakano Broadway
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  website_url,
  ai_summary, visitor_tips)
VALUES (
  'd4000000-0000-0000-0000-000000000108',
  'magi 中野ブロードウェイ店', 'magi Nakano Broadway',
  'd4000000-0000-0000-0000-000000000001',
  '東京都中野区中野5-52-15 中野ブロードウェイ1F', 'Nakano Broadway 1F, 5-52-15 Nakano, Nakano-ku, Tokyo 164-0001',
  ST_MakePoint(139.6655, 35.7078)::geography,
  1, '1F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  3.9, 100,
  'https://cardshopmagi.com/',
  'Physical retail arm of the ''magi'' collector-focused trading card app/marketplace by Jiraffe Inc. Focuses on high-end collector cards and graded items. IMPORTANT: Some branches have closed and reopened -- verify current status before visiting.',
  '• 13:00-20:00 (may vary -- verify before visiting)
  • Nakano Broadway 1F
  • Part of magi online marketplace
  • High-end collector cards and graded items
  • IMPORTANT: Verify current status -- branches have moved/closed
  • Check cardshopmagi.com for latest info'
);


-- ============================================================
-- Shop Inventory Data for Tokyo Extra Shops
-- ============================================================

-- Trading Card Shop LAMB (Ikebukuro key shop)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('d1000000-0000-0000-0000-000000000103', 'single_common', 'in_stock', 20, 500, 'Large Pokemon selection on 1F'),
  ('d1000000-0000-0000-0000-000000000103', 'single_rare', 'in_stock', 500, 8000, 'English and Japanese cards'),
  ('d1000000-0000-0000-0000-000000000103', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('d1000000-0000-0000-0000-000000000103', 'single_sar', 'in_stock', 8000, 150000, NULL),
  ('d1000000-0000-0000-0000-000000000103', 'booster_box', 'in_stock', 5200, 8000, 'Current sets available'),
  ('d1000000-0000-0000-0000-000000000103', 'oripa', 'in_stock', 500, 10000, 'Mystery oripa packs on 1F'),
  ('d1000000-0000-0000-0000-000000000103', 'psa_graded', 'in_stock', 5000, 300000, 'Graded card showcase'),
  ('d1000000-0000-0000-0000-000000000103', 'accessories', 'in_stock', 300, 5000, 'Sleeves, deck boxes, playmats')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- MINT GAMES Ikebukuro (Ikebukuro key shop)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('d1000000-0000-0000-0000-000000000107', 'single_common', 'in_stock', 20, 500, NULL),
  ('d1000000-0000-0000-0000-000000000107', 'single_rare', 'in_stock', 500, 8000, 'English cards available'),
  ('d1000000-0000-0000-0000-000000000107', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('d1000000-0000-0000-0000-000000000107', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('d1000000-0000-0000-0000-000000000107', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('d1000000-0000-0000-0000-000000000107', 'psa_graded', 'in_stock', 5000, 500000, 'PSA graded showcase'),
  ('d1000000-0000-0000-0000-000000000107', 'vintage_pack', 'limited', 30000, 300000, NULL),
  ('d1000000-0000-0000-0000-000000000107', 'accessories', 'in_stock', 300, 5000, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- MINT Shinjuku (Shinjuku key shop)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('d2000000-0000-0000-0000-000000000105', 'single_common', 'in_stock', 20, 500, NULL),
  ('d2000000-0000-0000-0000-000000000105', 'single_rare', 'in_stock', 500, 8000, 'English cards available'),
  ('d2000000-0000-0000-0000-000000000105', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('d2000000-0000-0000-0000-000000000105', 'single_sar', 'in_stock', 8000, 150000, NULL),
  ('d2000000-0000-0000-0000-000000000105', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('d2000000-0000-0000-0000-000000000105', 'psa_graded', 'in_stock', 5000, 500000, 'PSA graded showcase'),
  ('d2000000-0000-0000-0000-000000000105', 'vintage_pack', 'limited', 30000, 300000, NULL),
  ('d2000000-0000-0000-0000-000000000105', 'accessories', 'in_stock', 300, 5000, 'Sports card supplies also')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- Ryusei no Arashi Shinjuku (Shinjuku key shop)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('d2000000-0000-0000-0000-000000000104', 'single_common', 'in_stock', 20, 500, NULL),
  ('d2000000-0000-0000-0000-000000000104', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('d2000000-0000-0000-0000-000000000104', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('d2000000-0000-0000-0000-000000000104', 'booster_box', 'in_stock', 5200, 8000, 'Current sets always available'),
  ('d2000000-0000-0000-0000-000000000104', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('d2000000-0000-0000-0000-000000000104', 'accessories', 'in_stock', 300, 5000, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- MINT Shibuya (Shibuya key shop)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('d3000000-0000-0000-0000-000000000103', 'single_common', 'in_stock', 20, 500, NULL),
  ('d3000000-0000-0000-0000-000000000103', 'single_rare', 'in_stock', 500, 8000, 'English cards available'),
  ('d3000000-0000-0000-0000-000000000103', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('d3000000-0000-0000-0000-000000000103', 'single_sar', 'in_stock', 8000, 150000, NULL),
  ('d3000000-0000-0000-0000-000000000103', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('d3000000-0000-0000-0000-000000000103', 'psa_graded', 'in_stock', 5000, 500000, 'PSA graded showcase'),
  ('d3000000-0000-0000-0000-000000000103', 'vintage_pack', 'limited', 30000, 300000, NULL),
  ('d3000000-0000-0000-0000-000000000103', 'accessories', 'in_stock', 300, 5000, 'Sports card supplies also')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- Shogun City Stars Shibuya (Shibuya key shop)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('d3000000-0000-0000-0000-000000000106', 'single_rare', 'in_stock', 500, 8000, 'English and Japanese'),
  ('d3000000-0000-0000-0000-000000000106', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('d3000000-0000-0000-0000-000000000106', 'single_sar', 'in_stock', 8000, 150000, NULL),
  ('d3000000-0000-0000-0000-000000000106', 'psa_graded', 'in_stock', 10000, 500000, 'Known for graded cards'),
  ('d3000000-0000-0000-0000-000000000106', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('d3000000-0000-0000-0000-000000000106', 'oripa', 'in_stock', 500, 10000, NULL),
  ('d3000000-0000-0000-0000-000000000106', 'vintage_pack', 'limited', 30000, 300000, 'Vintage items when available')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- Mandarake Card-kan Nakano (Nakano key shop)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('d4000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 1000, 20000, 'Curated vintage selection'),
  ('d4000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 5000, 100000, 'Modern high-end singles'),
  ('d4000000-0000-0000-0000-000000000101', 'single_sar', 'in_stock', 10000, 200000, NULL),
  ('d4000000-0000-0000-0000-000000000101', 'psa_graded', 'in_stock', 10000, 500000, 'High-grade vintage showcase'),
  ('d4000000-0000-0000-0000-000000000101', 'vintage_pack', 'limited', 50000, 500000, 'Vintage packs when available'),
  ('d4000000-0000-0000-0000-000000000101', 'vintage_box', 'limited', 200000, 2000000, 'Rare sealed vintage boxes')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- Ryusei no PAO Nakano (Nakano key shop)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en)
VALUES
  ('d4000000-0000-0000-0000-000000000103', 'single_common', 'in_stock', 20, 500, NULL),
  ('d4000000-0000-0000-0000-000000000103', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('d4000000-0000-0000-0000-000000000103', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('d4000000-0000-0000-0000-000000000103', 'booster_box', 'in_stock', 5200, 8000, 'Current sets available'),
  ('d4000000-0000-0000-0000-000000000103', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('d4000000-0000-0000-0000-000000000103', 'accessories', 'in_stock', 300, 5000, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;
