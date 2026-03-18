-- ============================================================
-- Region: Fukuoka Tenjin / Hakata
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'f1000000-0000-0000-0000-000000000001',
  'Tenjin / Hakata', '天神・博多', 'Fukuoka', 'Fukuoka',
  33.59200000, 130.39900000, 14, true
);

-- ============================================================
-- Shop 1: Hareruya 2 Fukuoka (Pokemon Card Specialty)
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, english_staff_days, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_vintage, sells_english_cards, sells_raw_rare, sells_oripa,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000101',
  'ポケモンカード専門店 晴れる屋2 福岡店', 'Hareruya 2 Fukuoka',
  'f1000000-0000-0000-0000-000000000001',
  '〒810-0041 福岡県福岡市中央区大名2丁目1-53 BPRスクエア天神大名 2階',
  'BPR Square Tenjin Daimyo 2F, 2-1-53 Daimyo, Chuo-ku, Fukuoka 810-0041',
  ST_MakePoint(130.3946, 33.5888)::geography,
  true, 'Always',
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true, true, true, true, true, false,
  true, 4.3, 350,
  '092-753-7999', 'https://www.hareruya2.com/pages/store_fukuoka', 'hareruya2fkok',
  'Japan''s largest Pokemon card specialty chain with a dedicated Fukuoka store in the heart of Tenjin. Carries everything from vintage Japanese cards to the newest releases, including graded cards, English cards, and a wide range of supplies. English-language website and English-speaking staff make this the most tourist-friendly card shop in Fukuoka.',
  '• Best English support in Fukuoka — staff are used to foreign visitors
  • Accepts credit cards (Visa/Mastercard), IC cards, and PayPay
  • Weekdays 12:00-21:00, Weekends/Holidays 10:00-21:00
  • 5-minute walk from Nishi-Tetsu Fukuoka (Tenjin) Station
  • Vintage, graded, and English cards all available
  • Duel space with regular tournaments'
);

-- ============================================================
-- Shop 2: Card Labo Fukuoka Tenjin
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000102',
  'カードラボ 福岡天神店', 'Card Labo Fukuoka Tenjin',
  'f1000000-0000-0000-0000-000000000001',
  '〒810-0001 福岡県福岡市中央区天神2-8-22 JMFビル天神西通り01 2F',
  'JMF Building Tenjin Nishidori 01 2F, 2-8-22 Tenjin, Chuo-ku, Fukuoka 810-0001',
  ST_MakePoint(130.3960, 33.5905)::geography,
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true, true,
  true, 4.1, 280,
  '092-791-2646', 'https://www.c-labo.jp/shop/fukuokatenjin/',
  'Major nationwide card shop chain with a strong Tenjin presence. Known for Yu-Gi-Oh events but carries a full range of Pokemon cards including singles, boxes, and sealed packs. Features a satellite shop for Konami Card Game Station. Well-organized store with clear pricing.',
  '• Weekdays 11:00-20:00, Weekends 10:00-20:00
  • 3-minute walk from Tenjin Station Exit 3
  • Konami Card Game Station satellite shop inside
  • Good for Yu-Gi-Oh and Pokemon cards
  • Credit cards, IC cards, and QR payments accepted
  • Duel space available for events and casual play'
);

-- ============================================================
-- Shop 3: Yellow Submarine Magickers Fukuoka
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_english_cards,
  google_rating, google_review_count,
  website_url,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000103',
  'イエローサブマリン マジッカーズ福岡店', 'Yellow Submarine Magickers Fukuoka',
  'f1000000-0000-0000-0000-000000000001',
  '〒810-0001 福岡県福岡市中央区天神2-7-14 いちご天神シティビル3階',
  'Ichigo Tenjin City Building 3F, 2-7-14 Tenjin, Chuo-ku, Fukuoka 810-0001',
  ST_MakePoint(130.3968, 33.5908)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, false,
  3.7, 134,
  'https://yellowsubmarine.co.jp/shop/%E3%83%9E%E3%82%B8%E3%83%83%E3%82%AB%E3%83%BC%E3%82%BA%E7%A6%8F%E5%B2%A1%E5%BA%97/',
  'Long-established hobby chain with a dedicated Fukuoka store. Excellent selection of singles and supplies across Pokemon, MTG, Yu-Gi-Oh, and Duel Masters. Features a 52-seat duel room for tournaments and casual play. Well-organized by set with clear price tags.',
  '• 2-minute walk from Tenjin Station
  • 52-seat duel room — one of the largest play areas in Tenjin
  • Credit cards accepted (Visa/Mastercard)
  • Carries Pokemon, MTG, Yu-Gi-Oh, and Duel Masters
  • Good supply/accessory selection (sleeves, deck boxes, playmats)
  • Cards organized by set — easy to browse'
);

