import { createClient } from '@/lib/supabase/client';
import type { Post, CreatePostInput } from '@/types/sns';

export async function fetchFeed(limit = 20, offset = 0): Promise<Post[]> {
  const supabase = createClient();
  const { data, error } = await supabase
    .from('posts_with_details')
    .select('*')
    .order('created_at', { ascending: false })
    .range(offset, offset + limit - 1);

  if (error) throw error;
  return (data ?? []) as Post[];
}

export async function fetchUserPosts(userId: string): Promise<Post[]> {
  const supabase = createClient();
  const { data, error } = await supabase
    .from('posts_with_details')
    .select('*')
    .eq('user_id', userId)
    .order('created_at', { ascending: false });

  if (error) throw error;
  return (data ?? []) as Post[];
}

export async function fetchShopPosts(shopId: string): Promise<Post[]> {
  const supabase = createClient();
  const { data, error } = await supabase
    .from('posts_with_details')
    .select('*')
    .eq('shop_id', shopId)
    .order('created_at', { ascending: false });

  if (error) throw error;
  return (data ?? []) as Post[];
}

export async function createPost(userId: string, input: CreatePostInput): Promise<Post> {
  const supabase = createClient();
  const { data, error } = await supabase
    .from('posts')
    .insert({
      user_id: userId,
      shop_id: input.shop_id,
      post_type: input.post_type,
      body: input.body,
      image_urls: input.image_urls,
      lat: input.lat,
      lng: input.lng,
    })
    .select()
    .single();

  if (error) throw error;
  return data as Post;
}

export async function deletePost(postId: string): Promise<void> {
  const supabase = createClient();
  const { error } = await supabase.from('posts').delete().eq('id', postId);
  if (error) throw error;
}

export async function toggleLike(postId: string, userId: string, isLiked: boolean): Promise<void> {
  const supabase = createClient();
  if (isLiked) {
    const { error } = await supabase
      .from('likes')
      .delete()
      .eq('post_id', postId)
      .eq('user_id', userId);
    if (error) throw error;
  } else {
    const { error } = await supabase
      .from('likes')
      .insert({ post_id: postId, user_id: userId });
    if (error) throw error;
  }
}

export async function getLikedPostIds(userId: string, postIds: string[]): Promise<Set<string>> {
  if (postIds.length === 0) return new Set();
  const supabase = createClient();
  const { data, error } = await supabase
    .from('likes')
    .select('post_id')
    .eq('user_id', userId)
    .in('post_id', postIds);

  if (error) throw error;
  return new Set((data ?? []).map((row) => row.post_id));
}

export async function uploadPostImage(file: File, userId: string): Promise<string> {
  const supabase = createClient();
  const ext = file.name.split('.').pop() || 'jpg';
  const path = `${userId}/${Date.now()}_${Math.random().toString(36).slice(2, 8)}.${ext}`;

  const { error } = await supabase.storage
    .from('post-images')
    .upload(path, file, { contentType: file.type, upsert: false });

  if (error) throw error;

  const { data: urlData } = supabase.storage
    .from('post-images')
    .getPublicUrl(path);

  return urlData.publicUrl;
}
