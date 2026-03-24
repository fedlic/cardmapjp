# CardMapJP — 全プラットフォーム向けローンチコンテンツ集
**v1.0.0 | 2026年3月**

---

## 1. リリースノート（GitHub / README 用）

```
## v1.0.0 — Initial Public Release (2026-03-24)

### 🎉 First public release

CardMapJP is now live and open-source.
A Pokémon card shop finder built specifically for foreign visitors traveling to Japan.

### Features shipped in v1.0.0

**Map & Discovery**
- Interactive OpenStreetMap (Leaflet) with 284 shops across 23 regions
- Click-to-fly marker animation, color-coded selection state
- Real-time sidebar search with debounced input (200ms)
- Filter badges: English Staff / Beginner Friendly / English Cards / Vintage / PSA Graded

**Shop Detail Pages**
- AI-generated English summaries & visitor tips (Claude API)
- 13-category inventory grid (Booster Box → Accessories)
- Payment method display (Cash / Visa / Mastercard / IC)
- English staff schedule, ATM proximity notes
- Google Maps directions deep-link
- User review system via Supabase Auth

**Regions Coverage (23 regions)**
- Tokyo: Akihabara (78), Ikebukuro (12), Shibuya (10), Shinjuku (8), Nakano (8), Tachikawa (7), Machida (6)
- Kanto: Yokohama (8), Omiya (7), Chiba (7)
- Kansai: Nipponbashi/Osaka (20), Kyoto (11), Kobe (10)
- Chubu: Osu/Nagoya (15), Niigata (6), Kanazawa (5)
- Kyushu/Okinawa: Fukuoka (15), Kumamoto (6), Naha (6)
- Chugoku: Hiroshima (10), Okayama (7)
- Tohoku/Hokkaido: Sapporo (11), Sendai (11)

**SEO**
- Dynamic sitemap.xml covering all shop & region pages
- JSON-LD (Schema.org Store) on every shop page
- OpenGraph meta tags on all pages
- Akihabara SEO landing page with editorial content

**Admin Dashboard** (password-protected)
- Shop CRUD with create/edit dialog
- 13-category inventory management with bulk save
- HMAC-SHA256 signed cookie auth (24h session)

**API**
- `GET /api/shops` — list all shops with PostGIS radius search
- `POST /api/shops/[id]/generate-summary` — AI summary generation
- Full admin CRUD API

### Tech Stack
Next.js 15 (App Router) · TypeScript · Tailwind CSS 4 · shadcn/ui
Supabase (PostgreSQL + PostGIS) · Leaflet · Vercel · Claude API

### Open Source
MIT License — contributions welcome!
https://github.com/fedlic/cardmapjp

### What's Next (v1.1 roadmap)
- iOS app (SwiftUI + MapKit)
- Blog / SEO content auto-generation
- X (Twitter) auto-posting integration
- AdMob / AdSense monetization
- "Near me" GPS discovery
- Multi-language UI (JA / ZH / KO / TH)
```

---

## 2. NOTE 記事（日本語・技術ネタあり）

**タイトル：**
**訪日外国人向けポケカショップマップ「CardMapJP」をリリースした話——Next.js + Supabase + Claude APIで全国284店舗を網羅するまで**

---

訪日外国人がポケモンカードを買うとき、何が一番困るか知っていますか？

**「どこに行けばいいかわからない」** です。

秋葉原に行けばなんとかなるのは知ってる。でも何番出口を出て、どの店が英語が通じて、今日はシングルカードを買いたいのか、パックを剥きたいのか——そういった情報が英語でまとまっているサービスは存在しませんでした。

そこで作ったのが **CardMapJP**（https://cardmapjp.vercel.app）です。

### 何ができるのか

- 全国23エリア・284店舗をインタラクティブマップで一覧
- 英語スタッフ在籍・初心者OK・PSAグレードなどのフィルター
- 各店舗の在庫カテゴリ（ブースターボックス〜アクセサリー計13種）が一目でわかる
- AI生成の英語バイヤーズガイド付き
- 支払い方法・英語対応スタッフのシフト情報まで掲載