-- ============================================================
-- Shop 4: Surugaya Shintencho Toreka-kan (Card Hall)
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_vintage, sells_raw_rare,
  google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000104',
  '駿河屋 新天町店トレカ館', 'Surugaya Shintencho Toreka-kan',
  'f1000000-0000-0000-0000-000000000001',
  '〒810-0001 福岡県福岡市中央区天神2-8-215 積文館書店 新天町本店3階',
  'Sekibunkan Bookstore Shintencho Main Store 3F, 2-8-215 Tenjin, Chuo-ku, Fukuoka 810-0001',
  ST_MakePoint(130.3962, 33.5912)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  3.9, 120,
  'https://www.suruga-ya.jp/feature/realstore/shintencho/index.html', 'suruga_sinten',
  'Surugaya''s dedicated trading card branch inside the Shintencho shopping arcade, opened July 2025. Part of Japan''s largest secondhand hobby chain. Carries Pokemon, Yu-Gi-Oh, One Piece, MTG, and Duel Masters cards. Good place to find vintage cards and PSA graded rarities. Also buys cards at competitive prices.',
  '• Mon-Thu 14:00-20:30, Fri-Sun-Holidays 12:00-20:30
  • 2-minute walk from Tenjin Station
  • Inside the Shintencho covered shopping arcade
  • Great for vintage Pokemon cards and graded cards
  • Also buys/trades cards — bring your collection
  • Separate from Surugaya Hakata Marui store'
);

-- ============================================================
-- Shop 5: Surugaya Hakata Marui
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_vintage,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000105',
  '駿河屋 博多マルイ店', 'Surugaya Hakata Marui',
  'f1000000-0000-0000-0000-000000000001',
  '〒812-0012 福岡県福岡市博多区博多駅中央街9-1 博多マルイ6F',
  'Hakata Marui 6F, 9-1 Hakataekichuogai, Hakata-ku, Fukuoka 812-0012',
  ST_MakePoint(130.4207, 33.5897)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true,
  3.8, 200,
  '092-710-4437', 'https://www.suruga-ya.jp/feature/hakata_marui/index.html',
  'Surugaya''s Hakata branch in the Marui department store next to Hakata Station. Carries trading cards alongside figures, games, and anime goods. Convenient location for travelers arriving by Shinkansen or airport bus. Same building as Pokemon Center Fukuoka.',
  '• 10:00-21:00, open daily
  • Hakata Marui 6F — same building as Pokemon Center (2F)
  • 3-minute walk from JR Hakata Station
  • Credit cards and IC cards accepted
  • Combines card shopping with figures, games, and anime goods
  • Also buys cards — competitive buyback pricing'
);

-- ============================================================
-- Shop 6: Oretan Fukuoka Tenjin
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000106',
  'オレタン福岡天神店', 'Oretan Fukuoka Tenjin',
  'f1000000-0000-0000-0000-000000000001',
  '〒810-0001 福岡県福岡市中央区天神3丁目2-22 河村天神荘ビル3F',
  'Kawamura Tenjinso Building 3F, 3-2-22 Tenjin, Chuo-ku, Fukuoka 810-0001',
  ST_MakePoint(130.3977, 33.5923)::geography,
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true, true,
  true, 3.0, 150,
  'https://oretan.jp/shop/oretan_fukuoka_tenjin.html', 'card_strike',
  'One of Tenjin''s largest card shops by floor space with a massive 122-seat duel space. Carries Pokemon, Yu-Gi-Oh, One Piece, and more. Known for friendly staff, frequent tournaments, and a welcoming atmosphere for beginners and competitive players alike.',
  '• Mon-Thu 12:00-21:00, Fri-Sun 10:00-21:00, open daily
  • 8-minute walk from Tenjin Station
  • 122-seat duel space — largest in the area
  • Staff are friendly and helpful, great for beginners
  • Regular tournaments and events
  • Credit cards, IC cards, and QR payments accepted'
);

