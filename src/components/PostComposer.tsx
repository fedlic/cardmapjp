'use client';

import { useState, useRef } from 'react';
import { X, ImagePlus, MapPin } from 'lucide-react';
import ShopPicker from './ShopPicker';
import { createPost, uploadPostImage } from '@/lib/supabase/queries/posts';

interface ShopOption {
  id: string;
  name_en: string;
  name_jp: string;
}

interface PostComposerProps {
  userId: string;
  shops: ShopOption[];
  onClose: () => void;
  onCreated: () => void;
}

export default function PostComposer({ userId, shops, onClose, onCreated }: PostComposerProps) {
  const [postType, setPostType] = useState<'spot' | 'haul'>('spot');
  const [body, setBody] = useState('');
  const [selectedShop, setSelectedShop] = useState<ShopOption | null>(null);
  const [images, setImages] = useState<File[]>([]);
  const [previews, setPreviews] = useState<string[]>([]);
  const [showShopPicker, setShowShopPicker] = useState(false);
  const [isPosting, setIsPosting] = useState(false);
  const fileRef = useRef<HTMLInputElement>(null);

  const handleImageSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = Array.from(e.target.files || []);
    const remaining = 4 - images.length;
    const newFiles = files.slice(0, remaining);
    setImages((prev) => [...prev, ...newFiles]);
    newFiles.forEach((f) => {
      const reader = new FileReader();
      reader.onload = (ev) => {
        setPreviews((prev) => [...prev, ev.target?.result as string]);
      };
      reader.readAsDataURL(f);
    });
  };

  const removeImage = (index: number) => {
    setImages((prev) => prev.filter((_, i) => i !== index));
    setPreviews((prev) => prev.filter((_, i) => i !== index));
  };

  const handleSubmit = async () => {
    if (!selectedShop || !body.trim()) return;
    setIsPosting(true);
    try {
      const imageUrls: string[] = [];
      for (const file of images) {
        const url = await uploadPostImage(file, userId);
        imageUrls.push(url);
      }
      await createPost(userId, {
        shop_id: selectedShop.id,
        post_type: postType,
        body: body.trim(),
        image_urls: imageUrls,
        lat: null,
        lng: null,
      });
      onCreated();
      onClose();
    } catch (err) {
      console.error('Failed to create post:', err);
      alert('Failed to create post. Please try again.');
    } finally {
      setIsPosting(false);
    }
  };

  const canSubmit = selectedShop && body.trim() && !isPosting;

  return (
    <>
      <div className="fixed inset-0 bg-black/50 z-50 flex items-end sm:items-center justify-center">
        <div className="bg-white w-full sm:max-w-lg sm:rounded-xl rounded-t-xl max-h-[90vh] flex flex-col">
          {/* Header */}
          <div className="flex items-center justify-between p-4 border-b">
            <button onClick={onClose} className="text-sm text-gray-500">Cancel</button>
            <h3 className="font-semibold">New Post</h3>
            <button
              onClick={handleSubmit}
              disabled={!canSubmit}
              className={`text-sm font-semibold px-4 py-1.5 rounded-full ${
                canSubmit
                  ? 'bg-[#E3350D] text-white'
                  : 'bg-gray-200 text-gray-400'
              }`}
            >
              {isPosting ? 'Posting...' : 'Post'}
            </button>
          </div>

          <div className="flex-1 overflow-y-auto p-4 space-y-4">
            {/* Post type */}
            <div className="flex gap-2">
              {(['spot', 'haul'] as const).map((type) => (
                <button
                  key={type}
                  onClick={() => setPostType(type)}
                  className={`px-4 py-1.5 rounded-full text-sm font-medium transition-colors ${
                    postType === type
                      ? type === 'spot' ? 'bg-blue-100 text-blue-700' : 'bg-amber-100 text-amber-700'
                      : 'bg-gray-100 text-gray-500'
                  }`}
                >
                  {type === 'spot' ? 'Spot Report' : 'Haul'}
                </button>
              ))}
            </div>

            {/* Shop selection */}
            <button
              onClick={() => setShowShopPicker(true)}
              className="w-full flex items-center gap-2 px-3 py-2.5 border rounded-lg text-sm"
            >
              <MapPin className="size-4 text-[#E3350D]" />
              {selectedShop ? (
                <span className="font-medium">{selectedShop.name_en}</span>
              ) : (
                <span className="text-gray-400">Select a shop</span>
              )}
            </button>

            {/* Body */}
            <textarea
              value={body}
              onChange={(e) => setBody(e.target.value)}
              placeholder={postType === 'spot' ? "What did you find at this shop?" : "Show off your haul!"}
              rows={4}
              className="w-full border rounded-lg p-3 text-sm resize-none focus:outline-none focus:ring-2 focus:ring-[#E3350D]/30"
            />

            {/* Images */}
            <div className="flex gap-2 flex-wrap">
              {previews.map((src, i) => (
                <div key={i} className="relative">
                  <img src={src} alt="" className="w-20 h-20 object-cover rounded-lg" />
                  <button
                    onClick={() => removeImage(i)}
                    className="absolute -top-1.5 -right-1.5 bg-black/70 text-white rounded-full p-0.5"
                  >
                    <X className="size-3" />
                  </button>
                </div>
              ))}
              {images.length < 4 && (
                <button
                  onClick={() => fileRef.current?.click()}
                  className="w-20 h-20 border-2 border-dashed border-gray-200 rounded-lg flex items-center justify-center text-gray-400 hover:border-[#E3350D] hover:text-[#E3350D] transition-colors"
                >
                  <ImagePlus className="size-5" />
                </button>
              )}
            </div>
            <input
              ref={fileRef}
              type="file"
              accept="image/*"
              multiple
              onChange={handleImageSelect}
              className="hidden"
            />
          </div>
        </div>
      </div>

      {showShopPicker && (
        <ShopPicker
          shops={shops}
          onSelect={(shop) => {
            setSelectedShop(shop);
            setShowShopPicker(false);
          }}
          onClose={() => setShowShopPicker(false)}
        />
      )}
    </>
  );
}
