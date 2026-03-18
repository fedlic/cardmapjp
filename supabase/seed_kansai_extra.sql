-- ============================================================
-- Kansai Extra: Kyoto & Kobe Pokemon Card Shops
-- Generated 2026-03-18
-- ============================================================

-- ============================================================
-- Region: Kyoto (Teramachi/Kawaramachi)
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'aa000000-0000-0000-0000-000000000001',
  'Teramachi/Kawaramachi', '寺町・河原町', 'Kyoto', 'Kyoto',
  35.00350000, 135.76850000, 15, true
);

-- ============================================================
-- Kyoto Shop 1: Yellow Submarine Kyoto
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage, sells_english_cards,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'aa000000-0000-0000-0000-000000000101',
  'イエローサブマリン 京都店', 'Yellow Submarine Kyoto',
  'aa000000-0000-0000-0000-000000000001',
  '京都府京都市中京区蛸薬師通り新京極東入裏寺町598 河原町OKIビル 4F', 'Kawaramachi OKI Building 4F, 598 Uratera-machi, Nakagyo-ku, Kyoto 604-0000',
  ST_MakePoint(135.76875, 35.00425)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  true, 3.8, 180,
  '075-253-4300', 'https://yellowsubmarine.co.jp/', 'YS_KYOTO',
  'National chain with strong board game and TCG selection. 4th floor location with elevator access. Some English singles available. Tax-free eligible with passport for purchases over 5,500 yen. Staff are patient with language barriers.',
  '• Mon-Fri 12:00-21:00, Sat-Sun 11:00-20:00, Holidays 12:00-20:00
  • 4th floor — elevator available
  • Some English Pokemon cards in stock
  • Tax-free eligible with passport (5,500+ yen)
  • Strong vintage and board game selection alongside TCG'
);

-- ============================================================
-- Kyoto Shop 2: Amenity Dream Kyoto
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'aa000000-0000-0000-0000-000000000102',
  'アメニティードリーム 京都店', 'Amenity Dream Kyoto',
  'aa000000-0000-0000-0000-000000000001',
  '京都府京都市中京区蛸薬師通り河原町西入る裏寺町591番地 ラウンドアバウト5thビル3F', 'Roundabout 5th Building 3F, 591 Uratera-machi, Nakagyo-ku, Kyoto 604-0000',
  ST_MakePoint(135.76850, 35.00440)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  true, 3.7, 130,
  '075-251-0807', 'https://amenitydream.co.jp/shop/kyoto-kyoto/', 'amenitykyoto',
  'TCG specialty shop on the 3rd floor near Yellow Submarine. Has a play space for card battles. Covers multiple TCG lines including Pokemon, Yu-Gi-Oh, and others. Good singles selection and walk-in friendly for browsing.',
  '• Mon-Fri 12:00-21:00, Sat-Sun 11:00-20:00
  • Play space available for card battles
  • Near Yellow Submarine — visit both on the same trip
  • Multiple TCG lines including Pokemon, Yu-Gi-Oh
  • Walk-in friendly for casual browsing'
);

-- ============================================================
-- Kyoto Shop 3: GIRAFULL Kyoto Kawaramachi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'aa000000-0000-0000-0000-000000000103',
  'GIRAFULL 京都河原町店', 'GIRAFULL Kyoto Kawaramachi',
  'aa000000-0000-0000-0000-000000000001',
  '京都府京都市中京区新京極蛸薬師下東側503-16', '503-16 Higashigawa-cho, Shinkyogoku, Nakagyo-ku, Kyoto 604-8046',
  ST_MakePoint(135.76810, 35.00380)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  true, 3.6, 100,
  '075-366-4944', 'https://girafull.co.jp/', 'GIRAFULL_Kyoto',
  'Formerly Dragon Star Kyoto. Located on Shinkyogoku shopping street. Known for bargain bins with discounted cards. Rebranded shop — some older maps may still list as Dragon Star. Easy to find on the busy shopping arcade.',
  '• Mon-Fri 12:00-20:00, Sat 11:00-20:00, Sun 11:00-19:00
  • Formerly Dragon Star — look for GIRAFULL signage
  • Located on Shinkyogoku shopping street
  • Known for bargain bin deals on discounted cards
  • PayPay accepted alongside credit cards'
);

