export interface Region {
  id: string;
  name_en: string;
  name_jp: string;
  city: string;
  prefecture: string;
  center_lat: number;
  center_lng: number;
  zoom_level: number;
  is_active: boolean;
}

export interface Shop {
  id: string;
  name_jp: string;
  name_en: string;
  region_id: string;
  building_id: string | null;
  floor: number | null;
  floor_label: string | null;
  address_jp: string | null;
  address_en: string;
  location: { lat: number; lng: number };
  google_place_id: string | null;
  phone: string | null;
  website_url: string | null;
  twitter_handle: string | null;
  instagram_handle: string | null;
  open_hours: OpenHours | null;
  english_staff: boolean;
  english_staff_days: string | null;
  payment_methods: string[];
  atm_nearby: boolean;
  atm_note: string | null;
  beginner_friendly: boolean;
  sells_singles: boolean;
  sells_booster_box: boolean;
  sells_sealed_pack: boolean;
  sells_psa_graded: boolean;
  sells_raw_rare: boolean;
  sells_oripa: boolean;
  sells_english_cards: boolean;
  sells_vintage: boolean;
  ai_summary: string | null;
  ai_summary_updated_at: string | null;
  visitor_tips: string | null;
  rating_avg: number;
  review_count: number;
  google_rating: number | null;
  google_review_count: number | null;
  is_active: boolean;
  created_at: string;
  updated_at: string;
  // Joined
  inventory?: ShopInventory[];
  region?: Region;
}

export interface OpenHours {
  [day: string]: { open: string; close: string } | null;
}

export type InventoryCategory =
  | 'booster_box'
  | 'sealed_pack'
  | 'single_common'
  | 'single_rare'
  | 'single_sr'
  | 'single_sar'
  | 'psa_graded'
  | 'bgs_graded'
  | 'vintage_pack'
  | 'vintage_box'
  | 'oripa'
  | 'deck'
  | 'accessories';

export type Availability = 'in_stock' | 'limited' | 'sold_out' | 'unknown';

export interface ShopInventory {
  id: string;
  shop_id: string;
  category: InventoryCategory;
  availability: Availability;
  price_range_min: number | null;
  price_range_max: number | null;
  notes_en: string | null;
  last_verified_at: string | null;
  last_verified_by: string | null;
}

export interface Review {
  id: string;
  shop_id: string;
  user_id: string;
  rating: number;
  english_staff_rating: number | null;
  selection_rating: number | null;
  comment_en: string | null;
  visited_at: string | null;
  created_at: string;
}

export const CATEGORY_LABELS: Record<InventoryCategory, string> = {
  booster_box: 'Booster Boxes',
  sealed_pack: 'Sealed Packs',
  single_common: 'Common Singles',
  single_rare: 'Rare Singles',
  single_sr: 'SR / UR Cards',
  single_sar: 'SAR Cards',
  psa_graded: 'PSA Graded',
  bgs_graded: 'BGS Graded',
  vintage_pack: 'Vintage Packs',
  vintage_box: 'Vintage Boxes',
  oripa: 'Oripa',
  deck: 'Decks',
  accessories: 'Accessories',
};

export const CATEGORY_ICONS: Record<InventoryCategory, string> = {
  booster_box: '📦',
  sealed_pack: '🎴',
  single_common: '🃏',
  single_rare: '⭐',
  single_sr: '💎',
  single_sar: '🌟',
  psa_graded: '🏆',
  bgs_graded: '🥇',
  vintage_pack: '📜',
  vintage_box: '🗃️',
  oripa: '🎰',
  deck: '🎯',
  accessories: '🛡️',
};

export const AVAILABILITY_COLORS: Record<Availability, string> = {
  in_stock: 'bg-[#DCFCE7] text-[#15803D]',
  limited: 'bg-[#FEF3C7] text-[#92400E]',
  sold_out: 'bg-red-100 text-red-700',
  unknown: 'bg-gray-100 text-gray-500',
};

export const AVAILABILITY_LABELS: Record<Availability, string> = {
  in_stock: 'In Stock',
  limited: 'Limited',
  sold_out: 'Sold Out',
  unknown: 'Unknown',
};

// Admin member management types
export interface AdminUser {
  id: string;
  email: string;
  full_name: string | null;
  avatar_url: string | null;
  created_at: string;
  last_sign_in_at: string | null;
  review_count: number;
  is_banned: boolean;
}

export interface AdminReview {
  id: string;
  shop_id: string;
  user_id: string;
  rating: number;
  english_staff_rating: number | null;
  selection_rating: number | null;
  comment_en: string | null;
  visited_at: string | null;
  created_at: string;
  shop_name_en?: string;
  user_email?: string;
  user_full_name?: string;
}

export interface BannedUser {
  id: string;
  user_id: string;
  reason: string | null;
  banned_at: string;
  banned_by: string | null;
}

export interface GoogleReview {
  author_name: string;
  rating: number;
  text: string;
  time: number;
  profile_photo_url?: string;
  relative_time_description?: string;
}

// Raw DB row shape (before transforming location)
export interface ShopRow {
  id: string;
  name_jp: string;
  name_en: string;
  region_id: string;
  building_id: string | null;
  floor: number | null;
  floor_label: string | null;
  address_jp: string | null;
  address_en: string;
  lat: number;
  lng: number;
  google_place_id: string | null;
  phone: string | null;
  website_url: string | null;
  twitter_handle: string | null;
  instagram_handle: string | null;
  open_hours: OpenHours | null;
  english_staff: boolean;
  english_staff_days: string | null;
  payment_methods: string[];
  atm_nearby: boolean;
  atm_note: string | null;
  beginner_friendly: boolean;
  sells_singles: boolean;
  sells_booster_box: boolean;
  sells_sealed_pack: boolean;
  sells_psa_graded: boolean;
  sells_raw_rare: boolean;
  sells_oripa: boolean;
  sells_english_cards: boolean;
  sells_vintage: boolean;
  ai_summary: string | null;
  ai_summary_updated_at: string | null;
  visitor_tips: string | null;
  rating_avg: number;
  review_count: number;
  google_rating: number | null;
  google_review_count: number | null;
  is_active: boolean;
  created_at: string;
  updated_at: string;
  inventory?: ShopInventory[];
}
