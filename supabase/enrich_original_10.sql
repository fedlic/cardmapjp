-- =============================================================
-- Enrich Original 10 Shops: Missing Inventory + Updated Summaries
-- Run in Supabase Dashboard → SQL Editor
-- =============================================================

-- =====================
-- 1. Card Rush Akihabara (001) — add missing: accessories, deck
-- =====================
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000001', 'accessories', 'in_stock', 200, 3000, 'Sleeves, top loaders, and card cases'),
  ('10000000-0000-0000-0000-000000000001', 'deck', 'in_stock', 1500, 3500, 'Pre-constructed and starter decks')
ON CONFLICT (shop_id, category) DO NOTHING;

UPDATE shops SET
  ai_summary = 'Akihabara''s most iconic Pokémon card shop, famous for competitive singles pricing and one of the largest PSA graded showcases in the area. The shop operates a binder system where singles are organized by set — staff will help you navigate. Multiple branches in Akihabara, but this main store on Chuo-dori is the must-visit.',
  visitor_tips = '• Cash only — nearest ATM at 7-Eleven (1 min walk toward station)
• English-speaking staff on weekends; basic communication OK on weekdays
• Singles in binders by set number — tell staff which set you want
• PSA 9-10 graded cards in glass cases near entrance — ask to see them
• Gets very crowded after 2pm on weekends — visit in the morning for best experience
• Also has Store #0 (BiTO AKIBA PLAZA 7F) and Store #2 nearby'
WHERE id = '10000000-0000-0000-0000-000000000001';

-- =====================
-- 2. Trecaforest (002) — add missing: single_sr, accessories
-- =====================
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000002', 'single_sr', 'in_stock', 2000, 15000, 'Decent SR selection, fairly priced'),
  ('10000000-0000-0000-0000-000000000002', 'accessories', 'in_stock', 150, 2000, 'Basic sleeves and deck boxes')
ON CONFLICT (shop_id, category) DO NOTHING;

UPDATE shops SET
  ai_summary = 'A welcoming, well-lit shop that''s perfect for beginners and casual collectors visiting Akihabara for the first time. Cards are clearly labeled by rarity with fair prices, and staff are patient with newcomers. Good selection of sealed booster boxes and starter decks at competitive prices — one of the best value shops for sealed product.',
  visitor_tips = '• Very beginner-friendly — staff will explain card values and help you pick
• Cards sorted by rarity with clear Japanese price tags
• Best for: sealed booster boxes and starter decks at fair retail prices
• Accepts cash and IC cards (Suica/PASMO)
• Smaller store, but well-organized and not overwhelming
• Good first stop before exploring more specialized shops'
WHERE id = '10000000-0000-0000-0000-000000000002';

-- =====================
-- 3. Hareruya Tokyo (003) — add missing: sealed_pack, deck
-- =====================
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000003', 'sealed_pack', 'in_stock', 180, 550, 'Current and recent sets available'),
  ('10000000-0000-0000-0000-000000000003', 'deck', 'in_stock', 1500, 3500, 'Starter and pre-built decks')
ON CONFLICT (shop_id, category) DO NOTHING;

UPDATE shops SET
  ai_summary = 'The gold standard for competitive TCG shopping in Akihabara. Hareruya Tokyo has the most extensive singles inventory in the area, searchable by set and card number. They stock both Japanese AND English Pokémon cards — extremely rare in Japan. Staff speak excellent English and are accustomed to serving international visitors. Accepts credit cards, which is unusual for Akihabara card shops.',
  visitor_tips = '• BEST English support in Akihabara — staff speak fluent English
• Accepts Visa, Mastercard, and IC cards (Suica/PASMO) — rare for card shops!
• Stocks English-language Pokémon cards — very hard to find elsewhere in Japan
• Singles searchable by set code and card number — tell staff what you need
• Huge SAR/SR collection — best selection in the area
• Playmats, sleeves, deck boxes also available
• Separate from Hareruya 2 (Pokémon-only specialty store nearby)'
WHERE id = '10000000-0000-0000-0000-000000000003';

-- =====================
-- 4. Yuyu-Tei (004) — add missing: single_sar, deck, accessories
-- =====================
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000004', 'single_sar', 'in_stock', 8000, 80000, 'Good SAR selection with condition grades'),
  ('10000000-0000-0000-0000-000000000004', 'deck', 'in_stock', 1500, 3000, 'Starter decks in stock'),
  ('10000000-0000-0000-0000-000000000004', 'accessories', 'in_stock', 200, 3000, 'Sleeves and deck boxes')
