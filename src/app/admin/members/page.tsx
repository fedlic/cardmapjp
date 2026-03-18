'use client';

import { useState, useEffect, useMemo, useCallback } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Badge } from '@/components/ui/badge';
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from '@/components/ui/dialog';
import { useDebounce } from '@/hooks/useDebounce';
import type { AdminUser } from '@/types';

export default function AdminMembersPage() {
  const [members, setMembers] = useState<AdminUser[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');
  const debouncedSearch = useDebounce(search, 200);

  const [banOpen, setBanOpen] = useState(false);
  const [selectedMember, setSelectedMember] = useState<AdminUser | null>(null);
  const [banReason, setBanReason] = useState('');
  const [saving, setSaving] = useState(false);

  const fetchMembers = useCallback(async () => {
    const res = await fetch('/api/admin/members');
    if (res.ok) setMembers(await res.json());
    setLoading(false);
  }, []);

  useEffect(() => { fetchMembers(); }, [fetchMembers]);

  const filtered = useMemo(() => {
    if (!debouncedSearch) return members;
    const q = debouncedSearch.toLowerCase();
    return members.filter(
      (m) =>
        (m.full_name ?? '').toLowerCase().includes(q) ||
        m.email.toLowerCase().includes(q)
    );
  }, [members, debouncedSearch]);

  function openBanDialog(member: AdminUser) {
    setSelectedMember(member);
    setBanReason('');
    setBanOpen(true);
  }

  async function handleBan() {
    if (!selectedMember) return;
    setSaving(true);
    try {
      const res = await fetch(`/api/admin/members/${selectedMember.id}/ban`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ reason: banReason.trim() || null }),
      });
      if (res.ok) {
        setBanOpen(false);
        fetchMembers();
      }
    } finally {
      setSaving(false);
    }
  }

  async function handleUnban(member: AdminUser) {
    const res = await fetch(`/api/admin/members/${member.id}/ban`, {
      method: 'DELETE',
    });
    if (res.ok || res.status === 204) {
      fetchMembers();
    }
  }

  if (loading) {
    return <p className="text-muted-foreground">Loading members...</p>;
  }

  return (
    <div className="space-y-4">
      <h1 className="text-2xl font-bold">Members ({members.length})</h1>

      <Input
        placeholder="Search by name or email..."
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        className="max-w-sm h-9"
      />

      <div className="border rounded-lg overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-gray-50 border-b">
            <tr>
              <th className="text-left p-3 font-medium">User</th>
              <th className="text-left p-3 font-medium hidden sm:table-cell">Reviews</th>
              <th className="text-left p-3 font-medium hidden md:table-cell">Last Active</th>
              <th className="text-left p-3 font-medium hidden md:table-cell">Status</th>
              <th className="p-3 w-24"></th>
            </tr>
          </thead>
          <tbody>
            {filtered.map((member) => (
              <tr key={member.id} className="border-b hover:bg-gray-50">
                <td className="p-3">
                  <div className="flex items-center gap-3">
                    {member.avatar_url ? (
                      <img
                        src={member.avatar_url}
                        alt=""
                        className="w-8 h-8 rounded-full"
                        referrerPolicy="no-referrer"
                      />
                    ) : (
                      <div className="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center text-xs font-medium text-gray-500">
                        {(member.full_name ?? member.email)?.[0]?.toUpperCase() ?? '?'}
                      </div>
                    )}
                    <div>
                      <div className="font-medium">{member.full_name ?? '—'}</div>
                      <div className="text-xs text-muted-foreground">{member.email}</div>
                    </div>
                  </div>
                </td>
                <td className="p-3 hidden sm:table-cell">
                  {member.review_count > 0 ? (
                    <span className="font-medium">{member.review_count}</span>
                  ) : (
                    <span className="text-muted-foreground">0</span>
                  )}
                </td>
                <td className="p-3 hidden md:table-cell text-muted-foreground">
                  {member.last_sign_in_at
                    ? new Date(member.last_sign_in_at).toLocaleDateString()
                    : '—'}
                </td>
                <td className="p-3 hidden md:table-cell">
                  {member.is_banned ? (
                    <Badge variant="secondary" className="bg-red-100 text-red-800">
                      Banned
                    </Badge>
                  ) : (
                    <Badge variant="secondary" className="bg-green-100 text-green-800">
                      Active
                    </Badge>
                  )}
                </td>
                <td className="p-3">
                  {member.is_banned ? (
                    <Button
                      variant="ghost"
                      size="sm"
                      className="text-green-600 hover:text-green-700"
                      onClick={() => handleUnban(member)}
                    >
                      Unban
                    </Button>
                  ) : (
                    <Button
                      variant="ghost"
                      size="sm"
                      className="text-red-600 hover:text-red-700"
                      onClick={() => openBanDialog(member)}
                    >
                      Ban
                    </Button>
                  )}
                </td>
              </tr>
            ))}
            {filtered.length === 0 && (
              <tr>
                <td colSpan={5} className="p-6 text-center text-muted-foreground">
                  No members found.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

      {/* Ban Confirmation Dialog */}
      <Dialog open={banOpen} onOpenChange={setBanOpen}>
        <DialogContent className="max-w-sm">
          <DialogHeader>
            <DialogTitle>Ban User</DialogTitle>
          </DialogHeader>
          <p className="text-sm">
            Ban <strong>{selectedMember?.full_name ?? selectedMember?.email}</strong> from submitting reviews?
          </p>
          <div>
            <label className="text-xs font-medium text-muted-foreground">Reason (optional)</label>
            <textarea
              value={banReason}
              onChange={(e) => setBanReason(e.target.value)}
              placeholder="Reason for ban..."
              rows={2}
              className="w-full rounded border px-3 py-2 text-sm resize-none focus:outline-none focus:ring-2 focus:ring-[#E3350D]/50 mt-1"
            />
          </div>
          <DialogFooter>
            <Button variant="outline" onClick={() => setBanOpen(false)}>
              Cancel
            </Button>
            <Button
              variant="destructive"
              onClick={handleBan}
              disabled={saving}
            >
              {saving ? 'Banning...' : 'Ban User'}
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </div>
  );
}
