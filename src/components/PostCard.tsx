'use client';

import { Heart } from 'lucide-react';
import type { Post } from '@/types/sns';

function relativeTime(dateStr: string): string {
  const diff = Date.now() - new Date(dateStr).getTime();
  const mins = Math.floor(diff / 60000);
  if (mins < 1) return 'now';
  if (mins < 60) return `${mins}m`;
  const hours = Math.floor(mins / 60);
  if (hours < 24) return `${hours}h`;
  const days = Math.floor(hours / 24);
  if (days < 30) return `${days}d`;
  return new Date(dateStr).toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
}

function Avatar({ name, url }: { name: string; url: string | null }) {
  if (url) {
    return (
      <img src={url} alt={name} className="w-9 h-9 rounded-full object-cover" />
    );
  }
  const initial = (name || '?')[0].toUpperCase();
  return (
    <div className="w-9 h-9 rounded-full bg-[#E3350D] text-white flex items-center justify-center text-sm font-semibold">
      {initial}
    </div>
  );
}

interface PostCardProps {
  post: Post;
  isLiked: boolean;
  onLike: (postId: string) => void;
  onDelete?: (postId: string) => void;
}

export default function PostCard({ post, isLiked, onLike, onDelete }: PostCardProps) {
  const authorName = post.display_name || post.username;

  return (
    <div className="bg-white rounded-xl border border-gray-100 p-4">
      {/* Header */}
      <div className="flex items-center gap-3 mb-3">
        <Avatar name={authorName} url={post.avatar_url} />
        <div className="flex-1 min-w-0">
          <p className="text-sm font-semibold text-gray-900 truncate">{authorName}</p>
          <p className="text-xs text-gray-400">@{post.username} · {relativeTime(post.created_at)}</p>
        </div>
        <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${
          post.post_type === 'spot'
            ? 'bg-blue-50 text-blue-600'
            : 'bg-amber-50 text-amber-600'
        }`}>
          {post.post_type === 'spot' ? 'Spot' : 'Haul'}
        </span>
        {onDelete && (
          <button
            onClick={() => onDelete(post.id)}
            className="text-xs text-gray-400 hover:text-red-500"
          >
            Delete
          </button>
        )}
      </div>

      {/* Shop name */}
      {post.shop_name_en && (
        <p className="text-xs text-[#E3350D] font-medium mb-2">
          @ {post.shop_name_en}
        </p>
      )}

      {/* Body */}
      {post.body && (
        <p className="text-sm text-gray-700 whitespace-pre-wrap mb-3">{post.body}</p>
      )}

      {/* Images */}
      {post.image_urls.length > 0 && (
        <div className="flex gap-2 overflow-x-auto pb-2 mb-3 -mx-1 px-1">
          {post.image_urls.map((url, i) => (
            <img
              key={i}
              src={url}
              alt={`Post image ${i + 1}`}
              className="h-48 rounded-lg object-cover flex-shrink-0"
              loading="lazy"
            />
          ))}
        </div>
      )}

      {/* Like */}
      <button
        onClick={() => onLike(post.id)}
        className="flex items-center gap-1.5 text-sm group"
      >
        <Heart
          className={`size-5 transition-colors ${
            isLiked
              ? 'fill-[#E3350D] text-[#E3350D]'
              : 'text-gray-400 group-hover:text-[#E3350D]'
          }`}
        />
        <span className={isLiked ? 'text-[#E3350D]' : 'text-gray-400'}>
          {post.like_count}
        </span>
      </button>
    </div>
  );
}
