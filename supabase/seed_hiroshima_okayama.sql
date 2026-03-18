-- ============================================================
-- Region: Otemachi (Hiroshima)
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'ca000000-0000-0000-0000-000000000001',
  'Otemachi', '大手町', 'Hiroshima', 'Hiroshima',
  34.39400000, 132.45550000, 15, true
);

-- ============================================================
-- Region: Okayama Station (Okayama)
-- ============================================================
INSERT INTO regions (id, name_en, name_jp, city, prefecture, center_lat, center_lng, zoom_level, is_active)
VALUES (
  'cb000000-0000-0000-0000-000000000001',
  'Okayama Station', '岡山駅', 'Okayama', 'Okayama',
  34.66550000, 133.91850000, 14, true
);

-- ============================================================
-- Shop 1: Pokemon Center Hiroshima
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'ca000000-0000-0000-0000-000000000101',
  'ポケモンセンターヒロシマ', 'Pokemon Center Hiroshima',
  'ca000000-0000-0000-0000-000000000001',
  '〒732-0822 広島県広島市南区松原町1-2 ekie 2F', 'ekie 2F, 1-2 Matsubaracho, Minami-ku, Hiroshima 732-0822',
  ST_MakePoint(132.4753, 34.3975)::geography,
  '{"cash","visa","mastercard","amex","jcb","ic","paypay"}',
  false, true, true, false, false, false,
  true, 4.2, 300,
  '082-546-9537', 'https://www.pokemon.co.jp/shop/pokecen/hiroshima/',
  'Official Pokemon retail store, reopened at Hiroshima Station (ekie 2F) in April 2025. Directly connected to JR Hiroshima Station. Sells sealed booster packs, themed deck sets, official sleeves, playmats, plush toys, and exclusive Hiroshima-design merchandise. No singles or graded cards. Features a Pokemon Card Station for small events.',
  '• Daily 10:00-20:00
  • Directly connected to JR Hiroshima Station (ekie 2F)
  • Great first stop for sealed product and Hiroshima-exclusive souvenirs
  • No singles or graded cards — sealed product and merchandise only
  • All major credit cards, IC cards, and PayPay accepted'
);

-- ============================================================
-- Shop 2: Card Labo Hiroshima
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ca000000-0000-0000-0000-000000000102',
  'カードラボ 広島店', 'Card Labo Hiroshima',
  'ca000000-0000-0000-0000-000000000001',
  '〒730-0051 広島県広島市中区大手町2-3-1 アニメイトビル3F', 'Animate Building 3F, 2-3-1 Otemachi, Naka-ku, Hiroshima 730-0051',
  ST_MakePoint(132.4555, 34.3934)::geography,
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true, true, false, false,
  true, 3.9, 250,
  '082-259-3919', 'https://www.c-labo.jp/shop/hiroshima/', 'hiroshimalabo',
  'Major nationwide TCG chain with a large Hiroshima store. Konami Card Game Station satellite shop. Up to 124-seat free duel space with daily official tournaments. Good selection of Pokemon, Yu-Gi-Oh, and One Piece singles.',
  '• Weekdays 11:00-20:00, Weekends/Holidays 10:00-20:00
  • 124-seat free duel space with daily tournaments
  • 5-minute walk from Kamiyacho-nishi tram stop
  • Located on 3F of the Animate building on Hondori shopping street
  • Cash, credit cards, IC cards, and PayPay accepted'
);

-- ============================================================
-- Shop 3: Hobby Station Hiroshima
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ca000000-0000-0000-0000-000000000103',
  'ホビーステーション 広島店', 'Hobby Station Hiroshima',
  'ca000000-0000-0000-0000-000000000001',
  '〒730-0051 広島県広島市中区大手町1-5-16 大海原ビル1F', 'Oounabara Building 1F, 1-5-16 Otemachi, Naka-ku, Hiroshima 730-0051',
  ST_MakePoint(132.4535, 34.3950)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, false, false,
  true, 3.8, 200,
  '082-246-1171', 'https://www.hbst.net/shop/42/', 'HBSThiroshima',
  'One of Japan''s largest TCG retail chains. The Hiroshima store is in the Otemachi card shop district and carries a broad range of Pokemon, Yu-Gi-Oh, One Piece, and MTG singles and sealed product. Open 365 days a year. Has a separate 2nd store nearby for additional stock.',
  '• Daily 11:00-20:00
  • Located in the heart of the Otemachi card shop cluster
  • Open 365 days a year
  • Walking distance from Hondori tram stop
  • Broad multi-TCG selection including Pokemon, Yu-Gi-Oh, MTG'
);

