import type { Metadata } from "next";
import Script from "next/script";
import { Geist, Geist_Mono } from "next/font/google";
import { Analytics } from "@vercel/analytics/react";
import AuthButton from "@/components/AuthButton";
import ServiceWorkerRegistrar from "@/components/ServiceWorkerRegistrar";
import GoogleAnalytics from "@/components/GoogleAnalytics";
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
  manifest: "/manifest.json",
  themeColor: "#E3350D",
  appleWebApp: {
    capable: true,
    statusBarStyle: "black-translucent",
    title: "CardMapJP",
  },
  icons: {
    icon: [
      { url: "/favicon.ico", sizes: "32x32" },
      { url: "/icon-192x192.png", sizes: "192x192", type: "image/png" },
      { url: "/icon-512x512.png", sizes: "512x512", type: "image/png" },
    ],
    apple: "/apple-touch-icon.png",
  },
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
    <html lang="en">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased font-sans`}
      >
        <header className="h-12 bg-[#E3350D] text-white px-4 flex items-center justify-between shrink-0 z-50">
          <a href="/" className="flex items-center gap-2">
            <span className="text-lg font-bold tracking-tight">
              CardMapJP
            </span>
          </a>
          <nav className="flex items-center gap-3 text-sm">
            <a href="/" className="text-white/80 hover:text-white transition-colors">
              Home
            </a>
            <a href="/regions" className="text-white/80 hover:text-white transition-colors">
              Regions
            </a>
            <AuthButton />
          </nav>
        </header>
        <Script
          src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-8620642498629308"
          strategy="afterInteractive"
          crossOrigin="anonymous"
        />
        <main>{children}</main>
        <footer className="border-t border-gray-200 bg-gray-50 px-4 py-6 mt-8">
          <div className="max-w-6xl mx-auto flex flex-col sm:flex-row items-center justify-between gap-3 text-xs text-gray-500">
            <span>&copy; {new Date().getFullYear()} CardMapJP. All rights reserved.</span>
            <nav className="flex items-center gap-4">
              <a href="/privacy" className="hover:text-gray-700 transition-colors">Privacy Policy</a>
              <a href="/terms" className="hover:text-gray-700 transition-colors">Terms of Service</a>
              <a href="mailto:info@fedlic.tokyo" className="hover:text-gray-700 transition-colors">Contact</a>
            </nav>
          </div>
        </footer>
        <ServiceWorkerRegistrar />
                <GoogleAnalytics />
        <Analytics />
      </body>
    </html>
  );
}