-- ============================================================
-- Shop 7: BOOKOFF SUPER BAZAAR Mina Tenjin
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  website_url,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000107',
  'BOOKOFF SUPER BAZAAR ミーナ天神店', 'BOOKOFF SUPER BAZAAR Mina Tenjin',
  'f1000000-0000-0000-0000-000000000001',
  '〒810-0001 福岡県福岡市中央区天神4丁目3-8 ミーナ天神 6F-7F',
  'Mina Tenjin 6F-7F, 4-3-8 Tenjin, Chuo-ku, Fukuoka 810-0001',
  ST_MakePoint(130.3948, 33.5929)::geography,
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true, true,
  true, 3.8, 450,
  'https://www.bookoff.co.jp/shop/shop20529.html',
  'Kyushu''s largest BOOKOFF with 350,000+ items across multiple floors. The trading card section rivals specialty shops, with professional-level inventory of Pokemon, Yu-Gi-Oh, and One Piece cards. Great value on pre-owned singles. Fair pricing that doesn''t inflate for foreign tourists. Also carries figures, games, books, and branded goods.',
  '• 10:00-21:00 daily, open year-round
  • Mina Tenjin 6F-7F — trading cards on 7F
  • 3-minute walk from Tenjin Station
  • Credit cards, IC cards, and QR payments accepted
  • Bargain singles — great for budget collectors
  • Also check the vintage/pre-owned section for hidden gems
  • Tax-free shopping may be available for tourists'
);

-- ============================================================
-- Shop 8: Fullcomp Fukuoka Tenjin
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000108',
  'フルコンプ福岡天神店', 'Fullcomp Fukuoka Tenjin',
  'f1000000-0000-0000-0000-000000000001',
  '〒810-0001 福岡県福岡市中央区天神3丁目4-10 天神西茂ビル2階',
  'Tenjin Nishishige Building 2F, 3-4-10 Tenjin, Chuo-ku, Fukuoka 810-0001',
  ST_MakePoint(130.3969, 33.5919)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true,
  3.7, 130,
  'https://inspire-jp.net/fc-tenjin/', 'fc_tenjin',
  'Fullcomp''s first Kyushu branch, opened January 2023. Multi-TCG shop carrying Pokemon, Yu-Gi-Oh, Duel Masters, One Piece, MTG, and more. Features a 64-seat duel space for tournaments. Good selection of singles and sealed products across all major TCG titles.',
  '• Weekdays 11:00-21:00, Weekends 10:00-21:00, open daily
  • 64-seat duel space with daily events
  • Carries a wide range of TCG titles beyond Pokemon
  • Buy-back service available
  • Credit cards accepted'
);

-- ============================================================
-- Shop 9: Bee Honpo Fukuoka Tenjin
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000109',
  'Bee本舗 福岡天神店', 'Bee Honpo Fukuoka Tenjin',
  'f1000000-0000-0000-0000-000000000001',
  '〒810-0041 福岡県福岡市中央区大名2丁目9-5 グランドビル2階',
  'Grand Building 2F, 2-9-5 Daimyo, Chuo-ku, Fukuoka 810-0041',
  ST_MakePoint(130.3932, 33.5887)::geography,
  '{"cash","visa","mastercard","paypay"}',
  true, true, true, true,
  3.9, 90,
  '092-791-3991', 'https://y874j.hp.peraichi.com/', 'honpo_beetenjin',
  'Popular Pokemon and One Piece card shop known for competitive pricing and frequent special deals. Customers report finding cards at lower prices than competing shops. Good selection of singles and sealed products with regular promotions.',
  '• 11:00-20:00 daily
  • 3-minute walk from Akasaka Station, 8-minute walk from Tenjin Station
  • Known for affordable pricing and special deals
  • Pokemon, Yu-Gi-Oh, One Piece, and more
  • Credit cards and PayPay accepted
  • Good buyback prices'
);

