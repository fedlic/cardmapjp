import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Privacy Policy — CardMapJP",
  description:
    "Privacy policy for CardMapJP, the Pokemon card shop finder in Japan.",
};

export default function PrivacyPage() {
  return (
    <div className="max-w-3xl mx-auto px-4 py-12">
      <h1 className="text-3xl font-bold mb-8">Privacy Policy</h1>
      <p className="text-sm text-gray-500 mb-8">Last updated: April 2, 2026</p>

      <section className="space-y-6 text-gray-700 leading-relaxed">
        <div>
          <h2 className="text-xl font-semibold mb-3">1. Introduction</h2>
          <p>
            CardMapJP (&quot;we,&quot; &quot;our,&quot; or &quot;us&quot;) operates the website
            cardmapjp.vercel.app. This Privacy Policy explains how we collect, use,
            and protect your personal information when you use our service.
          </p>
          <p className="mt-2 text-gray-500">
            CardMapJP（以下「当社」）は、cardmapjp.vercel.app を運営しています。本プライバシーポリシーは、当サービスをご利用いただく際の個人情報の取り扱いについて説明するものです。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">2. Information We Collect</h2>
          <p>We may collect the following types of information:</p>
          <ul className="list-disc pl-6 mt-2 space-y-1">
            <li>Account information (email address) when you sign in via Google OAuth</li>
            <li>Reviews and ratings you submit</li>
            <li>Location data (only when you use the &quot;Near Me&quot; feature, with your permission)</li>
            <li>Usage data collected automatically (pages visited, device type, browser)</li>
          </ul>
          <p className="mt-2 text-gray-500">
            当社は以下の情報を収集する場合があります：Google OAuthによるログイン時のメールアドレス、投稿されたレビュー・評価、「近くのショップ」機能使用時の位置情報（許可された場合のみ）、自動収集される利用データ（閲覧ページ、デバイス種別、ブラウザ）。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">3. How We Use Your Information</h2>
          <ul className="list-disc pl-6 space-y-1">
            <li>To provide and improve our shop finder service</li>
            <li>To display shops near your location</li>
            <li>To display your reviews on shop pages</li>
            <li>To analyze usage patterns and improve the user experience</li>
          </ul>
          <p className="mt-2 text-gray-500">
            収集した情報は、ショップ検索サービスの提供・改善、現在地周辺のショップ表示、レビューの表示、利用パターンの分析に使用します。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">4. Third-Party Services</h2>
          <p>We use the following third-party services:</p>
          <ul className="list-disc pl-6 mt-2 space-y-1">
            <li>Google AdSense — for displaying advertisements. Google may use cookies to serve ads based on your browsing history. See <a href="https://policies.google.com/technologies/ads" className="text-blue-600 underline" target="_blank" rel="noopener noreferrer">Google&apos;s ad policies</a>.</li>
            <li>Google Analytics / Vercel Analytics — for usage analytics</li>
            <li>Supabase — for authentication and data storage</li>
            <li>Google OAuth — for user authentication</li>
          </ul>
          <p className="mt-2 text-gray-500">
            当社はGoogle AdSense（広告配信）、Google Analytics / Vercel Analytics（アクセス解析）、Supabase（認証・データ保存）、Google OAuth（ユーザー認証）を利用しています。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">5. Cookies</h2>
          <p>
            We use cookies and similar technologies to provide our services,
            including authentication and advertising. Third-party advertisers
            (such as Google AdSense) may also use cookies to serve personalized ads.
            You can manage cookie preferences in your browser settings.
          </p>
          <p className="mt-2 text-gray-500">
            当社は、認証や広告配信を含むサービス提供のためにCookieおよび類似技術を使用します。Google AdSenseなどの第三者広告事業者もパーソナライズド広告のためにCookieを使用する場合があります。Cookieの設定はブラウザで管理できます。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">6. Data Retention</h2>
          <p>
            We retain your personal data for as long as your account is active or
            as needed to provide our services. You may request deletion of your
            account and associated data by contacting us.
          </p>
          <p className="mt-2 text-gray-500">
            個人データは、アカウントが有効な間またはサービス提供に必要な期間保持します。アカウントおよび関連データの削除をご希望の場合はお問い合わせください。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">7. Your Rights</h2>
          <p>You have the right to:</p>
          <ul className="list-disc pl-6 mt-2 space-y-1">
            <li>Access your personal data</li>
            <li>Request correction or deletion of your data</li>
            <li>Opt out of personalized advertising</li>
            <li>Withdraw consent for location tracking</li>
          </ul>
          <p className="mt-2 text-gray-500">
            ご自身の個人データへのアクセス、訂正・削除の要求、パーソナライズド広告のオプトアウト、位置情報追跡の同意撤回が可能です。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">8. Children&apos;s Privacy</h2>
          <p>
            Our service is not directed at children under 13. We do not knowingly
            collect personal information from children under 13.
          </p>
          <p className="mt-2 text-gray-500">
            当サービスは13歳未満の子どもを対象としていません。13歳未満の子どもから意図的に個人情報を収集することはありません。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">9. Changes to This Policy</h2>
          <p>
            We may update this Privacy Policy from time to time. Changes will be
            posted on this page with an updated revision date.
          </p>
          <p className="mt-2 text-gray-500">
            本ポリシーは随時更新される場合があります。変更は更新日とともにこのページに掲載されます。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">10. Contact Us / お問い合わせ</h2>
          <p>
            If you have any questions about this Privacy Policy, please contact us at:{" "}
            <a href="mailto:info@fedlic.tokyo" className="text-blue-600 underline">
              info@fedlic.tokyo
            </a>
          </p>
          <p className="mt-2 text-gray-500">
            本ポリシーに関するお問い合わせは info@fedlic.tokyo までご連絡ください。
          </p>
        </div>
      </section>
    </div>
  );
}