ON CONFLICT (shop_id, category) DO NOTHING;

UPDATE shops SET
  ai_summary = 'Well-established nationwide chain known for reliable condition grading and competitive online-synced pricing. Every card is graded A/B/C with clear pricing — what you see is what you get. Strong online presence means you can check stock before visiting. Located on upper floors, so look for their signage and take the elevator.',
  visitor_tips = '• Cards graded by condition (A/B/C) with prices adjusted accordingly — great transparency
• Cash only — 7-Eleven ATM across the street
• Check yuyu-tei.jp before visiting to see what''s in stock
• Upper floors — look for the green Yuyu-Tei sign and take elevator
• Raw rare cards available — good for finding ungraded gems
• Popular chain with consistent pricing across locations'
WHERE id = '10000000-0000-0000-0000-000000000004';

-- =====================
-- 5. HobbyStation (005) — add missing: single_sr, deck, accessories
-- =====================
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000005', 'single_sr', 'in_stock', 2500, 35000, 'SR/UR selection across sets'),
  ('10000000-0000-0000-0000-000000000005', 'deck', 'in_stock', 1500, 3000, 'Pre-constructed decks'),
  ('10000000-0000-0000-0000-000000000005', 'accessories', 'in_stock', 200, 4000, 'Sleeves, playmats, deck boxes')
ON CONFLICT (shop_id, category) DO NOTHING;

UPDATE shops SET
  ai_summary = 'Multi-floor hobby shop with dedicated Pokémon card floors and one of the best oripa (lottery pack) selections in Akihabara. Offers multiple oripa tiers from ¥500 to ¥10,000 — a fun and uniquely Japanese way to gamble on rare pulls. Good all-around stock of singles, sealed product, and accessories.',
  visitor_tips = '• Oripa (lottery packs) are a MUST-TRY — multiple price tiers from ¥500 up
• Cash preferred; some electronic payments accepted
• Pokémon cards usually on 2F or 3F — check floor guide at entrance
• Gets crowded on weekends after noon — visit early for best oripa selection
• Multiple floors with different TCG titles — Pokémon section clearly marked
• Also carries sleeves, playmats, and deck boxes'
WHERE id = '10000000-0000-0000-0000-000000000005';

-- =====================
-- 6. Surugaya (006) — add missing: single_common, accessories
-- =====================
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000006', 'single_common', 'in_stock', 30, 500, 'Huge bulk commons/uncommons bins'),
  ('10000000-0000-0000-0000-000000000006', 'accessories', 'in_stock', 200, 3000, 'Card supplies and storage')
ON CONFLICT (shop_id, category) DO NOTHING;

UPDATE shops SET
  ai_summary = 'Japan''s largest secondhand hobby chain, and their Akihabara location is a treasure trove for vintage Pokémon collectors. The PSA graded showcase features cards worth ¥100,000+ in locked glass cases. Base Set, Jungle, Fossil, and other early-era sealed packs appear occasionally. They also buy cards at competitive rates — bring your collection if you want to sell.',
  visitor_tips = '• BEST for vintage — Base Set, Jungle, Fossil era cards and sealed packs
• PSA graded cards in locked showcase — ask staff to unlock for viewing
• Cash and credit cards accepted
• Also BUYS cards — competitive buyback rates, bring your extras
• Check the bulk bins for hidden gems at low prices
• Multiple Surugaya locations in Akihabara — this is the main buy center
• Staff limited English but prices are clearly tagged'
WHERE id = '10000000-0000-0000-0000-000000000006';