-- ============================================================
-- Shop 4: Yellow Submarine Hiroshima
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ca000000-0000-0000-0000-000000000104',
  'イエローサブマリン 広島店', 'Yellow Submarine Hiroshima',
  'ca000000-0000-0000-0000-000000000001',
  '〒730-0051 広島県広島市中区大手町1-5-14 吉岡ビル', 'Yoshioka Building, 1-5-14 Otemachi, Naka-ku, Hiroshima 730-0051',
  ST_MakePoint(132.4533, 34.3952)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, false, false,
  true, 3.7, 180,
  '082-545-9030', 'https://yellowsubmarine.co.jp/', 'YS_HIROSHIMA',
  'Long-established nationwide hobby chain (since 1985). Recognized as a Bushiroad TCG Station, Pokemon Card Gym, Konami Friendly Shop, and WPN-authorized store. Located right next to Hobby Station on Otemachi. Also carries tabletop RPGs, board games, and miniatures.',
  '• Weekdays 12:00-20:00, Weekends/Holidays 11:00-19:00
  • Note weekend hours differ (open earlier, close earlier)
  • Cards well-organized with clear pricing
  • Also carries board games, miniatures, and TRPG supplies
  • Right next to Hobby Station in the Otemachi cluster'
);

-- ============================================================
-- Shop 5: MINT Games Hiroshima
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ca000000-0000-0000-0000-000000000105',
  'MINT GAMES 広島店', 'MINT Games Hiroshima',
  'ca000000-0000-0000-0000-000000000001',
  '〒730-0034 広島県広島市中区新天地5-3 ドン・キホーテ広島八丁堀店5F', 'Don Quijote Hiroshima Hatchobori 5F, 5-3 Shintenchi, Naka-ku, Hiroshima 730-0034',
  ST_MakePoint(132.4621, 34.3922)::geography,
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true, true, true, false, true,
  true, 3.9, 220,
  '082-207-2505', 'https://mint-web.jp/', 'MintHiroshima',
  'Sports card and TCG cafe-style shop on the 5th floor of Don Quijote in the Hatchobori entertainment district. Carries over 300,000 items including sports cards, Pokemon, MTG, and other TCGs. Also has PSA graded cards and vintage product.',
  '• Daily 11:00-21:00
  • Open until 21:00 — later than most Hiroshima card shops
  • PSA graded cards and vintage product available
  • Located on 5F of Don Quijote (tax-free shopping downstairs)
  • Over 300,000 items in stock including sports cards'
);

-- ============================================================
-- Shop 6: Card Box Hiroshima
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ca000000-0000-0000-0000-000000000106',
  'カードボックス 広島店', 'Card Box Hiroshima',
  'ca000000-0000-0000-0000-000000000001',
  '〒730-0051 広島県広島市中区大手町1-4-32 大手町ビル1F', 'Otemachi Building 1F, 1-4-32 Otemachi, Naka-ku, Hiroshima 730-0051',
  ST_MakePoint(132.4540, 34.3947)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, false,
  true, 3.8, 170,
  '082-208-1988', 'https://cardbox.online/shop/detail/4221/', 'cbhiroshimafg',
  'Relocated and reopened in July 2025 in the Otemachi card shop cluster. Carries Yu-Gi-Oh, Duel Masters, Pokemon, and One Piece cards (new and used). Runs regular in-store events and tournaments. Buy-back counter with posted prices.',
  '• Weekdays 11:00-21:00, Weekends/Holidays 10:00-21:00
  • Open until 21:00 on all days
  • Buy-back counter with posted prices
  • In the same Otemachi Building as Toreka Shop Universe (3F)
  • Walking distance from Hondori tram stop'
);

