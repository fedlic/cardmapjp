export interface Profile {
  id: string;
  username: string;
  display_name: string | null;
  avatar_url: string | null;
  bio: string | null;
  country_code: string | null;
  created_at: string;
  updated_at: string;
}

export interface Post {
  id: string;
  user_id: string;
  shop_id: string;
  post_type: 'spot' | 'haul';
  body: string | null;
  image_urls: string[];
  lat: number | null;
  lng: number | null;
  created_at: string;
  updated_at: string;
  // from posts_with_details view
  username: string;
  display_name: string | null;
  avatar_url: string | null;
  like_count: number;
  // joined client-side
  shop_name_en?: string;
}

export interface CreatePostInput {
  shop_id: string;
  post_type: 'spot' | 'haul';
  body: string;
  image_urls: string[];
  lat: number | null;
  lng: number | null;
}
