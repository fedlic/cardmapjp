# CardMapJP

The ultimate Pokemon card shop finder for foreign visitors to Japan.
Find 284+ shops across 23 regions with real-time "Open Now" status, inventory info, English support details, and visitor tips.

日本全国のポケモンカードショップ検索サービス。
284店舗以上、23エリア対応。リアルタイム営業中フィルター、在庫情報、英語対応情報、訪問者向けTipsを提供。

**Live / 公開中:** [cardmapjp.vercel.app](https://cardmapjp.vercel.app)

---

## Features / 機能一覧

### Interactive Map / インタラクティブマップ
- Google Maps with marker clustering / Google Maps + マーカークラスタリング
- 284 card shops across 23 regions / 全国23エリア284店舗
- Region-aware navigation from region pages / エリアページからのマップ連携

### Shop Directory / ショップ一覧
- Filter: Open Now, EN Staff, PSA, BOX, Beginner / フィルター: 営業中、英語スタッフ、PSA、BOX、初心者向け
- "Open Now" uses real opening hours from Google Places API (JST timezone-aware, overnight hours supported) / 「営業中」フィルターはGoogle Places APIから取得した実際の営業時間を使用（日本時間対応、深夜営業対応）
- Distance-based sorting with geolocation / 位置情報による距離順ソート
- Infinite scroll (20 items per page) / 無限スクロール（20件ずつ）
- Google rating display / Google評価表示

### Shop Detail Pages / ショップ詳細ページ (`/shops/[id]`)
- AI-generated summaries and visitor tips (Claude API) / AI生成サマリーと訪問Tips（Claude API）
- Inventory grid with 13 product categories / 13カテゴリの在庫グリッド
- Google Reviews display with caching / Googleレビュー表示（キャッシュ付き）
- Payment methods, English staff schedule, ATM info / 支払方法、英語スタッフスケジュール、ATM情報
- Google Maps directions link / Google Mapsルート案内リンク
- User review system (Google OAuth via Supabase Auth) / ユーザーレビュー機能（Google OAuth）

### Regions / エリア (`/regions`)

23 regions across Japan / 日本全国23エリア:

| Area | Regions / エリア |
|------|-----------------|
| Tokyo / 東京 | Akihabara (78), Ikebukuro (12), Shibuya (10), Shinjuku (8), Nakano (8), Tachikawa (7), Machida (6) |
| Kanto / 関東 | Yokohama (8), Omiya (7), Chiba (7) |
| Kansai / 関西 | Nipponbashi/Osaka (20), Kyoto (11), Kobe (10) |
| Chubu / 中部 | Osu/Nagoya (15), Niigata (6), Kanazawa (5) |
| Kyushu & Okinawa / 九州・沖縄 | Fukuoka (15), Kumamoto (6), Naha (6) |
| Chugoku / 中国 | Hiroshima (10), Okayama (7) |
| Tohoku & Hokkaido / 東北・北海道 | Sapporo (11), Sendai (11) |

### SEO
- Dynamic sitemap.xml, robots.txt
- JSON-LD structured data (Schema.org `Store`)
- OpenGraph meta tags
- SEO landing page for Akihabara / 秋葉原向けSEOランディングページ

### Admin Dashboard / 管理画面 (`/admin`)
- Shop CRUD (create, edit, delete) / ショップCRUD
- Inventory management (13 categories) / 在庫管理
- Member management, ban system / メンバー管理、BAN機能
- Review moderation / レビュー管理
- Google Reviews bulk fetch / Googleレビュー一括取得
- HMAC-SHA256 cookie auth, 24h session / HMAC-SHA256認証

### API
- `GET /api/shops` - Shop list with PostGIS radius search / PostGIS半径検索対応
- `POST /api/shops/[id]/generate-summary` - AI summary generation / AIサマリー生成
- Admin CRUD routes / 管理者用CRUDルート

---

## Tech Stack / 技術スタック

| Layer | Technology |
|-------|-----------|
| Framework | Next.js 16 (App Router, TypeScript) |
| UI | Tailwind CSS 4 + shadcn/ui |
| Maps | Google Maps API + @googlemaps/markerclusterer |
| Database | Supabase (PostgreSQL + PostGIS) |
| AI | Anthropic Claude API |
| Auth | Supabase Auth (Google OAuth) |
| Icons | Lucide React |
| Deployment | Vercel |

---

## Scripts / スクリプト

| Script | Description / 説明 |
|--------|-------------------|
| `scripts/fetch-open-hours.mjs` | Fetch opening hours from Google Places API for all shops / 全店舗の営業時間をGoogle Places APIから取得 |

---

## Getting Started / セットアップ

### Prerequisites / 前提条件
- Node.js 18+
- Supabase account / Supabaseアカウント

### Setup

```bash
git clone https://github.com/fedlic/cardmapjp.git
cd cardmapjp
npm install

# Environment variables / 環境変数
cp .env.local.example .env.local
# Fill in Supabase URL, keys, Google Maps API key, admin password
# Supabase URL、キー、Google Maps APIキー、管理者パスワードを設定

# Run migrations / マイグレーション実行
npx supabase db query -f supabase/migrations/001_initial.sql --linked
npx supabase db query -f supabase/migrations/002_views_and_functions.sql --linked

# Seed data / データ投入
npx supabase db query -f supabase/seed.sql --linked

# Fetch opening hours / 営業時間取得
node scripts/fetch-open-hours.mjs

# Start dev server / 開発サーバー起動
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

---

## Database Schema / データベース構成

| Table / テーブル | Description / 説明 |
|-----------------|-------------------|
| regions | Shopping districts / ショッピングエリア |
| buildings | Physical buildings with PostGIS locations / 建物（PostGIS） |
| shops | Core shop data (47 fields) / ショップデータ（47フィールド） |
| shop_inventory | Product categories with availability / 商品カテゴリと在庫状況 |
| google_reviews_cache | Cached Google Places reviews / Googleレビューキャッシュ |
| reviews | User-submitted reviews / ユーザーレビュー |
| banned_users | Banned user list / BANユーザーリスト |

PostGIS `geography` type, `shops_with_coords` view, `shops_within_radius()` function, RLS policies, GiST indexes.

---

## Roadmap / ロードマップ

### Done / 完了
- [x] 284 shops across 23 regions / 全国23エリア284店舗
- [x] "Open Now" filter with Google Places API opening hours / Google Places API営業時間による「営業中」フィルター
- [x] Google Maps with marker clustering / Google Maps + クラスタリング
- [x] Distance-based sorting / 距離順ソート
- [x] AI-generated shop summaries (Claude API) / AI生成ショップサマリー
- [x] Google Reviews display / Googleレビュー表示
- [x] User auth (Google OAuth) + review system / ユーザー認証 + レビュー機能
- [x] Admin dashboard (shops, inventory, members, reviews) / 管理画面
- [x] SEO (sitemap, JSON-LD, OpenGraph) / SEO対策

### Planned / 予定
- [ ] Advanced multi-filter search / 複合フィルター検索
- [ ] Bookmark / favorites / お気に入り機能
- [ ] Photo uploads for reviews / レビュー写真アップロード
- [ ] "I visited" check-in badges / 訪問チェックインバッジ
- [ ] Multi-language (JA, ZH, KO, TH) / 多言語対応
- [ ] PWA with offline map / オフラインマップPWA
- [ ] Price trend charts / 価格推移チャート
- [ ] Mobile app / モバイルアプリ
- [ ] CI/CD with GitHub Actions
- [ ] E2E tests with Playwright

---

## License / ライセンス

Private project. All rights reserved.

---

Built with Next.js, Supabase, and Claude AI.
