-- ============================================================
-- Region: Nipponbashi (Osaka)
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'b1000000-0000-0000-0000-000000000001',
  'Nipponbashi', '日本橋', 'Osaka', 'Osaka',
  34.65900000, 135.50550000, 15, true
);

-- ============================================================
-- Shop 1: Dragon Star Nipponbashi Main Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000101',
  'ドラゴンスター日本橋本店', 'Dragon Star Nipponbashi Main Store',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区難波中2-5-12', '2-5-12 Nanbanaka, Naniwa-ku, Osaka 556-0011',
  ST_MakePoint(135.5057, 34.6586)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  4.0, 300,
  '06-6632-3131', 'https://dorasuta.jp/shop/detail?scd=4', 'ds_nipponbashi',
  'Kansai''s largest TCG chain. The main store focuses on buying/selling with a massive inventory at competitive prices. Known for special sale events with excellent deals on Pokemon singles and sealed products.',
  '• Weekdays 12:00-20:00, Weekends/Holidays 10:30-20:00
  • Cash, credit cards, IC cards accepted
  • Kansai''s biggest card shop chain — start your Nipponbashi card crawl here
  • Strong buyback prices — bring cards to sell
  • Multiple branches nearby (2nd and 3rd stores within walking distance)'
);

-- ============================================================
-- Shop 2: Dragon Star Nipponbashi 2nd Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  phone, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000102',
  'ドラゴンスター日本橋2号店', 'Dragon Star Nipponbashi 2nd Store',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区難波中2-1-17 コスモビル6F', 'Cosmo Building 6F, 2-1-17 Nanbanaka, Naniwa-ku, Osaka 556-0011',
  ST_MakePoint(135.5050, 34.6593)::geography,
  6, '6F',
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  3.8, 200,
  '06-6630-7115', 'ds_nipponbashi2',
  'Dragon Star''s tournament-focused branch with a large play space. Focus on competitive play and events alongside buying/selling. Open late on weekdays until 10pm.',
  '• Weekdays 12:00-22:00, Saturday 10:00-22:00, Sunday/Holidays 10:00-21:00
  • Large tournament space — daily events
  • Open late for after-work card shopping
  • Same chain as Main Store (separate inventory)'
);

-- ============================================================
-- Shop 3: Dragon Star Nipponbashi 3rd Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000103',
  'ドラゴンスター日本橋3号店', 'Dragon Star Nipponbashi 3rd Store',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区敷津東2-1-5', '2-1-5 Shikitsuhigashi, Naniwa-ku, Osaka 556-0012',
  ST_MakePoint(135.5065, 34.6562)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  3.8, 150,
  '06-6643-7755', 'ds_nipponbashi3',
  'Dragon Star''s third branch focusing on MTG and Flesh and Blood, with some Pokemon stock. Good complement to the main store for specific titles.',
  '• Weekdays 12:00-20:00, Weekends/Holidays 10:30-20:00
  • Focuses on MTG and Flesh and Blood
  • Pokemon stock available but smaller selection than main store'
);

-- ============================================================
-- Shop 4: Big Magic Namba
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_english_cards, sells_vintage,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000104',
  'BIG MAGICなんば店', 'Big Magic Namba',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区難波中2-4-15 興伸ビル1F-2F', 'Koshin Building 1F-2F, 2-4-15 Nanbanaka, Naniwa-ku, Osaka 556-0011',
  ST_MakePoint(135.5047, 34.6589)::geography,
  true,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  4.1, 250,
  '06-6633-7338', 'https://mtg.bigweb.co.jp/shop/namba',
  'Japan''s largest MTG shop chain with strong Pokemon TCG selection. English website available and staff can assist in English. Two floors with dueling space on 2F. Also carries Yu-Gi-Oh and Vanguard.',
  '• Weekdays 12:00-21:00, Weekends/Holidays 11:00-21:00
  • English support available — staff experienced with foreign visitors
  • English MTG and some English Pokemon cards in stock
  • Searchable English online inventory at bigweb.co.jp
  • 2F has dueling space for casual and tournament play'
);

