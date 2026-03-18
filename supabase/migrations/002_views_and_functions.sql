-- View to expose lat/lng from geography column
create or replace view shops_with_coords as
select
  s.*,
  ST_Y(s.location::geometry) as lat,
  ST_X(s.location::geometry) as lng
from shops s;

-- Function: find shops within radius
create or replace function shops_within_radius(
  p_lat double precision,
  p_lng double precision,
  p_radius double precision -- meters
)
returns table (
  id uuid,
  name_jp text,
  name_en text,
  region_id uuid,
  building_id uuid,
  floor int,
  floor_label text,
  address_jp text,
  address_en text,
  lat double precision,
  lng double precision,
  google_place_id text,
  phone text,
  website_url text,
  twitter_handle text,
  instagram_handle text,
  open_hours jsonb,
  english_staff boolean,
  english_staff_days text,
  payment_methods text[],
  atm_nearby boolean,
  atm_note text,
  beginner_friendly boolean,
  sells_singles boolean,
  sells_booster_box boolean,
  sells_sealed_pack boolean,
  sells_psa_graded boolean,
  sells_raw_rare boolean,
  sells_oripa boolean,
  sells_english_cards boolean,
  sells_vintage boolean,
  ai_summary text,
  ai_summary_updated_at timestamptz,
  visitor_tips text,
  rating_avg numeric,
  review_count int,
  google_rating numeric,
  google_review_count int,
  is_active boolean,
  created_at timestamptz,
  updated_at timestamptz,
  distance double precision
)
language sql stable
as $$
  select
    s.id, s.name_jp, s.name_en, s.region_id, s.building_id,
    s.floor, s.floor_label, s.address_jp, s.address_en,
    ST_Y(s.location::geometry) as lat,
    ST_X(s.location::geometry) as lng,
    s.google_place_id, s.phone, s.website_url, s.twitter_handle,
    s.instagram_handle, s.open_hours, s.english_staff, s.english_staff_days,
    s.payment_methods, s.atm_nearby, s.atm_note, s.beginner_friendly,
    s.sells_singles, s.sells_booster_box, s.sells_sealed_pack,
    s.sells_psa_graded, s.sells_raw_rare, s.sells_oripa,
    s.sells_english_cards, s.sells_vintage, s.ai_summary,
    s.ai_summary_updated_at, s.visitor_tips, s.rating_avg, s.review_count,
    s.google_rating, s.google_review_count, s.is_active,
    s.created_at, s.updated_at,
    ST_Distance(
      s.location,
      ST_SetSRID(ST_MakePoint(p_lng, p_lat), 4326)::geography
    ) as distance
  from shops s
  where
    s.is_active = true
    and ST_DWithin(
      s.location,
      ST_SetSRID(ST_MakePoint(p_lng, p_lat), 4326)::geography,
      p_radius
    )
  order by distance;
$$;