-- ============================================================
-- Kyoto Shop 4: Treca Capital Kyoto Shijo Kawaramachi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'aa000000-0000-0000-0000-000000000104',
  'トレカキャピタル 京都四条河原町本店', 'Treca Capital Kyoto Shijo Kawaramachi',
  'aa000000-0000-0000-0000-000000000001',
  '京都府京都市下京区四条通河原町東入真町68 エディオン京都河原町本店 6F', 'EDION Kyoto Kawaramachi 6F, 68 Shin-cho, Shimogyo-ku, Kyoto 600-8023',
  ST_MakePoint(135.76920, 35.00310)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.5, 120,
  '075-213-6021', 'https://kyoto.edion.com/floor/6f/', 'Trecapi_kyoto',
  'Located inside the large EDION electronics store on the 6th floor. Boasts the area''s largest play space with 80 seats. Regular tournaments held. Being inside a major retailer means all major payment methods are accepted.',
  '• Daily 10:00-20:00
  • Inside EDION electronics store (6F) — take elevator
  • 80-seat battle space, largest in Kyoto area
  • Regular tournaments for Pokemon and other TCGs
  • All major payment methods accepted (EDION standard)'
);

-- ============================================================
-- Kyoto Shop 5: Treca Park Shijo Kawaramachi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'aa000000-0000-0000-0000-000000000105',
  'トレカパーク 四条河原町店', 'Treca Park Shijo Kawaramachi',
  'aa000000-0000-0000-0000-000000000001',
  '京都府京都市下京区中之町571 1F', '1F, 571 Nakanomachi, Shimogyo-ku, Kyoto 600-8032',
  ST_MakePoint(135.76850, 35.00220)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.4, 80,
  '075-371-5123', 'https://www.furu1.net/shop/shop2641.html', 'sijyotoreka',
  'Ground floor shop with the latest closing hours in the area (22:30). Operated by Furuichi used bookstore chain. Opened December 2023, so the store is new and clean. Convenient location near Shijo-Kawaramachi intersection.',
  '• Daily 10:00-22:30 — latest closing time in Kyoto
  • Ground floor, easy to find
  • Opened Dec 2023, clean and modern interior
  • Operated by Furuichi (used bookstore chain)
  • Various cashless payments accepted'
);

-- ============================================================
-- Kyoto Shop 6: Card Pro Kyoto
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_raw_rare, sells_english_cards, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'aa000000-0000-0000-0000-000000000106',
  'カードプロ 京都店', 'Card Pro Kyoto',
  'aa000000-0000-0000-0000-000000000001',
  '京都府京都市中京区新京極蛸薬師下る東側町513', '513 Higashigawa-cho, Shinkyogoku, Nakagyo-ku, Kyoto 604-8046',
  ST_MakePoint(135.76800, 35.00370)::geography,
  true,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true, true,
  true, 4.2, 150,
  'cardpro_kyoto',
  'HIGHLY RECOMMENDED for foreign tourists. Staff can communicate in basic English. One side of the shop is dedicated entirely to classic/vintage Pokemon cards. Tax-free eligible with passport. Popular with international collectors. Small but extremely well-curated selection.',
  '• Daily 12:00-20:00
  • BEST SHOP for English speakers in Kyoto — staff speak basic English
  • One side dedicated to vintage/classic Pokemon cards
  • PSA graded and English cards available
  • Tax-free eligible with passport (5,500+ yen)
  • On Shinkyogoku street near Family Mart'
);