-- ============================================================
-- Shop 5: Yellow Submarine Namba
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000105',
  'イエローサブマリンなんば店', 'Yellow Submarine Namba',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区日本橋3-8-23', '3-8-23 Nipponbashi, Naniwa-ku, Osaka 556-0005',
  ST_MakePoint(135.5059, 34.6591)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  3.9, 200,
  '06-6635-4662', 'https://yellowsubmarine.co.jp/', 'YS_NANBA',
  'Long-established hobby chain carrying MTG, Flesh and Blood, TRPG, board games, and Pokemon singles. Prices can be slightly higher but excellent for rare vintage finds. Clean and well-organized store.',
  '• Daily 11:00-20:00
  • Vintage card selection worth checking
  • Also carries board games, miniatures, and TRPG supplies
  • Cash and credit cards accepted'
);

-- ============================================================
-- Shop 6: Surugaya Osaka Nipponbashi Main Building
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000106',
  '駿河屋大阪日本橋本館', 'Surugaya Osaka Nipponbashi Main Building',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区日本橋4-11-3', '4-11-3 Nipponbashi, Naniwa-ku, Osaka 556-0005',
  ST_MakePoint(135.5061, 34.6565)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  3.8, 350,
  '06-6641-2500', 'https://www.suruga-ya.jp/feature/nihonbashi_main/index.html',
  'Massive multi-floor used goods store with an excellent trading card section. Known for competitive buyback prices and vintage/retro Pokemon cards. Open daily from 10am with no holidays. Tax-free shopping potentially available.',
  '• Daily 10:00-21:00, open year-round
  • Excellent for vintage/retro Pokemon cards
  • Multi-floor store — cards on dedicated floor
  • Competitive buyback prices — bring cards to sell
  • Also carries games, figures, DVDs, and books'
);

-- ============================================================
-- Shop 7: Amenity Dream Namba 2nd Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000107',
  'アメニティードリームなんば2号店', 'Amenity Dream Namba 2nd Store',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区難波中2-1-7 なんば東ビル3F', 'Namba East Building 3F, 2-1-7 Nanbanaka, Naniwa-ku, Osaka 556-0011',
  ST_MakePoint(135.5052, 34.6593)::geography,
  3, '3F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  3.7, 180,
  '06-6644-4694', 'https://amenitydream.co.jp/shop/osaka-nanba2/', 'amenity_nmb',
  'TCG specialty shop hosting official tournament events. Located on a side street off Otaroad. Good selection of Pokemon and Yu-Gi-Oh cards with regular competitive events.',
  '• Weekdays 12:00-21:00, Weekends/Holidays 11:00-20:30
  • Hosts official tournament events
  • Located off Otaroad — look for the building entrance
  • Credit cards accepted'
);

-- ============================================================
-- Shop 8: Hareruya Nipponbashi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, english_staff_days, floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_english_cards, sells_vintage,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000108',
  '晴れる屋日本橋店', 'Hareruya Nipponbashi',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区難波中2-2-15 タカサゴビル2F', 'Takasago Building 2F, 2-2-15 Nanbanaka, Naniwa-ku, Osaka 556-0011',
  ST_MakePoint(135.5048, 34.6591)::geography,
  true, 'Always', 2, '2F',
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  4.2, 300,
  '06-6585-9600', 'https://www.hareruyamtg.com/en/user_data/shop_nipponbashi',
  'Japan''s largest MTG specialty shop chain with full English support. Open incredibly late until 11pm. English website and English-capable staff make this a must-visit for foreign collectors. 1-minute walk from Nankai Namba Station.',
  '• Weekdays 12:00-23:00, Weekends/Holidays 10:00-23:00
  • Excellent English support — full English website
  • Open until 11pm — latest closing time in the area
  • 1-minute walk from Nankai Namba Station
  • Carries English MTG cards and some English Pokemon'
);

