"use client";

import { useState } from "react";
import { Capacitor } from "@capacitor/core";
import { Apple, Download, ShieldAlert, Smartphone, X } from "lucide-react";
import { appDownloadLinks } from "@/lib/app-downloads";

const DISMISS_KEY = "cardmapjp-app-download-banner-dismissed";

function shouldShowAppDownloadBanner() {
  if (typeof window === "undefined") {
    return false;
  }

  if (Capacitor.isNativePlatform()) {
    return false;
  }

  try {
    return localStorage.getItem(DISMISS_KEY) !== "true";
  } catch {
    return true;
  }
}

export default function AppDownloadBanner() {
  const [isVisible, setIsVisible] = useState(shouldShowAppDownloadBanner);

  if (!isVisible) {
    return null;
  }

  function dismissBanner() {
    try {
      localStorage.setItem(DISMISS_KEY, "true");
    } catch {
      // The banner can still be dismissed for this session if storage is blocked.
    }

    setIsVisible(false);
  }

  return (
    <section
      aria-label="アプリをダウンロード"
      className="border-b border-red-200/70 bg-[#E3350D] px-3 py-2 text-white shadow-sm"
    >
      <div className="mx-auto flex max-w-6xl items-center gap-2">
        <div className="flex min-w-0 flex-1 flex-col gap-2 md:flex-row md:items-center md:justify-between">
          <div className="flex min-w-0 items-center gap-2">
            <span className="inline-flex size-8 shrink-0 items-center justify-center rounded-md bg-white/15 ring-1 ring-white/20">
              <Smartphone className="size-4" aria-hidden="true" />
            </span>
            <span className="min-w-0">
              <span className="block text-sm font-bold leading-tight tracking-tight">
                CardMapJPアプリ
              </span>
              <span className="block truncate text-xs text-white/80">
                地図とショップ情報をスマホでチェック
              </span>
            </span>
          </div>
          <div className="grid grid-cols-2 gap-2 md:flex md:items-center">
            <a
              href={appDownloadLinks.ios.href}
              className="inline-flex min-h-10 items-center justify-center gap-2 rounded-md bg-white px-3 py-2 text-sm font-bold text-[#E3350D] shadow-sm transition hover:bg-white/95 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-white/70"
            >
              <Apple className="size-4 shrink-0" aria-hidden="true" />
              <span className="truncate">{appDownloadLinks.ios.label}</span>
            </a>
            <a
              href={appDownloadLinks.android.href}
              className="inline-flex min-h-10 items-center justify-center gap-2 rounded-md bg-gray-950 px-3 py-2 text-sm font-bold text-white shadow-sm ring-1 ring-white/15 transition hover:bg-gray-900 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-white/70"
            >
              <Download className="size-4 shrink-0" aria-hidden="true" />
              <span className="truncate">{appDownloadLinks.android.label}</span>
            </a>
            <span className="col-span-2 inline-flex items-center justify-center gap-1 rounded-full bg-white/12 px-2 py-1 text-[11px] font-medium text-white/85 ring-1 ring-white/15 md:col-span-1">
              <ShieldAlert className="size-3" aria-hidden="true" />
              {appDownloadLinks.android.note}
            </span>
          </div>
        </div>
        <button
          type="button"
          aria-label="アプリダウンロード案内を閉じる"
          onClick={dismissBanner}
          className="inline-flex size-8 shrink-0 items-center justify-center rounded-md text-white/80 transition hover:bg-white/15 hover:text-white focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-white/70"
        >
          <X className="size-4" aria-hidden="true" />
        </button>
      </div>
    </section>
  );
}
