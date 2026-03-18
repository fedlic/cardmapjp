-- Banned users table
create table if not exists banned_users (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  reason text,
  banned_at timestamptz default now(),
  banned_by text,
  unique(user_id)
);

alter table banned_users enable row level security;

create index if not exists banned_users_user_id_idx on banned_users(user_id);

-- Allow users to check their own ban status (needed for RLS subquery in reviews policy)
create policy "users_check_own_ban" on banned_users
  for select using (auth.uid() = user_id);

-- Update reviews INSERT policy to block banned users
drop policy if exists "auth_insert_reviews" on reviews;
create policy "auth_insert_reviews" on reviews for insert
  with check (
    auth.uid() = user_id
    and not exists (
      select 1 from banned_users where banned_users.user_id = auth.uid()
    )
  );