-- ============================================================
-- Kyoto Shop 7: BOOKOFF PLUS Kawaramachi OPA
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'aa000000-0000-0000-0000-000000000107',
  'ブックオフプラス 河原町オーパ店', 'BOOKOFF PLUS Kawaramachi OPA',
  'aa000000-0000-0000-0000-000000000001',
  '京都府京都市中京区河原町通四条上ル 河原町オーパ 8F', 'Kawaramachi OPA 8F, Kawaramachi-dori Shijo-agaru, Nakagyo-ku, Kyoto 604-8026',
  ST_MakePoint(135.76940, 35.00360)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.5, 100,
  '075-253-6910', 'https://www.bookoff.co.jp/shop/shop20461.html', 'bop_kawara_tcg',
  'Large secondhand shop with a dedicated trading card section. Good for finding bargain-priced singles and older cards. 1 minute walk from Kawaramachi Station exit 3. Late hours (until 22:00) make it good for evening visits.',
  '• Daily 11:00-22:00
  • Dedicated trading card section on 8F
  • Good for bargain singles and older cards
  • 1 min from Kawaramachi Station exit 3
  • Standardized chain pricing — occasional underpriced finds'
);

-- ============================================================
-- Kyoto Shop 8: Surugaya Kyoto Teramachi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'aa000000-0000-0000-0000-000000000108',
  '駿河屋 京都寺町店', 'Surugaya Kyoto Teramachi',
  'aa000000-0000-0000-0000-000000000001',
  '京都府京都市下京区恵美須之町534-2', '534-2 Ebisunocho, Shimogyo-ku, Kyoto 600-8033',
  ST_MakePoint(135.76780, 35.00190)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.6, 200,
  '075-361-5553', 'https://www.suruga-ya.jp/feature/realstore/teramachi/index.html', 'surugateramachi',
  'Multi-floor hobby megastore. Trading cards are part of a larger inventory including retro games, figures, and anime goods. Vintage/retro selection can have hidden gems at fair prices. Great for one-stop hobby shopping.',
  '• Mon-Fri 12:00-22:00, Sat-Sun-Holidays 10:00-22:00
  • Multi-floor store — cards, retro games, figures, anime goods
  • Excellent for vintage/retro Pokemon finds
  • 3 min walk from Kawaramachi Station
  • Currently undergoing renovation (check before visiting)'
);

-- ============================================================
-- Kyoto Shop 9: Card Labo Avanti Kyoto
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'aa000000-0000-0000-0000-000000000109',
  'カードラボ アバンティ京都店', 'Card Labo Avanti Kyoto',
  'aa000000-0000-0000-0000-000000000001',
  '京都府京都市南区東九条西山王町31番地 京都アバンティ 6F', 'Kyoto Avanti 6F, 31 Higashi-kujo Nishi-sanno-cho, Minami-ku, Kyoto 601-8003',
  ST_MakePoint(135.75870, 34.98510)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  true, 3.7, 150,
  '075-682-8581', 'https://www.c-labo.jp/shop/kyoto/', 'avanti_labo',
  'Directly across from JR Kyoto Station (Hachijo exit). Extremely convenient for shinkansen arrivals. Card Labo is one of Japan''s largest TCG chains with strong Pokemon card inventory. Play space available for battles.',
  '• Daily 10:00-21:00
  • Directly across from JR Kyoto Station (Hachijo exit)
  • Best option if arriving by shinkansen
  • Card Labo chain — strong Pokemon TCG inventory
  • Play space available
  • Avanti building has restaurants and other shops'
);

-- ============================================================
-- Kyoto Shop 10: Hobby Station AEON Mall Kyoto
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'aa000000-0000-0000-0000-000000000110',
  'ホビーステーション イオンモールKYOTO店', 'Hobby Station AEON Mall Kyoto',
  'aa000000-0000-0000-0000-000000000001',
  '京都府京都市南区西九条鳥居口町1番地 イオンモールKYOTO 4F', 'AEON Mall Kyoto 4F, 1 Nishikujo-toriiguchi-cho, Minami-ku, Kyoto 601-8417',
  ST_MakePoint(135.75580, 34.98420)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  true, 3.6, 120,
  '075-661-2010', 'https://www.hbst.net/shop/29/', 'hbstkyotoshop',
  'Inside the large AEON Mall near Kyoto Station. Hobby Station is a well-known chain with consistent quality. Good for sealed product and popular singles. Mall has food courts, tax-free counters, and other shopping.',
  '• Daily 10:00-21:00
  • Inside AEON Mall near Kyoto Station (Hachijo exit)
  • Hobby Station chain — consistent quality and pricing
  • Mall has food court, tax-free counter, and other shops
  • Good for combining card shopping with general shopping'
);