-- ============================================================
-- Shop 10: Toreka Ball Tenjin
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_oripa, sells_raw_rare,
  beginner_friendly, google_rating, google_review_count,
  twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000110',
  'トレカボール天神店', 'Toreka Ball Tenjin',
  'f1000000-0000-0000-0000-000000000001',
  '〒810-0001 福岡県福岡市中央区天神3丁目6-30 天神ふじビル2階',
  'Tenjin Fuji Building 2F, 3-6-30 Tenjin, Chuo-ku, Fukuoka 810-0001',
  ST_MakePoint(130.3983, 33.5930)::geography,
  '{"cash","visa","mastercard","paypay"}',
  true, true, true,
  true, 4.0, 80,
  'Toreca_Ball',
  'Pokemon card specialist known for excellent oripa (lottery packs) at 3,000 and 10,000 yen price points. Welcoming atmosphere with staff who take time to explain oripa and buyback options to first-time visitors. A favorite among local collectors for fair pricing.',
  '• Sun-Thu 12:00-20:00, Fri-Sat 12:00-21:00
  • Pokemon card specialist — focused selection
  • Popular oripa at 3,000 and 10,000 yen
  • Very beginner-friendly — staff explain everything
  • Credit cards and PayPay accepted'
);

-- ============================================================
-- Shop 11: Toreka Rises Fukuoka Tenjin
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_oripa, sells_raw_rare,
  google_rating, google_review_count,
  website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000111',
  'トレカライザス福岡天神店', 'Toreka Rises Fukuoka Tenjin',
  'f1000000-0000-0000-0000-000000000001',
  '〒810-0001 福岡県福岡市中央区天神3丁目3-1 木下ビル3F',
  'Kinoshita Building 3F, 3-3-1 Tenjin, Chuo-ku, Fukuoka 810-0001',
  ST_MakePoint(130.3977, 33.5924)::geography,
  '{"cash","visa","mastercard","paypay"}',
  true, true, true, true,
  3.7, 60,
  'https://torecarises.com/', 'RisesFukuoka',
  'Conveniently located just 10 seconds from Tenjin Station West Exit 1. Carries Pokemon, One Piece, Dragon Ball, Yu-Gi-Oh, and Weiss Schwarz cards. Known for high-value buyback program and popular oripa lottery packs.',
  '• Weekdays 11:00-19:00, Weekends/Holidays 11:00-21:00
  • Literally 10 seconds from Tenjin Station West Exit 1
  • Strong buyback/selling prices
  • Popular oripa available
  • Credit cards and PayPay accepted'
);

-- ============================================================
-- Shop 12: Pokemon Center Fukuoka
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, english_staff_days, payment_methods,
  sells_booster_box, sells_sealed_pack,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000112',
  'ポケモンセンターフクオカ', 'Pokemon Center Fukuoka',
  'f1000000-0000-0000-0000-000000000001',
  '〒812-0012 福岡県福岡市博多区博多駅中央街9-1 博多マルイ 2F',
  'Hakata Marui 2F, 9-1 Hakataekichuogai, Hakata-ku, Fukuoka 812-0012',
  ST_MakePoint(130.4207, 33.5897)::geography,
  true, 'Always',
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true,
  true, 4.3, 1200,
  '092-413-5185', 'https://www.pokemon.co.jp/shop/pokecen/fukuoka/',
  'The only official Pokemon Center in Kyushu. Reopened June 2025 in a renovated, larger space at Hakata Marui. Sells official Pokemon merchandise, sealed booster boxes, packs, and exclusive Pokemon Center promos. Does NOT sell singles or graded cards. Features an event space and card station for play experiences.',
  '• 10:00-21:00 daily
  • Hakata Marui 2F — directly connected to JR Hakata Station
  • Official sealed products and exclusive Pokemon Center promos
  • Does NOT sell singles — for singles, visit card shops in Tenjin
  • Can get crowded — expect queues on weekends and holidays
  • Same building as Surugaya (6F) and Card Labo (7F)
  • Tax-free shopping available for tourists with passport'
);

