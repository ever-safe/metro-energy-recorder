const CACHE = "energy-v3";
self.addEventListener("install", () => self.skipWaiting());
self.addEventListener("activate", e => e.waitUntil((async () => {
  await clients.claim();
  const keys = await caches.keys();
  await Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k)));
})()));
async function handle(req) {
  if (req.method !== "GET") return;
  if (req.mode === "navigate") {
    const network = fetch(req).then(resp => {
      const copy = resp.clone();
      caches.open(CACHE).then(c => c.put(req, copy)).catch(() => {});
      return resp;
    }).catch(() => caches.match(req));
    return network;
  }
  const cache = await caches.open(CACHE);
  const cached = await cache.match(req);
  const network = fetch(req).then(resp => {
    if (resp.ok) cache.put(req, resp.clone());
    return resp;
  }).catch(() => cached || new Response("offline", { status: 503 }));
  return cached || network;
}
self.addEventListener("fetch", e => {
  if (e.request.method !== "GET") return;
  e.respondWith(handle(e.request));
});
