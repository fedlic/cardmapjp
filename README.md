# CardMapJP

**The ultimate Pokemon card shop finder for foreign visitors to Japan.**

Find the best Pokemon card shops in Akihabara and across Japan with real-time inventory info, English support details, and visitor tips tailored for international collectors.

**Live:** [cardmapjp.vercel.app](https://cardmapjp.vercel.app)

---

## Current Features (Phase 1)

### Interactive Map
- OpenStreetMap-based map powered by Leaflet/react-leaflet
- 78 card shops plotted across Akihabara
- Click markers to view shop summary, fly-to animation on selection
- Color-coded markers (red = default, gold = selected)

### Shop Directory
- Searchable sidebar with real-time filtering by shop name
- Filter badges: English Staff, Beginner Friendly, English Cards, Vintage, PSA Graded
- Google rating display with review counts

### Shop Detail Pages (`/shops/[id]`)
- AI-generated summaries and visitor tips (English)
- Inventory grid with 13 product categories and availability status
- Payment method info (cash, Visa, Mastercard, IC cards)
- English staff availability and schedule
- ATM proximity notes
- Google Maps directions link
- User review system (with Supabase Auth)

### Inventory Categories
| Category | Description |
|----------|-------------|
| Booster Boxes | Sealed booster boxes |
| Sealed Packs | Individual booster packs |
| Common Singles | Common/Uncommon single cards |
| Rare Singles | Rare single cards |
| SR / UR Cards | Super Rare / Ultra Rare |
| SAR Cards | Special Art Rare |
| PSA Graded | PSA graded cards |
| BGS Graded | BGS/Beckett graded cards |
| Vintage Packs | Vintage sealed packs |
| Vintage Boxes | Vintage sealed boxes |
| Oripa | Lottery packs (Japanese specialty) |
| Decks | Pre-constructed / starter decks |
| Accessories | Sleeves, playmats, deck boxes |

### Regions Page (`/regions`)
- Akihabara (Live - 78 shops)
- Coming soon: Shibuya, Shinjuku, Ikebukuro, Nipponbashi (Osaka), Osu (Nagoya), Teramachi (Kyoto), Tenjin (Fukuoka)

### API
- `GET /api/shops` - List all shops with inventory
  - Query params: `region_id`, `lat`, `lng`, `radius_km`
  - PostGIS-powered radius search
- `POST /api/shops/[id]/generate-summary` - Generate AI summary via Claude API

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Next.js 16 (App Router, TypeScript) |
| UI | Tailwind CSS 4 + shadcn/ui |
| Maps | Leaflet + react-leaflet + OpenStreetMap |
| Database | Supabase (PostgreSQL + PostGIS) |
| AI | Anthropic Claude API (shop summaries) |
| Auth | Supabase Auth (for reviews) |
| Icons | Lucide React |
| Deployment | Vercel |

---

## Project Structure

```
cardmapjp/
├── src/
│   ├── app/
│   │   ├── page.tsx                    # Home (map + sidebar)
│   │   ├── layout.tsx                  # Root layout with header
│   │   ├── shops/[id]/page.tsx         # Shop detail page
│   │   ├── regions/page.tsx            # Region selection
│   │   └── api/
│   │       └── shops/
│   │           ├── route.ts            # GET /api/shops
│   │           └── [id]/
│   │               └── generate-summary/
│   │                   └── route.ts    # POST AI summary
│   ├── components/
│   │   ├── ShopMap.tsx                 # Leaflet map with markers
│   │   ├── ShopSidebar.tsx             # Search + filter + list
│   │   ├── ShopCard.tsx                # Shop card in sidebar
│   │   ├── ShopFilters.tsx             # Filter badge buttons
│   │   ├── ShopDetail/
│   │   │   ├── HeroSection.tsx         # Shop name, ratings, badges
│   │   │   ├── AISummary.tsx           # AI summary + visitor tips
│   │   │   ├── InventoryGrid.tsx       # Product categories grid
│   │   │   ├── InfoSection.tsx         # Address, payment, links
│   │   │   └── ReviewList.tsx          # User reviews
│   │   └── ui/                         # shadcn/ui components
│   ├── lib/
│   │   ├── claude.ts                   # Claude API integration
│   │   ├── google-maps.ts             # Map config constants
│   │   ├── utils.ts                    # Utility functions
│   │   └── supabase/
│   │       ├── client.ts               # Browser Supabase client
│   │       ├── server.ts               # Server Supabase client
│   │       └── queries/
│   │           ├── shops.ts            # Shop queries
│   │           └── inventory.ts        # Inventory queries
│   └── types/
│       └── index.ts                    # All TypeScript types
├── supabase/
│   ├── migrations/
│   │   ├── 001_initial.sql             # Core schema (6 tables)
│   │   └── 002_views_and_functions.sql # PostGIS views & functions
│   ├── seed.sql                        # Original 10 shops
│   ├── seed_additional.sql             # 68 additional shops
│   ├── enrich_original_10.sql          # Enriched inventory for original 10
│   └── enrich_additional_part[1-3].sql # Inventory for all 68 shops
└── .env.local                          # Environment variables
```

---

## Database Schema

### Tables
- **regions** - Shopping districts (Akihabara, Nipponbashi, etc.)
- **buildings** - Physical buildings with PostGIS locations
- **shops** - Core shop data (47 fields including location, hours, payment, English support, inventory flags, AI content)
- **shop_inventory** - Product categories with availability and pricing (unique per shop+category)
- **google_reviews_cache** - Cached Google Places reviews
- **reviews** - User-submitted reviews with ratings

### Key Features
- PostGIS `geography` type for accurate distance calculations
- `shops_with_coords` view for easy lat/lng access
- `shops_within_radius()` function for geo-queries
- Row Level Security (RLS) policies on all tables
- GiST indexes for geographic queries

---

## Getting Started

### Prerequisites
- Node.js 18+
- Supabase account

### Setup

```bash
# Clone
git clone https://github.com/fedlic/cardmapjp.git
cd cardmapjp

# Install
npm install

# Environment variables
cp .env.local.example .env.local
# Fill in your Supabase URL, anon key, and service role key

# Run migrations (requires Supabase CLI)
npx supabase db query -f supabase/migrations/001_initial.sql --linked
npx supabase db query -f supabase/migrations/002_views_and_functions.sql --linked

# Seed data
npx supabase db query -f supabase/seed.sql --linked
npx supabase db query -f supabase/seed_additional.sql --linked
npx supabase db query -f supabase/enrich_original_10.sql --linked
npx supabase db query -f supabase/enrich_additional_part1.sql --linked
npx supabase db query -f supabase/enrich_additional_part2.sql --linked
npx supabase db query -f supabase/enrich_additional_part3.sql --linked

# Start dev server
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

---

## Roadmap

### Phase 2 - Enhanced Discovery
- [ ] Advanced search with multi-filter combinations (price range, category, payment method)
- [ ] "Near me" GPS-based shop discovery
- [ ] Shop comparison tool (compare inventory/prices side-by-side)
- [ ] Bookmark / favorites system (localStorage or auth-based)
- [ ] Sort shops by distance, rating, or inventory richness

### Phase 3 - Community & Content
- [ ] User authentication (Google / X login via Supabase Auth)
- [ ] User review submission with photo uploads
- [ ] "I visited" check-in system with badges
- [ ] Community-contributed inventory updates (crowd-sourced stock info)
- [ ] Shop owner claim & management portal

### Phase 4 - Multi-Region Expansion
- [ ] Nipponbashi (Osaka) - Den Den Town card shops
- [ ] Ikebukuro (Tokyo) - Otome Road & surroundings
- [ ] Shinjuku (Tokyo) - card shops near station
- [ ] Shibuya (Tokyo) - card shops
- [ ] Osu (Nagoya) - Osu Shopping Street
- [ ] Teramachi (Kyoto) - Teramachi Street shops
- [ ] Tenjin (Fukuoka) - Tenjin area shops
- [ ] Region-specific curated walking routes

### Phase 5 - Smart Features
- [ ] Real-time inventory tracking via shop partnerships
- [ ] Price trend charts (track card values over time)
- [ ] "Deal finder" - alerts when specific cards are in stock nearby
- [ ] Multi-language support (Japanese, Chinese, Korean, Thai)
- [ ] PWA with offline map support for use without data
- [ ] Integration with card price databases (e.g., Price Charting)

### Phase 6 - Platform
- [ ] Mobile app (React Native or Expo)
- [ ] Shop partnership program (verified shops, promoted listings)
- [ ] Affiliate links for online card purchases
- [ ] Travel itinerary builder ("Card shopping route for 1 day in Akihabara")
- [ ] Integration with Google Maps / Apple Maps for turn-by-turn navigation

### Infrastructure & Quality
- [ ] Automated shop data verification (web scraping + AI validation)
- [ ] Performance monitoring and error tracking
- [ ] SEO optimization (meta tags, structured data, sitemap)
- [ ] Accessibility audit (WCAG 2.1 AA compliance)
- [ ] E2E tests with Playwright
- [ ] CI/CD pipeline with GitHub Actions

---

## Data Coverage

| Region | Shops | Status |
|--------|-------|--------|
| Akihabara | 78 | Live |
| Shibuya | - | Planned |
| Shinjuku | - | Planned |
| Ikebukuro | - | Planned |
| Nipponbashi (Osaka) | - | Planned |
| Osu (Nagoya) | - | Planned |
| Teramachi (Kyoto) | - | Planned |
| Tenjin (Fukuoka) | - | Planned |

---

## License

Private project. All rights reserved.

---

Built with Next.js, Supabase, and Claude AI.