-- ============================================================
-- Shop 13: Card Labo Hakata Marui
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000113',
  'カードラボ 博多マルイ店', 'Card Labo Hakata Marui',
  'f1000000-0000-0000-0000-000000000001',
  '〒812-0012 福岡県福岡市博多区博多駅中央街9-1 博多マルイ 7F',
  'Hakata Marui 7F, 9-1 Hakataekichuogai, Hakata-ku, Fukuoka 812-0012',
  ST_MakePoint(130.4207, 33.5898)::geography,
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true,
  true, 3.8, 100,
  '092-710-5655', 'https://www.c-labo.jp/shop/hakatamarui/', 'hakata_labo',
  'Card Labo''s Hakata branch conveniently located in the same Marui department store as Pokemon Center Fukuoka. Good selection of Pokemon, Yu-Gi-Oh, and One Piece cards. Perfect complement to the Pokemon Center downstairs for visitors wanting both official merch and singles.',
  '• 10:00-21:00 daily
  • Hakata Marui 7F — same building as Pokemon Center (2F) and Surugaya (6F)
  • 2-minute walk from JR Hakata Station
  • One-stop shopping: Pokemon Center (2F) + Surugaya (6F) + Card Labo (7F)
  • Credit cards, IC cards, and QR payments accepted
  • Duel space available'
);

-- ============================================================
-- Shop 14: Mandarake Fukuoka
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_vintage, sells_raw_rare,
  google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000114',
  'まんだらけ 福岡店', 'Mandarake Fukuoka',
  'f1000000-0000-0000-0000-000000000001',
  '〒810-0041 福岡県福岡市中央区大名2丁目9-5 グランドビル',
  'Grand Building, 2-9-5 Daimyo, Chuo-ku, Fukuoka 810-0041',
  ST_MakePoint(130.3932, 33.5887)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true,
  4.0, 800,
  '092-716-7774', 'https://www.mandarake.co.jp/dir/fko/',
  'Iconic Japanese secondhand otaku chain with a Fukuoka store in the Daimyo area. While primarily known for figures, manga, and cosplay goods, the store carries vintage trading cards including rare Pokemon cards from early sets. Great for collectors seeking unique vintage finds alongside other otaku goods.',
  '• 12:00-20:00 daily
  • 1-minute walk from Akasaka Station Exit 5
  • Vintage/retro cards and rare finds
  • Also carries figures, manga, cosplay, and collectibles
  • Credit cards and IC cards accepted
  • Same building as Bee Honpo Fukuoka Tenjin
  • Tax-free shopping available for tourists with passport'
);

-- ============================================================
-- Shop 15: BOOKOFF NORTH Tenjin
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'f1000000-0000-0000-0000-000000000115',
  'ブックオフ ノース天神店', 'BOOKOFF NORTH Tenjin',
  'f1000000-0000-0000-0000-000000000001',
  '〒810-0001 福岡県福岡市中央区天神4-3-20 ノース天神6F-7F',
  'NORTH Tenjin 6F-7F, 4-3-20 Tenjin, Chuo-ku, Fukuoka 810-0001',
  ST_MakePoint(130.3950, 33.5933)::geography,
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true,
  true, 3.6, 320,
  '092-737-3911', 'https://www.bookoff.co.jp/',
  'Another large BOOKOFF location in the Tenjin area with a trading card section. Located in the NORTH Tenjin building near the main Tenjin intersection. Good bargain hunting for pre-owned Pokemon singles at reasonable prices. Less crowded than the Mina Tenjin branch.',
  '• 10:00-21:00 daily
  • 1-minute walk from Tenjin Station
  • Trading card section on upper floors
  • Bargain singles for budget collectors
  • Credit cards, IC cards, and QR payments accepted
  • Less crowded alternative to BOOKOFF Mina Tenjin'
);

-- ============================================================
-- Shop Inventory Data for Fukuoka Shops
-- ============================================================

