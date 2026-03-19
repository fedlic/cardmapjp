interface AISummaryProps {
  summary: string | null;
  tips: string | null;
}

export default function AISummary({ summary, tips }: AISummaryProps) {
  if (!summary && !tips) return null;

  return (
    <div className="space-y-4">
      {summary && (
        <div className="bg-[#FFFBEB] rounded-lg p-4">
          <p className="text-xs font-medium text-gray-400 mb-2">AI Summary</p>
          <p className="text-sm italic text-gray-700 leading-relaxed">{summary}</p>
        </div>
      )}

      {tips && (
        <div className="bg-[#FEF9C3] rounded-lg p-4">
          <p className="text-xs font-medium text-gray-500 mb-2">Visitor Tips</p>
          <div className="text-sm text-gray-700 leading-relaxed whitespace-pre-line">{tips}</div>
        </div>
      )}
    </div>
  );
}
