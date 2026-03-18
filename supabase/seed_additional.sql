-- Additional Akihabara Card Shops (70+ shops)
-- Tier 1: Major Dedicated TCG Shops

-- 11. Hareruya 2 (Pokemon Card Specialty)
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, english_staff, english_staff_days, payment_methods, sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_vintage, sells_english_cards, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000011',
  'ポケモンカード専門店 晴れる屋2', 'Hareruya 2 (Pokemon Card Specialty)',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-2-5', '1-2-5 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7710, 35.6984)::geography,
  true, 'Always',
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true,
  4.2, 500,
  'Japan''s largest Pokemon Card specialty store with 6 floors dedicated entirely to Pokemon TCG. Massive singles selection, PSA graded showcase, vintage cards, and English cards available. 88+ seat play space with daily tournaments.',
  '• Japan''s LARGEST Pokemon card specialty store — 6 floors!
• English and Japanese cards available
• Credit cards and IC cards accepted
• 88+ seat duel space with daily tournaments
• Separate from Hareruya MTG store'
);

-- 12. CARDWINGS (formerly Card World Tower)
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_oripa, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000012',
  'CARDWINGS秋葉原駅前店', 'CARDWINGS Akihabara Station Front',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-15-15 宝田第一ビル', 'Takarada 1st Building, 1-15-15 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7714, 35.6987)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.8, 280,
  'Akihabara''s largest TCG shop by floor space, covering an entire building. Carries Pokemon, Yu-Gi-Oh, MTG, One Piece, and more. 160+ duel seats available.',
  '• Entire building dedicated to cards — multiple floors
• 160+ duel seats — largest play area in Akihabara
• 1 min walk from JR Akihabara Station
• Credit cards accepted'
);

-- 13. Card Labo Radio Kaikan
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_sealed_pack, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000013',
  'カードラボ 秋葉原ラジオ会館本店', 'Card Labo Akihabara Radio Kaikan',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-15-16 秋葉原ラジオ会館 9F', 'Akihabara Radio Kaikan 9F, 1-15-16 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7711, 35.6983)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.9, 220,
  'Major card shop chain located on the 9th floor of the iconic Radio Kaikan building. Carries MTG, Yu-Gi-Oh, and Pokemon with 100-seat tournament space.',
  '• Located in Radio Kaikan 9F — take elevator
• 100-seat duel/tournament space
• Also has a 1F buy-back center (separate entrance)
• Credit cards accepted'
);

-- 14. Dragon Star Akihabara Ekimae
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_sealed_pack, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000014',
  'ドラゴンスター秋葉原駅前店', 'Dragon Star Akihabara Station Front',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-18-20 BiTO AKIBA PLAZA 6F', 'BiTO AKIBA PLAZA 6F, 1-18-20 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7735, 35.6978)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.8, 180,
  'Major nationwide chain with strong Pokemon, Yu-Gi-Oh, and One Piece card selection. 80-seat duel space on the 6th floor of BiTO AKIBA PLAZA.',
  '• BiTO AKIBA PLAZA 6F — near station
• 80-seat duel space
• Major chain with reliable stock
• Credit cards accepted'
);

-- 15. Dragon Star Akihabara
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000015',
  'ドラゴンスター秋葉原店', 'Dragon Star Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-8-11 アキバスタービル2F・3F', 'Akiba Star Building 2F-3F, 1-8-11 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7717, 35.6997)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.7, 150,
  'Second Dragon Star location in Akihabara across two floors. Good selection of Pokemon, Yu-Gi-Oh, and One Piece cards.'
);

-- 16. Amenity Dream
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_sealed_pack, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000016',
  'アメニティードリーム秋葉原店', 'Amenity Dream Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-11-6 小暮ビル 5F・6F', 'Kogure Building 5F-6F, 1-11-6 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7709, 35.6994)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.9, 200,
  'One of Japan''s largest TCG selections spanning two floors. Known for offering discounted slightly-damaged cards at bargain prices alongside mint stock.',
  '• 2 floors (5F-6F) of cards
• Known for discounted "slightly damaged" cards — great bargains
• Weekdays 12:00-21:00, Sat-Sun 11:00-20:00
• Credit cards accepted'
);

