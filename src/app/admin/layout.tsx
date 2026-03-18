'use client';

import { usePathname, useRouter } from 'next/navigation';
import { Button } from '@/components/ui/button';

const NAV_ITEMS = [
  { label: 'Dashboard', href: '/admin' },
  { label: 'Shops', href: '/admin/shops' },
  { label: 'Inventory', href: '/admin/inventory' },
  { label: 'Members', href: '/admin/members' },
  { label: 'Reviews', href: '/admin/reviews' },
];

export default function AdminLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const pathname = usePathname();
  const router = useRouter();

  // Login page gets its own layout
  if (pathname === '/admin/login') {
    return <>{children}</>;
  }

  async function handleLogout() {
    await fetch('/api/admin/logout', { method: 'POST' });
    router.push('/admin/login');
    router.refresh();
  }

  return (
    <div className="light flex h-[calc(100vh-44px)] bg-white text-gray-900">
      {/* Sidebar */}
      <aside className="hidden md:flex w-56 flex-col border-r bg-gray-50">
        <div className="p-4 border-b">
          <h2 className="font-bold text-sm text-muted-foreground uppercase tracking-wide">
            Admin
          </h2>
        </div>
        <nav className="flex-1 p-2 space-y-1">
          {NAV_ITEMS.map((item) => {
            const isActive =
              item.href === '/admin'
                ? pathname === '/admin'
                : pathname.startsWith(item.href);
            return (
              <a
                key={item.href}
                href={item.href}
                className={`block px-3 py-2 rounded-md text-sm font-medium transition-colors ${
                  isActive
                    ? 'bg-[#E3350D] text-white'
                    : 'text-gray-700 hover:bg-gray-100'
                }`}
              >
                {item.label}
              </a>
            );
          })}
        </nav>
        <div className="p-2 border-t">
          <Button
            variant="ghost"
            size="sm"
            className="w-full justify-start text-muted-foreground"
            onClick={handleLogout}
          >
            Logout
          </Button>
        </div>
      </aside>

      {/* Mobile nav */}
      <div className="md:hidden fixed bottom-0 left-0 right-0 light bg-white border-t z-40 flex">
        {NAV_ITEMS.map((item) => {
          const isActive =
            item.href === '/admin'
              ? pathname === '/admin'
              : pathname.startsWith(item.href);
          return (
            <a
              key={item.href}
              href={item.href}
              className={`flex-1 text-center py-3 text-xs font-medium ${
                isActive ? 'text-[#E3350D] border-t-2 border-[#E3350D]' : 'text-gray-500'
              }`}
            >
              {item.label}
            </a>
          );
        })}
      </div>

      {/* Main content */}
      <main className="flex-1 overflow-y-auto p-6 pb-20 md:pb-6">
        {children}
      </main>
    </div>
  );
}