-- ============================================================
-- Shop 9: Hareruya2 Namba (Pokemon TCG Specialty)
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, english_staff_days, floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_raw_rare, sells_english_cards, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000109',
  '晴れる屋2なんば店', 'Hareruya2 Namba',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市中央区難波千日前7-10 COCONAMBA 5F', 'COCONAMBA 5F, 7-10 Namba-Sennichimae, Chuo-ku, Osaka 542-0075',
  ST_MakePoint(135.5057, 34.6613)::geography,
  true, 'Always', 5, '5F',
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true, true,
  true, 4.3, 250,
  'https://www.hareruya2.com/pages/store_namba-en', 'hareruya2namba',
  'Hareruya''s dedicated Pokemon TCG specialty store with 80-seat free play area. Daily Pokemon events and beginner-friendly teaching staff. Opened September 2024. Dedicated English website makes this the #1 stop for English-speaking Pokemon card collectors in Osaka.',
  '• Weekdays 12:00-21:00, Weekends/Holidays 10:00-21:00
  • #1 recommended shop for English-speaking visitors
  • Dedicated English website at hareruya2.com
  • 80-seat free play area — daily Pokemon events
  • Beginner-friendly with teaching staff
  • 2-minute walk from Nankai Namba Station
  • Graded cards, English cards, and vintage all available'
);

-- ============================================================
-- Shop 10: Card Labo Osaka Nipponbashi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000110',
  'カードラボ大阪日本橋店', 'Card Labo Osaka Nipponbashi',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区日本橋西1-1-3 アニメイトビル5F', 'Animate Building 5F, 1-1-3 Nipponbashi-Nishi, Naniwa-ku, Osaka 556-0004',
  ST_MakePoint(135.5044, 34.6608)::geography,
  5, '5F',
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  3.7, 200,
  '06-6567-9494', 'https://www.c-labo.jp/shop/nipponbashi/', 'nipponbashi_lab',
  'Large chain card shop with 32 duel seats inside the Animate building. Strong selection of Pokemon support SR and vintage cards. Custom deck builds available. Prices can be slightly higher than competitors.',
  '• Daily 12:00-21:00
  • 32-seat duel space
  • Located inside Animate building (5F) — look for entrance on ground floor
  • Strong vintage Pokemon selection
  • Credit cards and IC cards accepted'
);

-- ============================================================
-- Shop 11: Card Labo Otaroad Main Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  website_url,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000111',
  'カードラボオタロード本店', 'Card Labo Otaroad Main Store',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区日本橋4-16-1', '4-16-1 Nipponbashi, Naniwa-ku, Osaka 556-0005',
  ST_MakePoint(135.5054, 34.6558)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  3.8, 180,
  'https://www.c-labo.jp/shop/otaro/',
  'Card Labo''s flagship Otaroad branch. Specializes in support SR and old-back vintage Pokemon cards. Good atmosphere with beginner-friendly staff.',
  '• Daily 12:00-21:00
  • Flagship Otaroad location
  • Good for vintage Pokemon card hunters
  • Walk south along Otaroad to find it'
);

-- ============================================================
-- Shop 12: Mandarake Grand Chaos
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, payment_methods,
  sells_singles, sells_psa_graded, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000112',
  'まんだらけグランドカオス', 'Mandarake Grand Chaos',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区日本橋4-12-6', '4-12-6 Nipponbashi, Naniwa-ku, Osaka 556-0005',
  ST_MakePoint(135.5058, 34.6564)::geography,
  true,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  4.1, 500,
  '06-6636-7077', 'https://www.mandarake.co.jp/dir/gcs/',
  'Iconic multi-floor otaku shop relocated to current address in March 2025. Excellent for vintage and high-grade rare Pokemon cards. English floor guide and signage available. Tax-free shopping for tourists with passport.',
  '• Daily 12:00-20:00
  • English floor guide and signage — tourist-friendly
  • Tax-free shopping available for tourists with passport
  • Excellent for vintage/rare Pokemon cards
  • Also carries figures, manga, cosplay, and collectibles
  • Multi-floor store — cards on dedicated floor'
);

-- ============================================================
-- Shop 13: GIRAFULL Osaka Nipponbashi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000113',
  'GIRAFULL大阪日本橋店', 'GIRAFULL Osaka Nipponbashi',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区日本橋4-14-1', '4-14-1 Nipponbashi, Naniwa-ku, Osaka 556-0005',
  ST_MakePoint(135.5055, 34.6556)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  3.9, 150,
  'girafull_o_n',
  'Multi-TCG specialty shop carrying Pokemon, One Piece, Yu-Gi-Oh, and Flesh and Blood. Buying accepted until 1 hour before closing. Multiple locations in the Nipponbashi area.',
  '• Weekdays 12:00-20:00, Saturday 10:00-20:00, Sunday/Holidays 10:00-19:00
  • Multi-TCG shop — check for Pokemon specifically
  • Buyback service available
  • Multiple branches in the area'
);

