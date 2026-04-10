'use client';

import { useEffect } from 'react';

export default function AdSenseScript() {
  useEffect(() => {
    const id = 'adsense-script';
    if (document.getElementById(id)) return;

    const script = document.createElement('script');
    script.id = id;
    script.async = true;
    script.crossOrigin = 'anonymous';
    script.src =
      'https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-8620642498629308';
    document.head.appendChild(script);
  }, []);

  return null;
}
