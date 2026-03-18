# CardMapJP 運用マニュアル

> **CardMapJP** — 訪日外国人向けポケモンカードショップ検索サービス
>
> 本番URL: https://cardmapjp.vercel.app

---

## 目次

1. [プロジェクト概要](#1-プロジェクト概要)
2. [技術スタック](#2-技術スタック)
3. [環境構築](#3-環境構築)
4. [ディレクトリ構成](#4-ディレクトリ構成)
5. [機能一覧](#5-機能一覧)
6. [管理画面（Admin）](#6-管理画面admin)
7. [ユーザー認証（Google OAuth）](#7-ユーザー認証google-oauth)
8. [データベース](#8-データベース)
9. [API エンドポイント](#9-api-エンドポイント)
10. [デプロイ](#10-デプロイ)
11. [SEO](#11-seo)
12. [トラブルシューティング](#12-トラブルシューティング)

---

## 1. プロジェクト概要

日本全国のポケモンカードショップを地図上で検索できるWebアプリ。主に訪日外国人コレクター向け。

- **ショップ数**: 284店舗 / 23地域
- **主な対象地域**: 秋葉原(78店), 日本橋(20店), 大須(15店), 天神・博多(15店) 他
- **言語**: 英語（UIとコンテンツ全体）
- **収益モデル**: 未実装（将来的にアフィリエイト・提携予定）

### 主要機能

| 機能 | 説明 |
|------|------|
| インタラクティブマップ | Leaflet地図上にショップをピン表示 |
| 検索・フィルタ | 名前検索 + 8種のフィルタ |
| Near Me（GPS） | ブラウザ位置情報で近くのショップを距離順表示 |
| お気に入り・訪問済み | localStorageに保存、フィルタ可能 |
| ショップ詳細ページ | 在庫・営業時間・AI要約・口コミ・JSON-LD |
| ユーザーレビュー | Googleログインで星評価+コメント投稿 |
| 地域ランディングページ | SEO記事付き地域別ページ（4地域） |
| 管理画面 | ショップCRUD・在庫管理・統計ダッシュボード |

---

## 2. 技術スタック

| レイヤー | 技術 | バージョン |
|---------|------|-----------|
| フレームワーク | Next.js (App Router, TypeScript) | 16.1.7 |
| UI | React | 19.2.3 |
| スタイリング | Tailwind CSS | 4 |
| UIコンポーネント | shadcn/ui + Lucide React | - |
| 地図 | Leaflet + react-leaflet + OpenStreetMap | 1.9.4 / 5.0.0 |
| データベース | Supabase (PostgreSQL + PostGIS) | - |
| 認証 | Supabase Auth (Google OAuth) | @supabase/ssr 0.9.0 |
| AI | Anthropic Claude API | 0.79.0 |
| デプロイ | Vercel | - |

---

## 3. 環境構築

### 前提条件

- Node.js 18以上
- npm
- Supabase アカウント
- Google Cloud Console アカウント（OAuth用）

### セットアップ手順

```bash
# 1. クローン
git clone https://github.com/fedlic/cardmapjp.git
cd cardmapjp

# 2. パッケージインストール
npm install

# 3. 環境変数を設定
cp .env.local.example .env.local
```

### 環境変数（`.env.local`）

```env
# Supabase
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGc...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGc...

# AI（ショップ要約生成に使用。空でも動作する）
ANTHROPIC_API_KEY=sk-ant-...

# アプリ設定
NEXT_PUBLIC_APP_URL=https://cardmapjp.vercel.app
ADMIN_PASSWORD=（管理画面ログイン用パスワード）
```

| 変数名 | 必須 | 用途 |
|--------|------|------|
| `NEXT_PUBLIC_SUPABASE_URL` | 必須 | Supabase プロジェクトURL |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | 必須 | 公開用APIキー（RLSで保護） |
| `SUPABASE_SERVICE_ROLE_KEY` | 必須 | サーバー専用キー（管理操作用） |
| `ANTHROPIC_API_KEY` | 任意 | Claude APIキー（AI要約生成） |
| `NEXT_PUBLIC_APP_URL` | 任意 | 本番URL |
| `ADMIN_PASSWORD` | 必須 | 管理画面パスワード |

### 開発サーバー起動

```bash
npm run dev        # http://localhost:3000
```

### その他のコマンド

```bash
npm run build      # 本番ビルド
npm run start      # 本番サーバー起動
npm run lint       # ESLint実行
```

---

## 4. ディレクトリ構成

```
cardmapjp/
├── src/
│   ├── middleware.ts                # 認証ミドルウェア（Admin HMAC + Supabase セッション）
│   ├── app/
│   │   ├── page.tsx                # トップページ（マップ + サイドバー）
│   │   ├── layout.tsx              # ルートレイアウト（ヘッダー + AuthButton）
│   │   ├── sitemap.ts              # 動的サイトマップ生成
│   │   ├── robots.ts               # robots.txt
│   │   ├── auth/
│   │   │   └── callback/route.ts   # Google OAuth コールバック
│   │   ├── shops/
│   │   │   └── [id]/page.tsx       # ショップ詳細（ISR 30分）
│   │   ├── regions/
│   │   │   ├── page.tsx            # 地域一覧
│   │   │   └── [slug]/page.tsx     # 地域ランディングページ（ISR 1時間）
│   │   ├── admin/                  # 管理画面（パスワード保護）
│   │   │   ├── layout.tsx          # サイドナビ付きレイアウト
│   │   │   ├── login/page.tsx      # ログイン画面
│   │   │   ├── page.tsx            # ダッシュボード
│   │   │   ├── shops/page.tsx      # ショップ管理
│   │   │   └── inventory/page.tsx  # 在庫管理
│   │   └── api/                    # APIルート
│   ├── components/
│   │   ├── HomePageClient.tsx      # トップページクライアント
│   │   ├── ShopMap.tsx             # Leaflet地図
│   │   ├── ShopSidebar.tsx         # サイドバー（検索・フィルタ・ソート）
│   │   ├── ShopCard.tsx            # ショップカード
│   │   ├── ShopFilters.tsx         # フィルタバッジ
│   │   ├── AuthButton.tsx          # ログイン/ログアウトボタン
│   │   └── ShopDetail/             # ショップ詳細コンポーネント群
│   │       ├── HeroSection.tsx     # ヘッダー（店名・評価・バッジ）
│   │       ├── AISummary.tsx       # AI要約・訪問Tips
│   │       ├── InventoryGrid.tsx   # 在庫カテゴリグリッド
│   │       ├── InfoSection.tsx     # 住所・営業時間・決済・リンク
│   │       ├── ReviewList.tsx      # レビュー一覧
│   │       └── ReviewForm.tsx      # レビュー投稿フォーム
│   ├── hooks/
│   │   ├── useDebounce.ts          # 200msデバウンス
│   │   ├── useGeolocation.ts       # ブラウザ位置情報
│   │   └── useShopPreferences.ts   # お気に入り・訪問済み（localStorage）
│   ├── lib/
│   │   ├── claude.ts               # Claude API統合
│   │   ├── google-maps.ts          # 地図設定・Google Mapsリンク生成
│   │   ├── regions.ts              # 地域設定データ（4地域分）
│   │   ├── geo.ts                  # Haversine距離計算
│   │   └── supabase/
│   │       ├── client.ts           # ブラウザ用Supabaseクライアント
│   │       ├── server.ts           # サーバー用Supabaseクライアント
│   │       └── queries/            # クエリヘルパー
│   └── types/
│       └── index.ts                # TypeScript型定義
├── supabase/
│   ├── migrations/                 # DBマイグレーション
│   └── seed*.sql                   # シードデータ
└── docs/
    └── manual_ja.md                # 本ファイル
```

---

## 5. 機能一覧

### 5.1 インタラクティブマップ

- **ライブラリ**: Leaflet + react-leaflet（OpenStreetMapタイル）
- **マーカー色**: 赤=通常, 金=選択中, 青=ユーザー現在地
- **動作**: ショップ選択でズームイン（fly-to）、地図移動でサイドバーが連動

### 5.2 サイドバー（検索・フィルタ・ソート）

**検索**: 店名（英語/日本語）でリアルタイム検索（200msデバウンス）

**フィルタ（8種）**:

| フィルタ名 | 説明 |
|-----------|------|
| Favorites Only | お気に入りのみ表示 |
| Visited Only | 訪問済みのみ表示 |
| English Staff | 英語対応スタッフあり |
| PSA Graded | PSA鑑定カード取扱 |
| Booster Boxes | ブースターボックス取扱 |
| Singles | シングルカード取扱 |
| Beginner Friendly | 初心者向け |
| Vintage | ヴィンテージ取扱 |

**ソート**: 名前順 / 評価順 / 距離順（GPS有効時に自動切替）

**地図連動**: 地図のビューポート内のショップのみ表示

### 5.3 Near Me（GPS検索）

1. ユーザーが「Near Me」ボタンをクリック
2. ブラウザが位置情報許可を要求
3. 許可後、Haversine公式で各ショップまでの距離を計算
4. ソートが自動で「距離順」に切替
5. 地図にユーザー位置（青マーカー）を表示

**エラーハンドリング**: 拒否/タイムアウト/未対応ブラウザに対応

### 5.4 お気に入り・訪問済み

- **保存先**: `localStorage`（キー: `cardmapjp_favorites`, `cardmapjp_visited`）
- **UI**: ハートアイコン（お気に入り）、チェックアイコン（訪問済み）
- **操作**: ショップカードのアイコンをクリックでトグル
- ログイン不要で利用可能

### 5.5 ショップ詳細ページ (`/shops/[id]`)

| セクション | 内容 |
|-----------|------|
| ヘッダー | 店名(英/日), Google評価, バッジ(English Staff等) |
| AI要約 | Claude生成の2-3文の要約 + 訪問Tips |
| 在庫グリッド | 13カテゴリの在庫状況・価格帯 |
| 店舗情報 | 住所, 営業時間, 決済方法, ATM情報, 外部リンク |
| レビュー | ユーザー投稿のレビュー一覧 + 投稿フォーム |

**在庫カテゴリ（13種）**:
Booster Boxes, Sealed Packs, Common Singles, Rare Singles, SR/UR Cards, SAR Cards, PSA Graded, BGS Graded, Vintage Packs, Vintage Boxes, Oripa, Decks, Accessories

**在庫ステータス**: `in_stock`(在庫あり) / `limited`(残少) / `sold_out`(品切) / `unknown`(不明)

### 5.6 地域ランディングページ (`/regions/[slug]`)

SEO記事コンテンツ付きの地域別ページ。現在4地域に対応：

| スラッグ | 地域 | 店舗数 |
|---------|------|--------|
| `akihabara` | 秋葉原 | 78 |
| `nipponbashi` | 日本橋（大阪） | 20 |
| `osu` | 大須（名古屋） | 15 |
| `tenjin-hakata` | 天神・博多 | 15 |

各ページに含まれる情報：
- ヒーローセクション（地域名・説明）
- アクセス情報（路線・最寄駅）
- 訪問Tips（決済・言語・おすすめ時間帯等）
- ショップ一覧（評価・バッジ付き）

**設定ファイル**: `src/lib/regions.ts`

---

## 6. 管理画面（Admin）

### アクセス方法

1. `https://cardmapjp.vercel.app/admin/login` にアクセス
2. 環境変数 `ADMIN_PASSWORD` で設定したパスワードを入力
3. ログイン成功でダッシュボードにリダイレクト

### 認証方式

- HMAC-SHA256署名付きCookie（`admin_session`）
- 有効期限: 24時間
- `middleware.ts` で `/admin/*` と `/api/admin/*` を保護

### 6.1 ダッシュボード (`/admin`)

| 表示項目 | 説明 |
|---------|------|
| 全ショップ数 | 全登録数 |
| アクティブ数 | `is_active=true` のショップ数 |
| 平均評価 | Google評価の平均 |
| 在庫サマリ | in_stock/limited/sold_out の件数 |
| 最近更新 | 直近5件の更新ショップ |

### 6.2 ショップ管理 (`/admin/shops`)

**一覧表示**: 全ショップのテーブル（名前検索可）

**ショップ作成/編集ダイアログ**:

| フィールド | 説明 |
|-----------|------|
| name_en / name_jp | 店名（英語/日本語） |
| address_en / address_jp | 住所（英語/日本語） |
| lat / lng | 緯度/経度 |
| region_id | 地域ID |
| phone | 電話番号 |
| website_url | 公式サイトURL |
| twitter_handle | X(Twitter)ハンドル |
| 各種フラグ | english_staff, beginner_friendly, sells_* 等（12種のトグル） |
| open_hours | 曜日別営業時間（7日分） |

**削除**: 確認ダイアログ → DELETE API呼び出し

### 6.3 在庫管理 (`/admin/inventory`)

1. ドロップダウンでショップを選択
2. 13カテゴリのグリッドが表示
3. 各カテゴリごとに設定:
   - **在庫ステータス**: in_stock / limited / sold_out / unknown
   - **価格帯**: 最低/最高価格（円）
   - **備考**: 英語のメモ
4. 「Save All」で一括保存

---

## 7. ユーザー認証（Google OAuth）

### 仕組み

```
ユーザー → Sign Inクリック
  → Supabase OAuth → Google ログイン画面
  → 認証成功 → /auth/callback（code交換）
  → Cookie にセッション保存
  → ホームにリダイレクト
```

### コンポーネント構成

| ファイル | 役割 |
|---------|------|
| `src/components/AuthButton.tsx` | ヘッダーのSign In/Outボタン |
| `src/app/auth/callback/route.ts` | OAuth コールバック処理 |
| `src/lib/supabase/client.ts` | ブラウザ用Supabaseクライアント（`@supabase/ssr`） |
| `src/lib/supabase/server.ts` | サーバー用クライアント（`createAuthServerClient()`） |
| `src/middleware.ts` | 全ルートでセッションリフレッシュ |

### ユーザー状態

| 状態 | ヘッダー表示 | レビュー |
|------|------------|---------|
| 未ログイン | 「Sign In」ボタン | 「Sign in with Google to leave a review」リンク |
| ログイン済 | Googleアバター + 名前 + 「Sign Out」ボタン | レビュー投稿フォーム表示 |

### Google OAuth 設定手順

**Google Cloud Console**:
1. APIs & Services → OAuth consent screen → 外部で作成
2. Scopes: `email`, `profile`, `openid` を追加
3. Credentials → OAuth client ID → Web application
4. Authorized JavaScript origins: `https://cardmapjp.vercel.app`, `http://localhost:3000`
5. Authorized redirect URIs: `https://<project-ref>.supabase.co/auth/v1/callback`

**Supabase Dashboard**:
1. Authentication → Providers → Google → ON
2. Client ID / Client Secret を貼り付け
3. Authentication → URL Configuration:
   - Site URL: `https://cardmapjp.vercel.app`
   - Redirect URLs: `https://cardmapjp.vercel.app/auth/callback`, `http://localhost:3000/auth/callback`

### レビュー投稿

- ショップ詳細ページ下部にフォーム表示（ログイン時のみ）
- 星5段階評価（ホバープレビュー付き）+ コメント（任意）
- Supabase RLS: `auth.uid() = user_id` で本人のみ書き込み可
- 投稿後「Thanks for your review!」メッセージ表示

---

## 8. データベース

### Supabase (PostgreSQL + PostGIS)

#### テーブル一覧

| テーブル | 説明 | 主なカラム |
|---------|------|-----------|
| `regions` | 地域マスタ | id, name_en, name_jp, center_lat, center_lng |
| `shops` | ショップ（47カラム） | id, name_*, address_*, location(PostGIS), open_hours, sells_*, ai_summary |
| `shop_inventory` | 在庫情報 | shop_id, category, availability, price_range_min/max |
| `reviews` | ユーザーレビュー | shop_id, user_id(FK→auth.users), rating, comment_en |
| `google_reviews_cache` | Google口コミキャッシュ | shop_id, reviews(JSONB), fetched_at |

#### ビューと関数

| 名前 | 種別 | 説明 |
|------|------|------|
| `shops_with_coords` | VIEW | PostGIS geography → lat/lng を展開 |
| `shops_within_radius()` | FUNCTION | 緯度/経度/半径(m)で近隣ショップ検索 |

#### セキュリティ

- 全テーブルにRLS（Row Level Security）有効
- 公開: アクティブなショップの読み取りのみ
- レビュー: `auth.uid() = user_id` で書き込み制限
- 管理操作: Service Role Key 使用

#### インデックス

- GiST: `shops.location`（PostGIS地理検索用）
- B-tree: `shops.region_id`, `shop_inventory.shop_id`

---

## 9. API エンドポイント

### 公開API

| メソッド | パス | 説明 | キャッシュ |
|---------|------|------|-----------|
| GET | `/api/shops` | ショップ一覧 | 5分 |
| GET | `/auth/callback` | OAuth コールバック | - |

`/api/shops` クエリパラメータ:

| パラメータ | 説明 |
|-----------|------|
| `region_id` | 地域IDでフィルタ |
| `lat`, `lng` | 中心座標（PostGIS半径検索） |
| `radius_km` | 検索半径（km、デフォルト2） |

### 管理API（要認証）

| メソッド | パス | 説明 |
|---------|------|------|
| POST | `/api/admin/login` | ログイン |
| POST | `/api/admin/logout` | ログアウト |
| GET | `/api/admin/shops` | 全ショップ取得 |
| POST | `/api/admin/shops` | ショップ新規作成 |
| PUT | `/api/admin/shops/[id]` | ショップ更新 |
| DELETE | `/api/admin/shops/[id]` | ショップ削除 |
| GET | `/api/admin/inventory?shop_id=xxx` | 在庫取得 |
| PUT | `/api/admin/inventory` | 在庫一括更新 |
| POST | `/api/shops/[id]/generate-summary` | AI要約生成 |

---

## 10. デプロイ

### Vercel（自動デプロイ）

- `main` ブランチへのプッシュで自動デプロイ
- ドメイン: `cardmapjp.vercel.app`

```bash
# 手動デプロイ確認
cd ~/cardmapjp
npm run build        # ビルドエラーがないか確認
git push             # mainへプッシュ → Vercel自動デプロイ
```

### Vercel 環境変数

Vercel Dashboard → Settings → Environment Variables に以下を設定:

- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY`
- `ANTHROPIC_API_KEY`
- `NEXT_PUBLIC_APP_URL`
- `ADMIN_PASSWORD`

### ISRキャッシュ戦略

| ページ | revalidate | 説明 |
|--------|-----------|------|
| トップページ (`/`) | 300秒（5分） | ショップ一覧 |
| ショップ詳細 (`/shops/[id]`) | 1800秒（30分） | SSG + ISR |
| 地域ページ (`/regions/[slug]`) | 3600秒（1時間） | SSG + ISR |

### ビルド出力

```
ƒ  (Dynamic)  サーバーサイドレンダリング
○  (Static)   事前生成済み静的ページ

主要ルート:
├ ƒ /                    ← 動的
├ ƒ /shops/[id]          ← ISR（284ページ事前生成）
├ ƒ /regions/[slug]      ← ISR（4ページ事前生成）
├ ƒ /auth/callback       ← 動的
├ ○ /sitemap.xml         ← 静的
└ ○ /robots.txt          ← 静的
```

---

## 11. SEO

### 実装済み対策

| 対策 | ファイル | 説明 |
|------|---------|------|
| サイトマップ | `src/app/sitemap.ts` | 全ショップ+地域ページを動的生成 |
| robots.txt | `src/app/robots.ts` | `/api/` をブロック |
| JSON-LD | `shops/[id]/page.tsx` | Schema.org `Store` 構造化データ |
| OGPタグ | `generateMetadata()` | 各ページにtitle/description/og設定 |
| 地域LP | `regions/[slug]/page.tsx` | SEO記事コンテンツ（4地域） |
| Google Search Console | `layout.tsx` | サイト認証済み |

### JSON-LD（ショップ詳細ページ）

```json
{
  "@context": "https://schema.org",
  "@type": "Store",
  "name": "Card Shop Example",
  "alternateName": "カードショップ例",
  "geo": { "latitude": 35.698, "longitude": 139.773 },
  "openingHours": ["Mo 10:00-20:00", ...],
  "aggregateRating": { "ratingValue": 4.2, "reviewCount": 150 }
}
```

---

## 12. トラブルシューティング

### ビルドエラー

```bash
# 型エラーの確認
npm run build

# よくある原因
# - Supabase クライアントのインポートミス（client.ts / server.ts）
# - 環境変数の未設定
```

### ログインできない（Google OAuth）

1. Supabase Dashboard → Authentication → Providers → Google が ON か確認
2. Google Cloud Console → Credentials → OAuth Client ID が正しいか確認
3. Redirect URI が `https://<project-ref>.supabase.co/auth/v1/callback` か確認
4. Supabase → URL Configuration → Redirect URLs に `/auth/callback` があるか確認
5. OAuth同意画面が「外部」の場合、テストユーザーに自分が追加されているか確認
6. 本番公開するには OAuth同意画面の Publishing status を「In Production」にする

### 地図が表示されない

- Leafletはクライアント専用。`dynamic(() => import('./ShopMap'), { ssr: false })` で読み込み
- CSSが読み込まれているか確認: `import 'leaflet/dist/leaflet.css'`

### サイドバーが地図と連動しない

- `ShopMap.tsx` の `BoundsTracker` が `onBoundsChange` を受け取っているか確認
- `HomePageClient.tsx` で `mapBounds` state が `ShopSidebar` に渡されているか確認

### Near Me が動かない

- HTTPS 環境でのみ動作（localhost は例外で動作する）
- ブラウザの位置情報許可を確認
- `useGeolocation` のステータス: `idle` → `loading` → `success` / `denied` / `unavailable` / `timeout`

### 管理画面にアクセスできない

- 環境変数 `ADMIN_PASSWORD` が設定されているか確認
- Cookie `admin_session` が正しく設定されているか（ブラウザDevTools → Application → Cookies）
- ミドルウェアが `/admin/*` パスを保護している

### AI要約が生成されない

- 環境変数 `ANTHROPIC_API_KEY` が設定されているか確認
- 空の場合、AI要約機能は無効（他の機能には影響なし）

---

## 付録: データカバレッジ

| 地域 | 店舗数 | 都道府県 |
|------|--------|---------|
| 秋葉原 | 78 | 東京 |
| 日本橋 | 20 | 大阪 |
| 大須 | 15 | 愛知 |
| 天神・博多 | 15 | 福岡 |
| 池袋 | 12 | 東京 |
| 札幌 | 11 | 北海道 |
| 仙台 | 11 | 宮城 |
| 寺町・河原町 | 11 | 京都 |
| 広島 | 10 | 広島 |
| 三宮 | 10 | 兵庫 |
| 渋谷 | 10 | 東京 |
| 中野 | 8 | 東京 |
| 新宿 | 8 | 東京 |
| 横浜 | 8 | 神奈川 |
| 千葉 | 7 | 千葉 |
| 岡山 | 7 | 岡山 |
| 大宮 | 7 | 埼玉 |
| 立川 | 7 | 東京 |
| 熊本 | 6 | 熊本 |
| 町田 | 6 | 東京 |
| 那覇 | 6 | 沖縄 |
| 新潟 | 6 | 新潟 |
| 金沢 | 5 | 石川 |
| **合計** | **284** | **23地域** |