-- =====================
-- 7. Mandarake Complex (007) — add missing: single_sr, single_common, accessories
-- =====================
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000007', 'single_sr', 'in_stock', 5000, 50000, 'Premium SR/UR in display cases'),
  ('10000000-0000-0000-0000-000000000007', 'single_common', 'in_stock', 50, 500, 'Curated commons at slightly higher prices'),
  ('10000000-0000-0000-0000-000000000007', 'accessories', 'limited', 300, 5000, 'Limited card supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

UPDATE shops SET
  ai_summary = 'Iconic 8-floor Akihabara landmark and a must-visit for any collector. The TCG section (5F) features rare vintage Pokémon cards you won''t find anywhere else — including museum-quality sealed boxes worth millions of yen. Prices reflect the rarity, but the selection is unmatched. Tax-free shopping is available for tourists with a valid passport.',
  visitor_tips = '• TCG section on 5F — take the elevator (building has 8 floors of otaku goods)
• TAX-FREE shopping available — bring your passport to the register!
• Accepts credit cards (Visa/Mastercard) and IC cards
• Vintage sealed boxes can cost ¥300,000-¥5,000,000+ — window shopping is free!
• Best for: rare/unique vintage finds you can''t get anywhere else
• Also worth browsing other floors — manga, figures, cosplay, retro games
• Most famous otaku building in Akihabara — worth visiting even just to look'
WHERE id = '10000000-0000-0000-0000-000000000007';

-- =====================
-- 8. Card Kingdom (008) — add missing: single_sr, accessories
-- =====================
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000008', 'single_sr', 'in_stock', 2000, 20000, 'Curated SR selection'),
  ('10000000-0000-0000-0000-000000000008', 'accessories', 'in_stock', 150, 2500, 'Sleeves, deck boxes, card files')
ON CONFLICT (shop_id, category) DO NOTHING;

UPDATE shops SET
  ai_summary = 'A friendly, smaller card shop with a welcoming atmosphere that''s perfect for beginners. Staff are happy to explain card values and help you find specific cards. Features a casual play space for on-the-spot games. The curated selection is smaller than the mega-shops but well-organized, making it less overwhelming for first-time visitors.',
  visitor_tips = '• BEST for beginners — staff are patient and helpful with newcomers
• Cash only — ATM at nearby convenience store
• Casual play space available — challenge a local to a game!
• Smaller, well-curated selection — less overwhelming than giant shops
• Good starter deck selection for getting into the game
• Quiet weekday atmosphere vs crowded weekend scene'
WHERE id = '10000000-0000-0000-0000-000000000008';

-- =====================
-- 9. HobbyOFF (009) — add missing: vintage_pack, vintage_box, sealed_pack, accessories
-- =====================
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000009', 'vintage_pack', 'limited', 15000, 200000, 'Occasional vintage sealed packs'),
  ('10000000-0000-0000-0000-000000000009', 'vintage_box', 'limited', 80000, 800000, 'Rare vintage boxes when traded in'),
  ('10000000-0000-0000-0000-000000000009', 'sealed_pack', 'in_stock', 180, 400, 'Current set packs'),
  ('10000000-0000-0000-0000-000000000009', 'accessories', 'in_stock', 100, 2000, 'Basic card supplies, secondhand binders')
ON CONFLICT (shop_id, category) DO NOTHING;

UPDATE shops SET
  ai_summary = 'Part of the famous Hard Off secondhand chain, this shop is a treasure hunter''s paradise. The bargain bins are packed with ungraded cards at rock-bottom prices — perfect for those willing to dig. PSA graded cards and vintage items appear when customers trade them in. Best value shop in Akihabara for budget-conscious collectors.',
  visitor_tips = '• BEST for bargain hunting — dig through bins for hidden gems at ¥10-200
• Part of Hard Off chain — look for the yellow/green signage
• Cash and credit cards accepted
• PSA graded section near checkout — items rotate as customers trade in
• Vintage packs/boxes appear randomly — check back regularly for new stock
• Pre-owned cards in great condition at fraction of market price
• Also sells used games, figures, and hobby items on other floors'
WHERE id = '10000000-0000-0000-0000-000000000009';

-- =====================
-- 10. Yellow Submarine (010) — add missing: deck, single_sar
-- =====================
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000010', 'deck', 'in_stock', 1500, 3500, 'Starter and theme decks'),
  ('10000000-0000-0000-0000-000000000010', 'single_sar', 'in_stock', 8000, 60000, 'Good SAR selection')
ON CONFLICT (shop_id, category) DO NOTHING;

UPDATE shops SET
  ai_summary = 'Long-running hobby shop chain and one of the few Akihabara stores stocking English-language Pokémon cards alongside Japanese. Well-organized with clear price tags on everything. Accepts credit cards (Visa/Mastercard), making it convenient for international visitors. A reliable, well-established choice with consistent stock levels.',
  visitor_tips = '• Stocks ENGLISH Pokémon cards — very rare find in Akihabara!
• Accepts Visa and Mastercard — no need to find an ATM
• Cards organized by set with clear price tags — easy to browse independently
• This is the main store — Yellow Submarine has other locations nearby
• Good all-around shop: singles, boxes, packs, decks, accessories
• Sleeves and deck boxes available — stock up on supplies
• Well-lit, spacious store with calm atmosphere'
WHERE id = '10000000-0000-0000-0000-000000000010';