-- 17. BIG MAGIC
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, english_staff, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000017',
  'BIG MAGIC 秋葉原店', 'BIG MAGIC Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-11-6 小暮ビル 5-7F', 'Kogure Building 5-7F, 1-11-6 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7709, 35.6995)::geography,
  true,
  true, true,
  '{"cash","visa","mastercard"}',
  4.0, 160,
  'Premier MTG shop with one of the largest Magic: The Gathering selections in Akihabara. Also carries Yu-Gi-Oh and Pokemon. Tablet-based inventory system for easy browsing.',
  '• One of the best MTG shops in Tokyo
• Some English-speaking staff (international MTG community)
• Tablet-based search system for inventory
• Also at Radio Kaikan 9F'
);

-- 18. FULLCOMP Radio Kaikan
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000018',
  'フルコンプ 秋葉原ラジオ会館店', 'FULLCOMP Akihabara Radio Kaikan',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-15-16 秋葉原ラジオ会館 9F', 'Akihabara Radio Kaikan 9F, 1-15-16 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7711, 35.6984)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.7, 130,
  'Used singles specialist in Radio Kaikan 9F. Carries One Piece, Yu-Gi-Oh, Duel Masters, and Pokemon. Buy-back service available. Open 10:00-20:00 year-round.'
);

-- 19. FULLCOMP Akihabara
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000019',
  'フルコンプ秋葉原店', 'FULLCOMP Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-14-6 恵光ビル 4F', 'Eiko Building 4F, 3-14-6 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7695, 35.7020)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.6, 100,
  'FULLCOMP''s main Akihabara store. Pokemon, Yu-Gi-Oh, One Piece singles and boxes with buy-back service.'
);

-- 20. CardShop magi
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_psa_graded, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000020',
  'カードショップmagi 秋葉原店', 'CardShop magi Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-14-9 第26東ビル 5F', 'Dai-26 Higashi Building 5F, 3-14-9 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7694, 35.7022)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.8, 140,
  'High-value and niche card specialist. Carries PSA graded cards and rare Pokemon, Yu-Gi-Oh, and One Piece cards. Hours 12:00-20:00. Also has a Radio Kaikan branch.'
);

-- 21. Clove Base
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_sealed_pack, payment_methods, google_rating, google_review_count, beginner_friendly, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000021',
  'Clove Base 秋葉原', 'Clove Base Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区神田佐久間町1-13 チョムチョム秋葉原6F', 'Chomchom Akihabara 6F, 1-13 Kanda Sakumacho, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7752, 35.6983)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  4.0, 170,
  true,
  'Akihabara''s largest cafe-integrated card shop. Enjoy drinks and food while browsing Pokemon, Yu-Gi-Oh, and One Piece cards in a relaxed atmosphere.',
  '• Cafe + card shop combo — order drinks while you browse
• Beginner-friendly atmosphere
• Credit cards accepted
• Also has "Clove Lounge" nearby'
);

-- 22. Beams Akihabara Ekichika
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_sealed_pack, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000022',
  'ビームス秋葉原駅チカ店', 'Card Shop Beams Akihabara Ekichika',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-13-1 Akiba1131.bldg 3F', 'Akiba1131 Building 3F, 1-13-1 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7707, 35.6991)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.8, 130,
  'Card shop near the station with Pokemon, Yu-Gi-Oh, and One Piece cards. Weekdays 13:00-21:00, Sat-Sun 11:00-21:00.'
);

-- 23. Beams Akihabara Main
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000023',
  'カードショップ ビームス 秋葉原本店', 'Card Shop Beams Akihabara Main Store',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-2-15', '3-2-15 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7700, 35.7005)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.7, 110,
  'Original Beams card shop location. Pokemon, Yu-Gi-Oh, MTG singles and boxes.'
);

-- 24. Torecal (Tax-free!)
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, english_staff, sells_singles, sells_psa_graded, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000024',
  'トレカル秋葉原駅前店', 'Torecal Akihabara Ekimae',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-13-1 Akiba1131.bldg 9F', 'Akiba1131 Building 9F, 1-13-1 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7707, 35.6992)::geography,
  true,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.9, 120,
  'Tourist-friendly card shop offering TAX-FREE shopping for foreign visitors. Pokemon and One Piece specialist with PSA graded cards.',
  '• TAX-FREE shopping for tourists — bring your passport!