-- ============================================================
-- Shop 7: RoSE Trading Card Hiroshima
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_psa_graded, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ca000000-0000-0000-0000-000000000107',
  'RoSEトレカ 広島本店', 'RoSE Trading Card Hiroshima',
  'ca000000-0000-0000-0000-000000000001',
  '〒730-0044 広島県広島市中区宝町4-30 パーセ宝町1F', 'Pase Takaramachi 1F, 4-30 Takaramachi, Naka-ku, Hiroshima 730-0044',
  ST_MakePoint(132.4612, 34.3883)::geography,
  '{"cash","paypay"}',
  true, true, true, true, true, false, true,
  4.5, 120,
  '082-500-9384', 'https://rosetradingcard.com', 'RoSEtradingcard',
  'Independent local card shop specializing in Pokemon and One Piece cards. Known for an excellent selection of PSA-graded cards and rare singles. Closed on Mondays and Fridays.',
  '• Tue-Thu 15:00-21:00, Sat-Sun 12:00-17:00, Closed Mon & Fri
  • Excellent PSA-graded card selection
  • Check @RoSEtradingcard on X for schedule changes before visiting
  • Limited hours — plan accordingly
  • Located south of the main Otemachi area near Takaramachi tram stop'
);

-- ============================================================
-- Shop 8: BOOKOFF Super Bazaar Hiroshima Otemachi
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ca000000-0000-0000-0000-000000000108',
  'BOOKOFF SUPER BAZAAR 広島大手町店', 'BOOKOFF Super Bazaar Hiroshima Otemachi',
  'ca000000-0000-0000-0000-000000000001',
  '〒730-0051 広島県広島市中区大手町2-7-6', '2-7-6 Otemachi, Naka-ku, Hiroshima 730-0051',
  ST_MakePoint(132.4545, 34.3920)::geography,
  '{"cash","visa","mastercard","ic","paypay"}',
  true, false, true, true, false, true,
  true, 3.6, 250,
  '082-543-6216', 'https://www.bookoff.co.jp/shop/shop20135.html', 'bookoff_trk',
  'Large multi-floor BOOKOFF with a dedicated trading card section. Carries used Pokemon, Yu-Gi-Oh, and other TCG singles and sealed packs at competitive prices. Great for bargain hunting on used cards.',
  '• Main store 10:00-22:00, TCG section 12:00-22:00
  • Latest closing time among Hiroshima card shops (22:00)
  • Great for bargain hunting on used singles
  • 408-car parking lot at the back of the building
  • Phone inquiries about card stock are not accepted'
);

-- ============================================================
-- Shop 9: Hobby Station Hiroshima 2nd Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ca000000-0000-0000-0000-000000000109',
  'ホビーステーション 広島2号店', 'Hobby Station Hiroshima 2nd Store',
  'ca000000-0000-0000-0000-000000000001',
  '〒730-0051 広島県広島市中区大手町1-5-15 本通西ビル1F', 'Hondori Nishi Building 1F, 1-5-15 Otemachi, Naka-ku, Hiroshima 730-0051',
  ST_MakePoint(132.4536, 34.3949)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, false, false,
  true, 3.7, 150,
  '082-246-1171', 'https://www.hbst.net/shop/42/', 'HBSThiroshima',
  'Second branch of Hobby Station in the Otemachi card shop cluster, just steps from the main store. Provides additional stock and play space. Same chain as the main store with separate inventory focused on different TCG titles.',
  '• Daily 11:00-20:00
  • Steps away from the main Hobby Station store
  • Separate inventory from the main store
  • Located in the Otemachi card shop street
  • Same hours and payment methods as the main store'
);

-- ============================================================
-- Shop 10: Toreka Shop Universe Hiroshima
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  google_rating, google_review_count,
  phone, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'ca000000-0000-0000-0000-000000000110',
  'トレカショップ ユニバース 広島', 'Toreka Shop Universe Hiroshima',
  'ca000000-0000-0000-0000-000000000001',
  '〒730-0051 広島県広島市中区大手町1-4-32 大手町ビル3F', 'Otemachi Building 3F, 1-4-32 Otemachi, Naka-ku, Hiroshima 730-0051',
  ST_MakePoint(132.4540, 34.3947)::geography,
  '{"cash","visa","mastercard"}',
  true, true, true, true, false, false,
  3.9, 100,
  '082-208-1988', 'universe_hiroshima',
  'Local independent card shop on the 3rd floor of the Otemachi Building (same building as Card Box on 1F). Specializes in Pokemon and One Piece TCG with a curated selection of rare singles and sealed product.',
  '• Daily 11:00-20:00
  • Same building as Card Box (1F) — visit both in one trip
  • Curated selection of rare singles
  • Located in the Otemachi card shop cluster
  • Smaller boutique feel compared to chain stores'
);