-- Hareruya 2 Fukuoka (full range Pokemon specialist)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, 'Large singles collection organized by set'),
  ('f1000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, 'Extensive rare singles selection'),
  ('f1000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 50000, 'SR/UR cards regularly stocked'),
  ('f1000000-0000-0000-0000-000000000101', 'single_sar', 'in_stock', 8000, 150000, 'SAR cards available'),
  ('f1000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5200, 8000, 'Current sets always available'),
  ('f1000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('f1000000-0000-0000-0000-000000000101', 'psa_graded', 'in_stock', 5000, 500000, 'PSA graded showcase'),
  ('f1000000-0000-0000-0000-000000000101', 'vintage_pack', 'limited', 30000, 300000, 'Vintage packs when available'),
  ('f1000000-0000-0000-0000-000000000101', 'accessories', 'in_stock', 300, 5000, 'Sleeves, deck boxes, playmats');

-- Card Labo Fukuoka Tenjin
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000102', 'single_common', 'in_stock', 30, 400, NULL),
  ('f1000000-0000-0000-0000-000000000102', 'single_rare', 'in_stock', 400, 5000, NULL),
  ('f1000000-0000-0000-0000-000000000102', 'single_sr', 'in_stock', 2000, 30000, NULL),
  ('f1000000-0000-0000-0000-000000000102', 'booster_box', 'in_stock', 5500, 8000, 'Current sets in stock'),
  ('f1000000-0000-0000-0000-000000000102', 'sealed_pack', 'in_stock', 180, 500, NULL);

-- Yellow Submarine Magickers Fukuoka
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000103', 'single_common', 'in_stock', 30, 400, NULL),
  ('f1000000-0000-0000-0000-000000000103', 'single_rare', 'in_stock', 400, 5000, NULL),
  ('f1000000-0000-0000-0000-000000000103', 'single_sr', 'in_stock', 3000, 30000, NULL),
  ('f1000000-0000-0000-0000-000000000103', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('f1000000-0000-0000-0000-000000000103', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('f1000000-0000-0000-0000-000000000103', 'accessories', 'in_stock', 200, 4000, 'Good supply of sleeves, deck boxes');

-- Surugaya Shintencho Toreka-kan
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000104', 'single_rare', 'in_stock', 500, 10000, NULL),
  ('f1000000-0000-0000-0000-000000000104', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('f1000000-0000-0000-0000-000000000104', 'psa_graded', 'limited', 8000, 500000, 'PSA graded cards in showcase'),
  ('f1000000-0000-0000-0000-000000000104', 'vintage_pack', 'limited', 30000, 300000, 'Vintage packs occasionally'),
  ('f1000000-0000-0000-0000-000000000104', 'booster_box', 'in_stock', 5500, 8500, NULL);

-- Surugaya Hakata Marui
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000105', 'single_rare', 'in_stock', 500, 8000, NULL),
  ('f1000000-0000-0000-0000-000000000105', 'single_sr', 'limited', 3000, 40000, NULL),
  ('f1000000-0000-0000-0000-000000000105', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('f1000000-0000-0000-0000-000000000105', 'sealed_pack', 'in_stock', 180, 500, NULL);

-- Oretan Fukuoka Tenjin
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000106', 'single_common', 'in_stock', 30, 400, NULL),
  ('f1000000-0000-0000-0000-000000000106', 'single_rare', 'in_stock', 400, 5000, NULL),
  ('f1000000-0000-0000-0000-000000000106', 'single_sr', 'in_stock', 2000, 30000, NULL),
  ('f1000000-0000-0000-0000-000000000106', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('f1000000-0000-0000-0000-000000000106', 'sealed_pack', 'in_stock', 180, 500, NULL);

-- BOOKOFF SUPER BAZAAR Mina Tenjin
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000107', 'single_common', 'in_stock', 10, 200, 'Bargain pre-owned singles'),
  ('f1000000-0000-0000-0000-000000000107', 'single_rare', 'in_stock', 200, 5000, 'Pre-owned, good value'),
  ('f1000000-0000-0000-0000-000000000107', 'booster_box', 'limited', 5000, 7500, 'Occasional deals on older sets'),
  ('f1000000-0000-0000-0000-000000000107', 'sealed_pack', 'in_stock', 180, 400, NULL);

-- Fullcomp Fukuoka Tenjin
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000108', 'single_common', 'in_stock', 30, 400, NULL),
  ('f1000000-0000-0000-0000-000000000108', 'single_rare', 'in_stock', 400, 5000, NULL),
  ('f1000000-0000-0000-0000-000000000108', 'single_sr', 'in_stock', 2000, 25000, NULL),
  ('f1000000-0000-0000-0000-000000000108', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('f1000000-0000-0000-0000-000000000108', 'sealed_pack', 'in_stock', 180, 500, NULL);

-- Bee Honpo Fukuoka Tenjin
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000109', 'single_common', 'in_stock', 20, 300, 'Known for affordable pricing'),
  ('f1000000-0000-0000-0000-000000000109', 'single_rare', 'in_stock', 300, 4000, 'Competitive prices'),
  ('f1000000-0000-0000-0000-000000000109', 'single_sr', 'in_stock', 2000, 25000, NULL),
  ('f1000000-0000-0000-0000-000000000109', 'booster_box', 'in_stock', 5200, 7800, 'Often has deals'),
  ('f1000000-0000-0000-0000-000000000109', 'sealed_pack', 'in_stock', 180, 500, NULL);

-- Toreka Ball Tenjin
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000110', 'single_rare', 'in_stock', 400, 5000, NULL),
  ('f1000000-0000-0000-0000-000000000110', 'single_sr', 'in_stock', 2000, 30000, NULL),
  ('f1000000-0000-0000-0000-000000000110', 'oripa', 'in_stock', 3000, 10000, 'Popular 3,000 and 10,000 yen oripa');

-- Toreka Rises Fukuoka Tenjin
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000111', 'single_rare', 'in_stock', 400, 5000, NULL),
  ('f1000000-0000-0000-0000-000000000111', 'single_sr', 'in_stock', 2000, 30000, NULL),
  ('f1000000-0000-0000-0000-000000000111', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('f1000000-0000-0000-0000-000000000111', 'oripa', 'in_stock', 500, 10000, 'Various oripa tiers available');

-- Pokemon Center Fukuoka
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000112', 'booster_box', 'in_stock', 5500, 5800, 'Official MSRP pricing'),
  ('f1000000-0000-0000-0000-000000000112', 'sealed_pack', 'in_stock', 180, 550, 'All current sets available'),
  ('f1000000-0000-0000-0000-000000000112', 'deck', 'in_stock', 1800, 3000, 'Starter and battle decks'),
  ('f1000000-0000-0000-0000-000000000112', 'accessories', 'in_stock', 400, 8000, 'Official Pokemon sleeves, deck boxes, playmats, exclusive merch');

-- Card Labo Hakata Marui
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000113', 'single_common', 'in_stock', 30, 400, NULL),
  ('f1000000-0000-0000-0000-000000000113', 'single_rare', 'in_stock', 400, 5000, NULL),
  ('f1000000-0000-0000-0000-000000000113', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('f1000000-0000-0000-0000-000000000113', 'sealed_pack', 'in_stock', 180, 500, NULL);

-- Mandarake Fukuoka
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000114', 'single_rare', 'limited', 1000, 20000, 'Curated vintage rare selection'),
  ('f1000000-0000-0000-0000-000000000114', 'vintage_pack', 'limited', 50000, 500000, 'Vintage packs when available'),
  ('f1000000-0000-0000-0000-000000000114', 'single_sar', 'limited', 15000, 200000, 'High-value collector cards');

-- BOOKOFF NORTH Tenjin
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('f1000000-0000-0000-0000-000000000115', 'single_common', 'in_stock', 10, 200, 'Bargain pre-owned singles'),
  ('f1000000-0000-0000-0000-000000000115', 'single_rare', 'in_stock', 200, 3000, 'Pre-owned, budget-friendly'),
  ('f1000000-0000-0000-0000-000000000115', 'booster_box', 'limited', 5000, 7000, NULL);