• 1 min from JR Akihabara Station
• Pokemon and One Piece specialist
• PSA graded cards available'
);

-- 25. MERCARD
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000025',
  'メルカード 秋葉原', 'MERCARD Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-8-7 神林ビル2F', 'Kanbayashi Building 2F, 1-8-7 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7718, 35.6997)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.7, 100,
  'Carries 13 TCG titles including One Piece, Yu-Gi-Oh, Pokemon, Dragon Ball, and Gundam Card. Weekdays 13:00-20:00, Sat-Sun 11:00-20:00.'
);

-- 26. MERCARD 2nd Store
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000026',
  'メルカード 秋葉原2号店', 'MERCARD Akihabara 2nd Store',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-2-14 今井ビル5F', 'Imai Building 5F, 3-2-14 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7700, 35.7005)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.6, 60,
  'MERCARD''s second store specializing in Duel Masters, Union Arena, Gundam Card, Shadowverse, and niche TCG titles.'
);

-- 27. Fukufuku Toreka
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_oripa, sells_vintage, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000027',
  '福福トレカ 秋葉原店', 'Fukufuku Toreka Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-9-8 木村ビル2F-4F', 'Kimura Building 2F-4F, 1-9-8 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7713, 35.6995)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.6, 110,
  'Multi-floor card shop with Pokemon, Yu-Gi-Oh, One Piece singles, oripa lottery packs, and vintage collection cards. Multiple Akihabara locations.'
);

-- 28. Grand Panda Canyon
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_sealed_pack, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000028',
  'グランドパンダキャニオン 秋葉原本店', 'Grand Panda Canyon Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-14-7 東雲堂ビル3F', 'Shinundo Building 3F, 3-14-7 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7695, 35.7020)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.9, 90,
  'Pokemon and Shadowverse Evolve specialist. Well-curated singles, boxes, and sealed products.'
);

-- 29. TokyoMTG
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, english_staff, english_staff_days, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000029',
  '東京MTG', 'TokyoMTG',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田2-2-3 キョウスビル2F', 'Kyosu Building 2F, 2-2-3 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7687, 35.6999)::geography,
  true, 'Always',
  true, true,
  '{"cash","visa","mastercard"}',
  4.3, 140,
  'Highly-rated MTG specialty shop with excellent English support. Cozy sofa play area, regular tournaments, and artist events. A must-visit for MTG fans.',
  '• Excellent English support — international MTG community
• Cozy sofa play area
• Closed Tuesdays, Hours 12:00-21:00
• Regular tournaments and artist signing events'
);

-- 30. Pocket Center
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_vintage, sells_english_cards, sells_sealed_pack, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000030',
  'ポケットセンター秋葉原', 'Pocket Center Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-16-14 ダイサンビル501', 'Daisan Building 501, 3-16-14 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7688, 35.7025)::geography,
  true, true, true, true,
  '{"cash","visa","mastercard"}',
  4.1, 80,
  'Pokemon card specialist focusing on vintage/retro cards, sealed packs, English supplies, and new releases. Hidden gem near Suehirocho Station.',
  '• Pokemon vintage/retro specialist — old-back cards!
• English cards and supplies available
• Buzz 501 at entrance to get in
• Weekdays 14:00-20:00, Sat-Sun 13:00-20:00'
);

-- 31. Ninnin
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000031',
  'ポケカ専門店 ニンニン', 'Pokemon Card Shop Ninnin',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-8-7 富士ビル2F', 'Fuji Building 2F, 3-8-7 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7697, 35.7014)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.5, 70,
  'Pokemon card specialist primarily focused on buying/purchasing cards. Also sells singles. Hours 13:00-20:00.'
);

-- 32. Otachu 2nd Store Toreka-kan
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_vintage, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000032',
  'おたちゅう。秋葉原2号店 トレカ館', 'Otachu Akihabara 2nd Store Toreka-kan',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-15-6 小暮末広ビル 8F', 'Kogure Suehiro Building 8F, 3-15-6 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7690, 35.7023)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.8, 90,
  'Vintage/retro card specialist. Yu-Gi-Oh and Pokemon with high-value buyback program. Great for finding rare old cards.'
);

