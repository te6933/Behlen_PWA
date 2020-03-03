const cacheName = 'aim-v1'
const staticAssets = [
        './',
        './AimDocViewer.aspx',
        './AimForm.aspx',
        './index.js',
        './manifest1.webmanifest',
        './ImageUpload.aspx',
        './Default.aspx',
        './Images/AimLogo-192X192.png',
        './Images/AimLogo-512x512.png',
        './Images/Behlen_Logo_WBG.png',
        './bonus.cs',
        './admin.cs',
        './Documents.cs',
        './EmpChart.aspx',
        './IdeaList.cs',
        './ideas.cs',
        './index.aspx',
        './MySqlConnection.cs',
        './MySqlConnections.cs',
        './points.cs',
        './preliminary.cs',
        './ReadMySql.aspx',
        './savings.cs',
        './SubBonus.aspx',
        './SubIdeaList.cs',
        './SubIdeas.aspx',
        './SubMainIdea.aspx',
        './SubPoints.aspx',
        './SubPreAssign.aspx',
        './SubSavings.aspx',
        './WriteMySql.cs'
];

self.addEventListener('install', async e => {
    const cache = await caches.open(cacheName);
    await cache.addAll(staticAssets);
    //return self.skipWaiting();
});

self.addEventListener('activate', async e => {
    self.clients.claim();
});

self.addEventListener('fetch', async e => {
    const req = e.request;
    const url = new URL(req.url);

    if (url.origin == location.origin) {
        e.respondWith(cacheFirst(req));
    } else {
        e.respondWith(networkAndCache(req));
    }
});

async function cacheFirst(req) {
    const cache = await caches.open(cacheName);
    const cached = await cache.match(req);
    return cached || fetch(req);
}

async function networkAndCache(req) {
    const cache = await caches.open(cacheName);
    try {
        const fresh = await fetch(req);
        await cache.put(req, fresh.clone());
        return fresh;
    } catch (e) {
        const cached = await cache.match(req);
        return cached;
    }
}