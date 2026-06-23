import { Download, Smartphone } from "lucide-react";
import { appDownloadLinks } from "@/lib/app-downloads";

export default function AppDownloadBanner() {
  return (
    <section
      aria-label="アプリをダウンロード"
      className="border-b border-red-100 bg-red-50/90 px-4 py-2"
    >
      <div className="mx-auto flex max-w-6xl flex-col gap-2 sm:flex-row sm:items-center sm:justify-between">
        <div className="flex items-center gap-2 text-sm font-semibold text-[#E3350D]">
          <Smartphone className="size-4 shrink-0" aria-hidden="true" />
          <span>アプリをダウンロード</span>
        </div>
        <div className="grid grid-cols-1 gap-2 sm:flex sm:items-center">
          <a
            href={appDownloadLinks.ios.href}
            className="inline-flex min-h-10 items-center justify-between gap-3 rounded-md border border-red-200 bg-white px-3 py-2 text-sm text-gray-900 shadow-sm transition-colors hover:border-[#E3350D] hover:text-[#E3350D]"
          >
            <span className="flex flex-col leading-tight">
              <span className="font-semibold">{appDownloadLinks.ios.label}</span>
              <span className="text-xs text-gray-500">{appDownloadLinks.ios.status}</span>
            </span>
            <span className="text-xs text-gray-500">{appDownloadLinks.ios.note}</span>
          </a>
          <a
            href={appDownloadLinks.android.href}
            className="inline-flex min-h-10 items-center justify-between gap-3 rounded-md border border-red-200 bg-white px-3 py-2 text-sm text-gray-900 shadow-sm transition-colors hover:border-[#E3350D] hover:text-[#E3350D]"
          >
            <span className="flex flex-col leading-tight">
              <span className="font-semibold">{appDownloadLinks.android.label}</span>
              <span className="text-xs text-gray-500">{appDownloadLinks.android.status}</span>
            </span>
            <span className="inline-flex items-center gap-1 rounded-full bg-yellow-100 px-2 py-1 text-xs font-medium text-yellow-900">
              <Download className="size-3" aria-hidden="true" />
              {appDownloadLinks.android.note}
            </span>
          </a>
        </div>
      </div>
    </section>
  );
}
