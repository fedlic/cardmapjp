# cardmapjp

日本のポケモンカードショップ検索サービス。
デプロイ先: https://cardmapjp.vercel.app

## 技術スタック

- Next.js 16 (App Router), React 19, TypeScript
- Tailwind CSS 4, shadcn/ui
- Leaflet / react-leaflet (OpenStreetMap)
- Supabase (PostgreSQL + PostGIS)
- Claude API (AI要約)
- Capacitor 8 (Android/iOS)

## コマンド

```bash
npm run dev     # 開発サーバー起動
npm run build   # プロダクションビルド
npm run lint    # ESLint
```

### Android ビルド

```bash
# JDK 21 が必要
export JAVA_HOME=/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home
export ANDROID_HOME=~/Library/Android/sdk
cd android && ./gradlew bundleRelease   # AAB (Google Play用)
cd android && ./gradlew assembleRelease # APK
```

- 署名設定: `android/keystore.properties`（Git管理外）
- 出力先: `android/app/build/outputs/bundle/release/app-release.aab`
- Capacitor設定: `capacitor.config.ts`（webDir: out, server: cardmapjp.vercel.app）

## Vercel 環境変数

| Variable | Description |
|---|---|
| NEXT_PUBLIC_SUPABASE_URL | Supabase project URL |
| NEXT_PUBLIC_SUPABASE_ANON_KEY | Supabase anonymous key |
| SUPABASE_SERVICE_ROLE_KEY | Supabase service role key |
| NEXT_PUBLIC_GOOGLE_MAPS_API_KEY | Google Maps API key |
| ANTHROPIC_API_KEY | Claude API key for AI summaries |
| NEXT_PUBLIC_APP_URL | https://cardmapjp.vercel.app |
| NEXT_PUBLIC_GA_ID | Google Analytics 4 measurement ID |
| NEXT_PUBLIC_ADSENSE_SLOT_INFEED | AdSense slot ID for shop list infeed ads |
| NEXT_PUBLIC_ADSENSE_SLOT_DETAIL | AdSense slot ID for shop detail page ads |
| NEXT_PUBLIC_ADSENSE_SLOT_SIDEBAR | AdSense slot ID for region page ads |

## 注意事項

- パッケージマネージャは npm
- SEO対応済み（sitemap, robots.txt, JSON-LD）
- パスワード保護の管理ダッシュボードあり
- Google Play ストア掲載情報: `google-play-listing.md`
