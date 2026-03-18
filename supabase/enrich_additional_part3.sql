-- =============================================================
-- Enrich Additional Shops Part 3 (051-078): Inventory Data
-- =============================================================

-- 051: Toreka Verse Gachapon Kaikan 6F
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000051', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000051', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000051', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000051', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000051', 'accessories', 'in_stock', 200, 2000, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 052: Denko Sekka — cards + vending machines
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000052', 'booster_box', 'in_stock', 5000, 22000, 'Sealed boxes'),
  ('10000000-0000-0000-0000-000000000052', 'sealed_pack', 'in_stock', 180, 550, 'Packs (also from vending machines)'),
  ('10000000-0000-0000-0000-000000000052', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000052', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000052', 'oripa', 'in_stock', 300, 5000, 'Vending machine oripa'),
  ('10000000-0000-0000-0000-000000000052', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 053: Toreka Yokocho Don Quijote 5F — inside Don Quijote
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000053', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000053', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000053', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000053', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000053', 'oripa', 'in_stock', 500, 10000, 'Multiple oripa price tiers'),
  ('10000000-0000-0000-0000-000000000053', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 054: Card Bank — vintage cards in Liberty building
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000054', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000054', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000054', 'vintage_pack', 'limited', 15000, 150000, 'Vintage sealed packs'),
  ('10000000-0000-0000-0000-000000000054', 'single_common', 'in_stock', 10, 500, 'Vintage commons')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 055: Minna de Toreka!! Main Store
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000055', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000055', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000055', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000055', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000055', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 056: Minna de Toreka!! 2nd Store
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000056', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000056', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000056', 'single_common', 'in_stock', 10, 500, 'Commons'),
  ('10000000-0000-0000-0000-000000000056', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 057: Bee Honpo — 6F singles shop
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000057', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000057', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000057', 'single_common', 'in_stock', 10, 500, 'Commons'),
  ('10000000-0000-0000-0000-000000000057', 'booster_box', 'in_stock', 5000, 22000, 'Sealed boxes')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 058: flat-Kobo — 6F singles and boxes
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000058', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000058', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000058', 'booster_box', 'in_stock', 5000, 22000, 'Sealed boxes'),
  ('10000000-0000-0000-0000-000000000058', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 059: Shakashaka Toreka — small Pokemon shop
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000059', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000059', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000059', 'single_common', 'in_stock', 10, 500, 'Commons')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 060: Chelmo — slightly north, Pokemon + vintage
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000060', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000060', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000060', 'vintage_pack', 'limited', 15000, 150000, 'Vintage cards available'),
  ('10000000-0000-0000-0000-000000000060', 'single_common', 'in_stock', 10, 500, 'Commons')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 061: Cardon Main Store — basement shop
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000061', 'booster_box', 'in_stock', 5000, 22000, 'Sealed boxes'),
  ('10000000-0000-0000-0000-000000000061', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000061', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000061', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000061', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 062: Akiba Senryuu — oripa specialist
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000062', 'oripa', 'in_stock', 300, 30000, 'Wide range of oripa lottery packs'),
  ('10000000-0000-0000-0000-000000000062', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR prizes from oripa'),
  ('10000000-0000-0000-0000-000000000062', 'single_rare', 'in_stock', 100, 5000, 'Rare singles')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 063: Bushiroad Store — official Bushiroad TCGs (minimal Pokemon)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000063', 'booster_box', 'in_stock', 5000, 18000, 'Bushiroad TCG boxes (Weiss Schwarz, Vanguard)'),
  ('10000000-0000-0000-0000-000000000063', 'sealed_pack', 'in_stock', 180, 400, 'Bushiroad packs'),
  ('10000000-0000-0000-0000-000000000063', 'deck', 'in_stock', 1500, 3500, 'Trial decks'),
  ('10000000-0000-0000-0000-000000000063', 'accessories', 'in_stock', 200, 3000, 'Official Bushiroad sleeves, playmats')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 064: Card Labo AKIHABARA Gamers B1 — second Card Labo location
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000064', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000064', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000064', 'single_common', 'in_stock', 10, 500, 'Commons'),
  ('10000000-0000-0000-0000-000000000064', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000064', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000064', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000064', 'accessories', 'in_stock', 200, 3000, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 065: Card Rush Store #0 TC — Card Rush additional location
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000065', 'booster_box', 'in_stock', 5000, 25000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000065', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000065', 'single_common', 'in_stock', 10, 500, 'Commons by set'),
  ('10000000-0000-0000-0000-000000000065', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000065', 'single_sr', 'in_stock', 2000, 40000, 'SR/UR in binders'),
  ('10000000-0000-0000-0000-000000000065', 'single_sar', 'in_stock', 8000, 80000, 'SAR cards'),
  ('10000000-0000-0000-0000-000000000065', 'accessories', 'in_stock', 200, 3000, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 066: Machi Chara Toreka-kan
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000066', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000066', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000066', 'single_common', 'in_stock', 10, 500, 'Commons')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 067: Torekking — basement card shop
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000067', 'booster_box', 'in_stock', 5000, 22000, 'Sealed boxes'),
  ('10000000-0000-0000-0000-000000000067', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000067', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000067', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 068: Toreka no Bankoku — Liberty building
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000068', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000068', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000068', 'single_common', 'in_stock', 10, 500, 'Commons')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 069: Weiss Schwarz Mart — Weiss Schwarz specialist (no Pokemon)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000069', 'booster_box', 'in_stock', 5000, 18000, 'Weiss Schwarz boxes'),
  ('10000000-0000-0000-0000-000000000069', 'sealed_pack', 'in_stock', 180, 400, 'Weiss Schwarz packs'),
  ('10000000-0000-0000-0000-000000000069', 'single_rare', 'in_stock', 100, 10000, 'WS rare singles'),
  ('10000000-0000-0000-0000-000000000069', 'deck', 'in_stock', 1500, 3500, 'Trial decks'),
  ('10000000-0000-0000-0000-000000000069', 'accessories', 'in_stock', 200, 3000, 'WS sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 070: Card Shop Spiral — oripa + singles on Junk Street
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000070', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000070', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000070', 'oripa', 'in_stock', 500, 10000, 'Oripa lottery packs'),
  ('10000000-0000-0000-0000-000000000070', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 071: Card Shop NEM — Duel Masters specialist (minimal Pokemon)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000071', 'booster_box', 'in_stock', 5000, 18000, 'Duel Masters boxes'),
  ('10000000-0000-0000-0000-000000000071', 'sealed_pack', 'in_stock', 180, 400, 'DM packs'),
  ('10000000-0000-0000-0000-000000000071', 'single_rare', 'in_stock', 100, 5000, 'DM rare singles'),
  ('10000000-0000-0000-0000-000000000071', 'accessories', 'in_stock', 200, 2000, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 072: Card Shop Hanjou — celebrity/streamer-owned
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000072', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000072', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000072', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000072', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000072', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000072', 'accessories', 'in_stock', 200, 2500, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 073: Toreka Banpaku (Card Expo)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000073', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000073', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000073', 'single_common', 'in_stock', 10, 500, 'Commons')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 074: Toreka Circuit — buyback + oripa
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000074', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000074', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000074', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000074', 'oripa', 'in_stock', 500, 10000, 'Oripa lottery packs'),
  ('10000000-0000-0000-0000-000000000074', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 075: Maron's Hideout — arcade TCG specialist (no Pokemon)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000075', 'single_rare', 'in_stock', 100, 5000, 'Arcade TCG rare cards'),
  ('10000000-0000-0000-0000-000000000075', 'single_common', 'in_stock', 10, 300, 'Arcade TCG commons'),
  ('10000000-0000-0000-0000-000000000075', 'accessories', 'in_stock', 200, 1500, 'Card sleeves and binders')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 076: Trading Card Shop Kolo-ya — 6F specialty
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000076', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000076', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000076', 'single_common', 'in_stock', 10, 500, 'Commons'),
  ('10000000-0000-0000-0000-000000000076', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 077: TCG Shop 193 — multiple TCG titles
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000077', 'booster_box', 'in_stock', 5000, 22000, 'Multiple TCG boxes'),
  ('10000000-0000-0000-0000-000000000077', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000077', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000077', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000077', 'accessories', 'in_stock', 200, 2000, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 078: MTG Restaurant Rishada — MTG restaurant/bar (no Pokemon cards for sale)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000078', 'accessories', 'in_stock', 200, 3000, 'MTG playmats, sleeves for dining customers'),
  ('10000000-0000-0000-0000-000000000078', 'deck', 'limited', 1500, 5000, 'Rental/sample decks for play while dining')
ON CONFLICT (shop_id, category) DO NOTHING;