-- 33. Otachu 5th Store
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000033',
  'おたちゅう。秋葉原5号店 GO!GO!トレカ', 'Otachu Akihabara 5th Store GO!GO! Toreka',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-9-2 末広ビル B1F', 'Suehiro Building B1F, 3-9-2 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7697, 35.7013)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.7, 70,
  'Basement card shop with Pokemon, One Piece, Dragon Ball, Weiss Schwarz, Yu-Gi-Oh, and Hololive TCG cards.'
);

-- 34. Eldorado (Vintage specialist)
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_vintage, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000034',
  'エルドラード', 'Eldorado',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-15-6 小暮末広ビル 9F', 'Kogure Suehiro Building 9F, 3-15-6 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7690, 35.7024)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  4.2, 60,
  'Vintage/retro collection card ONLY specialist. Carries initial-era Yu-Gi-Oh, Duel Masters, and Pokemon cards. One of the best places for early-edition cards.',
  '• VINTAGE ONLY — early/initial-era cards specialist
• Closed Tue/Wed
• Mon/Thu 13:00-20:00, Fri-Sun 11:00-20:00
• One floor above Otachu 2nd Store (same building)'
);

-- 35. Toreka Himitsukichi
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_raw_rare, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000035',
  'トレカ秘密基地', 'Toreka Himitsukichi (Secret Base)',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田4-9-2 千住ビル5F', 'Senju Building 5F, 4-9-2 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7694, 35.7029)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  4.0, 50,
  'Pokemon card specialist with curated rare singles. Hidden on the 5th floor. Hours 12:00-20:00.'
);

-- 36. GEKIRIN
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000036',
  'GEKIRIN秋葉原店', 'GEKIRIN Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-10-6 ホープビル5F', 'Hope Building 5F, 3-10-6 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7695, 35.7015)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.7, 50,
  'Pokemon card shop with active Twitter giveaway promotions. Hours 12:00-20:00.'
);

-- 37. Nanapoke
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000037',
  'ナナポケ 秋葉原店', 'Nanapoke Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区神田佐久間町3-21-48 筋野ビル4F', 'Sujino Building 4F, 3-21-48 Kanda Sakumacho, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7755, 35.7000)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.6, 40,
  'YouTuber-supervised Pokemon card shop. Sells decks with special offers. Closed Thursdays. Weekdays 13:00-20:00, Sat-Sun 12:00-20:00.'
);

-- 38. Furuichi Trading Card Park
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_vintage, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000038',
  'ふるいちトレカパーク AKIBAラジ館店', 'Furuichi Trading Card Park AKIBA Radio Kaikan',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-15-16 ラジオ会館 7F', 'Radio Kaikan 7F, 1-15-16 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7711, 35.6983)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.8, 100,
  'Card shop on Radio Kaikan 7F with Pokemon, Yu-Gi-Oh, One Piece, and retro games. Official tournaments daily. Hours 10:00-20:00.'
);

-- 39. Kaisoku-oh Radio Kaikan
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000039',
  'カードショップ買賊王 ラジオ会館店', 'Card Shop Kaisoku-oh Radio Kaikan',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-15-16 秋葉原ラジオ会館 2F', 'Radio Kaikan 2F, 1-15-16 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7711, 35.6982)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.6, 70,
  'Card shop on Radio Kaikan 2F. Pokemon, Yu-Gi-Oh, One Piece singles and buy-back service.'
);

-- 40. Kaisoku-oh Cultures ZONE
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000040',
  'カードショップ買賊王 AKIBAカルチャーズZONE店', 'Card Shop Kaisoku-oh AKIBA Cultures ZONE',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-7-6 AKIBAカルチャーズZONE 3F', 'AKIBA Cultures ZONE 3F, 1-7-6 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7720, 35.6990)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.5, 50,
  'Kaisoku-oh''s second location in AKIBA Cultures ZONE. Pokemon, Yu-Gi-Oh singles and buy-back.'
);

-- 41. Toreka Sunrise
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_psa_graded, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000041',
  'トレカsunrise東京秋葉原店', 'Toreka Sunrise Tokyo Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-11-2 ロック2ビル1F', 'Rock 2 Building 1F, 3-11-2 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7694, 35.7016)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.7, 60,
  'Pokemon specialist with PSA graded cards, boxes, and singles. Also offers online/mail-order buyback.'
);

