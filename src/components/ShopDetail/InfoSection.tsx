import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { getDirectionsUrl } from '@/lib/google-maps';
import type { Shop } from '@/types';

interface InfoSectionProps {
  shop: Shop;
}

const PAYMENT_LABELS: Record<string, string> = {
  cash: 'Cash',
  visa: 'Visa',
  mastercard: 'Mastercard',
  ic: 'IC Card (Suica/Pasmo)',
};

export default function InfoSection({ shop }: InfoSectionProps) {
  const directionsUrl = getDirectionsUrl(
    shop.location.lat,
    shop.location.lng,
    shop.name_en
  );

  return (
    <div className="space-y-4">
      <h2 className="font-semibold text-lg">Shop Info</h2>

      <Card>
        <CardContent className="p-4 space-y-4">
          {/* Address */}
          <div>
            <h3 className="text-sm font-medium text-muted-foreground">
              Address
            </h3>
            <p className="text-sm">{shop.address_en}</p>
            {shop.address_jp && (
              <p className="text-xs text-muted-foreground">{shop.address_jp}</p>
            )}
            {shop.floor_label && (
              <p className="text-xs text-muted-foreground">
                Floor: {shop.floor_label}
              </p>
            )}
          </div>

          {/* Payment */}
          <div>
            <h3 className="text-sm font-medium text-muted-foreground">
              Payment Methods
            </h3>
            <div className="flex flex-wrap gap-1 mt-1">
              {shop.payment_methods.map((m) => (
                <Badge key={m} variant="outline" className="text-xs">
                  {PAYMENT_LABELS[m] || m}
                </Badge>
              ))}
            </div>
          </div>

          {/* ATM */}
          {shop.atm_nearby && shop.atm_note && (
            <div>
              <h3 className="text-sm font-medium text-muted-foreground">
                Nearest ATM
              </h3>
              <p className="text-sm">{shop.atm_note}</p>
            </div>
          )}

          {/* Language */}
          <div>
            <h3 className="text-sm font-medium text-muted-foreground">
              English Support
            </h3>
            <p className="text-sm">
              {shop.english_staff
                ? `Yes${shop.english_staff_days ? ` — ${shop.english_staff_days}` : ''}`
                : 'Limited / None'}
            </p>
          </div>

          {/* Links */}
          <div className="flex flex-wrap gap-2">
            {shop.website_url && (
              <a
                href={shop.website_url}
                target="_blank"
                rel="noopener noreferrer"
                className="text-sm text-[#E3350D] hover:underline"
              >
                Website
              </a>
            )}
            {shop.twitter_handle && (
              <a
                href={`https://x.com/${shop.twitter_handle}`}
                target="_blank"
                rel="noopener noreferrer"
                className="text-sm text-[#E3350D] hover:underline"
              >
                @{shop.twitter_handle}
              </a>
            )}
          </div>
        </CardContent>
      </Card>

      <a href={directionsUrl} target="_blank" rel="noopener noreferrer">
        <Button className="w-full bg-[#E3350D] hover:bg-[#c42d0b] text-white">
          Get Directions
        </Button>
      </a>
    </div>
  );
}
