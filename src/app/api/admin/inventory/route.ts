import { NextRequest, NextResponse } from 'next/server';
import { createServerClient } from '@/lib/supabase/server';

export async function GET(request: NextRequest) {
  const shopId = new URL(request.url).searchParams.get('shop_id');
  if (!shopId) {
    return NextResponse.json({ error: 'shop_id required' }, { status: 400 });
  }

  const supabase = createServerClient();
  const { data, error } = await supabase
    .from('shop_inventory')
    .select('*')
    .eq('shop_id', shopId)
    .order('category');

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
  return NextResponse.json(data);
}

export async function PUT(request: NextRequest) {
  const { items } = await request.json() as {
    items: Array<{
      id?: string;
      shop_id: string;
      category: string;
      availability: string;
      price_range_min: number | null;
      price_range_max: number | null;
      notes_en: string | null;
    }>;
  };

  const supabase = createServerClient();

  for (const item of items) {
    if (item.id) {
      const { id, ...rest } = item;
      await supabase.from('shop_inventory').update(rest).eq('id', id);
    } else {
      await supabase.from('shop_inventory').insert(item);
    }
  }

  return NextResponse.json({ ok: true });
}