-- 42. Popsan Trading
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000042',
  'ポプサン商会 秋葉原ポケカ専門店', 'Popsan Trading Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田4-13-1 第2日浦ビル', '2nd Hiura Building, 4-13-1 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7693, 35.7035)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.8, 40,
  'Pokemon card specialist with two floors including a basement battle area. Hours 13:00-22:00 — one of the latest-closing shops.'
);

-- 43. Trading Card Shop YK
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_raw_rare, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000043',
  'トレカショップYK 秋葉原店', 'Trading Card Shop YK Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-2-3', '3-2-3 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7700, 35.7004)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.6, 30,
  'Collectible rare card specialist on Shoheibashi Street. Pokemon singles. Hours 13:00-20:00.'
);

-- 44. Toreka Raftel (One Piece specialist)
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000044',
  'トレカラフテル 秋葉原店', 'Card Shop Toreka Raftel Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-16-10 ニュー秋葉原センタービル #17', 'New Akihabara Center Building #17, 1-16-10 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7726, 35.6980)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.7, 50,
  'Claims Japan''s largest One Piece card selection. Also carries Pokemon and Yu-Gi-Oh. Weekdays 13:00-20:00, Sat-Sun 11:00-20:00.'
);

-- 45. Trading Card Palace
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000045',
  'トレカパレス', 'Trading Card Palace',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-16-10 ニュー秋葉原センター 2F-26', 'New Akihabara Center 2F-26, 1-16-10 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7726, 35.6981)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.5, 30,
  'Small card shop in the New Akihabara Center. Pokemon, Yu-Gi-Oh singles. Weekdays 14:00-20:30, Sat-Sun 12:00-19:00.'
);

-- 46. Toreka Mall (TCG Mall)
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_oripa, payment_methods, google_rating, google_review_count, beginner_friendly, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000046',
  'トレカモーール秋葉原1号店', 'Toreka Mall Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-2-9 ラオックス秋葉原本店 B1F', 'LAOX Akihabara Main Store B1F, 1-2-9 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7710, 35.6985)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.8, 60,
  true,
  'Japan''s first TCG-shop-only mall concept. Multiple specialty vendors under one roof in the LAOX basement. Browse different dealers for best prices.',
  '• Multi-vendor mall — compare prices between dealers!
• In LAOX basement (B1F) — easy to find
• Japan''s first TCG mall concept
• Great for browsing different specialties'
);

-- 47. Toreka Rises
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000047',
  'トレカライザス 秋葉原店', 'Toreka Rises Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-6-1 丸山ビル6F', 'Maruyama Building 6F, 3-6-1 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7700, 35.7008)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.6, 40,
  'Pokemon, One Piece, and Yu-Gi-Oh cards with singles and boxes.'
);

-- 48. SNKRDUNK Toreka (PSA submission!)
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_psa_graded, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000048',
  'スニダントレカ 秋葉原店', 'SNKRDUNK Trading Cards Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-14-1 外神田一丁目ビル中央棟1F', 'Sotokanda 1-chome Building Central Tower 1F, 1-14-1 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7708, 35.6990)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.9, 80,
  'World''s first PSA direct store partnership. Submit cards for PSA grading in-store! Also sells Pokemon, Yu-Gi-Oh, and PSA graded cards.',
  '• WORLD''S FIRST PSA direct store — submit cards for grading!
• By SNKRDUNK (major sneaker/collectibles platform)
• Ground floor — easy access
• Great PSA graded card selection'
);

-- 49. Kabe no Mise (Wall Shop)
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_vintage, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000049',
  'カベの店', 'Kabe no Mise (Wall Shop)',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-14-2 秋葉原ラジオセンター内', 'Akihabara Radio Center, 1-14-2 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7712, 35.6985)::geography,
  true, true,
  '{"cash"}',
  3.8, 40,
  'Old-school Akihabara card stall inside the historic Radio Center. Cards displayed on walls and glass panels. Multiple sub-locations in the building.',
  '• Classic Akihabara atmosphere — inside Radio Center
