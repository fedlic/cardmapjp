import Anthropic from '@anthropic-ai/sdk';

const anthropic = new Anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY!,
});

export async function generateShopSummary(
  shopName: string,
  reviews: string[]
): Promise<{ ai_summary: string; visitor_tips: string }> {
  const prompt = `You are helping foreign tourists find Pokémon card shops in Japan.
Based on these Google Maps reviews for "${shopName}", write:

1. ai_summary: A 2-3 sentence English description of this shop.
   Focus on: what they sell, shop atmosphere, who it's good for.

2. visitor_tips: 3-4 practical bullet points for foreign visitors.
   Include: payment methods, English support, how to navigate the shop,
   any special features (PSA cases, binder system, etc.)

Reviews:
${reviews.join('\n---\n')}

Respond in JSON: { "ai_summary": "...", "visitor_tips": "..." }`;

  const message = await anthropic.messages.create({
    model: 'claude-sonnet-4-20250514',
    max_tokens: 1024,
    messages: [{ role: 'user', content: prompt }],
  });

  const text = message.content[0].type === 'text' ? message.content[0].text : '';
  const jsonMatch = text.match(/\{[\s\S]*\}/);
  if (!jsonMatch) throw new Error('Failed to parse AI response');

  return JSON.parse(jsonMatch[0]);
}
