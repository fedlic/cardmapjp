-- Region: Akihabara
insert into regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
values (
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  'Akihabara', '秋葉原', 'Tokyo', 'Tokyo',
  35.69840000, 139.77310000, 15, true
);

-- Shop 1: Card Rush Akihabara
insert into shops (id, name_jp, name_en, region_id, address_jp, address_en, location, english_staff, english_staff_days, payment_methods, sells_singles, sells_booster_box, sells_psa_graded, sells_sealed_pack, google_rating, google_review_count, ai_summary, visitor_tips)
values (
  '10000000-0000-0000-0000-000000000001',
  'カードラッシュ秋葉原店', 'Card Rush Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-15-7', '3-15-7 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7723, 35.6986)::geography,
  true, 'Weekends',
  '{"cash"}',
  true, true, true, true,
  4.2, 340,
  'One of Akihabara''s most popular Pokémon card shops with an extensive singles collection and competitive prices. Known for their well-organized PSA graded card showcase and friendly atmosphere.',
  '• Cash only — ATM at 7-Eleven 1 min walk
• English-speaking staff available on weekends
• Singles organized by set in binder system — ask staff for help navigating
• PSA graded cards displayed in glass cases near the entrance'
);

-- Shop 2: Trecaforest
insert into shops (id, name_jp, name_en, region_id, address_jp, address_en, location, beginner_friendly, sells_singles, sells_booster_box, sells_sealed_pack, google_rating, google_review_count, ai_summary, visitor_tips)
values (
  '10000000-0000-0000-0000-000000000002',
  'トレカの森', 'Trecaforest',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-11-6', '1-11-6 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7715, 35.7003)::geography,
  true,
  true, true, true,
  4.0, 180,
  'A welcoming shop that''s great for beginners and casual collectors. Clean, well-lit store with clearly labeled sections and reasonable prices on sealed products.',
  '• Very beginner-friendly — staff will help you find what you need
• Good selection of sealed booster boxes at fair prices
• Cards organized by rarity, easy to browse
• Accepts cash and some IC cards'
);

-- Shop 3: Hareruya Tokyo
insert into shops (id, name_jp, name_en, region_id, address_jp, address_en, location, english_staff, english_staff_days, sells_singles, sells_booster_box, sells_english_cards, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
values (
  '10000000-0000-0000-0000-000000000003',
  '晴れる屋Tokyo', 'Hareruya Tokyo',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-14-10', '3-14-10 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7745, 35.6978)::geography,
  true, 'Always',
  true, true, true,
  '{"cash","visa","mastercard","ic"}',
  4.5, 520,
  'Premium card shop with excellent English support and a massive singles inventory. Hareruya is well-known in the competitive TCG community and stocks both Japanese and English Pokémon cards.',
  '• Excellent English support — staff are used to foreign visitors
• Accepts credit cards (Visa/Mastercard) and IC cards
• Huge singles selection searchable by set and card number
• Also carries English-language Pokémon cards'
);

-- Shop 4: Yuyu-Tei Akihabara
insert into shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, google_rating, google_review_count, ai_summary, visitor_tips)
values (
  '10000000-0000-0000-0000-000000000004',
  '遊々亭秋葉原店', 'Yuyu-Tei Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田4-6-1', '4-6-1 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7730, 35.6991)::geography,
  true, true, true, true,
  4.3, 290,
  'Well-established card shop chain with competitive pricing on singles and sealed products. Known for their extensive online presence and reliable grading of card conditions.',
  '• Cash only — 7-Eleven ATM nearby
• Cards graded by condition with clear pricing
• Check their website for stock before visiting
• Located on upper floors — look for the sign and take elevator'
);

-- Shop 5: HobbyStation Akihabara
insert into shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_sealed_pack, sells_oripa, google_rating, google_review_count, ai_summary, visitor_tips)
values (
  '10000000-0000-0000-0000-000000000005',
  'ホビーステーション秋葉原店', 'HobbyStation Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-16-12', '3-16-12 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7749, 35.6999)::geography,
  true, true, true, true,
  4.1, 210,
  'Multi-floor hobby shop with a dedicated Pokémon card section. Offers oripa (lottery packs) and a good mix of sealed and single cards at competitive prices.',
  '• Cash preferred, some electronic payments accepted
• Oripa (lottery packs) available — fun gamble for rare pulls
• Multiple floors — Pokémon cards typically on 2F or 3F
• Can get crowded on weekends, visit early for best selection'
);

-- Shop 6: Surugaya Akihabara
insert into shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_psa_graded, sells_vintage, sells_raw_rare, google_rating, google_review_count, ai_summary, visitor_tips)
values (
  '10000000-0000-0000-0000-000000000006',
  '駿河屋秋葉原買取センター', 'Surugaya Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-11-2', '3-11-2 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7718, 35.6976)::geography,
  true, true, true, true,
  4.0, 450,
  'Major secondhand hobby chain with an impressive vintage Pokémon card collection. Great place to find Base Set era cards, old sealed packs, and PSA graded rarities.',
  '• Cash and credit cards accepted
• Excellent vintage section — Base Set, Jungle, Fossil era cards
• PSA graded cards in locked showcase — ask staff to see them
• Also buys cards — bring your collection if you want to sell'
);

