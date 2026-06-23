export const appDownloadLinks = {
  ios: {
    label: "App Store",
    status: "iOS版",
    href:
      process.env.NEXT_PUBLIC_CARDMAPJP_IOS_URL ||
      "https://apps.apple.com/jp/app/card-map-jp/id6761031128",
    note: "公開後にURL差し替え",
  },
  android: {
    label: "Android APK / 直接ダウンロード",
    status: "野良APK",
    href:
      process.env.NEXT_PUBLIC_CARDMAPJP_ANDROID_APK_URL ||
      "https://fedlic.tokyo/cardmapjp/android/cardmapjp.apk",
    note: "Google Playではありません",
  },
} as const;
