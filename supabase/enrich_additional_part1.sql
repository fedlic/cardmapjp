-- =============================================================
-- Enrich Additional Shops Part 1 (011-030): Inventory Data
-- =============================================================

-- 011: Hareruya 2 (Pokemon Card Specialty) — 6-floor Pokemon specialist
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000011', 'booster_box', 'in_stock', 5000, 25000, 'Wide selection of current and recent sets'),
  ('10000000-0000-0000-0000-000000000011', 'sealed_pack', 'in_stock', 180, 550, 'All current sets available'),
  ('10000000-0000-0000-0000-000000000011', 'single_common', 'in_stock', 10, 500, 'Massive commons/uncommons inventory'),
  ('10000000-0000-0000-0000-000000000011', 'single_rare', 'in_stock', 100, 5000, 'Extensive rare singles by set'),
  ('10000000-0000-0000-0000-000000000011', 'single_sr', 'in_stock', 2000, 50000, 'Huge SR/UR showcase'),
  ('10000000-0000-0000-0000-000000000011', 'single_sar', 'in_stock', 8000, 100000, 'Best SAR selection in Akihabara'),
  ('10000000-0000-0000-0000-000000000011', 'psa_graded', 'in_stock', 5000, 500000, 'Impressive PSA graded showcase'),
  ('10000000-0000-0000-0000-000000000011', 'vintage_pack', 'limited', 15000, 300000, 'Vintage sealed packs when available'),
  ('10000000-0000-0000-0000-000000000011', 'deck', 'in_stock', 1500, 3500, 'Starter and pre-built decks'),
  ('10000000-0000-0000-0000-000000000011', 'accessories', 'in_stock', 200, 5000, 'Full range of sleeves, deck boxes, playmats'),
  ('10000000-0000-0000-0000-000000000011', 'oripa', 'in_stock', 500, 10000, 'Multiple oripa tiers available')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 012: CARDWINGS Akihabara Station Front — largest TCG shop by floor space
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000012', 'booster_box', 'in_stock', 5000, 25000, 'Current sets across multiple TCG titles'),
  ('10000000-0000-0000-0000-000000000012', 'sealed_pack', 'in_stock', 180, 550, 'Current and recent packs'),
  ('10000000-0000-0000-0000-000000000012', 'single_common', 'in_stock', 10, 500, 'Large bulk singles collection'),
  ('10000000-0000-0000-0000-000000000012', 'single_rare', 'in_stock', 100, 5000, 'Good rare singles selection'),
  ('10000000-0000-0000-0000-000000000012', 'single_sr', 'in_stock', 2000, 40000, 'SR/UR cards in display cases'),
  ('10000000-0000-0000-0000-000000000012', 'single_sar', 'in_stock', 8000, 80000, 'SAR cards available'),
  ('10000000-0000-0000-0000-000000000012', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000012', 'accessories', 'in_stock', 200, 4000, 'Sleeves, playmats, deck boxes'),
  ('10000000-0000-0000-0000-000000000012', 'oripa', 'in_stock', 500, 5000, 'Oripa lottery packs')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 013: Card Labo Akihabara Radio Kaikan — major chain in Radio Kaikan 9F
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000013', 'booster_box', 'in_stock', 5000, 22000, 'Current Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000013', 'sealed_pack', 'in_stock', 180, 550, 'Current set packs'),
  ('10000000-0000-0000-0000-000000000013', 'single_common', 'in_stock', 10, 500, 'Commons/uncommons bins'),
  ('10000000-0000-0000-0000-000000000013', 'single_rare', 'in_stock', 100, 5000, 'Rare singles organized by set'),
  ('10000000-0000-0000-0000-000000000013', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR in display cases'),
  ('10000000-0000-0000-0000-000000000013', 'deck', 'in_stock', 1500, 3500, 'Starter and theme decks'),
  ('10000000-0000-0000-0000-000000000013', 'accessories', 'in_stock', 200, 3000, 'Sleeves, deck boxes, card files')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 014: Dragon Star Akihabara Station Front — major chain on BiTO AKIBA PLAZA 6F
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000014', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon, Yu-Gi-Oh boxes'),
  ('10000000-0000-0000-0000-000000000014', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000014', 'single_common', 'in_stock', 10, 500, 'Bulk commons'),
  ('10000000-0000-0000-0000-000000000014', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000014', 'single_sr', 'in_stock', 2000, 35000, 'SR/UR selection'),
  ('10000000-0000-0000-0000-000000000014', 'single_sar', 'in_stock', 8000, 60000, 'SAR cards in showcase'),
  ('10000000-0000-0000-0000-000000000014', 'deck', 'in_stock', 1500, 3500, 'Pre-constructed decks'),
  ('10000000-0000-0000-0000-000000000014', 'accessories', 'in_stock', 200, 3000, 'Sleeves, deck boxes')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 015: Dragon Star Akihabara — second location, two floors
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000015', 'booster_box', 'in_stock', 5000, 22000, 'Current boxes'),
  ('10000000-0000-0000-0000-000000000015', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000015', 'single_common', 'in_stock', 10, 500, 'Bulk singles'),
  ('10000000-0000-0000-0000-000000000015', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000015', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000015', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000015', 'accessories', 'in_stock', 200, 3000, 'Sleeves and supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 016: Amenity Dream Akihabara — two floors, discounted damaged cards
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000016', 'booster_box', 'in_stock', 5000, 25000, 'Wide box selection'),
  ('10000000-0000-0000-0000-000000000016', 'sealed_pack', 'in_stock', 180, 550, 'Current and recent packs'),
  ('10000000-0000-0000-0000-000000000016', 'single_common', 'in_stock', 10, 300, 'Huge bulk selection including discounted played cards'),
  ('10000000-0000-0000-0000-000000000016', 'single_rare', 'in_stock', 80, 5000, 'Rare singles with condition-based pricing'),
  ('10000000-0000-0000-0000-000000000016', 'single_sr', 'in_stock', 1500, 40000, 'SR/UR with some at bargain prices'),
  ('10000000-0000-0000-0000-000000000016', 'single_sar', 'in_stock', 6000, 70000, 'SAR cards available'),
  ('10000000-0000-0000-0000-000000000016', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000016', 'accessories', 'in_stock', 200, 4000, 'Full accessories range')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 017: BIG MAGIC Akihabara — premier MTG shop, also Pokemon
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000017', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon and MTG boxes'),
  ('10000000-0000-0000-0000-000000000017', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000017', 'single_rare', 'in_stock', 100, 5000, 'Pokemon rare singles'),
  ('10000000-0000-0000-0000-000000000017', 'single_sr', 'in_stock', 2000, 30000, 'SR cards (tablet-based browsing system)'),
  ('10000000-0000-0000-0000-000000000017', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000017', 'accessories', 'in_stock', 200, 4000, 'Sleeves, playmats, deck boxes')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 018: FULLCOMP Akihabara Radio Kaikan — used singles specialist
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000018', 'single_common', 'in_stock', 10, 500, 'Used commons/uncommons'),
  ('10000000-0000-0000-0000-000000000018', 'single_rare', 'in_stock', 100, 5000, 'Used rare singles'),
  ('10000000-0000-0000-0000-000000000018', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR singles'),
  ('10000000-0000-0000-0000-000000000018', 'booster_box', 'in_stock', 5000, 22000, 'Sealed boxes'),
  ('10000000-0000-0000-0000-000000000018', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 019: FULLCOMP Akihabara — main store
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000019', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000019', 'single_common', 'in_stock', 10, 500, 'Used singles'),
  ('10000000-0000-0000-0000-000000000019', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000019', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000019', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 020: CardShop magi — high-value and niche specialist with PSA
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000020', 'single_sr', 'in_stock', 3000, 50000, 'Premium SR/UR cards'),
  ('10000000-0000-0000-0000-000000000020', 'single_sar', 'in_stock', 10000, 100000, 'High-end SAR selection'),
  ('10000000-0000-0000-0000-000000000020', 'psa_graded', 'in_stock', 5000, 300000, 'PSA graded showcase'),
  ('10000000-0000-0000-0000-000000000020', 'single_rare', 'in_stock', 200, 5000, 'Curated rare singles'),
  ('10000000-0000-0000-0000-000000000020', 'vintage_pack', 'limited', 20000, 200000, 'Occasional vintage sealed packs')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 021: Clove Base Akihabara — cafe-integrated card shop
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000021', 'booster_box', 'in_stock', 5000, 22000, 'Current boxes'),
  ('10000000-0000-0000-0000-000000000021', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000021', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000021', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR in display'),
  ('10000000-0000-0000-0000-000000000021', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000021', 'accessories', 'in_stock', 200, 3000, 'Sleeves, deck boxes')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 022: Card Shop Beams Akihabara Ekichika
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000022', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000022', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000022', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000022', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR selection'),
  ('10000000-0000-0000-0000-000000000022', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 023: Card Shop Beams Main Store
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000023', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon, Yu-Gi-Oh boxes'),
  ('10000000-0000-0000-0000-000000000023', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000023', 'single_common', 'in_stock', 10, 500, 'Commons/uncommons'),
  ('10000000-0000-0000-0000-000000000023', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000023', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000023', 'accessories', 'in_stock', 200, 2500, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 024: Torecal Akihabara Ekimae — TAX-FREE, PSA graded
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000024', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000024', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000024', 'single_sr', 'in_stock', 2000, 40000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000024', 'single_sar', 'in_stock', 8000, 80000, 'SAR cards'),
  ('10000000-0000-0000-0000-000000000024', 'psa_graded', 'in_stock', 5000, 200000, 'PSA graded showcase'),
  ('10000000-0000-0000-0000-000000000024', 'accessories', 'in_stock', 200, 3000, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 025: MERCARD Akihabara — 13 TCG titles
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000025', 'booster_box', 'in_stock', 5000, 22000, 'Multiple TCG boxes'),
  ('10000000-0000-0000-0000-000000000025', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000025', 'single_common', 'in_stock', 10, 500, 'Commons across titles'),
  ('10000000-0000-0000-0000-000000000025', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000025', 'single_sr', 'in_stock', 2000, 25000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000025', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000025', 'accessories', 'in_stock', 200, 2500, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 026: MERCARD 2nd Store — niche TCGs
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000026', 'booster_box', 'in_stock', 5000, 20000, 'Niche TCG boxes'),
  ('10000000-0000-0000-0000-000000000026', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000026', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000026', 'single_sr', 'in_stock', 2000, 20000, 'SR cards'),
  ('10000000-0000-0000-0000-000000000026', 'accessories', 'in_stock', 200, 2000, 'Basic supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 027: Fukufuku Toreka — oripa, vintage, multi-location
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000027', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000027', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000027', 'single_sr', 'in_stock', 2000, 35000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000027', 'oripa', 'in_stock', 500, 10000, 'Multiple oripa tiers'),
  ('10000000-0000-0000-0000-000000000027', 'vintage_pack', 'limited', 15000, 150000, 'Vintage collection cards'),
  ('10000000-0000-0000-0000-000000000027', 'accessories', 'in_stock', 200, 2500, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 028: Grand Panda Canyon — Pokemon + Shadowverse specialist
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000028', 'booster_box', 'in_stock', 5000, 22000, 'Pokemon boxes'),
  ('10000000-0000-0000-0000-000000000028', 'sealed_pack', 'in_stock', 180, 550, 'Current packs'),
  ('10000000-0000-0000-0000-000000000028', 'single_rare', 'in_stock', 100, 5000, 'Curated rare singles'),
  ('10000000-0000-0000-0000-000000000028', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR showcase'),
  ('10000000-0000-0000-0000-000000000028', 'single_sar', 'in_stock', 8000, 60000, 'SAR cards'),
  ('10000000-0000-0000-0000-000000000028', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000028', 'accessories', 'in_stock', 200, 3000, 'Sleeves, supplies')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 029: TokyoMTG — MTG specialty (minimal Pokemon)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000029', 'single_rare', 'limited', 200, 5000, 'Limited Pokemon singles'),
  ('10000000-0000-0000-0000-000000000029', 'accessories', 'in_stock', 200, 4000, 'Sleeves, playmats (MTG-focused)')
ON CONFLICT (shop_id, category) DO NOTHING;

-- 030: Pocket Center Akihabara — Pokemon specialist, vintage, English supplies
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('10000000-0000-0000-0000-000000000030', 'booster_box', 'in_stock', 5000, 22000, 'Current and older boxes'),
  ('10000000-0000-0000-0000-000000000030', 'sealed_pack', 'in_stock', 180, 550, 'Current and recent packs'),
  ('10000000-0000-0000-0000-000000000030', 'single_rare', 'in_stock', 100, 5000, 'Rare singles'),
  ('10000000-0000-0000-0000-000000000030', 'single_sr', 'in_stock', 2000, 30000, 'SR/UR cards'),
  ('10000000-0000-0000-0000-000000000030', 'vintage_pack', 'limited', 15000, 200000, 'Vintage/retro sealed packs'),
  ('10000000-0000-0000-0000-000000000030', 'deck', 'in_stock', 1500, 3500, 'Starter decks'),
  ('10000000-0000-0000-0000-000000000030', 'accessories', 'in_stock', 200, 3000, 'English supplies available')
ON CONFLICT (shop_id, category) DO NOTHING;