-- Shop 7: Mandarake Complex
insert into shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_vintage, sells_raw_rare, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
values (
  '10000000-0000-0000-0000-000000000007',
  'まんだらけComplex', 'Mandarake Complex',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-11-12', '3-11-12 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7710, 35.7005)::geography,
  true, true, true,
  '{"cash","visa","mastercard","ic"}',
  4.4, 2100,
  'Iconic Akihabara landmark with 8 floors of otaku goods. The trading card floor has rare vintage Pokémon cards you won''t find anywhere else, plus unique collector items.',
  '• Credit cards and IC cards accepted
• TCG section on 5F — take the elevator
• Amazing vintage finds but prices reflect rarity
• Tax-free shopping available for tourists with passport'
);

-- Shop 8: Card Kingdom Akihabara
insert into shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_sealed_pack, beginner_friendly, google_rating, google_review_count, ai_summary, visitor_tips)
values (
  '10000000-0000-0000-0000-000000000008',
  'カードキングダム', 'Card Kingdom Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-14-3', '3-14-3 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7738, 35.6982)::geography,
  true, true, true, true,
  3.9, 160,
  'Friendly neighborhood card shop with a welcoming atmosphere. Good for both beginners looking for starter decks and collectors browsing singles.',
  '• Cash only
• Beginner-friendly — staff happy to explain card values
• Smaller shop but well-curated selection
• Play space available for casual games'
);

-- Shop 9: HobbyOFF Akihabara
insert into shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_psa_graded, sells_vintage, sells_booster_box, google_rating, google_review_count, ai_summary, visitor_tips)
values (
  '10000000-0000-0000-0000-000000000009',
  'ホビーオフ秋葉原店', 'HobbyOFF Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田4-3-3', '4-3-3 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7755, 35.6970)::geography,
  true, true, true, true,
  3.8, 320,
  'Part of the Hard Off chain, this secondhand shop offers great value on pre-owned Pokémon cards. Hidden gems at bargain prices if you''re willing to dig through their bins.',
  '• Cash and credit cards accepted
• Bargain bins with ungraded cards — treasure hunting!
• PSA graded section near checkout counter
• Part of Hard Off chain — look for the yellow/green signage'
);

-- Shop 10: Yellow Submarine
insert into shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_sealed_pack, sells_english_cards, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
values (
  '10000000-0000-0000-0000-000000000010',
  'イエローサブマリン', 'Yellow Submarine',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-15-16', '1-15-16 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7726, 35.7001)::geography,
  true, true, true, true,
  '{"cash","visa","mastercard"}',
  4.1, 380,
  'Long-running hobby shop chain with a solid Pokémon card section. Stocks both Japanese and English cards, making it a great stop for international collectors.',
  '• Credit cards accepted (Visa/Mastercard)
• Carries English Pokémon cards — rare find in Akihabara
• Well-organized by set with clear price tags
• Multiple locations in Akihabara — this is the main store'
);

-- Shop Inventory Data
-- Card Rush
insert into shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) values
  ('10000000-0000-0000-0000-000000000001', 'single_common', 'in_stock', 30, 500, 'Large commons/uncommons collection'),
  ('10000000-0000-0000-0000-000000000001', 'single_rare', 'in_stock', 500, 5000, 'Good rare singles selection'),
  ('10000000-0000-0000-0000-000000000001', 'single_sr', 'in_stock', 3000, 30000, 'SR/UR cards regularly stocked'),
  ('10000000-0000-0000-0000-000000000001', 'single_sar', 'limited', 10000, 100000, 'SAR cards available but sell fast'),
  ('10000000-0000-0000-0000-000000000001', 'booster_box', 'in_stock', 5500, 8000, 'Current sets always available'),
  ('10000000-0000-0000-0000-000000000001', 'psa_graded', 'in_stock', 5000, 500000, 'PSA 9-10 showcase near entrance'),
  ('10000000-0000-0000-0000-000000000001', 'sealed_pack', 'in_stock', 180, 500, NULL);

-- Trecaforest
insert into shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) values
  ('10000000-0000-0000-0000-000000000002', 'single_common', 'in_stock', 30, 300, NULL),
  ('10000000-0000-0000-0000-000000000002', 'single_rare', 'in_stock', 300, 3000, NULL),
  ('10000000-0000-0000-0000-000000000002', 'booster_box', 'in_stock', 5500, 7500, 'Fair prices on current sets'),
  ('10000000-0000-0000-0000-000000000002', 'sealed_pack', 'in_stock', 180, 400, NULL),
  ('10000000-0000-0000-0000-000000000002', 'deck', 'in_stock', 1800, 3000, 'Starter decks always in stock');