• Cards displayed on walls — unique browsing experience
• Cash only
• Hours 10:00-18:30'
);

-- 50. Card Land
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000050',
  'カードランド秋葉原店', 'Card Land Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-6-1 外神田ビル3F', 'Sotokanda Building 3F, 1-6-1 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7722, 35.6990)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.5, 30,
  'Pokemon, Yu-Gi-Oh singles. Weekdays/Sat 12:00-20:00, Sun 12:00-18:00.'
);

-- 51. Toreka Verse Gachapon Kaikan
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000051',
  'カードショップ トレカバース 秋葉原 ガチャポン会館店', 'Card Shop Toreka Verse Akihabara Gachapon Kaikan',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-15-5 秋葉原ガチャポン会館 6F', 'Akihabara Gachapon Kaikan 6F, 3-15-5 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7690, 35.7023)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.6, 30,
  'Pokemon, Conan TCG, Lorcana, and Bushiroad TCGs. Located on 6F of the famous Gachapon Kaikan building.'
);

-- 52. Denko Sekka
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000052',
  'デンコーセッカ 秋葉原店', 'Denko Sekka Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-14-5 久郷ビル 1F', 'Kugo Building 1F, 3-14-5 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7694, 35.7020)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.6, 40,
  'Pokemon, Yu-Gi-Oh, and One Piece cards. Also has card vending machines.'
);

-- 53. Toreka Yokocho Don Quijote
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_oripa, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000053',
  'トレカ横丁 ドン・キホーテ秋葉原店5F', 'Toreka Yokocho Don Quijote Akihabara 5F',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田4-3-3 ドン・キホーテ秋葉原 5F', 'Don Quijote Akihabara 5F, 4-3-3 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7709, 35.7029)::geography,
  true, true,
  '{"cash","visa","mastercard","ic"}',
  3.5, 50,
  'Card shop inside the famous Don Quijote discount store. Pokemon, Yu-Gi-Oh, oripa lottery packs.',
  '• Inside Don Quijote 5F — major tourist landmark
• Combine card shopping with Don Quijote bargains
• Tax-free shopping available at Don Quijote
• Open late (Don Quijote is open until 5am)'
);

-- 54. Card Bank
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_vintage, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000054',
  'カードバンク', 'Card Bank',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-15-14 リバティー秋葉原2店 5F', 'Liberty Akihabara 2nd Store 5F, 1-15-14 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7713, 35.6985)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.6, 40,
  'Pokemon, Yu-Gi-Oh singles and vintage cards in the Liberty building.'
);

-- 55. Minna de Toreka Main
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000055',
  'みんなでトレカ!! 秋葉原本店', 'Minna de Toreka!! Akihabara Main Store',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-5-1 エトランゼ18秋葉原 2F', 'Etranze 18 Akihabara 2F, 3-5-1 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7698, 35.7008)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.6, 40,
  'Pokemon, Yu-Gi-Oh, One Piece singles and boxes.'
);

-- 56. Minna de Toreka 2nd
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000056',
  'みんなでトレカ!! 秋葉原2号店', 'Minna de Toreka!! Akihabara 2nd Store',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-9-10 日宝アキバ館1F', 'Nippo Akiba-kan 1F, 3-9-10 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7696, 35.7013)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.5, 30,
  'Second location on Junk Street. Pokemon, Yu-Gi-Oh singles.'
);

-- 57. Bee Honpo
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000057',
  'Bee本舗 秋葉原店', 'Bee Honpo Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-3-5 ヨシヰビル6F', 'Yoshii Building 6F, 3-3-5 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7699, 35.7006)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.5, 25,
  'Pokemon, Yu-Gi-Oh singles shop on the 6th floor.'
);

-- 58. flat-Kobo
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000058',
  'flat-工房 秋葉原店', 'flat-Kobo Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-14-9 第26東ビル 6F', 'Dai-26 Higashi Building 6F, 3-14-9 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7694, 35.7023)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.5, 20,
  'Pokemon, Yu-Gi-Oh singles and boxes on the 6th floor.'
);

-- 59. Shakashaka Toreka
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000059',
  'カードショップ シャカシャカトレカ', 'Card Shop Shakashaka Toreka',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田4-7-2 小林ビル5F', 'Kobayashi Building 5F, 4-7-2 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7697, 35.7030)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.5, 20,
  'Pokemon, Yu-Gi-Oh singles.'
);