-- ============================================================
-- Shop 14: GIRAFULL Namba
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000114',
  'GIRAFULLなんば店', 'GIRAFULL Namba',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市中央区難波千日前13-13 なんばKHビル', 'Namba KH Building, 13-13 Namba-Sennichimae, Chuo-ku, Osaka',
  ST_MakePoint(135.5064, 34.6610)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  4.0, 200,
  'GIRAFULL_Namba',
  'Entire building dedicated to TCG with 426 battle seats — one of the largest play spaces in Japan. 1-minute walk from Nankai Namba Station central exit. Carries Pokemon, One Piece, Yu-Gi-Oh, and more.',
  '• Weekdays 12:00-21:00, Saturday 10:00-21:00, Sunday 10:00-19:00
  • 426 battle seats — one of Japan''s largest play spaces
  • 1-minute walk from Nankai Namba Station central exit
  • Entire building is a card shop — impossible to miss'
);

-- ============================================================
-- Shop 15: Hobby Station Nipponbashi Main Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000115',
  'ホビーステーション日本橋本店', 'Hobby Station Nipponbashi Main Store',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区日本橋3-8-12', '3-8-12 Nipponbashi, Naniwa-ku, Osaka 556-0005',
  ST_MakePoint(135.5060, 34.6590)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  true, 3.8, 250,
  '06-6631-7820', 'https://www.hbst.net/shop/11/', 'HBSTnipponbashi',
  'Regional flagship card shop with large singles selection and 36-seat free duel space. Daily tournaments and events. Pokemon Card Gym certified store. Beginner-friendly with helpful staff.',
  '• Daily 11:00-20:00
  • 36-seat free duel space
  • Pokemon Card Gym certified store
  • Daily tournaments and events
  • Beginner-friendly — staff will help newcomers'
);

-- ============================================================
-- Shop 16: Full Comp Osaka Nipponbashi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000116',
  'フルコンプ大阪日本橋店', 'Full Comp Osaka Nipponbashi',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区日本橋3-8-18 平田ビル4F', 'Hirata Building 4F, 3-8-18 Nipponbashi, Naniwa-ku, Osaka 556-0005',
  ST_MakePoint(135.5058, 34.6590)::geography,
  4, '4F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  3.7, 150,
  '06-6636-2652', 'https://inspire-jp.net/fc-osaka/',
  'TCG specialty shop with play space. 4-minute walk from Namba Station. Carries Pokemon, Yu-Gi-Oh, and other TCGs. Active event schedule.',
  '• Weekdays 12:00-21:00, Weekends/Holidays 11:00-21:00
  • 4-minute walk from Namba Station
  • Play space available for casual games
  • Credit cards accepted'
);

-- ============================================================
-- Shop 17: Playze Osaka Nipponbashi Main Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000117',
  'プレイズ大阪日本橋本店', 'Playze Osaka Nipponbashi Main Store',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区日本橋3-7-6', '3-7-6 Nipponbashi, Naniwa-ku, Osaka 556-0005',
  ST_MakePoint(135.5055, 34.6592)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  true, 4.0, 200,
  '06-6684-8444', 'https://playze.jp/pages/playze_osaka_nihonbashi_headquarters', 'Preyz_N_honten',
  'Massive 210-seat battle space hosting regional qualifiers and major tournament events. Open late until 10pm. Operated by Otakara Souko group. One of the best tournament venues in Osaka.',
  '• Weekdays 12:00-22:00, Weekends/Holidays 10:00-22:00
  • 210-seat battle space — hosts major tournaments
  • Open late until 10pm
  • 4-minute walk from Namba Station via Otaroad
  • Beginner-friendly with helpful staff'
);

