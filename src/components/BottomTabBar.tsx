'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { Map, Newspaper, UserCircle } from 'lucide-react';

const tabs = [
  { href: '/', label: 'Map', icon: Map },
  { href: '/feed', label: 'Feed', icon: Newspaper },
  { href: '/profile', label: 'Profile', icon: UserCircle },
] as const;

export default function BottomTabBar() {
  const pathname = usePathname();

  return (
    <nav className="fixed bottom-0 left-0 right-0 z-50 bg-white/95 backdrop-blur border-t border-gray-200 md:hidden"
      style={{ paddingBottom: 'env(safe-area-inset-bottom, 0px)' }}
    >
      <div className="flex items-center justify-around h-14">
        {tabs.map(({ href, label, icon: Icon }) => {
          const active = href === '/' ? pathname === '/' : pathname.startsWith(href);
          return (
            <Link
              key={href}
              href={href}
              className={`flex flex-col items-center gap-0.5 px-4 py-1 ${
                active ? 'text-[#E3350D]' : 'text-gray-400'
              }`}
            >
              <Icon className="size-5" />
              <span className="text-[10px] font-medium">{label}</span>
            </Link>
          );
        })}
      </div>
    </nav>
  );
}
