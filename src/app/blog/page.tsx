import type { Metadata } from 'next';
import Link from 'next/link';
import { createServerClient } from '@/lib/supabase/server';

export const revalidate = 3600;

export const metadata: Metadata = {
  title: 'ブログ | CardMapJP — カードショップ情報メディア',
  description:
    'ポケモンカード・遊戯王・MTGなど、全国のカードショップ情報や買取・シングル購入のコツをまとめたCardMapJP公式ブログです。',
  openGraph: {
    title: 'CardMapJP ブログ',
    description:
      'ポケモンカード・遊戯王・MTGなど、全国のカードショップ情報や買取・シングル購入のコツをまとめたCardMapJP公式ブログです。',
    type: 'website',
    url: 'https://cardmapjp.vercel.app/blog',
  },
};

interface BlogPostListItem {
  slug: string;
  title: string;
  description: string | null;
  tags: string[] | null;
  published_at: string | null;
}

function formatDate(value: string | null): string {
  if (!value) return '';
  const d = new Date(value);
  return `${d.getFullYear()}/${String(d.getMonth() + 1).padStart(2, '0')}/${String(d.getDate()).padStart(2, '0')}`;
}

export default async function BlogIndexPage() {
  const supabase = createServerClient();
  const { data } = await supabase
    .from('blog_posts')
    .select('slug,title,description,tags,published_at')
    .order('published_at', { ascending: false });

  const posts = (data ?? []) as BlogPostListItem[];

  return (
    <div className="max-w-3xl mx-auto px-4 py-8">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">ブログ</h1>
      <p className="text-gray-500 mb-6">
        カードショップ情報・買取・遊び方のコツをまとめた記事一覧です。
      </p>

      {posts.length === 0 ? (
        <p className="text-gray-500 text-sm">記事はまだありません。</p>
      ) : (
        <ul className="space-y-4">
          {posts.map((post) => (
            <li
              key={post.slug}
              className="border border-gray-200 rounded-lg p-4 hover:border-[#E3350D] transition-colors bg-white"
            >
              <Link href={`/blog/${post.slug}`} className="block">
                <h2 className="text-lg font-semibold text-gray-900 mb-1">
                  {post.title}
                </h2>
                {post.description && (
                  <p className="text-sm text-gray-600 line-clamp-2 mb-2">
                    {post.description}
                  </p>
                )}
                <div className="flex flex-wrap items-center gap-2 text-xs text-gray-500">
                  <time dateTime={post.published_at ?? undefined}>
                    {formatDate(post.published_at)}
                  </time>
                  {post.tags?.map((tag) => (
                    <span
                      key={tag}
                      className="bg-gray-100 text-gray-700 px-2 py-0.5 rounded"
                    >
                      #{tag}
                    </span>
                  ))}
                </div>
              </Link>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