-- ============================================================
-- Shop 18: Magi Osaka Nipponbashi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000118',
  'magi大阪日本橋店', 'Magi Osaka Nipponbashi',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区日本橋3-6-2', '3-6-2 Nipponbashi, Naniwa-ku, Osaka 556-0005',
  ST_MakePoint(135.5055, 34.6594)::geography,
  true,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true, true,
  3.9, 150,
  'https://cardshopmagi.com/en/shop/magi-nipponbashi/', 'magiNipponbashi',
  'Collector-focused TCG and sneaker specialty shop. Handles PSA graded cards and has a strong online marketplace (magi.camp). Opened September 2023. Also sells on eBay internationally. English website available.',
  '• Daily 13:00-19:30
  • English website available — tourist-friendly
  • PSA graded cards in stock
  • Online marketplace at magi.camp
  • Also carries sneakers alongside cards
  • Shorter hours than most — plan visit for afternoon'
);

-- ============================================================
-- Shop 19: Ninnin Osaka Nipponbashi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000119',
  'ニンニン大阪日本橋店', 'Ninnin Osaka Nipponbashi',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区日本橋3-8-26 稲原ビル1F', 'Inahara Building 1F, 3-8-26 Nipponbashi, Naniwa-ku, Osaka 556-0005',
  ST_MakePoint(135.5061, 34.6589)::geography,
  1, '1F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  4.0, 180,
  '06-6647-3383', 'https://nin-nin-pokeka.jp/', 'ninnin_osaka',
  'Pokemon card specialty shop known for high buyback prices. Carries everything from latest releases to retro/old-back Pokemon cards. Strong focus on buying — great place to sell cards too.',
  '• Weekdays 13:00-20:00, Weekends/Holidays 11:00-20:00
  • Pokemon card specialist — focused inventory
  • Known for high buyback prices
  • Latest releases to vintage/retro cards
  • 5-minute walk from Namba Station'
);

-- ============================================================
-- Shop 20: ALANN Nipponbashi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, english_staff_days, floor, floor_label, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_raw_rare, sells_english_cards, sells_vintage,
  google_rating, google_review_count,
  phone, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'b1000000-0000-0000-0000-000000000120',
  'ALANN日本橋', 'ALANN Nipponbashi',
  'b1000000-0000-0000-0000-000000000001',
  '大阪府大阪市浪速区難波中2-4-3 村上ビル305', 'Murakami Building 305, 2-4-3 Nanbanaka, Naniwa-ku, Osaka 556-0011',
  ST_MakePoint(135.5049, 34.6588)::geography,
  true, 'Always', 3, '3F',
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true, true,
  4.0, 150,
  '06-6636-5222', 'alann_2017',
  'Highly multilingual card shop with staff speaking English, Chinese, Korean, and Thai. Carries Pokemon cards in English, Chinese, and Korean alongside Japanese. Claims the largest playmat stock in the area. Very tourist-friendly — a must-visit for non-Japanese speakers.',
  '• Weekdays 13:00-20:00, Weekends/Holidays 11:00-20:00
  • MOST tourist-friendly shop — multilingual staff (EN, CN, KR, TH)
  • English, Chinese, and Korean language cards available
  • Largest playmat stock in the area
  • 7-minute walk from Nihonbashi Station Exit 5
  • PSA graded cards available'
);

-- ============================================================
-- Shop Inventory Data for Osaka Shops
-- ============================================================