秋葉原だけで78店舗、大阪・日本橋20店、名古屋・大須15店。国内主要カードショップをほぼカバーしています。

### 技術スタック

フロントはNext.js 15（App Router）+ TypeScript + Tailwind CSS 4。DBはSupabase（PostgreSQL + PostGIS）でジオクエリを使った半径検索も実装済み。デプロイはVercel。

AIで何をやっているかというと、各店舗の英語バイヤーズサマリーをAnthropic Claude APIで自動生成しています。「この店はビンテージパック在庫が多く、現金払い推奨、英語スタッフは土日のみ」みたいな情報をLLMに整理させて、外国人が実際に使える形にしています。

地図はGoogleマップではなくOpenStreetMap（Leaflet）を使っています。理由はコストとライセンスの透明性。ポケカショップ用途ではGoogleマップAPIの課金が意外と痛い。

DBスキーマはshops（47カラム）、shop_inventory（13カテゴリ × 店舗数）、PostGIS geography型でガチのジオクエリまで作っています。フロントからみると`/api/shops?lat=35.69&lng=139.70&radius_km=1`という形でPostGISの`shops_within_radius()`を叩くだけ。

### オープンソース

**MITライセンスで全コード公開しています。**
https://github.com/fedlic/cardmapjp

ポケカの在庫データ更新や英語翻訳のPRは大歓迎です。「うちの地元のカードショップが載ってない」というissueも歓迎します。

### これからやること

iOSアプリ（SwiftUI + MapKit）の開発、X自動投稿連携、店舗数の拡充、多言語対応（日英中韓タイ）などを予定しています。

訪日観光でポケカ旅行をしたい外国人トレーナーに届けば嬉しい。そしてこういう「海外からの旅行者向けニッチ情報サービス」という形式がどれだけ刺さるか、マネタイズ含めてデータを集めているところです。

使ってみた感想・バグ報告・スター、何でも歓迎です。

---

## 3. ブログ記事（英語・SEO向け）

**Title: I Built an Open-Source Pokémon Card Shop Finder for Japan — Here's What I Learned**

*Posted on [blog.cardmapjp.com] · March 2026*

---

If you've ever landed in Akihabara hoping to pick up some Pokémon cards, you know the feeling: dozens of shops, no map, no filter for "does this place have English staff?", and no way to know if the store three floors up actually has sealed booster boxes or just beat-up singles in binders.

I couldn't find a service that solved this. So I built one.