-- ============================================================
-- Shop 11: Card Labo Okayama West Exit
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  english_staff, payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'cb000000-0000-0000-0000-000000000101',
  'カードラボ 岡山西口店', 'Card Labo Okayama West Exit',
  'cb000000-0000-0000-0000-000000000001',
  '〒700-0024 岡山県岡山市北区駅元町30-12 飛鳥ビル3F', 'Asuka Building 3F, 30-12 Ekimotocho, Kita-ku, Okayama 700-0024',
  ST_MakePoint(133.9144, 34.6642)::geography,
  true,
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true, true, false, false,
  true, 4.0, 200,
  '086-252-9737', 'https://www.c-labo.jp/shop/okayamanishi/', 'okayama_clabo',
  'Major nationwide chain with the Okayama branch just 3 minutes walk from JR Okayama Station West Exit. Offers tax-free shopping for foreign tourists. Carries the full range of Pokemon, Yu-Gi-Oh, One Piece, Duel Masters, and Weiss Schwarz.',
  '• Mon-Thu 12:00-21:00, Fri 12:00-22:00, Sat 10:00-22:00, Sun 10:00-21:00
  • Tax-free shopping available for foreign tourists
  • 3 minutes from JR Okayama Station West Exit
  • English-speaking staff available
  • Friday and Saturday hours extend to 22:00'
);

-- ============================================================
-- Shop 12: Card Box Okayama Ekimae
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_english_cards, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url,
  ai_summary, visitor_tips)
VALUES (
  'cb000000-0000-0000-0000-000000000102',
  'カードボックス 岡山駅前店', 'Card Box Okayama Ekimae',
  'cb000000-0000-0000-0000-000000000001',
  '〒700-0023 岡山県岡山市北区駅前町1-8-18 イコットニコットB1F', 'icotnicot B1F, 1-8-18 Ekimae-cho, Kita-ku, Okayama 700-0023',
  ST_MakePoint(133.9198, 34.6652)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, true, false,
  true, 3.7, 180,
  '086-232-3267', 'https://cardbox.online/shop/detail/4263/',
  'Located in the basement of icotnicot commercial building, 5 minutes from JR Okayama Station East Exit. Open 10:00-22:00 every day. Carries international/English versions of Yu-Gi-Oh and Pokemon cards. 96-seat duel space for casual play and tournaments.',
  '• Daily 10:00-22:00 (closed only New Year''s Day)
  • 5 minutes from JR Okayama Station East Exit
  • English/international Pokemon and Yu-Gi-Oh cards available
  • 96-seat duel space for tournaments
  • Wide selection of sealed product and original packs'
);

-- ============================================================
-- Shop 13: Oretan Okayama Main Store
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'cb000000-0000-0000-0000-000000000103',
  'カードゲームショップ オレタン 岡山本店', 'Oretan Okayama Main Store',
  'cb000000-0000-0000-0000-000000000001',
  '〒700-0962 岡山県岡山市北区北長瀬表町2-17-80 ブランチ岡山北長瀬内', 'Branch Okayama Kitanagase, 2-17-80 Kitanagase Omotemachi, Kita-ku, Okayama 700-0962',
  ST_MakePoint(133.8905, 34.6608)::geography,
  '{"cash","visa","mastercard","ic","paypay"}',
  true, true, true, true, false, false,
  true, 4.1, 190,
  '086-250-1900', 'https://oretan.jp/', 'oretan_staff',
  'Large local card shop at the Branch Okayama Kitanagase shopping complex. Features a massive 102-seat free duel space. Carries Pokemon, Yu-Gi-Oh, Duel Masters, Shadowverse Evolve, Weiss Schwarz, and more. Buy-back counter open until 20:00.',
  '• Weekdays 11:00-21:00, Weekends/Holidays 10:00-21:00
  • Massive 102-seat free duel space
  • Near JR Kitanagase Station (10 min from Okayama Station by train)
  • Free parking available at the Branch complex
  • Buy-back counter open until 20:00'
);

-- ============================================================
-- Shop 14: Card Box Fujita
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'cb000000-0000-0000-0000-000000000104',
  'カードボックス 藤田店', 'Card Box Fujita',
  'cb000000-0000-0000-0000-000000000001',
  '〒701-0221 岡山県岡山市南区藤田560-209 Pモール藤田内', 'P-Mall Fujita, 560-209 Fujita, Minami-ku, Okayama 701-0221',
  ST_MakePoint(133.9282, 34.6145)::geography,
  '{"cash","visa","mastercard","ic"}',
  true, true, true, true, true, false,
  true, 3.6, 140,
  '086-296-0003', 'https://cardbox.online/shop/detail/1329/', '21P4',
  'Located inside P-Mall Fujita shopping center in southern Okayama, about 20 minutes from Okayama Station by car. Opens early at 9:00 and stays open until 22:00, 365 days a year. Carries Pokemon, Yu-Gi-Oh, Duel Masters, and One Piece cards.',
  '• Daily 09:00-22:00, open 365 days
  • Opens early at 09:00 — earliest among Okayama card shops
  • About 20 minutes from Okayama Station by car
  • Near JR Senoo Station
  • Phone inquiries about card stock are not accepted'
);

