import { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'jp.cardmap.app',
  appName: 'CardMap JP',
  webDir: 'out',
  server: {
    url: 'https://cardmapjp.vercel.app',
    cleartext: false,
  },
};

export default config;