-- Dragon Star Main Store
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('b1000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, 'Competitive pricing on commons'),
  ('b1000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, 'Large rare singles selection'),
  ('b1000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('b1000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5200, 8000, 'Current sets always available'),
  ('b1000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('b1000000-0000-0000-0000-000000000101', 'oripa', 'in_stock', 500, 10000, 'Various price tiers'),
  ('b1000000-0000-0000-0000-000000000101', 'vintage_pack', 'limited', 30000, 300000, 'Vintage packs when available');

-- Hareruya2 Namba
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('b1000000-0000-0000-0000-000000000109', 'single_common', 'in_stock', 20, 500, NULL),
  ('b1000000-0000-0000-0000-000000000109', 'single_rare', 'in_stock', 500, 8000, 'Extensive selection'),
  ('b1000000-0000-0000-0000-000000000109', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('b1000000-0000-0000-0000-000000000109', 'single_sar', 'in_stock', 8000, 150000, NULL),
  ('b1000000-0000-0000-0000-000000000109', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('b1000000-0000-0000-0000-000000000109', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('b1000000-0000-0000-0000-000000000109', 'psa_graded', 'in_stock', 5000, 500000, 'PSA graded showcase'),
  ('b1000000-0000-0000-0000-000000000109', 'vintage_pack', 'limited', 30000, 300000, NULL),
  ('b1000000-0000-0000-0000-000000000109', 'accessories', 'in_stock', 300, 5000, 'Sleeves, deck boxes, playmats');

-- ALANN Nipponbashi
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('b1000000-0000-0000-0000-000000000120', 'single_common', 'in_stock', 30, 500, NULL),
  ('b1000000-0000-0000-0000-000000000120', 'single_rare', 'in_stock', 500, 8000, 'EN/CN/KR cards available'),
  ('b1000000-0000-0000-0000-000000000120', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('b1000000-0000-0000-0000-000000000120', 'psa_graded', 'in_stock', 5000, 300000, 'PSA graded cards'),
  ('b1000000-0000-0000-0000-000000000120', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('b1000000-0000-0000-0000-000000000120', 'accessories', 'in_stock', 300, 8000, 'Largest playmat stock in area');

-- Mandarake Grand Chaos
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('b1000000-0000-0000-0000-000000000112', 'single_rare', 'in_stock', 1000, 20000, 'Curated vintage selection'),
  ('b1000000-0000-0000-0000-000000000112', 'single_sr', 'in_stock', 5000, 100000, NULL),
  ('b1000000-0000-0000-0000-000000000112', 'psa_graded', 'in_stock', 10000, 500000, 'High-grade showcase'),
  ('b1000000-0000-0000-0000-000000000112', 'vintage_pack', 'limited', 50000, 500000, 'Vintage packs when available');

-- Surugaya Main Building
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('b1000000-0000-0000-0000-000000000106', 'single_common', 'in_stock', 10, 300, 'Bargain pre-owned singles'),
  ('b1000000-0000-0000-0000-000000000106', 'single_rare', 'in_stock', 300, 8000, NULL),
  ('b1000000-0000-0000-0000-000000000106', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('b1000000-0000-0000-0000-000000000106', 'booster_box', 'in_stock', 5500, 8500, NULL),
  ('b1000000-0000-0000-0000-000000000106', 'vintage_pack', 'limited', 30000, 300000, 'Vintage finds occasionally');

-- Big Magic Namba
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('b1000000-0000-0000-0000-000000000104', 'single_common', 'in_stock', 30, 500, NULL),
  ('b1000000-0000-0000-0000-000000000104', 'single_rare', 'in_stock', 500, 8000, 'English cards available'),
  ('b1000000-0000-0000-0000-000000000104', 'single_sr', 'in_stock', 3000, 40000, NULL),
  ('b1000000-0000-0000-0000-000000000104', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('b1000000-0000-0000-0000-000000000104', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('b1000000-0000-0000-0000-000000000104', 'vintage_pack', 'limited', 30000, 200000, NULL);

-- Hobby Station Nipponbashi
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('b1000000-0000-0000-0000-000000000115', 'single_common', 'in_stock', 20, 400, NULL),
  ('b1000000-0000-0000-0000-000000000115', 'single_rare', 'in_stock', 400, 5000, NULL),
  ('b1000000-0000-0000-0000-000000000115', 'single_sr', 'in_stock', 2000, 30000, NULL),
  ('b1000000-0000-0000-0000-000000000115', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('b1000000-0000-0000-0000-000000000115', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('b1000000-0000-0000-0000-000000000115', 'oripa', 'in_stock', 500, 5000, NULL);

-- GIRAFULL Namba
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('b1000000-0000-0000-0000-000000000114', 'single_common', 'in_stock', 30, 500, NULL),
  ('b1000000-0000-0000-0000-000000000114', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('b1000000-0000-0000-0000-000000000114', 'single_sr', 'in_stock', 3000, 40000, NULL),
  ('b1000000-0000-0000-0000-000000000114', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('b1000000-0000-0000-0000-000000000114', 'oripa', 'in_stock', 500, 10000, 'Popular oripa selection');