-- 60. Chelmo
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_vintage, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000060',
  '秋葉原チェルモ', 'Chelmo Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田6-14-1 日興ビル4F', 'Nikko Building 4F, 6-14-1 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7695, 35.7050)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.6, 30,
  'Pokemon singles and vintage cards. Located slightly north of the main Akihabara area.'
);

-- 61. Cardon
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000061',
  'カードン 秋葉原本店', 'Cardon Akihabara Main Store',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田2-4-4 第一電波ビル B2F', 'Dai-ichi Denpa Building B2F, 2-4-4 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7690, 35.7000)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.5, 30,
  'Basement card shop with Pokemon, Yu-Gi-Oh, One Piece singles and boxes.'
);

-- 62. Akiba Senryuu (Oripa specialist)
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_oripa, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000062',
  'アキバ籤龍', 'Akiba Senryuu',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-7-9 サンビュー外神田1F', 'Sunview Sotokanda 1F, 3-7-9 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7699, 35.7011)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.5, 30,
  'Oripa (lottery pack) specialist. Pokemon and Yu-Gi-Oh lottery packs at various price points.'
);

-- 63. Bushiroad Store
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_sealed_pack, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000063',
  'ブシロードストア in AKIHABARAゲーマーズ本店', 'Bushiroad Store in AKIHABARA Gamers',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-14-7 秋葉原野村ビル', 'Akihabara Nomura Building, 1-14-7 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7706, 35.6988)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.8, 60,
  'Official Bushiroad TCG store. Weiss Schwarz, Cardfight Vanguard, Rebirth, and BanG Dream cards.'
);

-- 64. Card Labo Gamers B1
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000064',
  'カードラボ AKIHABARAゲーマーズB1店', 'Card Labo AKIHABARA Gamers B1',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-14-7 秋葉原野村ビル B1F', 'Akihabara Nomura Building B1F, 1-14-7 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7706, 35.6989)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.7, 50,
  'Card Labo''s second location in AKIHABARA Gamers basement. Pokemon, Duel Masters, Bushiroad TCGs. 32 duel seats. Weekdays 11:00-20:00, Sat-Sun 10:00-20:00.'
);

-- 65. Card Rush 0-go-ten
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000065',
  'カードラッシュ秋葉原0号店TC', 'Card Rush Akihabara Store #0 TC',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-18-18 BiTO AKIBA PLAZA 7F', 'BiTO AKIBA PLAZA 7F, 1-18-18 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7735, 35.6979)::geography,
  true, true,
  '{"cash"}',
  4.0, 100,
  'Card Rush''s additional location on BiTO AKIBA PLAZA 7F. Pokemon, Yu-Gi-Oh singles and boxes. Weekdays 13:00-21:00, Sat-Sun 11:00-21:00.'
);

-- 66. Machi Chara Toreka-kan
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000066',
  'まちキャラ トレカ館', 'Machi Chara Toreka-kan',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-1-13 倉田ビル', 'Kurata Building, 3-1-13 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7701, 35.7003)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.5, 20,
  'Pokemon, Yu-Gi-Oh singles.'
);

-- 67. Torekking
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000067',
  'トレキング 秋葉原店', 'Torekking Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田4-4-2 地下1F', 'B1F, 4-4-2 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7701, 35.7028)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.5, 20,
  'Basement card shop. Pokemon, Yu-Gi-Oh, One Piece singles. Hours 12:00-20:00.'
);

-- 68. Toreka Bankoku
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000068',
  'トレカの万国 秋葉原店', 'Toreka no Bankoku Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-15-14 リバティー5号店 6F', 'Liberty 5th Store 6F, 1-15-14 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7714, 35.6986)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.5, 20,
  'Pokemon, Yu-Gi-Oh singles in the Liberty building.'
);

-- 69. Weiss Schwarz Mart
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, sells_sealed_pack, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000069',
  'Weiß Schwarz Mart AKIHABARA店', 'Weiss Schwarz Mart AKIHABARA',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田1-14-7 秋葉原野村ビル 2F', 'Akihabara Nomura Building 2F, 1-14-7 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7706, 35.6987)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.7, 30,
  'Weiss Schwarz TCG specialist shop. Niche but excellent selection for Weiss Schwarz fans.'
);

