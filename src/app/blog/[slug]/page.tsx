import { notFound } from 'next/navigation';
import Link from 'next/link';
import type { Metadata } from 'next';
import { createServerClient } from '@/lib/supabase/server';

export const revalidate = 3600;

interface PageProps {
  params: Promise<{ slug: string }>;
}

interface BlogPost {
  slug: string;
  title: string;
  description: string | null;
  content: string;
  tags: string[] | null;
  published_at: string | null;
}

export async function generateStaticParams() {
  // ビルド時にSupabaseへ接続できない場合は空配列を返し、ISR（revalidate）に委ねる
  try {
    if (!process.env.NEXT_PUBLIC_SUPABASE_URL || !process.env.SUPABASE_SERVICE_ROLE_KEY) {
      return [];
    }
    const supabase = createServerClient();
    const { data } = await supabase.from('blog_posts').select('slug');
    return (data ?? []).map((row: { slug: string }) => ({ slug: row.slug }));
  } catch {
    return [];
  }
}

async function getPost(slug: string): Promise<BlogPost | null> {
  const supabase = createServerClient();
  const { data } = await supabase
    .from('blog_posts')
    .select('slug,title,description,content,tags,published_at')
    .eq('slug', slug)
    .maybeSingle();
  return (data as BlogPost | null) ?? null;
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params;
  const post = await getPost(slug);
  if (!post) return { title: 'Not Found | CardMapJP' };

  const description = post.description ?? post.content.slice(0, 120);
  return {
    title: `${post.title} | CardMapJP ブログ`,
    description,
    openGraph: {
      title: post.title,
      description,
      type: 'article',
      url: `https://cardmapjp.vercel.app/blog/${post.slug}`,
      publishedTime: post.published_at ?? undefined,
    },
  };
}

function formatDate(value: string | null): string {
  if (!value) return '';
  const d = new Date(value);
  return `${d.getFullYear()}年${d.getMonth() + 1}月${d.getDate()}日`;
}

export default async function BlogArticlePage({ params }: PageProps) {
  const { slug } = await params;
  const post = await getPost(slug);
  if (!post) notFound();

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'Article',
    headline: post.title,
    description: post.description ?? undefined,
    datePublished: post.published_at ?? undefined,
    author: {
      '@type': 'Organization',
      name: 'CardMapJP',
    },
    publisher: {
      '@type': 'Organization',
      name: 'CardMapJP',
      url: 'https://cardmapjp.vercel.app',
    },
    mainEntityOfPage: {
      '@type': 'WebPage',
      '@id': `https://cardmapjp.vercel.app/blog/${post.slug}`,
    },
    keywords: post.tags?.join(', '),
  };

  // 改行を段落に変換
  const paragraphs = post.content
    .split(/\n{2,}/)
    .map((p) => p.trim())
    .filter(Boolean);

  return (
    <article className="max-w-3xl mx-auto px-4 py-8">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      <nav className="text-sm text-gray-500 mb-4">
        <Link href="/blog" className="hover:text-[#E3350D]">
          ← ブログ一覧
        </Link>
      </nav>

      <h1 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-3 leading-tight">
        {post.title}
      </h1>

      <div className="flex flex-wrap items-center gap-2 text-xs text-gray-500 mb-6">
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

      {post.description && (
        <p className="text-gray-700 text-base leading-relaxed mb-6 border-l-4 border-[#E3350D] pl-3 bg-gray-50 py-2">
          {post.description}
        </p>
      )}

      <div className="space-y-4 text-gray-800 text-base leading-relaxed">
        {paragraphs.map((para, i) => (
          <p key={i} className="whitespace-pre-wrap">
            {para}
          </p>
        ))}
      </div>

      <hr className="my-8 border-gray-200" />

      <div className="text-sm text-gray-500">
        <Link href="/" className="hover:text-[#E3350D]">
          トップへ戻る
        </Link>
        <span className="mx-2">/</span>
        <Link href="/blog" className="hover:text-[#E3350D]">
          ブログ一覧
        </Link>
      </div>
    </article>
  );
}
