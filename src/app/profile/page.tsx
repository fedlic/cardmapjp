import ProfileClient from '@/components/ProfileClient';
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Profile | CardMapJP',
  description: 'Your CardMapJP profile and posts.',
};

export default function ProfilePage() {
  return <ProfileClient />;
}