-- ============================================================
-- Kyoto Shop 11: Dragon Star Kyoto
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'aa000000-0000-0000-0000-000000000111',
  'ドラゴンスター 京都店', 'Dragon Star Kyoto',
  'aa000000-0000-0000-0000-000000000001',
  '京都府京都市下京区真苧屋町195 福井ビル2F', 'Fukui Building 2F, 195 Maoya-cho, Shimogyo-ku, Kyoto 600-8211',
  ST_MakePoint(135.75740, 34.98780)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  true, 3.8, 180,
  '075-746-4139', 'https://dorasuta.jp/shop/detail?scd=8', 'ds_kyoto',
  'Major Kansai-based TCG chain, 5-minute walk from Kyoto Station. Play space with daily tournaments. Strong inventory across all card games. Good first stop if arriving at Kyoto Station.',
  '• Mon-Thu 12:00-21:00, Fri-Sat 10:00-21:00, Sun 10:00-20:00
  • 5-minute walk from Kyoto Station
  • Dragon Star chain — strong Kansai-based TCG retailer
  • Play space with daily tournaments
  • PayPay accepted alongside credit cards'
);

-- ============================================================
-- Kyoto Inventory Data
-- ============================================================

-- Card Pro Kyoto (top-rated, English-friendly, PSA graded)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('aa000000-0000-0000-0000-000000000106', 'single_common', 'in_stock', 30, 500, NULL),
  ('aa000000-0000-0000-0000-000000000106', 'single_rare', 'in_stock', 500, 10000, 'Well-curated selection'),
  ('aa000000-0000-0000-0000-000000000106', 'single_sr', 'in_stock', 3000, 60000, NULL),
  ('aa000000-0000-0000-0000-000000000106', 'single_sar', 'in_stock', 8000, 150000, NULL),
  ('aa000000-0000-0000-0000-000000000106', 'psa_graded', 'in_stock', 5000, 300000, 'PSA graded showcase'),
  ('aa000000-0000-0000-0000-000000000106', 'vintage_pack', 'limited', 30000, 300000, 'Vintage specialist')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- Yellow Submarine Kyoto
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('aa000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, NULL),
  ('aa000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('aa000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('aa000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5200, 8000, 'Current sets available'),
  ('aa000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('aa000000-0000-0000-0000-000000000101', 'vintage_pack', 'limited', 30000, 250000, 'Vintage finds occasionally')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- Card Labo Avanti Kyoto
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('aa000000-0000-0000-0000-000000000109', 'single_common', 'in_stock', 20, 500, NULL),
  ('aa000000-0000-0000-0000-000000000109', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('aa000000-0000-0000-0000-000000000109', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('aa000000-0000-0000-0000-000000000109', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('aa000000-0000-0000-0000-000000000109', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('aa000000-0000-0000-0000-000000000109', 'oripa', 'in_stock', 500, 5000, 'Various price tiers'),
  ('aa000000-0000-0000-0000-000000000109', 'accessories', 'in_stock', 300, 5000, 'Sleeves, deck boxes, playmats')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- Dragon Star Kyoto
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('aa000000-0000-0000-0000-000000000111', 'single_common', 'in_stock', 20, 500, 'Competitive pricing'),
  ('aa000000-0000-0000-0000-000000000111', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('aa000000-0000-0000-0000-000000000111', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('aa000000-0000-0000-0000-000000000111', 'booster_box', 'in_stock', 5200, 8000, 'Current sets available'),
  ('aa000000-0000-0000-0000-000000000111', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('aa000000-0000-0000-0000-000000000111', 'oripa', 'in_stock', 500, 10000, 'Various price tiers'),
  ('aa000000-0000-0000-0000-000000000111', 'vintage_pack', 'limited', 30000, 300000, 'Vintage packs when available')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- ============================================================
-- Region: Kobe (Sannomiya)
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'ab000000-0000-0000-0000-000000000001',
  'Sannomiya', '三宮', 'Kobe', 'Hyogo',
  35.19150000, 135.19050000, 15, true
);

-- ============================================================
-- Kobe Shop 1: Hareruya 2 Sannomiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_raw_rare, sells_oripa, sells_english_cards, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ab000000-0000-0000-0000-000000000101',
  '晴れる屋2 三宮店', 'Hareruya 2 Sannomiya',
  'ab000000-0000-0000-0000-000000000001',
  '兵庫県神戸市中央区三宮町1丁目9-1 センタープラザ 2F 44号', 'Center Plaza 2F Unit 44, 1-9-1 Sannomiya-cho, Chuo-ku, Kobe 650-0021',
  ST_MakePoint(135.19050, 35.19180)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true, true, true,
  true, 4.0, 300,
  '078-954-7878', 'https://www.hareruya2.com/pages/store_sannomiya', 'hareruya2snnmy',
  'Japan''s largest Pokemon TCG specialty chain. Massive inventory of singles, sealed product, and graded cards. Daily Pokemon TCG events. Hareruya brand has an English website for pre-visit research. Located inside Center Plaza shopping complex.',
  '• Weekdays 12:00-21:00, Weekends/Holidays 10:00-21:00
  • #1 recommended shop for Pokemon TCG in Kobe
  • English website at hareruya2.com for pre-visit research
  • PSA graded cards, English cards, and vintage all available
  • Daily Pokemon TCG events
  • 5 min walk from Sannomiya Station
  • Inside Center Plaza shopping complex'
);

-- ============================================================
-- Kobe Shop 2: Dragon Star Kobe Sannomiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ab000000-0000-0000-0000-000000000102',
  'ドラゴンスター 神戸三宮店', 'Dragon Star Kobe Sannomiya',
  'ab000000-0000-0000-0000-000000000001',
  '兵庫県神戸市中央区三宮町1-8-1 さんプラザ 3F 501C号室', 'San Plaza 3F Unit 501C, 1-8-1 Sannomiya-cho, Chuo-ku, Kobe 650-0021',
  ST_MakePoint(135.19100, 35.19150)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  true, 3.8, 250,
  '078-599-6080', 'https://dorasuta.jp/shop/detail?scd=6', 'ds_kbsannomiya',
  'Inside San Plaza, connected to Center Plaza. Huge 128-seat play space with daily official tournaments. Dragon Star is a major Kansai chain with excellent Pokemon card inventory. Also has a satellite shop nearby.',
  '• Weekdays 12:00-21:00, Sat 10:00-20:00, Sun/Holidays 10:00-19:30
  • 128-seat play space — daily official tournaments
  • Dragon Star chain — top Kansai TCG retailer
  • Inside San Plaza (connected to Center Plaza)
  • Satellite shop nearby for additional products
  • 5 min from Sannomiya Station'
);

-- ============================================================
-- Kobe Shop 3: Yellow Submarine Sannomiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_english_cards, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ab000000-0000-0000-0000-000000000103',
  'イエローサブマリン 三宮店', 'Yellow Submarine Sannomiya',
  'ab000000-0000-0000-0000-000000000001',
  '兵庫県神戸市中央区三宮町2-11-1 センタープラザ西館 2F', 'Center Plaza West Building 2F, 2-11-1 Sannomiya-cho, Chuo-ku, Kobe 650-0021',
  ST_MakePoint(135.18920, 35.19100)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true,
  true, 3.7, 150,
  '078-327-5202', 'https://yellowsubmarine.co.jp/', 'YS_Sannomiya',
  'National chain in Center Plaza West Building 2nd floor. Strong board game and TCG selection with play space. Pokemon singles in display cases. Open year-round except New Year''s Day. Good community atmosphere.',
  '• Mon-Sat 12:00-20:00, Sun/Holidays 11:00-19:00
  • Center Plaza West Building, 2nd floor
  • Some English Pokemon cards available (limited)
  • Open year-round (closed only New Year''s Day)
  • 3 min from Motomachi Station or 5 min from Sannomiya'
);

-- ============================================================
-- Kobe Shop 4: Playze Sannomiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ab000000-0000-0000-0000-000000000104',
  'プレイズ 三宮店', 'Playze Sannomiya',
  'ab000000-0000-0000-0000-000000000001',
  '兵庫県神戸市中央区三宮町2丁目11-1-315 センタープラザ西館 3F', 'Center Plaza West Building 3F Unit 315, 2-11-1 Sannomiya-cho, Chuo-ku, Kobe 650-0021',
  ST_MakePoint(135.18930, 35.19100)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  true, 3.7, 130,
  '078-599-5775', 'https://playze.jp/pages/playze_sannomiya', 'preyz_sannomiy',
  'Run by Otakara Souko group. One floor above Yellow Submarine in Center Plaza West. Has 48 free seats for card battles. Handles Pokemon, Yu-Gi-Oh, One Piece cards and more. Convenient to visit with Yellow Submarine downstairs.',
  '• Mon-Fri 12:00-20:00, Sat 10:00-21:00, Sun/Holidays 10:00-20:00
  • Center Plaza West 3F — one floor above Yellow Submarine
  • 48 free seats for card battles
  • Run by Otakara Souko group
  • Visit together with Yellow Submarine (2F) below'
);

-- ============================================================
-- Kobe Shop 5: Treca Park Sannomiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ab000000-0000-0000-0000-000000000105',
  'トレカパーク 三宮店', 'Treca Park Sannomiya',
  'ab000000-0000-0000-0000-000000000001',
  '兵庫県神戸市中央区三宮町2丁目11-1 センタープラザ西館 3F', 'Center Plaza West Building 3F, 2-11-1 Sannomiya-cho, Chuo-ku, Kobe 650-0021',
  ST_MakePoint(135.18920, 35.19100)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.5, 100,
  '078-321-2325', 'https://www.furu1.net/shop/shop0127.html', 'torepa_sannomiy',
  'Operated by Furuichi used bookstore chain. On the 3rd floor of Center Plaza West. Known for original packs (oripa) at 2,200 and 3,300 yen price points. Free duel space available. 7 min walk from Sannomiya Station.',
  '• Daily 10:00-20:00
  • Center Plaza West 3F — same floor as Playze
  • Known for oripa at 2,200 and 3,300 yen price points
  • Free duel space available
  • 7 min from Sannomiya or 5 min from Motomachi Station'
);

-- ============================================================
-- Kobe Shop 6: Treca Champion Kobe Sannomiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  website_url,
  ai_summary, visitor_tips)
VALUES (
  'ab000000-0000-0000-0000-000000000106',
  'トレカチャンピオン 神戸三宮店', 'Treca Champion Kobe Sannomiya',
  'ab000000-0000-0000-0000-000000000001',
  '兵庫県神戸市中央区三宮町1-8-1 さんプラザ 2F', 'San Plaza 2F, 1-8-1 Sannomiya-cho, Chuo-ku, Kobe 650-0021',
  ST_MakePoint(135.19100, 35.19150)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true,
  true, 3.5, 80,
  'http://www.trading-card-champion.com/concept12.html',
  'Opened April 2024. Located in San Plaza 2nd floor. Handles Pokemon, Dragon Ball, One Piece, Yu-Gi-Oh cards. Has duel space and weekly official tournaments. Newer store with clean, well-organized layout. Same building as Dragon Star (3F).',
  '• Daily 12:00-20:00 (estimated — confirm locally)
  • San Plaza 2F — same building as Dragon Star (3F)
  • Opened April 2024 — clean and well-organized
  • Weekly official tournaments
  • Duel space for card battles'
);

-- ============================================================
-- Kobe Shop 7: Surugaya Kobe Sannomiya Store 1
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'ab000000-0000-0000-0000-000000000107',
  '駿河屋 神戸三宮1号店', 'Surugaya Kobe Sannomiya Store 1',
  'ab000000-0000-0000-0000-000000000001',
  '兵庫県神戸市中央区三宮町1-8-1 さんプラザビル 3F-2', 'San Plaza Building 3F-2, 1-8-1 Sannomiya-cho, Chuo-ku, Kobe 650-0021',
  ST_MakePoint(135.19090, 35.19150)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.5, 150,
  '078-381-5011', 'https://www.suruga-ya.jp/feature/sannomiya/index.html',
  'Major Japanese secondhand hobby chain. Multiple Surugaya stores in the Sannomiya complex: 1-go store (3F, games/cards), 2-go store (2F, anime/figures). Good for older and vintage Pokemon cards at secondhand prices. Inventory changes daily.',
  '• Weekdays 12:00-20:00, Weekends/Holidays 11:00-20:00
  • San Plaza 3F — same building as Dragon Star
  • Multiple Surugaya stores in the complex
  • Good for vintage/older Pokemon cards at secondhand prices
  • Inventory changes daily — worth revisiting'
);

-- ============================================================
-- Kobe Shop 8: MINT Sannomiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_raw_rare, sells_english_cards, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ab000000-0000-0000-0000-000000000108',
  'MINT 三宮店', 'MINT Sannomiya',
  'ab000000-0000-0000-0000-000000000001',
  '兵庫県神戸市中央区三宮町1-5-10 三宮オーパ別館 1F-2F', 'Sannomiya OPA Annex 1F-2F, 1-5-10 Sannomiya-cho, Chuo-ku, Kobe 650-0021',
  ST_MakePoint(135.19250, 35.19250)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, true, true, true,
  true, 3.8, 200,
  'https://mint-web.jp/?pid=122209528', 'MintSannomiya1F',
  'Two-floor store in Sannomiya OPA Annex. 1st floor specializes in sports cards, 2nd floor is dedicated to Pokemon and other TCGs. Known for high-end collectible and PSA graded cards. Unique for combining sports cards and Pokemon TCG.',
  '• Daily 11:00-20:00 (estimated — confirm locally)
  • Two floors: 1F sports cards, 2F Pokemon and TCG
  • PSA graded cards and English cards available
  • High-end collectibles specialist
  • Unique combo of sports cards and Pokemon TCG
  • In Sannomiya OPA Annex building'
);

-- ============================================================
-- Kobe Shop 9: BOOKOFF Sannomiya Center-Gai
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'ab000000-0000-0000-0000-000000000109',
  'ブックオフ 三宮センター街店', 'BOOKOFF Sannomiya Center-Gai',
  'ab000000-0000-0000-0000-000000000001',
  '兵庫県神戸市中央区三宮町2-10-7 グレースコウベビル 5F', 'Grace Kobe Building 5F, 2-10-7 Sannomiya-cho, Chuo-ku, Kobe 650-0021',
  ST_MakePoint(135.18980, 35.19130)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.4, 100,
  '078-335-1446', 'https://www.bookoff.co.jp/shop/shop10822.html',
  'Large BOOKOFF with a trading card section. Good for budget finds and older cards mixed into general inventory. Consistent chain pricing with occasional underpriced cards. Also sells books, games, and electronics.',
  '• Daily 10:00-20:00
  • 5th floor — look for BOOKOFF signs at entrance
  • Good for budget finds and older cards
  • 4 min from JR Sannomiya Station
  • Also has books, games, and electronics'
);

-- ============================================================
-- Kobe Shop 10: Card Gamers Kobe Sannomiya
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  website_url,
  ai_summary, visitor_tips)
