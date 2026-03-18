'use client';

import { useState, useCallback } from 'react';

export interface GeoPosition {
  lat: number;
  lng: number;
}

export type GeoStatus = 'idle' | 'loading' | 'success' | 'denied' | 'unavailable' | 'timeout';

export function useGeolocation() {
  const [position, setPosition] = useState<GeoPosition | null>(null);
  const [status, setStatus] = useState<GeoStatus>('idle');
  const [error, setError] = useState<string | null>(null);

  const requestLocation = useCallback(() => {
    if (!navigator.geolocation) {
      setStatus('unavailable');
      setError('Geolocation is not supported by your browser');
      return;
    }

    setStatus('loading');
    setError(null);

    navigator.geolocation.getCurrentPosition(
      (pos) => {
        setPosition({ lat: pos.coords.latitude, lng: pos.coords.longitude });
        setStatus('success');
      },
      (err) => {
        switch (err.code) {
          case err.PERMISSION_DENIED:
            setStatus('denied');
            setError('Location permission denied');
            break;
          case err.POSITION_UNAVAILABLE:
            setStatus('unavailable');
            setError('Location unavailable');
            break;
          case err.TIMEOUT:
            setStatus('timeout');
            setError('Location request timed out');
            break;
        }
      },
      { enableHighAccuracy: true, timeout: 10000, maximumAge: 60000 },
    );
  }, []);

  const clearLocation = useCallback(() => {
    setPosition(null);
    setStatus('idle');
    setError(null);
  }, []);

  return { position, status, error, requestLocation, clearLocation };
}
