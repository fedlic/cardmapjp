import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Terms of Service — CardMapJP",
  description:
    "Terms of service for CardMapJP, the Pokemon card shop finder in Japan.",
};

export default function TermsPage() {
  return (
    <div className="max-w-3xl mx-auto px-4 py-12">
      <h1 className="text-3xl font-bold mb-8">Terms of Service</h1>
      <p className="text-sm text-gray-500 mb-8">Last updated: April 2, 2026</p>

      <section className="space-y-6 text-gray-700 leading-relaxed">
        <div>
          <h2 className="text-xl font-semibold mb-3">1. Acceptance of Terms</h2>
          <p>
            By accessing and using CardMapJP (&quot;the Service&quot;), you agree to be
            bound by these Terms of Service. If you do not agree to these terms,
            please do not use the Service.
          </p>
          <p className="mt-2 text-gray-500">
            CardMapJP（以下「本サービス」）にアクセスし利用することにより、本利用規約に同意したものとみなされます。同意いただけない場合は、本サービスのご利用をお控えください。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">2. Description of Service</h2>
          <p>
            CardMapJP is a web-based directory that helps users find Pokemon
            trading card shops across Japan. We provide shop locations, hours,
            inventory information, and user reviews. The Service is provided
            &quot;as is&quot; and is intended for informational purposes only.
          </p>
          <p className="mt-2 text-gray-500">
            CardMapJPは、日本全国のポケモンカードショップを検索できるウェブディレクトリです。ショップの場所、営業時間、在庫情報、ユーザーレビューを提供します。本サービスは「現状有姿」で提供され、情報提供を目的としています。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">3. User Accounts</h2>
          <p>
            You may create an account using Google OAuth to access features such
            as submitting reviews. You are responsible for maintaining the security
            of your account and for all activities that occur under your account.
          </p>
          <p className="mt-2 text-gray-500">
            レビュー投稿などの機能を利用するために、Google OAuthを使用してアカウントを作成できます。アカウントのセキュリティ管理および、アカウントで行われるすべての活動について責任を負うものとします。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">4. User Content</h2>
          <p>
            When you submit reviews or other content, you grant us a non-exclusive,
            worldwide, royalty-free license to use, display, and distribute that
            content on the Service. You agree not to submit content that is:
          </p>
          <ul className="list-disc pl-6 mt-2 space-y-1">
            <li>False, misleading, or fraudulent</li>
            <li>Defamatory, abusive, or harassing</li>
            <li>Infringing on third-party intellectual property rights</li>
            <li>Containing spam, malware, or unauthorized advertising</li>
          </ul>
          <p className="mt-2 text-gray-500">
            レビュー等のコンテンツを投稿する場合、当社に対してそのコンテンツを本サービス上で使用・表示・配信するための非独占的かつ無償のライセンスを付与するものとします。虚偽・誤解を招く内容、名誉毀損・嫌がらせ、知的財産権の侵害、スパムやマルウェアを含む内容の投稿は禁止します。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">5. Accuracy of Information</h2>
          <p>
            While we strive to keep shop information accurate and up-to-date,
            we do not guarantee the accuracy, completeness, or timeliness of any
            information on the Service. Shop hours, inventory, and other details
            may change without notice. Please verify information directly with
            shops before visiting.
          </p>
          <p className="mt-2 text-gray-500">
            ショップ情報の正確性と最新性の維持に努めていますが、本サービス上の情報の正確性、完全性、適時性を保証するものではありません。営業時間や在庫等の情報は予告なく変更される場合があります。ご来店前に直接ショップにご確認ください。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">6. Advertisements</h2>
          <p>
            The Service displays third-party advertisements, including those served
            by Google AdSense. We are not responsible for the content or accuracy
            of third-party advertisements. Your interactions with advertisers are
            solely between you and the advertiser.
          </p>
          <p className="mt-2 text-gray-500">
            本サービスはGoogle AdSenseを含む第三者広告を表示します。第三者広告の内容や正確性について当社は責任を負いません。広告主との取引はお客様と広告主間の問題です。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">7. Intellectual Property</h2>
          <p>
            The Service and its original content (excluding user-submitted content)
            are the property of CardMapJP and are protected by copyright and other
            intellectual property laws. Pokemon and related trademarks are the
            property of Nintendo, Creatures Inc., and GAME FREAK Inc.
          </p>
          <p className="mt-2 text-gray-500">
            本サービスおよびオリジナルコンテンツ（ユーザー投稿コンテンツを除く）はCardMapJPの財産であり、著作権法等により保護されています。ポケモンおよび関連商標は任天堂、クリーチャーズ、ゲームフリークの所有物です。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">8. Limitation of Liability</h2>
          <p>
            To the fullest extent permitted by law, CardMapJP shall not be liable
            for any indirect, incidental, special, or consequential damages arising
            from your use of the Service.
          </p>
          <p className="mt-2 text-gray-500">
            法律で認められる最大限の範囲において、本サービスの利用から生じるいかなる間接的、偶発的、特別、結果的損害についても、CardMapJPは責任を負いません。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">9. Termination</h2>
          <p>
            We reserve the right to suspend or terminate your access to the Service
            at any time, without notice, for conduct that we believe violates these
            Terms or is harmful to other users or the Service.
          </p>
          <p className="mt-2 text-gray-500">
            本規約に違反する行為、または他のユーザーや本サービスに害を及ぼすと判断される行為があった場合、予告なくサービスへのアクセスを停止または終了する権利を留保します。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">10. Governing Law</h2>
          <p>
            These Terms shall be governed by and construed in accordance with the
            laws of Japan. Any disputes shall be subject to the exclusive
            jurisdiction of the Tokyo District Court.
          </p>
          <p className="mt-2 text-gray-500">
            本規約は日本法に準拠し、解釈されるものとします。紛争が生じた場合は、東京地方裁判所を第一審の専属的合意管轄裁判所とします。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">11. Changes to Terms</h2>
          <p>
            We may update these Terms from time to time. Continued use of the
            Service after changes constitutes acceptance of the new Terms.
          </p>
          <p className="mt-2 text-gray-500">
            本規約は随時更新される場合があります。変更後の本サービスの継続利用をもって、新しい規約に同意したものとみなされます。
          </p>
        </div>

        <div>
          <h2 className="text-xl font-semibold mb-3">12. Contact Us / お問い合わせ</h2>
          <p>
            For questions about these Terms, please contact us at:{" "}
            <a href="mailto:info@fedlic.tokyo" className="text-blue-600 underline">
              info@fedlic.tokyo
            </a>
          </p>
          <p className="mt-2 text-gray-500">
            本規約に関するお問い合わせは info@fedlic.tokyo までご連絡ください。
          </p>
        </div>
      </section>
    </div>
  );
}
