-- =============================================================
-- Enrich Additional Shops Part 2 (031-050): Inventory Data
-- =============================================================

-- 031: Pokemon Card Shop Ninnin — buying/selling specialist
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000031', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000031', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000031', 'single_sar', 'limited', 8000, 60000, 'Some SAR cards')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 032: Otachu 2nd Store Toreka-kan — vintage/retro specialist
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000032', 'single_rare', 'in_stock', 100, 5000, 'Vintage rare singles'),
  ('10000000-0000-0000-0000-000000000032', 'single_sr', 'in_stock', 2000, 40000, 'Vintage SR cards'),
  ('10000000-0000-0000-0000-000000000032', 'vintage_pack', 'limited', 15000, 200000, 'Rare vintage sealed packs'),
  ('10000000-0000-0000-0000-000000000032', 'psa_graded', 'limited', 5000, 200000, 'Graded vintage cards'),
  ('10000000-0000-0000-0000-000000000032', 'single_common', 'in_stock', 10, 500, 'Vintage commons')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 033: Otachu 5th Store GO!GO! Toreka — basement multi-TCG shop
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000033', 'booster_box', 'in_stock', 5000, 22000, 'Multiple TCG boxes'),
  ('10000000-0000-0000-0000-000000000033', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000033', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000033', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000033', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 034: Eldorado — vintage/retro collection ONLY specialist
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000034', 'single_rare', 'in_stock', 200, 10000, 'Early-edition rare cards'),
  ('10000000-0000-0000-0000-000000000034', 'single_sr', 'in_stock', 3000, 80000, 'Vintage SR/UR cards'),
  ('10000000-0000-0000-0000-000000000034', 'vintage_pack', 'limited', 20000, 300000, 'Initial-era sealed packs'),
  ('10000000-0000-0000-0000-000000000034', 'vintage_box', 'limited', 100000, 1000000, 'Vintage sealed boxes when available'),
  ('10000000-0000-0000-0000-000000000034', 'psa_graded', 'in_stock', 5000, 500000, 'Vintage graded cards'),
  ('10000000-0000-0000-0000-000000000034', 'single_common', 'in_stock', 30, 1000, 'Vintage commons/uncommons')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 035: Toreka Himitsukichi (Secret Base) — curated rare Pokemon specialist
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000035', 'single_rare', 'in_stock', 100, 5000, 'Curated rare singles'),
  ('10000000-0000-0000-0000-000000000035', 'single_sr', 'in_stock', 2000, 40000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000035', 'single_sar', 'in_stock', 8000, 80000, 'SAR collection'),
  ('10000000-0000-0000-0000-000000000035', 'psa_graded', 'limited', 5000, 150000, 'Some graded cards')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 036: GEKIRIN Akihabara — Pokemon shop with promotions
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000036', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000036', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000036', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000036', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000036', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 037: Nanapoke Akihabara — YouTuber-supervised Pokemon shop
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000037', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000037', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000037', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000037', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000037', 'deck', 'in_stock', 1500, 3500, 'Decks with special offers'),
  ('10000000-0000-0000-0000-000000000037', 'accessories', 'in_stock', 200, 2000, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 038: Furuichi Trading Card Park — Radio Kaikan 7F, tournaments
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000038', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon, Yu-Gi-Oh boxes'),
  ('10000000-0000-0000-0000-000000000038', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000038', 'single_common', 'in_stock', 10, 500, 'Commons/uncommons'),
  ('10000000-0000-0000-0000-000000000038', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000038', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000038', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000038', 'accessories', 'in_stock', 200, 3000, 'Sleeves, deck boxes')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 039: Card Shop Kaisoku-oh Radio Kaikan — buy-back service
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000039', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000039', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000039', 'booster_box', 'in_stock', 5000, 22000, 'Sealed boxes'),
  ('10000000-0000-0000-0000-000000000039', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 040: Card Shop Kaisoku-oh AKIBA Cultures ZONE — second location
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000040', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000040', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000040', 'booster_box', 'in_stock', 5000, 22000, 'Sealed boxes'),
  ('10000000-0000-0000-0000-000000000040', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 041: Toreka Sunrise — PSA graded, boxes, singles
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000041', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000041', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000041', 'single_sr', 'in_stock', 2000, 40000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000041', 'single_sar', 'in_stock', 8000, 80000, 'SAR cards'),
  ('10000000-0000-0000-0000-000000000041', 'psa_graded', 'in_stock', 5000, 200000, 'PSA graded showcase'),
  ('10000000-0000-0000-0000-000000000041', 'accessories', 'in_stock', 200, 2500, 'Supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 042: Popsan Trading — two floors, late-closing (until 22:00)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000042', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000042', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000042', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000042', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000042', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000042', 'accessories', 'in_stock', 200, 2500, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 043: Trading Card Shop YK — collectible rare specialist
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000043', 'single_rare', 'in_stock', 200, 5000, 'Curated rare singles'),
  ('10000000-0000-0000-0000-000000000043', 'single_sr', 'in_stock', 3000, 50000, 'Premium SR/UR cards'),
  ('10000000-0000-0000-0000-000000000043', 'single_sar', 'in_stock', 10000, 100000, 'SAR cards'),
  ('10000000-0000-0000-0000-000000000043', 'psa_graded', 'limited', 5000, 200000, 'Some graded cards')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 044: Toreka Raftel — Japan's largest One Piece selection, also Pokemon
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000044', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon and One Piece boxes'),
  ('10000000-0000-0000-0000-000000000044', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000044', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000044', 'single_sr', 'in_stock', 2000, 35000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000044', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000044', 'accessories', 'in_stock', 200, 2500, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 045: Trading Card Palace — small shop in New Akihabara Center
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000045', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000045', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000045', 'single_common', 'in_stock', 10, 500, 'Commons/uncommons'),
  ('10000000-0000-0000-0000-000000000045', 'accessories', 'in_stock', 200, 1500, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 046: Toreka Mall — TCG-shop-only mall concept, multiple vendors
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000046', 'booster_box', 'in_stock', 5000, 25000, 'Multiple vendors with boxes'),
  ('10000000-0000-0000-0000-000000000046', 'sealed_pack', 'in_stock', 180, 550, 'Packs from various dealers'),
  ('10000000-0000-0000-0000-000000000046', 'single_common', 'in_stock', 10, 500, 'Bulk singles'),
  ('10000000-0000-0000-0000-000000000046', 'single_rare', 'in_stock', 100, 5000, 'Rare singles from different vendors'),
  ('10000000-0000-0000-0000-000000000046', 'single_sr', 'in_stock', 2000, 40000, 'SR/UR cards — compare prices between vendors'),
  ('10000000-0000-0000-0000-000000000046', 'single_sar', 'in_stock', 8000, 80000, 'SAR cards'),
  ('10000000-0000-0000-0000-000000000046', 'oripa', 'in_stock', 500, 10000, 'Oripa from multiple vendors'),
  ('10000000-0000-0000-0000-000000000046', 'accessories', 'in_stock', 200, 3000, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 047: Toreka Rises — Pokemon, One Piece, Yu-Gi-Oh
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000047', 'booster_box', 'in_stock', 5000, 22000, 'Sealed boxes'),
  ('10000000-0000-0000-0000-000000000047', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000047', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000047', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 048: SNKRDUNK Trading Cards — PSA direct store partnership!
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000048', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000048', 'single_sr', 'in_stock', 2000, 50000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000048', 'single_sar', 'in_stock', 8000, 100000, 'SAR cards'),
  ('10000000-0000-0000-0000-000000000048', 'psa_graded', 'in_stock', 5000, 500000, 'PSA graded cards — submit for grading in-store!'),
  ('10000000-0000-0000-0000-000000000048', 'accessories', 'in_stock', 200, 3000, 'Grading supplies, sleeves')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 049: Kabe no Mise (Wall Shop) — old-school stall in Radio Center
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000049', 'single_rare', 'in_stock', 100, 5000, 'Singles on wall displays'),
  ('10000000-0000-0000-0000-000000000049', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR in glass panels'),
  ('10000000-0000-0000-0000-000000000049', 'single_common', 'in_stock', 10, 500, 'Bulk commons'),
  ('10000000-0000-0000-0000-000000000049', 'vintage_pack', 'limited', 15000, 150000, 'Occasional vintage finds')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 050: Card Land Akihabara — Pokemon, Yu-Gi-Oh singles
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000050', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000050', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000050', 'single_common', 'in_stock', 10, 500, 'Commons'),
  ('10000000-0000-0000-0000-000000000050', 'booster_box', 'in_stock', 5000, 22000, 'Sealed boxes'),
  ('10000000-0000-0000-0000-000000000050', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;
