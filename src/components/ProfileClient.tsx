'use client';

import { useState, useEffect, useCallback } from 'react';
import { LogOut, Pencil } from 'lucide-react';
import { createClient } from '@/lib/supabase/client';
import { fetchProfile, updateProfile } from '@/lib/supabase/queries/profiles';
import { fetchUserPosts, toggleLike, getLikedPostIds } from '@/lib/supabase/queries/posts';
import PostCard from './PostCard';
import type { Profile, Post } from '@/types/sns';
import type { User } from '@supabase/supabase-js';

function Avatar({ name, url, size = 'lg' }: { name: string; url: string | null; size?: 'lg' | 'sm' }) {
  const cls = size === 'lg' ? 'w-20 h-20 text-2xl' : 'w-10 h-10 text-sm';
  if (url) {
    return <img src={url} alt={name} className={`${cls} rounded-full object-cover`} />;
  }
  const initial = (name || '?')[0].toUpperCase();
  return (
    <div className={`${cls} rounded-full bg-[#E3350D] text-white flex items-center justify-center font-bold`}>
      {initial}
    </div>
  );
}

export default function ProfileClient() {
  const [user, setUser] = useState<User | null>(null);
  const [profile, setProfile] = useState<Profile | null>(null);
  const [posts, setPosts] = useState<Post[]>([]);
  const [likedIds, setLikedIds] = useState<Set<string>>(new Set());
  const [loading, setLoading] = useState(true);
  const [editing, setEditing] = useState(false);
  const [editName, setEditName] = useState('');
  const [editBio, setEditBio] = useState('');
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    const supabase = createClient();
    supabase.auth.getUser().then(({ data: { user } }) => {
      setUser(user);
      setLoading(false);
    });
  }, []);

  useEffect(() => {
    if (!user) return;
    Promise.all([
      fetchProfile(user.id),
      fetchUserPosts(user.id),
    ]).then(([prof, userPosts]) => {
      setProfile(prof);
      setPosts(userPosts);
      if (prof) {
        setEditName(prof.display_name || '');
        setEditBio(prof.bio || '');
      }
    }).catch(console.error);
  }, [user]);

  useEffect(() => {
    if (!user || posts.length === 0) return;
    getLikedPostIds(user.id, posts.map((p) => p.id)).then(setLikedIds).catch(console.error);
  }, [user, posts]);

  const handleSignIn = async () => {
    const supabase = createClient();
    await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: { redirectTo: `${window.location.origin}/auth/callback?next=/profile` },
    });
  };

  const handleSignOut = async () => {
    const supabase = createClient();
    await supabase.auth.signOut();
    setUser(null);
    setProfile(null);
    setPosts([]);
  };

  const handleSaveProfile = async () => {
    if (!user) return;
    setSaving(true);
    try {
      const updated = await updateProfile(user.id, {
        display_name: editName.trim() || null,
        bio: editBio.trim() || null,
      } as { display_name?: string; bio?: string });
      setProfile(updated);
      setEditing(false);
    } catch (err) {
      console.error('Failed to update profile:', err);
    } finally {
      setSaving(false);
    }
  };

  const handleLike = useCallback(async (postId: string) => {
    if (!user) return;
    const wasLiked = likedIds.has(postId);
    setLikedIds((prev) => {
      const next = new Set(prev);
      if (wasLiked) next.delete(postId);
      else next.add(postId);
      return next;
    });
    setPosts((prev) =>
      prev.map((p) =>
        p.id === postId ? { ...p, like_count: p.like_count + (wasLiked ? -1 : 1) } : p
      )
    );
    try {
      await toggleLike(postId, user.id, wasLiked);
    } catch {
      setLikedIds((prev) => {
        const next = new Set(prev);
        if (wasLiked) next.add(postId);
        else next.delete(postId);
        return next;
      });
      setPosts((prev) =>
        prev.map((p) =>
          p.id === postId ? { ...p, like_count: p.like_count + (wasLiked ? 1 : -1) } : p
        )
      );
    }
  }, [user, likedIds]);

  if (loading) {
    return (
      <div className="flex items-center justify-center h-[60vh]">
        <div className="w-6 h-6 border-2 border-gray-200 border-t-[#E3350D] rounded-full animate-spin" />
      </div>
    );
  }

  // Not signed in
  if (!user) {
    return (
      <div className="max-w-md mx-auto px-4 py-16 text-center space-y-6">
        <div className="w-20 h-20 rounded-full bg-gray-100 flex items-center justify-center mx-auto">
          <span className="text-3xl text-gray-300">?</span>
        </div>
        <div>
          <h2 className="text-lg font-semibold text-gray-900">Join the Community</h2>
          <p className="text-sm text-gray-500 mt-1">Sign in to post, like, and connect with other collectors.</p>
        </div>
        <button
          onClick={handleSignIn}
          className="bg-[#E3350D] text-white px-6 py-2.5 rounded-full font-medium hover:bg-[#c42e0b] transition-colors"
        >
          Sign in with Google
        </button>
      </div>
    );
  }

  const displayName = profile?.display_name || user.user_metadata?.full_name || 'User';

  return (
    <div className="max-w-lg mx-auto px-4 py-6 pb-24 space-y-6">
      {/* Profile header */}
      <div className="flex items-center gap-4">
        <Avatar name={displayName} url={profile?.avatar_url || user.user_metadata?.avatar_url} />
        <div className="flex-1">
          <h2 className="text-lg font-bold text-gray-900">{displayName}</h2>
          {profile?.username && (
            <p className="text-sm text-gray-400">@{profile.username}</p>
          )}
          {profile?.bio && (
            <p className="text-sm text-gray-600 mt-1">{profile.bio}</p>
          )}
        </div>
      </div>

      {/* Stats */}
      <div className="flex gap-6">
        <div className="text-center">
          <p className="text-lg font-bold text-gray-900">{posts.length}</p>
          <p className="text-xs text-gray-400">Posts</p>
        </div>
      </div>

      {/* Actions */}
      <div className="flex gap-2">
        <button
          onClick={() => setEditing(!editing)}
          className="flex items-center gap-1.5 px-4 py-2 border rounded-full text-sm font-medium text-gray-700 hover:bg-gray-50"
        >
          <Pencil className="size-3.5" />
          Edit Profile
        </button>
        <button
          onClick={handleSignOut}
          className="flex items-center gap-1.5 px-4 py-2 border rounded-full text-sm font-medium text-gray-700 hover:bg-gray-50"
        >
          <LogOut className="size-3.5" />
          Sign Out
        </button>
      </div>

      {/* Edit form */}
      {editing && (
        <div className="border rounded-xl p-4 space-y-3">
          <div>
            <label className="text-xs font-medium text-gray-500 block mb-1">Display Name</label>
            <input
              type="text"
              value={editName}
              onChange={(e) => setEditName(e.target.value)}
              className="w-full border rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-[#E3350D]/30"
            />
          </div>
          <div>
            <label className="text-xs font-medium text-gray-500 block mb-1">Bio</label>
            <textarea
              value={editBio}
              onChange={(e) => setEditBio(e.target.value)}
              rows={3}
              className="w-full border rounded-lg px-3 py-2 text-sm resize-none focus:outline-none focus:ring-2 focus:ring-[#E3350D]/30"
            />
          </div>
          <div className="flex gap-2 justify-end">
            <button
              onClick={() => setEditing(false)}
              className="px-4 py-1.5 text-sm text-gray-500"
            >
              Cancel
            </button>
            <button
              onClick={handleSaveProfile}
              disabled={saving}
              className="px-4 py-1.5 text-sm bg-[#E3350D] text-white rounded-full font-medium"
            >
              {saving ? 'Saving...' : 'Save'}
            </button>
          </div>
        </div>
      )}

      {/* User's posts */}
      <div>
        <h3 className="text-sm font-semibold text-gray-500 mb-3">Your Posts</h3>
        {posts.length === 0 ? (
          <p className="text-sm text-gray-400 text-center py-8">No posts yet.</p>
        ) : (
          <div className="space-y-3">
            {posts.map((post) => (
              <PostCard
                key={post.id}
                post={post}
                isLiked={likedIds.has(post.id)}
                onLike={handleLike}
              />
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