-- Hareruya
insert into shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) values
  ('10000000-0000-0000-0000-000000000003', 'single_common', 'in_stock', 20, 500, 'Massive inventory'),
  ('10000000-0000-0000-0000-000000000003', 'single_rare', 'in_stock', 500, 8000, 'Searchable by set and number'),
  ('10000000-0000-0000-0000-000000000003', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('10000000-0000-0000-0000-000000000003', 'single_sar', 'in_stock', 8000, 150000, 'Best SAR selection in Akihabara'),
  ('10000000-0000-0000-0000-000000000003', 'booster_box', 'in_stock', 5200, 7800, NULL),
  ('10000000-0000-0000-0000-000000000003', 'accessories', 'in_stock', 300, 5000, 'Sleeves, deck boxes, playmats');

-- Yuyu-Tei
insert into shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) values
  ('10000000-0000-0000-0000-000000000004', 'single_common', 'in_stock', 20, 400, NULL),
  ('10000000-0000-0000-0000-000000000004', 'single_rare', 'in_stock', 400, 5000, 'Condition-graded pricing'),
  ('10000000-0000-0000-0000-000000000004', 'single_sr', 'in_stock', 2000, 40000, NULL),
  ('10000000-0000-0000-0000-000000000004', 'booster_box', 'in_stock', 5400, 7600, NULL),
  ('10000000-0000-0000-0000-000000000004', 'sealed_pack', 'in_stock', 180, 500, NULL);

-- HobbyStation
insert into shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) values
  ('10000000-0000-0000-0000-000000000005', 'single_common', 'in_stock', 30, 400, NULL),
  ('10000000-0000-0000-0000-000000000005', 'single_rare', 'in_stock', 400, 4000, NULL),
  ('10000000-0000-0000-0000-000000000005', 'booster_box', 'in_stock', 5500, 8500, NULL),
  ('10000000-0000-0000-0000-000000000005', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('10000000-0000-0000-0000-000000000005', 'oripa', 'in_stock', 500, 10000, 'Multiple price tiers available');

-- Surugaya
insert into shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) values
  ('10000000-0000-0000-0000-000000000006', 'single_rare', 'in_stock', 500, 10000, NULL),
  ('10000000-0000-0000-0000-000000000006', 'single_sr', 'limited', 5000, 80000, NULL),
  ('10000000-0000-0000-0000-000000000006', 'psa_graded', 'in_stock', 8000, 1000000, 'High-end PSA 10 showcase'),
  ('10000000-0000-0000-0000-000000000006', 'vintage_pack', 'limited', 30000, 500000, 'Base Set, Jungle packs occasionally'),
  ('10000000-0000-0000-0000-000000000006', 'vintage_box', 'limited', 200000, 3000000, 'Rare vintage boxes when available');

-- Mandarake
insert into shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) values
  ('10000000-0000-0000-0000-000000000007', 'single_rare', 'in_stock', 1000, 20000, 'Curated rare selection'),
  ('10000000-0000-0000-0000-000000000007', 'single_sar', 'limited', 15000, 200000, NULL),
  ('10000000-0000-0000-0000-000000000007', 'vintage_pack', 'limited', 50000, 800000, 'Unique vintage finds'),
  ('10000000-0000-0000-0000-000000000007', 'vintage_box', 'limited', 300000, 5000000, 'Museum-quality vintage boxes');

-- Card Kingdom
insert into shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) values
  ('10000000-0000-0000-0000-000000000008', 'single_common', 'in_stock', 20, 300, NULL),
  ('10000000-0000-0000-0000-000000000008', 'single_rare', 'in_stock', 300, 3000, NULL),
  ('10000000-0000-0000-0000-000000000008', 'booster_box', 'in_stock', 5500, 7800, NULL),
  ('10000000-0000-0000-0000-000000000008', 'sealed_pack', 'in_stock', 180, 400, NULL),
  ('10000000-0000-0000-0000-000000000008', 'deck', 'in_stock', 1500, 3000, 'Good starter deck selection');

-- HobbyOFF
insert into shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) values
  ('10000000-0000-0000-0000-000000000009', 'single_common', 'in_stock', 10, 200, 'Bargain bin treasures'),
  ('10000000-0000-0000-0000-000000000009', 'single_rare', 'in_stock', 200, 5000, 'Pre-owned, great value'),
  ('10000000-0000-0000-0000-000000000009', 'psa_graded', 'limited', 3000, 300000, NULL),
  ('10000000-0000-0000-0000-000000000009', 'booster_box', 'limited', 5000, 7000, 'Occasional deals on older sets');

-- Yellow Submarine
insert into shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) values
  ('10000000-0000-0000-0000-000000000010', 'single_common', 'in_stock', 30, 400, NULL),
  ('10000000-0000-0000-0000-000000000010', 'single_rare', 'in_stock', 400, 5000, NULL),
  ('10000000-0000-0000-0000-000000000010', 'single_sr', 'in_stock', 3000, 30000, NULL),
  ('10000000-0000-0000-0000-000000000010', 'booster_box', 'in_stock', 5500, 8000, NULL),
  ('10000000-0000-0000-0000-000000000010', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('10000000-0000-0000-0000-000000000010', 'accessories', 'in_stock', 200, 4000, 'Sleeves and deck boxes');
