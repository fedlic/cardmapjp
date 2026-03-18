import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import { createAuthServerClient } from "@/lib/supabase/server";
import AuthButton from "@/components/AuthButton";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "CardMapJP — Pokemon Card Shop Finder in Japan",
  description:
    "Find the best Pokemon card shops in Akihabara and across Japan. Real-time inventory, English support info, and visitor tips for foreign collectors.",
  verification: {
    google: "DcP8asRDyzENMw-VEHqueaMAq_K4X6YyzgeIdGQF0QA",
  },
};

export default async function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const supabase = await createAuthServerClient();
  const { data: { user } } = await supabase.auth.getUser();

  return (
    <html lang="en">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased font-sans`}
      >
        <header className="bg-[#E3350D] text-white px-4 py-3 flex items-center justify-between shrink-0 z-50">
          <a href="/" className="flex items-center gap-2">
            <span className="text-xl font-bold tracking-tight">CardMapJP</span>
            <span className="text-xs bg-white/20 rounded px-1.5 py-0.5">
              Beta
            </span>
          </a>
          <nav className="flex items-center gap-4 text-sm">
            <a href="/" className="hover:underline">
              Map
            </a>
            <a href="/regions" className="hover:underline">
              Regions
            </a>
            <AuthButton user={user} />
          </nav>
        </header>
        <main className="flex-1">{children}</main>
      </body>
    </html>
  );
}
