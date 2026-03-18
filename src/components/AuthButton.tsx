'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { User } from '@supabase/supabase-js';

export default function AuthButton() {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const supabase = createClient();

    // Get initial session
    supabase.auth.getUser().then(({ data: { user } }) => {
      setUser(user);
      setLoading(false);
    });

    // Listen for auth changes (login/logout)
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null);
    });

    return () => subscription.unsubscribe();
  }, []);

  const handleSignIn = async () => {
    const supabase = createClient();
    await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: `${window.location.origin}/auth/callback`,
      },
    });
  };

  const handleSignOut = async () => {
    const supabase = createClient();
    await supabase.auth.signOut();
    setUser(null);
  };

  if (loading) {
    return null;
  }

  if (!user) {
    return (
      <button
        onClick={handleSignIn}
        className="text-sm bg-white/20 hover:bg-white/30 rounded px-3 py-1 transition-colors"
      >
        Sign In
      </button>
    );
  }

  const avatarUrl = user.user_metadata?.avatar_url;
  const displayName = user.user_metadata?.full_name || user.email?.split('@')[0] || 'User';

  return (
    <div className="flex items-center gap-2">
      {avatarUrl && (
        <img
          src={avatarUrl}
          alt=""
          className="size-6 rounded-full"
          referrerPolicy="no-referrer"
          loading="lazy"
        />
      )}
      <span className="text-sm hidden sm:inline">{displayName}</span>
      <button
        onClick={handleSignOut}
        className="text-xs bg-white/20 hover:bg-white/30 rounded px-2 py-1 transition-colors"
      >
        Sign Out
      </button>
    </div>
  );
}