-- 70. Card Shop Spiral
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_oripa, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000070',
  'カードショップ すぱいらる 秋葉原店', 'Card Shop Spiral Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-9-3', '3-9-3 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7697, 35.7014)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.5, 20,
  'Pokemon, Yu-Gi-Oh singles and oripa lottery packs on Junk Street.'
);

-- 71. Card Shop NEM (Duel Masters specialist)
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000071',
  'カードショップ NEM 秋葉原', 'Card Shop NEM Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-5-1 エトランゼ18秋葉原 3F', 'Etranze 18 Akihabara 3F, 3-5-1 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7698, 35.7009)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.6, 20,
  'Duel Masters specialist shop. One of the best selections of Duel Masters cards in Akihabara.'
);

-- 72. Card Shop Hanjou
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000072',
  'カードショップ はんじょう', 'Card Shop Hanjou',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-10-5', '3-10-5 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7696, 35.7016)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.7, 40,
  'Celebrity-owned card shop run by famous streamer Hanjou. Pokemon, Yu-Gi-Oh singles and boxes.'
);

-- 73. Toreka Banpaku
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000073',
  'トレカ万博', 'Toreka Banpaku (Card Expo)',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-2-14 今井ビル5F', 'Imai Building 5F, 3-2-14 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7701, 35.7006)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.5, 20,
  'Pokemon, Yu-Gi-Oh singles.'
);

-- 74. Toreka Circuit
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_oripa, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000074',
  'トレカ サーキット 秋葉原', 'Toreka Circuit Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-8-9', '3-8-9 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7698, 35.7012)::geography,
  true, true, true,
  '{"cash","visa","mastercard"}',
  3.6, 30,
  'Pokemon, One Piece, Union Arena, and more. Strong buyback program and oripa lottery packs.'
);

-- 75. Maron no Kakurega
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000075',
  'マロンの隠れ家 秋葉原店', 'Maron''s Hideout Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田4-4-2 外神田協栄ビル5F', 'Sotokanda Kyoei Building 5F, 4-4-2 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7701, 35.7029)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.8, 30,
  'Arcade TCG specialist (WCCF, LoV, Sangokushi Taisen). Niche shop for arcade card game fans. Closed Wednesdays. Hours 11:00-20:00.'
);

-- 76. Kolo-ya
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000076',
  'トレーディングカード専門店 kolo屋', 'Trading Card Shop Kolo-ya',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-7-12', '3-7-12 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7699, 35.7010)::geography,
  true,
  '{"cash","visa","mastercard"}',
  3.5, 15,
  'Pokemon, Yu-Gi-Oh specialty cards. Access by elevator to 6F.'
);

-- 77. TCG Shop 193
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, sells_singles, sells_booster_box, payment_methods, google_rating, google_review_count, ai_summary)
VALUES (
  '10000000-0000-0000-0000-000000000077',
  'TCGショップ193 秋葉原店', 'TCG Shop 193 Akihabara',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-11-4', '3-11-4 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7695, 35.7017)::geography,
  true, true,
  '{"cash","visa","mastercard"}',
  3.6, 25,
  'Multiple TCG titles including Pokemon and Yu-Gi-Oh.'
);

-- 78. MTG Restaurant Rishada
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location, english_staff, sells_singles, payment_methods, google_rating, google_review_count, ai_summary, visitor_tips)
VALUES (
  '10000000-0000-0000-0000-000000000078',
  'MTG Restaurant リシャーダ', 'MTG Restaurant Rishada',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '東京都千代田区外神田3-10-11', '3-10-11 Sotokanda, Chiyoda-ku, Tokyo',
  ST_MakePoint(139.7696, 35.7018)::geography,
  true,
  true,
  '{"cash","visa","mastercard"}',
  4.1, 50,
  'Unique MTG-themed restaurant/bar where you can play Magic: The Gathering while dining and drinking. A one-of-a-kind experience in Akihabara.',
  '• Play MTG while eating/drinking!
• Unique concept — restaurant + card shop
• English-friendly (international MTG community)
• Great atmosphere for casual games'
);
