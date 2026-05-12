'use client';

import { useState, useEffect, useCallback } from 'react';
import { Plus } from 'lucide-react';
import { createClient } from '@/lib/supabase/client';
import { fetchFeed, toggleLike, getLikedPostIds } from '@/lib/supabase/queries/posts';
import PostCard from './PostCard';
import PostComposer from './PostComposer';
import type { Post } from '@/types/sns';
import type { User } from '@supabase/supabase-js';

interface ShopOption {
  id: string;
  name_en: string;
  name_jp: string;
}

interface FeedClientProps {
  initialPosts: Post[];
  shops: ShopOption[];
}

export default function FeedClient({ initialPosts, shops }: FeedClientProps) {
  const [posts, setPosts] = useState(initialPosts);
  const [likedIds, setLikedIds] = useState<Set<string>>(new Set());
  const [user, setUser] = useState<User | null>(null);
  const [showComposer, setShowComposer] = useState(false);
  const [loading, setLoading] = useState(false);

  // Build shop name lookup
  const shopMap = new Map(shops.map((s) => [s.id, s.name_en]));

  useEffect(() => {
    const supabase = createClient();
    supabase.auth.getUser().then(({ data: { user } }) => {
      setUser(user);
    });
  }, []);

  useEffect(() => {
    if (!user || posts.length === 0) return;
    const postIds = posts.map((p) => p.id);
    getLikedPostIds(user.id, postIds).then(setLikedIds).catch(console.error);
  }, [user, posts]);

  const handleLike = useCallback(async (postId: string) => {
    if (!user) {
      const supabase = createClient();
      await supabase.auth.signInWithOAuth({
        provider: 'google',
        options: { redirectTo: `${window.location.origin}/auth/callback?next=/feed` },
      });
      return;
    }

    const wasLiked = likedIds.has(postId);

    // Optimistic update
    setLikedIds((prev) => {
      const next = new Set(prev);
      if (wasLiked) next.delete(postId);
      else next.add(postId);
      return next;
    });
    setPosts((prev) =>
      prev.map((p) =>
        p.id === postId
          ? { ...p, like_count: p.like_count + (wasLiked ? -1 : 1) }
          : p
      )
    );

    try {
      await toggleLike(postId, user.id, wasLiked);
    } catch {
      // Revert on failure
      setLikedIds((prev) => {
        const next = new Set(prev);
        if (wasLiked) next.add(postId);
        else next.delete(postId);
        return next;
      });
      setPosts((prev) =>
        prev.map((p) =>
          p.id === postId
            ? { ...p, like_count: p.like_count + (wasLiked ? 1 : -1) }
            : p
        )
      );
    }
  }, [user, likedIds]);

  const refreshFeed = useCallback(async () => {
    setLoading(true);
    try {
      const data = await fetchFeed(50, 0);
      setPosts(data);
    } catch (err) {
      console.error('Failed to refresh feed:', err);
    } finally {
      setLoading(false);
    }
  }, []);

  const postsWithShopNames = posts.map((p) => ({
    ...p,
    shop_name_en: shopMap.get(p.shop_id) || p.shop_id,
  }));

  return (
    <div className="max-w-lg mx-auto px-4 py-4 pb-24 space-y-3">
      {/* Pull to refresh hint */}
      {loading && (
        <div className="flex justify-center py-2">
          <div className="w-5 h-5 border-2 border-gray-200 border-t-[#E3350D] rounded-full animate-spin" />
        </div>
      )}

      {postsWithShopNames.length === 0 ? (
        <div className="text-center py-16">
          <p className="text-gray-400 text-sm">No posts yet. Be the first to share!</p>
        </div>
      ) : (
        postsWithShopNames.map((post) => (
          <PostCard
            key={post.id}
            post={post}
            isLiked={likedIds.has(post.id)}
            onLike={handleLike}
          />
        ))
      )}

      {/* FAB */}
      <button
        onClick={() => {
          if (!user) {
            const supabase = createClient();
            supabase.auth.signInWithOAuth({
              provider: 'google',
              options: { redirectTo: `${window.location.origin}/auth/callback?next=/feed` },
            });
            return;
          }
          setShowComposer(true);
        }}
        className="fixed bottom-20 right-4 w-14 h-14 bg-[#E3350D] text-white rounded-full shadow-lg flex items-center justify-center hover:bg-[#c42e0b] transition-colors z-40"
      >
        <Plus className="size-6" />
      </button>

      {showComposer && user && (
        <PostComposer
          userId={user.id}
          shops={shops}
          onClose={() => setShowComposer(false)}
          onCreated={refreshFeed}
        />
      )}
    </div>
  );
}
