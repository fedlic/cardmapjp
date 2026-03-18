'use client';

import { useState, useCallback, useEffect } from 'react';

const FAVORITES_KEY = 'cardmapjp_favorites';
const VISITED_KEY = 'cardmapjp_visited';

function readIds(key: string): Set<string> {
  if (typeof window === 'undefined') return new Set();
  try {
    const raw = localStorage.getItem(key);
    return raw ? new Set(JSON.parse(raw)) : new Set();
  } catch {
    return new Set();
  }
}

function writeIds(key: string, ids: Set<string>) {
  localStorage.setItem(key, JSON.stringify([...ids]));
}

export interface UseShopPreferencesReturn {
  favorites: Set<string>;
  visited: Set<string>;
  toggleFavorite: (shopId: string) => void;
  toggleVisited: (shopId: string) => void;
  isFavorite: (shopId: string) => boolean;
  isVisited: (shopId: string) => boolean;
  favoritesCount: number;
  visitedCount: number;
}

export function useShopPreferences(): UseShopPreferencesReturn {
  const [favorites, setFavorites] = useState<Set<string>>(new Set());
  const [visited, setVisited] = useState<Set<string>>(new Set());

  useEffect(() => {
    setFavorites(readIds(FAVORITES_KEY));
    setVisited(readIds(VISITED_KEY));
  }, []);

  const toggleFavorite = useCallback((shopId: string) => {
    setFavorites((prev) => {
      const next = new Set(prev);
      if (next.has(shopId)) {
        next.delete(shopId);
      } else {
        next.add(shopId);
      }
      writeIds(FAVORITES_KEY, next);
      return next;
    });
  }, []);

  const toggleVisited = useCallback((shopId: string) => {
    setVisited((prev) => {
      const next = new Set(prev);
      if (next.has(shopId)) {
        next.delete(shopId);
      } else {
        next.add(shopId);
      }
      writeIds(VISITED_KEY, next);
      return next;
    });
  }, []);

  const isFavorite = useCallback((shopId: string) => favorites.has(shopId), [favorites]);
  const isVisited = useCallback((shopId: string) => visited.has(shopId), [visited]);

  return {
    favorites,
    visited,
    toggleFavorite,
    toggleVisited,
    isFavorite,
    isVisited,
    favoritesCount: favorites.size,
    visitedCount: visited.size,
  };
}