**CardMapJP** (https://cardmapjp.vercel.app) is an open-source Pokémon card shop finder designed specifically for international visitors to Japan. As of today, v1.0.0 is live with 284 shops across 23 regions nationwide.

Here's what's inside, and what building it taught me.

---

### What the App Does

The core flow is simple: open the map, pick a region, click a shop. You immediately see:

- Which of 13 inventory categories the shop carries (Booster Boxes, Singles, PSA Graded cards, Oripa lottery packs, Vintage Boxes, and more)
- Payment methods accepted (cash-only is more common than you'd think)
- Whether English-speaking staff are available — and on which days
- An AI-generated buyer's guide written in plain English
- User reviews from other international collectors

Filters let you narrow to shops with English staff, beginner-friendly environments, English-language card stock, vintage inventory, or PSA grading services. The sidebar search is live-filtered as you type.

Coverage spans Tokyo (Akihabara, Ikebukuro, Shibuya, Shinjuku, Nakano, and more), Osaka's Nipponbashi, Nagoya's Osu, Fukuoka's Tenjin, plus Sapporo, Sendai, Kyoto, Kobe, Hiroshima, Okayama, and several others.

---

### Why This Exists

The international Pokémon TCG community is huge, and Japan is the mecca. Sealed Japanese product is often cheaper here than anywhere else in the world. Vintage cards that are impossible to find elsewhere exist in Akihabara glass cases. PSA grading turnaround via Japanese services is faster and sometimes cheaper than US options.

But the information gap is real. Japanese TCG fan sites don't serve foreign visitors. Google Maps searches return mixed results with no TCG-specific filters. There is no single English-language resource that maps the ecosystem.

That's the gap CardMapJP fills.

---

### The Tech

The stack is straightforward: Next.js 15 with App Router, TypeScript, Tailwind CSS 4, Supabase (PostgreSQL + PostGIS), and Vercel for deployment.

A few decisions worth explaining:

**OpenStreetMap over Google Maps.** For a niche app, Google Maps API billing adds up fast. OpenStreetMap via Leaflet is free, open, and more than sufficient for shop location display.

**PostGIS for geo-queries.** The "near me" feature uses a `shops_within_radius()` PostgreSQL function with PostGIS geography types. Accurate distance calculation without any external geocoding service.

**Claude API for shop summaries.** Each shop detail page includes an AI-generated English summary with practical visitor tips — hours, payment preferences, English staff availability, inventory strengths. These are generated once and cached. It turns raw database fields into genuinely useful travel guidance.

**ISR for performance.** The home page uses 5-minute incremental static regeneration, and individual shop pages are statically generated at build time with JSON-LD structured data for SEO.

---

### Open Source

The entire codebase is MIT-licensed and on GitHub: https://github.com/fedlic/cardmapjp

PRs welcome for: new shop data, regional coverage expansion, translation improvements, and feature development. If your local card shop isn't listed, open an issue.

---

### What's Coming

The iOS app (SwiftUI + MapKit + Supabase) is in active development. Blog-based SEO content for each city is next. Longer-term: crowdsourced inventory updates, price tracking, multi-language UI (JA/ZH/KO/TH), and a shop partnership program.

If you're heading to Japan and want to find Pokémon cards — [start here](https://cardmapjp.vercel.app). And if you're a developer interested in contributing, [the repo is open](https://github.com/fedlic/cardmapjp).

---

## 4. X (Twitter) 投稿案 — 日本語

### Tweet A（メインアナウンス）
```
訪日外国人向けポケカショップマップ「CardMapJP」をリリースしました🗺️

全国23エリア・284店舗をまとめて検索できます

✅ 英語スタッフ在籍フィルター
✅ 在庫カテゴリ一覧（ブースター / シングル / PSA / オリパ etc.）
✅ 支払い方法・英語対応時間帯まで掲載

海外からの友達に教えてあげてください👇

👉 https://cardmapjp.vercel.app
#ポケモンカード #秋葉原 #CardMapJP
```

### Tweet B（秋葉原特化）
```
秋葉原だけでポケカショップ78店舗——

どこに何が売ってるか、英語スタッフはいるか、現金しか使えないかどうか、全部まとめてあります

外国人トレーナーが日本旅行で迷わないために作りました

👉 https://cardmapjp.vercel.app/?region=akihabara
#秋葉原 #ポケカ #ポケモンカード
```

### Tweet C（オープンソース告知）
```
CardMapJPのコードをGitHubで全公開しました

「うちの地元のカードショップも載せてほしい」「このエリアのデータが欲しい」

PRもissueも大歓迎です🙌

⭐ https://github.com/fedlic/cardmapjp

#OSS #ポケモンカード #個人開発
```

### Tweet D（英語・インバウンド向け）
```
CardMapJP is live 🇯🇵

Finding Pokémon card shops in Japan just got easier.

284 shops · 23 cities
Filter by English staff, inventory type, payment method

Free, open-source, built for international collectors

👉 https://cardmapjp.vercel.app
#PokemonTCG #Japan #Akihabara
```

### Tweet E（スレッド1枚目用）
```
訪日外国人がポケカを買うときの「あるある困りごと」を全部解決するサービスを作りました

秋葉原78店・全国284店舗をマップで一括検索できます🗺️

（詳細は続きのスレッドで）

👉 cardmapjp.vercel.app
```

---

## 5. X (Twitter) 投稿案 — 英語

### Tweet A（メインアナウンス）
```
Built CardMapJP — an open-source Pokémon card shop finder for international visitors in Japan 🇯🇵

📍 284 shops across 23 regions
🔍 Filter: English staff, inventory type, payment method
🤖 AI-generated buyer's guides for each shop

Free to use. Code on GitHub.

👉 https://cardmapjp.vercel.app
#PokemonTCG #Japan
```

### Tweet B（Akihabara特化）
```
78 Pokémon card shops in Akihabara alone.

CardMapJP maps them all — with filters for English staff, sealed product, PSA graded cards, vintage boxes, and more.

No more guessing which floor the card shop is on.

👉 https://cardmapjp.vercel.app/?region=akihabara
#Akihabara #PokemonCards #Japan
```

### Tweet C（海外コレクター向け）
```
Traveling to Japan and looking for Pokémon cards?

CardMapJP shows you:
— Which shops have English-speaking staff
— What inventory categories each shop carries
— Payment methods accepted (some are cash-only!)
— AI buyer tips in plain English

👉 https://cardmapjp.vercel.app
#PokemonTCG #JapanTravel
```

---

## 6. Facebook POST — 日本語

**CardMapJP、正式リリースしました🎉**

訪日外国人向けのポケモンカードショップ検索サービスです。

日本にはポケカショップが本当にたくさんあります。秋葉原だけで78店舗。全国では23エリアで284店舗を掲載しています（2026年3月現在）。

でも、英語でこの情報をまとめているサービスは今まで存在しませんでした。

「英語が通じる店を先に知りたい」
「シングルカードに強い店はどこ？」
「PSAグレードのカードを買いたい」
「現金しか使えない店は避けたい」

こういったニーズに答えます。

**主な機能：**
- インタラクティブマップで全国284店舗を一覧表示
- 英語スタッフ在籍・ビギナーフレンドリー・PSAグレードなどのフィルター機能
- 各店舗の在庫カテゴリ（ブースターボックス、シングル、ビンテージ、オリパなど13種類）
- AIが生成した英語バイヤーズガイド（実際に役立つ旅行者向けアドバイス付き）
- 支払い方法・英語対応スタッフのシフト情報

**技術面：**
Next.js + Supabase + PostGIS + Claude APIという構成で開発。地図はOpenStreetMap（Leaflet）を使用。コードはMITライセンスでGitHubに全公開しています。

外国人の友人・知人が日本に来るときに「ポケカ買いたい」と言ったら、ぜひこのURLを教えてあげてください。

🔗 https://cardmapjp.vercel.app
💻 https://github.com/fedlic/cardmapjp

#ポケモンカード #秋葉原 #訪日外国人 #個人開発 #オープンソース

---

## 7. Facebook POST — 英語

**CardMapJP is officially live! 🎉**

I've just launched an open-source Pokémon card shop finder designed specifically for international visitors to Japan.

The idea came from a simple observation: Japan has an incredible Pokémon card shopping scene — but almost zero English-language resources for navigating it. There's no single place where an overseas collector can figure out which shops in Akihabara have English staff, which ones carry PSA graded cards, or which ones only accept cash.

So I built one.

**What CardMapJP does:**
→ Maps 284 Pokémon card shops across 23 regions in Japan
→ Filters for English staff availability, inventory type (Booster Boxes / Singles / PSA Graded / Vintage / Oripa, etc.), payment methods, and more
→ Displays AI-generated English buyer's guides for each shop
→ Shows English staff schedules and ATM proximity info
→ Fully searchable with real-time filtering

**Coverage includes:** Akihabara (78 shops), Nipponbashi/Osaka, Osu/Nagoya, Tenjin/Fukuoka, Ikebukuro, Shibuya, Shinjuku, Nakano, Kyoto, Kobe, Sapporo, Sendai, Hiroshima, Yokohama, Okinawa, and more.

**Tech notes (for the curious):**
Built with Next.js 15, Supabase (PostgreSQL + PostGIS for geo-queries), Leaflet/OpenStreetMap, and the Claude API for AI-generated shop summaries. Deployed on Vercel. The full codebase is MIT-licensed on GitHub — PRs and new shop data submissions are very welcome.

If you're planning a trip to Japan and want to hunt for Pokémon cards, this is for you. And if you're a developer who wants to contribute, the repo is open.

🔗 https://cardmapjp.vercel.app
💻 https://github.com/fedlic/cardmapjp

#PokemonTCG #Pokemon #Japan #Akihabara #JapanTravel #OpenSource #IndieHacker

---

*CardMapJP v1.0.0 — Built by FEDLIC TOKYO*
*Open-source: github.com/fedlic/cardmapjp*
