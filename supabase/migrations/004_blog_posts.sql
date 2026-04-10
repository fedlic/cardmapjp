-- Blog posts table for SEO content / AdSense eligibility
create table if not exists blog_posts (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  title text not null,
  description text,
  content text not null,
  tags text[],
  published_at timestamptz default now(),
  created_at timestamptz default now()
);

alter table blog_posts enable row level security;

-- Public read access (published articles)
create policy "public_read_blog_posts" on blog_posts
  for select using (true);

create index if not exists blog_posts_slug_idx on blog_posts(slug);
create index if not exists blog_posts_published_at_idx on blog_posts(published_at desc);