-- ============================================================
-- Shop 15: Furuichi Aeon Mall Okayama
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'cb000000-0000-0000-0000-000000000105',
  'ふるいち イオンモール岡山店', 'Furuichi Aeon Mall Okayama',
  'cb000000-0000-0000-0000-000000000001',
  '〒700-0907 岡山県岡山市北区下石井1-2-1 イオンモール岡山5F', 'Aeon Mall Okayama 5F, 1-2-1 Shimoishii, Kita-ku, Okayama 700-0907',
  ST_MakePoint(133.9215, 34.6615)::geography,
  '{"cash","visa","mastercard","jcb","ic","paypay"}',
  true, false, true, true, false, true,
  true, 3.5, 200,
  '086-230-2705', 'https://www.furu1.net/shop/shop0158.html', 'furu1_AMokayama',
  'Located on the 5th floor of Aeon Mall Okayama, directly connected to JR Okayama Station via underground walkway. Part of the Furuichi/Furuhon Ichiba chain. Sells used games, hobby items, and trading cards including Pokemon singles at affordable prices.',
  '• Daily 10:00-21:00
  • Directly connected to JR Okayama Station via underground walkway
  • Good for affordable used cards and vintage items
  • Combine with shopping and dining at Aeon Mall
  • 2,500-space parking lot at the mall'
);

-- ============================================================
-- Shop 16: Pocket Center Okayama
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_vintage,
  beginner_friendly, google_rating, google_review_count,
  phone, website_url, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'cb000000-0000-0000-0000-000000000106',
  'Pocket Center 岡山本店', 'Pocket Center Okayama',
  'cb000000-0000-0000-0000-000000000001',
  '〒700-0092 岡山県岡山市北区万成東町1-31', '1-31 Mannari-Higashimachi, Kita-ku, Okayama 700-0092',
  ST_MakePoint(133.8995, 34.6715)::geography,
  '{"cash","paypay"}',
  true, true, true, true, true, false,
  true, 4.3, 100,
  '086-230-7449', 'https://pockecen.base.shop/', 'PocketCenter24',
  'Independent local shop specializing in Pokemon, Yu-Gi-Oh, One Piece, Duel Masters, and Weiss Schwarz. Opens late on weekdays (14:00) but stays open until midnight on Fridays and Saturdays. Has 12 parking spaces.',
  '• Mon-Thu 14:00-22:00, Fri-Sat 14:00-24:00, Sun 11:00-20:00
  • Open until midnight on Friday and Saturday
  • 15 minutes by car from JR Okayama Station (not walkable)
  • 12 parking spaces available
  • Check @PocketCenter24 on X for latest hours'
);

-- ============================================================
-- Shop 17: Card Shop Wakain
-- ============================================================
INSERT INTO shops (id, name_jp, name_en, region_id, address_jp, address_en, location,
  payment_methods,
  sells_singles, sells_booster_box, sells_sealed_pack, sells_raw_rare, sells_oripa, sells_english_cards, sells_vintage,
  google_rating, google_review_count,
  phone, twitter_handle,
  ai_summary, visitor_tips)
VALUES (
  'cb000000-0000-0000-0000-000000000107',
  'カードショップ若院', 'Card Shop Wakain',
  'cb000000-0000-0000-0000-000000000001',
  '〒700-0913 岡山県岡山市北区大供1-3-8', '1-3-8 Daikyo, Kita-ku, Okayama 700-0913',
  ST_MakePoint(133.9175, 34.6560)::geography,
  '{"cash"}',
  true, true, true, true, false, true, false,
  4.2, 90,
  '086-238-5967', 'cardshop_wakain',
  'Small independent card shop known for carrying English/international versions of Yu-Gi-Oh and Pokemon cards, which is unusual outside Tokyo. Closed on Wednesdays. A good stop for foreign visitors looking for English-language card product.',
  '• Mon-Tue, Thu-Sun 13:00-22:00, Closed Wednesdays
  • English/international Pokemon and Yu-Gi-Oh cards available
  • About 10 minutes walk south from JR Okayama Station
  • Near Daiunji-mae tram stop (Seikibashi Line)
  • Cash may be the primary payment method'
);

