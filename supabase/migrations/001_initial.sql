-- PostGIS
create extension if not exists postgis;

-- Regions (for future expansion)
create table regions (
  id uuid primary key default gen_random_uuid(),
  name_en text not null,
  name_jp text not null,
  city text not null,
  prefecture text not null,
  center_lat decimal(10,8),
  center_lng decimal(11,8),
  zoom_level int default 15,
  is_active boolean default false,
  created_at timestamptz default now()
);

-- Buildings
create table buildings (
  id uuid primary key default gen_random_uuid(),
  name_en text,
  name_jp text not null,
  address text,
  location geography(point, 4326),
  floor_count int,
  created_at timestamptz default now()
);

-- Shops (core table)
create table shops (
  id uuid primary key default gen_random_uuid(),
  name_jp text not null,
  name_en text not null,
  region_id uuid references regions(id),
  building_id uuid references buildings(id),
  floor int,
  floor_label text,
  address_jp text,
  address_en text not null,
  location geography(point, 4326) not null,
  google_place_id text unique,
  phone text,
  website_url text,
  twitter_handle text,
  instagram_handle text,
  open_hours jsonb,
  -- Visitor-facing flags
  english_staff boolean default false,
  english_staff_days text,
  payment_methods text[] default '{"cash"}',
  atm_nearby boolean default true,
  atm_note text,
  beginner_friendly boolean default false,
  -- Inventory flags
  sells_singles boolean default true,
  sells_booster_box boolean default false,
  sells_sealed_pack boolean default false,
  sells_psa_graded boolean default false,
  sells_raw_rare boolean default false,
  sells_oripa boolean default false,
  sells_english_cards boolean default false,
  sells_vintage boolean default false,
  -- AI-generated content
  ai_summary text,
  ai_summary_updated_at timestamptz,
  visitor_tips text,
  -- Stats
  rating_avg numeric(3,2) default 0,
  review_count int default 0,
  google_rating numeric(3,1),
  google_review_count int,
  is_active boolean default true,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Inventory detail
create table shop_inventory (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid references shops(id) on delete cascade,
  category text not null check (category in (
    'booster_box',
    'sealed_pack',
    'single_common',
    'single_rare',
    'single_sr',
    'single_sar',
    'psa_graded',
    'bgs_graded',
    'vintage_pack',
    'vintage_box',
    'oripa',
    'deck',
    'accessories'
  )),
  availability text check (availability in ('in_stock','limited','sold_out','unknown')),
  price_range_min int,
  price_range_max int,
  notes_en text,
  last_verified_at timestamptz,
  last_verified_by text,
  created_at timestamptz default now(),
  unique(shop_id, category)
);

-- Google Maps review cache
create table google_reviews_cache (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid references shops(id) on delete cascade,
  google_place_id text not null,
  reviews jsonb not null,
  fetched_at timestamptz default now()
);

-- Reviews (user submitted)
create table reviews (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid references shops(id) on delete cascade,
  user_id uuid references auth.users(id),
  rating smallint check (rating between 1 and 5),
  english_staff_rating smallint check (english_staff_rating between 1 and 5),
  selection_rating smallint check (selection_rating between 1 and 5),
  comment_en text,
  visited_at date,
  created_at timestamptz default now()
);

-- RLS policies
alter table shops enable row level security;
alter table shop_inventory enable row level security;
alter table reviews enable row level security;

create policy "public_read_shops" on shops for select using (is_active = true);
create policy "public_read_inventory" on shop_inventory for select using (true);
create policy "public_read_reviews" on reviews for select using (true);
create policy "auth_insert_reviews" on reviews for insert with check (auth.uid() = user_id);

-- Indexes
create index shops_location_idx on shops using gist(location);
create index shops_region_idx on shops(region_id);
create index inventory_shop_idx on shop_inventory(shop_id);
