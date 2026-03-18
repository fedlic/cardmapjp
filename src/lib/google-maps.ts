export const DEFAULT_CENTER = { lat: 35.6984, lng: 139.7731 }; // Akihabara
export const DEFAULT_ZOOM = 15;

export function getDirectionsUrl(lat: number, lng: number, name: string) {
  return `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}&destination_place_id=&travelmode=walking`;
}

export function getPlaceUrl(placeId: string) {
  return `https://www.google.com/maps/place/?q=place_id:${placeId}`;
}