-- ============================================================
-- Shop Inventory Data for Hiroshima Shops
-- ============================================================

-- Card Labo Hiroshima (key Hiroshima shop)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ca000000-0000-0000-0000-000000000102', 'single_common', 'in_stock', 20, 500, 'Competitive pricing on commons'),
  ('ca000000-0000-0000-0000-000000000102', 'single_rare', 'in_stock', 500, 8000, 'Good rare singles selection'),
  ('ca000000-0000-0000-0000-000000000102', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('ca000000-0000-0000-0000-000000000102', 'booster_box', 'in_stock', 5200, 8000, 'Current sets always available'),
  ('ca000000-0000-0000-0000-000000000102', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('ca000000-0000-0000-0000-000000000102', 'deck', 'in_stock', 1500, 3000, 'Starter and theme decks'),
  ('ca000000-0000-0000-0000-000000000102', 'accessories', 'in_stock', 300, 5000, 'Sleeves, deck boxes, playmats')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- MINT Games Hiroshima (key Hiroshima shop)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('ca000000-0000-0000-0000-000000000105', 'single_common', 'in_stock', 30, 500, NULL),
  ('ca000000-0000-0000-0000-000000000105', 'single_rare', 'in_stock', 500, 8000, 'Large selection'),
  ('ca000000-0000-0000-0000-000000000105', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('ca000000-0000-0000-0000-000000000105', 'single_sar', 'in_stock', 8000, 150000, NULL),
  ('ca000000-0000-0000-0000-000000000105', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('ca000000-0000-0000-0000-000000000105', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('ca000000-0000-0000-0000-000000000105', 'psa_graded', 'in_stock', 5000, 500000, 'PSA graded showcase'),
  ('ca000000-0000-0000-0000-000000000105', 'vintage_pack', 'limited', 30000, 300000, 'Vintage product when available')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- ============================================================
-- Shop Inventory Data for Okayama Shops
-- ============================================================

-- Card Labo Okayama West Exit (key Okayama shop)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('cb000000-0000-0000-0000-000000000101', 'single_common', 'in_stock', 20, 500, NULL),
  ('cb000000-0000-0000-0000-000000000101', 'single_rare', 'in_stock', 500, 8000, 'Extensive selection'),
  ('cb000000-0000-0000-0000-000000000101', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('cb000000-0000-0000-0000-000000000101', 'booster_box', 'in_stock', 5200, 8000, 'Current sets available'),
  ('cb000000-0000-0000-0000-000000000101', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('cb000000-0000-0000-0000-000000000101', 'deck', 'in_stock', 1500, 3000, 'Starter and theme decks'),
  ('cb000000-0000-0000-0000-000000000101', 'accessories', 'in_stock', 300, 5000, 'Sleeves, deck boxes, playmats')
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;

-- Card Box Okayama Ekimae (key Okayama shop)
INSERT INTO shop_inventory (shop_id, category, availability, price_range_min, price_range_max, notes_en) VALUES
  ('cb000000-0000-0000-0000-000000000102', 'single_common', 'in_stock', 20, 500, NULL),
  ('cb000000-0000-0000-0000-000000000102', 'single_rare', 'in_stock', 500, 8000, 'EN cards available'),
  ('cb000000-0000-0000-0000-000000000102', 'single_sr', 'in_stock', 3000, 50000, NULL),
  ('cb000000-0000-0000-0000-000000000102', 'booster_box', 'in_stock', 5200, 8000, NULL),
  ('cb000000-0000-0000-0000-000000000102', 'sealed_pack', 'in_stock', 180, 500, NULL),
  ('cb000000-0000-0000-0000-000000000102', 'oripa', 'in_stock', 500, 5000, 'Original pack sales'),
  ('cb000000-0000-0000-0000-000000000102', 'accessories', 'in_stock', 300, 5000, NULL)
ON CONFLICT (shop_id, category) DO UPDATE SET
  availability = EXCLUDED.availability,
  price_range_min = EXCLUDED.price_range_min,
  price_range_max = EXCLUDED.price_range_max,
  notes_en = EXCLUDED.notes_en;
