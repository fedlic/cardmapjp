import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
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

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="dark">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased font-sans`}
      >
        <header className="bg-[#16213e] text-white px-4 py-2 flex items-center justify-between shrink-0 z-50 border-b border-white/10">
          <a href="/" className="flex items-center gap-2">
            <span className="text-xl font-bold tracking-tight">
              <span className="text-[#E3350D]">Card</span>
              <span>MapJP</span>
            </span>
            <span className="text-[10px] bg-[#FFCB05] text-[#1a1a2e] font-bold rounded px-1.5 py-0.5">
              Beta
            </span>
          </a>
          <nav className="flex items-center gap-4 text-sm">
            <a href="/" className="text-white/70 hover:text-white transition-colors">
              Map
            </a>
            <a href="/regions" className="text-white/70 hover:text-white transition-colors">
              Regions
            </a>
            <AuthButton />
          </nav>
        </header>
        <main className="flex-1">{children}</main>
      </body>
    </html>
  );
}