VALUES (
  'ab000000-0000-0000-0000-000000000110',
  'カードゲーマーズ 神戸三宮店', 'Card Gamers Kobe Sannomiya',
  'ab000000-0000-0000-0000-000000000001',
  '兵庫県神戸市中央区三宮町2丁目11-1 センタープラザ西館', 'Center Plaza West Building, 2-11-1 Sannomiya-cho, Chuo-ku, Kobe 650-0021',
  ST_MakePoint(135.18930, 35.19100)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true,
  true, 3.5, 80,
  'https://www.c-labo.jp/',
  'Operated by Card Labo (one of Japan''s biggest TCG chains) inside the Gamers anime shop. Opened April 2023. Located in Center Plaza West, same complex as Yellow Submarine and Playze. Specializes in Pokemon, One Piece, Dragon Ball, and arcade-game cards.',
  '• Daily 10:00-20:00 (estimated — confirm locally)
  • Center Plaza West — same complex as Yellow Submarine and Playze
  • Operated by Card Labo chain
  • Inside the Gamers anime shop
  • Opened April 2023
  • Pokemon, One Piece, Dragon Ball cards'
);

-- ============================================================
-- Kobe Inventory Data
-- ============================================================

-- Hareruya 2 Sannomiya (top Pokemon TCG specialist)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ab000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, NULL),
  ('ab000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, 'Extensive selection'),
  ('ab000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('ab000000-0000-0000-0000-000000000101', 'single_sar', 'in_stock', 8000, 150000, NULL),
  ('ab000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5200, 8000, 'All current sets'),
  ('ab000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('ab000000-0000-0000-0000-000000000101', 'psa_graded', 'in_stock', 5000, 500000, 'PSA graded showcase'),
  ('ab000000-0000-0000-0000-000000000101', 'vintage_pack', 'limited', 30000, 300000, NULL),
  ('ab000000-0000-0000-0000-000000000101', 'oripa', 'in_stock', 500, 10000, 'Various price tiers'),
  ('ab000000-0000-0000-0000-000000000101', 'accessories', 'in_stock', 300, 5000, 'Sleeves, deck boxes, playmats')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- Dragon Star Kobe Sannomiya
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ab000000-0000-0000-0000-000000000102', 'single_common', 'in_stock', 20, 500, 'Competitive pricing'),
  ('ab000000-0000-0000-0000-000000000102', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('ab000000-0000-0000-0000-000000000102', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('ab000000-0000-0000-0000-000000000102', 'booster_box', 'in_stock', 5200, 8000, 'Current sets always available'),
  ('ab000000-0000-0000-0000-000000000102', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('ab000000-0000-0000-0000-000000000102', 'oripa', 'in_stock', 500, 10000, 'Various price tiers'),
  ('ab000000-0000-0000-0000-000000000102', 'vintage_pack', 'limited', 30000, 300000, 'Vintage packs when available')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- MINT Sannomiya (high-end / PSA graded)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ab000000-0000-0000-0000-000000000108', 'single_rare', 'in_stock', 1000, 20000, 'Curated high-end selection'),
  ('ab000000-0000-0000-0000-000000000108', 'single_sr', 'in_stock', 5000, 100000, NULL),
  ('ab000000-0000-0000-0000-000000000108', 'single_sar', 'in_stock', 10000, 200000, NULL),
  ('ab000000-0000-0000-0000-000000000108', 'psa_graded', 'in_stock', 10000, 500000, 'High-grade showcase'),
  ('ab000000-0000-0000-0000-000000000108', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('ab000000-0000-0000-0000-000000000108', 'vintage_pack', 'limited', 50000, 500000, 'Vintage packs when available')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- Surugaya Kobe Sannomiya
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ab000000-0000-0000-0000-000000000107', 'single_common', 'in_stock', 10, 300, 'Bargain pre-owned singles'),
  ('ab000000-0000-0000-0000-000000000107', 'single_rare', 'in_stock', 300, 8000, NULL),
  ('ab000000-0000-0000-0000-000000000107', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('ab000000-0000-0000-0000-000000000107', 'booster_box', 'in_stock', 5500, 8500, NULL),
  ('ab000000-0000-0000-0000-000000000107', 'vintage_pack', 'limited', 30000, 300000, 'Vintage finds occasionally')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;
