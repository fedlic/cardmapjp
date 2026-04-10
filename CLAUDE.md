# cardmapjp

## 概要

日本のポケモンカードショップ検索サービス。インタラクティブマップでショップを探せるWebアプリ。
デプロイ先: https://cardmapjp.vercel.app

## 技術スタック

- Next.js 16 (App Router), React 19, TypeScript
- Tailwind CSS 4, shadcn/ui
- Leaflet / react-leaflet (OpenStreetMap)
- Supabase (PostgreSQL + PostGIS)
- Claude API (AI要約)

## よく使うコマンド

```bash
npm run dev     # 開発サーバー起動
npm run build   # プロダクションビルド
npm run lint    # ESLint
```

## 注意事項

- パッケージマネージャは npm
- SEO対応済み（sitemap, robots.txt, JSON-LD）
- パスワード保護の管理ダッシュボードあり
