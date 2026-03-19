import type { Shop, OpenHours } from '@/types';

interface InfoSectionProps {
  shop: Shop;
}

const DAY_ORDER = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];
const DAY_LABELS: Record<string, string> = {
  monday: 'Mon', tuesday: 'Tue', wednesday: 'Wed', thursday: 'Thu',
  friday: 'Fri', saturday: 'Sat', sunday: 'Sun',
};

const PAYMENT_LABELS: Record<string, string> = {
  cash: 'Cash', visa: 'Visa', mastercard: 'Mastercard', ic: 'IC Card',
};

function OpenHoursDisplay({ hours }: { hours: OpenHours }) {
  const entries = DAY_ORDER.filter((d) => d in hours);
  if (entries.length === 0) return null;

  return (
    <div className="py-3 border-b border-gray-100">
      <h3 className="text-xs font-medium text-gray-400 mb-2">Hours</h3>
      <div className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-1 text-sm">
        {entries.map((day) => {
          const slot = hours[day];
          return (
            <div key={day} className="contents">
              <span className="font-medium text-gray-900">{DAY_LABELS[day]}</span>
              <span className="text-gray-600">{slot ? `${slot.open} - ${slot.close}` : 'Closed'}</span>
            </div>
          );
        })}
      </div>
    </div>
  );
}

export default function InfoSection({ shop }: InfoSectionProps) {
  return (
    <div>
      <h2 className="font-semibold text-lg text-gray-900 mb-3">Shop Info</h2>

      <div className="bg-white rounded-lg border border-gray-100 shadow-sm">
        {/* Address */}
        <div className="p-4 border-b border-gray-100">
          <h3 className="text-xs font-medium text-gray-400 mb-1">Address</h3>
          <p className="text-sm text-gray-900">{shop.address_en}</p>
          {shop.address_jp && <p className="text-xs text-gray-400 mt-0.5">{shop.address_jp}</p>}
          {shop.floor_label && <p className="text-xs text-gray-400">Floor: {shop.floor_label}</p>}
        </div>

        {/* Hours */}
        {shop.open_hours && (
          <div className="px-4">
            <OpenHoursDisplay hours={shop.open_hours} />
          </div>
        )}

        {/* Payment */}
        <div className="p-4 border-b border-gray-100">
          <h3 className="text-xs font-medium text-gray-400 mb-2">Payment</h3>
          <div className="flex flex-wrap gap-1.5">
            {shop.payment_methods.map((m) => (
              <span key={m} className="text-xs bg-gray-100 text-gray-600 rounded px-2 py-0.5">
                {PAYMENT_LABELS[m] || m}
              </span>
            ))}
          </div>
        </div>

        {/* ATM */}
        {shop.atm_nearby && shop.atm_note && (
          <div className="p-4 border-b border-gray-100">
            <h3 className="text-xs font-medium text-gray-400 mb-1">Nearest ATM</h3>
            <p className="text-sm text-gray-700">{shop.atm_note}</p>
          </div>
        )}

        {/* English Support */}
        <div className="p-4 border-b border-gray-100">
          <h3 className="text-xs font-medium text-gray-400 mb-1">English Support</h3>
          <p className="text-sm text-gray-700">
            {shop.english_staff
              ? `Yes${shop.english_staff_days ? ` - ${shop.english_staff_days}` : ''}`
              : 'Limited / None'}
          </p>
        </div>

        {/* Links */}
        {(shop.website_url || shop.twitter_handle) && (
          <div className="p-4 flex flex-wrap gap-3">
            {shop.website_url && (
              <a href={shop.website_url} target="_blank" rel="noopener noreferrer"
                className="text-sm text-[#E3350D] hover:underline">
                Website
              </a>
            )}
            {shop.twitter_handle && (
              <a href={`https://x.com/${shop.twitter_handle}`} target="_blank" rel="noopener noreferrer"
                className="text-sm text-[#E3350D] hover:underline">
                @{shop.twitter_handle}
              </a>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
