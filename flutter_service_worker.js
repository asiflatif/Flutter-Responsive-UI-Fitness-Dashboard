'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "c71676a9e9d29042e90b8ba25e3d4da2",
"assets/assets/fruits/apple.svg": "3b0383f9e1707a97c104b2072022cdf5",
"assets/assets/fruits/apricot.svg": "c5efd6045378a4bdaac4b22909e98e4c",
"assets/assets/fruits/banana.svg": "f756717cd08192bfd364c1b0802c5056",
"assets/assets/fruits/blueberry.svg": "762f8354f77c2d00e2d231d051d9ec99",
"assets/assets/fruits/carrot.svg": "1f98ff9fe219c470ad691e2adcfbe813",
"assets/assets/fruits/grapes.svg": "e594f28d26a06d739e11d346189cda17",
"assets/assets/fruits/strawberry.svg": "75711263bb54688bc7948721db528d88",
"assets/assets/icons/activity.svg": "a823f2622ada6e0c203223d20586eec5",
"assets/assets/icons/avatar.svg": "466e2b73c20041378dd69037d6a0619b",
"assets/assets/icons/bmi.svg": "c77f7d8d34148b6d33bdf0f4d7a943dc",
"assets/assets/icons/coach1.svg": "e3d1f4e37f8552780d2d59b259e2523c",
"assets/assets/icons/coach2.svg": "33dc4287a52dc969c9e76577f772169d",
"assets/assets/icons/goals.svg": "7ad5231301539db9ddf94a1b914ce7a5",
"assets/assets/icons/heart.svg": "49df4f57b90f5cebe877d303e2183135",
"assets/assets/icons/search.svg": "82ad5e39b306dc6a42809cbeef651e64",
"assets/assets/icons/sleep.svg": "13ebc586697122af2bc3ff359f04e1cd",
"assets/assets/icons/workout.svg": "0c7f2e7656c89bd66c282122e28a4296",
"assets/assets/images/goal.png": "19e02891c053d6f80c4d6ecdbd86f3cc",
"assets/assets/images/heartrate.png": "56c2ab69c1e379c9ed335e63f41e3f53",
"assets/assets/images/nav_img.png": "4111bf8c65dff375f5bd620e6144d5da",
"assets/assets/images/pulse.png": "c80cff16e000f78bfca4f76270224f69",
"assets/assets/images/running.png": "90b3d425849c2c3863871efbf532207d",
"assets/assets/images/walking.png": "f5022878db11f4b773fe0a168d3a5b9c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/NOTICES": "f8ecc79afecc2c439eb06e6e1be3af83",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "0d51396eada8e67b19f4cda3e6b2eb76",
"/": "0d51396eada8e67b19f4cda3e6b2eb76",
"main.dart.js": "ac18250798ea09f5dfd7271c328a66ec",
"manifest.json": "c6aaa97962d7670fec802ea09e020055",
"version.json": "9a12b4026fd0c308c81a06a79e014063"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
