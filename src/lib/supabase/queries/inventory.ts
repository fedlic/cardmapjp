import { createServerClient } from '../server';
import type { ShopInventory } from '@/types';

export async function getShopInventory(shopId: string): Promise<ShopInventory[]> {
  const supabase = createServerClient();
  const { data, error } = await supabase
    .from('shop_inventory')
    .select('*')
    .eq('shop_id', shopId)
    .order('category');

  if (error) throw error;
  return data as ShopInventory[];
}
