'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { User } from '@supabase/supabase-js';

export default function AuthButton() {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const supabase = createClient();
    supabase.auth.getUser().then(({ data: { user } }) => {
      setUser(user);
      setLoading(false);
    });
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null);
    });
    return () => subscription.unsubscribe();
  }, []);

  const handleSignIn = async () => {
    const supabase = createClient();
    await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: { redirectTo: `${window.location.origin}/auth/callback` },
    });
  };

  const handleSignOut = async () => {
    const supabase = createClient();
    await supabase.auth.signOut();
    setUser(null);
  };

  if (loading) return null;

  if (!user) {
    return (
      <button
        onClick={handleSignIn}
        className="text-sm bg-white/20 hover:bg-white/30 rounded-full px-3 py-1 transition-colors"
      >
        Sign In
      </button>
    );
  }

  return (
    <div className="flex items-center gap-2">
      <span className="text-sm hidden sm:inline">
        {user.user_metadata?.full_name || user.email?.split('@')[0]}
      </span>
      <button
        onClick={handleSignOut}
        className="text-xs bg-white/20 hover:bg-white/30 rounded-full px-2 py-1 transition-colors"
      >
        Out
      </button>
    </div>
  );
}
