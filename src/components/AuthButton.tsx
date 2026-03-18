'use client';

import { useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { User } from '@supabase/supabase-js';

interface AuthButtonProps {
  user: User | null;
}

export default function AuthButton({ user }: AuthButtonProps) {
  const [loading, setLoading] = useState(false);

  const handleSignIn = async () => {
    setLoading(true);
    const supabase = createClient();
    await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: `${window.location.origin}/auth/callback`,
      },
    });
  };

  const handleSignOut = async () => {
    setLoading(true);
    const supabase = createClient();
    await supabase.auth.signOut();
    window.location.reload();
  };

  if (!user) {
    return (
      <button
        onClick={handleSignIn}
        disabled={loading}
        className="text-sm bg-white/20 hover:bg-white/30 rounded px-3 py-1 transition-colors disabled:opacity-50"
      >
        {loading ? 'Signing in...' : 'Sign In'}
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
        />
      )}
      <span className="text-sm hidden sm:inline">{displayName}</span>
      <button
        onClick={handleSignOut}
        disabled={loading}
        className="text-xs bg-white/20 hover:bg-white/30 rounded px-2 py-1 transition-colors disabled:opacity-50"
      >
        {loading ? '...' : 'Sign Out'}
      </button>
    </div>
  );
}
