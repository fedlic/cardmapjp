import { NextRequest, NextResponse } from 'next/server';
import { createServerClient } from '@supabase/ssr';

const ADMIN_PUBLIC_PATHS = ['/admin/login', '/api/admin/login'];

export async function middleware(request: NextRequest) {
  const { pathname } = request.nextUrl;

  // Skip session refresh on auth callback (PKCE code exchange handles its own cookies)
  if (pathname === '/auth/callback') {
    return NextResponse.next();
  }

  // --- Supabase session refresh (all routes) ---
  let response = NextResponse.next({ request });

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll();
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value }) =>
            request.cookies.set(name, value)
          );
          response = NextResponse.next({ request });
          cookiesToSet.forEach(({ name, value, options }) =>
            response.cookies.set(name, value, options)
          );
        },
      },
    }
  );

  // Refresh the session JWT (important for keeping auth alive)
  await supabase.auth.getUser();

  // --- Admin HMAC protection (existing logic) ---
  if (pathname.startsWith('/admin') || pathname.startsWith('/api/admin')) {
    if (!ADMIN_PUBLIC_PATHS.some((p) => pathname === p)) {
      const session = request.cookies.get('admin_session')?.value;
      if (!session || session.split('.').length !== 2) {
        if (pathname.startsWith('/api/admin')) {
          return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
        }
        return NextResponse.redirect(new URL('/admin/login', request.url));
      }
    }
  }

  return response;
}

export const config = {
  matcher: [
    '/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)',
  ],
};
