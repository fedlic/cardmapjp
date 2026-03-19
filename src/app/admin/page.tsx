import { createServerClient } from '@/lib/supabase/server';
import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import FetchReviewsButton from '@/components/admin/FetchReviewsButton';

export const dynamic = 'force-dynamic';

export default async function AdminDashboard() {
  const supabase = createServerClient();

  const [shopsResult, inventoryResult, recentResult, reviewsResult, usersResult] = await Promise.all([
    supabase
      .from('shops_with_coords')
      .select('id, is_active, google_rating'),
    supabase
      .from('shop_inventory')
      .select('availability'),
    supabase
      .from('shops_with_coords')
      .select('id, name_en, updated_at, is_active')
      .order('updated_at', { ascending: false })
      .limit(5),
    supabase
      .from('reviews')
      .select('id, rating, user_id'),
    supabase.auth.admin.listUsers({ perPage: 1000 }),
  ]);

  const shops = (shopsResult.data ?? []) as { id: string; is_active: boolean; google_rating: number | null }[];
  const inventory = (inventoryResult.data ?? []) as { availability: string }[];
  const recent = (recentResult.data ?? []) as { id: string; name_en: string; updated_at: string; is_active: boolean }[];

  const totalShops = shops.length;
  const activeShops = shops.filter((s) => s.is_active).length;
  const ratings = shops.map((s) => s.google_rating).filter((r): r is number => r !== null);
  const avgRating = ratings.length > 0
    ? (ratings.reduce((a, b) => a + b, 0) / ratings.length).toFixed(1)
    : 'N/A';

  const inStock = inventory.filter((i) => i.availability === 'in_stock').length;
  const limited = inventory.filter((i) => i.availability === 'limited').length;
  const soldOut = inventory.filter((i) => i.availability === 'sold_out').length;

  const reviews = (reviewsResult.data ?? []) as { id: string; rating: number; user_id: string }[];
  const totalReviews = reviews.length;
  const reviewRatings = reviews.map((r) => r.rating).filter((r): r is number => r !== null);
  const avgReviewRating = reviewRatings.length > 0
    ? (reviewRatings.reduce((a, b) => a + b, 0) / reviewRatings.length).toFixed(1)
    : 'N/A';
  const totalUsers = usersResult.data?.users?.length ?? 0;
  const activeReviewers = new Set(reviews.map((r) => r.user_id)).size;

  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold">Dashboard</h1>

      {/* Stats */}
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <Card>
          <CardContent className="p-5">
            <p className="text-sm text-muted-foreground">Total Shops</p>
            <p className="text-3xl font-bold">{totalShops}</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-5">
            <p className="text-sm text-muted-foreground">Active Shops</p>
            <p className="text-3xl font-bold text-green-600">{activeShops}</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-5">
            <p className="text-sm text-muted-foreground">Avg Rating</p>
            <p className="text-3xl font-bold">{avgRating}</p>
          </CardContent>
        </Card>
      </div>

      {/* User & Review Stats */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-4">
        <Card>
          <CardContent className="p-5">
            <p className="text-sm text-muted-foreground">Registered Users</p>
            <p className="text-3xl font-bold">{totalUsers}</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-5">
            <p className="text-sm text-muted-foreground">Active Reviewers</p>
            <p className="text-3xl font-bold text-blue-600">{activeReviewers}</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-5">
            <p className="text-sm text-muted-foreground">Total Reviews</p>
            <p className="text-3xl font-bold">{totalReviews}</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-5">
            <p className="text-sm text-muted-foreground">Avg Review Rating</p>
            <p className="text-3xl font-bold">{avgReviewRating}</p>
          </CardContent>
        </Card>
      </div>

      {/* Inventory Summary */}
      <Card>
        <CardContent className="p-5">
          <h2 className="font-semibold mb-3">Inventory Summary</h2>
          <div className="flex flex-wrap gap-4">
            <div className="flex items-center gap-2">
              <Badge className="bg-green-100 text-green-800">In Stock</Badge>
              <span className="font-medium">{inStock}</span>
            </div>
            <div className="flex items-center gap-2">
              <Badge className="bg-yellow-100 text-yellow-800">Limited</Badge>
              <span className="font-medium">{limited}</span>
            </div>
            <div className="flex items-center gap-2">
              <Badge className="bg-red-100 text-red-800">Sold Out</Badge>
              <span className="font-medium">{soldOut}</span>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Google Reviews */}
      <Card>
        <CardContent className="p-5">
          <h2 className="font-semibold mb-3">Google Reviews</h2>
          <p className="text-sm text-gray-500 mb-3">
            Fetch reviews from Google Places API (New) for all shops. Skips shops with fresh cache (7 days).
          </p>
          <FetchReviewsButton />
        </CardContent>
      </Card>

      {/* Recently Updated */}
      <Card>
        <CardContent className="p-5">
          <h2 className="font-semibold mb-3">Recently Updated</h2>
          <div className="space-y-2">
            {recent.map((shop) => (
              <a
                key={shop.id}
                href={`/admin/shops`}
                className="flex items-center justify-between py-2 px-3 rounded hover:bg-gray-50 transition-colors"
              >
                <div className="flex items-center gap-2">
                  <span className="text-sm font-medium">{shop.name_en}</span>
                  {!shop.is_active && (
                    <Badge variant="outline" className="text-xs">Inactive</Badge>
                  )}
                </div>
                <span className="text-xs text-muted-foreground">
                  {new Date(shop.updated_at).toLocaleDateString()}
                </span>
              </a>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
