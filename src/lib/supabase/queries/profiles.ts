import { createClient } from '@/lib/supabase/client';
import type { Profile } from '@/types/sns';

export async function fetchProfile(userId: string): Promise<Profile | null> {
  const supabase = createClient();
  const { data, error } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', userId)
    .single();

  if (error) {
    if (error.code === 'PGRST116') return null;
    throw error;
  }
  return data as Profile;
}

export async function updateProfile(
  userId: string,
  updates: { display_name?: string; bio?: string; country_code?: string }
): Promise<Profile> {
  const supabase = createClient();
  const { data, error } = await supabase
    .from('profiles')
    .update({ ...updates, updated_at: new Date().toISOString() })
    .eq('id', userId)
    .select()
    .single();

  if (error) throw error;
  return data as Profile;
}
