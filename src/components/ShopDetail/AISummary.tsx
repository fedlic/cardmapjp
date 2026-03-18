import { Card, CardContent } from '@/components/ui/card';

interface AISummaryProps {
  summary: string | null;
  tips: string | null;
}

export default function AISummary({ summary, tips }: AISummaryProps) {
  if (!summary && !tips) return null;

  return (
    <div className="space-y-4">
      {summary && (
        <Card className="border-[#FFCB05] bg-[#FFCB05]/5">
          <CardContent className="p-4">
            <h2 className="font-semibold text-sm text-muted-foreground mb-2">
              AI Summary
            </h2>
            <p className="italic text-sm leading-relaxed">{summary}</p>
          </CardContent>
        </Card>
      )}

      {tips && (
        <Card>
          <CardContent className="p-4">
            <h2 className="font-semibold mb-2">Visitor Tips</h2>
            <div className="text-sm leading-relaxed whitespace-pre-line">
              {tips}
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
