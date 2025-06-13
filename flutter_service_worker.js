'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "89aa222f494c4fdb9dece6482432495d",
"version.json": "b45daa7956316a890126133b20b0f088",
"index.html": "b5a124c6db1de45d511d2a51871aa712",
"/": "b5a124c6db1de45d511d2a51871aa712",
"main.dart.js": "b5dd35ed90a1e74e8d182142c626f0bb",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "3aca8cbdbab430567cfb023b5abb6cea",
"assets/AssetManifest.json": "4459b5ff708fd1450c219704cd233a06",
"assets/NOTICES": "5935d2a1d4316612b70f2cebb2233f3f",
"assets/FontManifest.json": "7f1db583dcf68730e7a0c0ac673fcc3f",
"assets/AssetManifest.bin.json": "d755b698c9b1a4093cc4a17d7cbaa934",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "0ae9c2096db32b84a2ac6aa498057525",
"assets/fonts/MaterialIcons-Regular.otf": "91892f1325fa73123cd895f118f5d566",
"assets/assets/svg/floors_plan.svg": "fac482020244a87cd622ce8861590b87",
"assets/assets/svg/logout.svg": "2ba206f72d3d6102d26f1f0904cef174",
"assets/assets/svg/instagram_icon.svg": "1b608b9dffc7158772e953034abf7b50",
"assets/assets/svg/wp_icon.svg": "5732df48ccc6a290d8007cceb08f8e7c",
"assets/assets/svg/bill_icon.svg": "412df6bdced828e093093486d40e88a9",
"assets/assets/svg/tds_icon.svg": "6f34102c1d4c37831e376df48b460539",
"assets/assets/svg/bills_back.svg": "ca1b8ac34760e146708dee7b37dfc611",
"assets/assets/svg/expences%25201.svg": "f13bb4642c4adfbe8555aecb78919c1b",
"assets/assets/svg/build1.svg": "33974aaf9e13767e37c1a8b8405d8fc0",
"assets/assets/svg/gst_icon.svg": "161a7e2d99e7a7eb3f2d95553ce02cd4",
"assets/assets/svg/twitter_icon.svg": "5b6a267741e6abc94d804e65c3082f80",
"assets/assets/svg/build3.svg": "a89f02b5ec0ce45215968fb6003ec768",
"assets/assets/svg/build2.svg": "b6f344273c2d55fcf2abba5f9ea42c5e",
"assets/assets/svg/project_icon.svg": "4052462026f08df3f979829bb3f6b18d",
"assets/assets/svg/true_icon.svg": "bee9f83c0082a255fa7162249cb9a052",
"assets/assets/svg/bills_back_3.svg": "73b859f4cab85d6ec4ec4574a4a869b2",
"assets/assets/svg/discord_icon.svg": "9d595b390f2eb24072f1040cefd9bc5a",
"assets/assets/svg/parties_icon.svg": "a6b1c983c24e4fa55f25245dddbd2db0",
"assets/assets/svg/user1.svg": "5dcbff554493741fc190ec7bad49d6ae",
"assets/assets/svg/more_vert.svg": "df68e9b3a7a9f8226e7560172a10d4bb",
"assets/assets/svg/user2.svg": "aea6eec36a28a8055e50c5d5243b2d6f",
"assets/assets/svg/bxs_phone-call.svg": "616f2970d56b8d608dc872065043b385",
"assets/assets/svg/user3.svg": "9137981c92f19b3796b2d80afba984bb",
"assets/assets/svg/remaining.svg": "6fcb1db5a3d2363330a6ff3f511780e0",
"assets/assets/images/m3.png": "59f4ae8de5c1182b4f6b58cd2046607e",
"assets/assets/images/tds_icon.png": "e854fa6da2c2e0872c429b7cee10a258",
"assets/assets/images/m2.png": "e170e4378273f65ac32cb3c2c1f7d96b",
"assets/assets/images/m1.png": "9be31ede2a4f87ad79352b1b0d99aece",
"assets/assets/images/m4.png": "f659f58f6da58dd9323a494bd762193b",
"assets/assets/images/wp_icon.png": "b0fe971be7a8b65827d31ca1afbac605",
"assets/assets/images/r2.png": "ae446288dfd152a18908bcf96c6e990d",
"assets/assets/images/r3.png": "25e192e06efba0185d650a268b4f20a6",
"assets/assets/images/r1.png": "e43ec92ce8bcb47a353b61b07aff81fd",
"assets/assets/images/r4.png": "3d787fc18d11e9ed4cef240cc2c2560f",
"assets/assets/images/floors_plan.png": "ff443152d355623817d988a5ee04f634",
"assets/assets/images/waving_hand.png": "5da2d7f94235ef097ee635522db71ec4",
"assets/assets/images/user3.png": "72f03ad72deb643213298380647b4323",
"assets/assets/images/user2.png": "83db98f614d02620dc02dbdff4323250",
"assets/assets/images/user1.png": "f6812d33b3b720fdef4ed742fe8f649b",
"assets/assets/images/onboard3.png": "7842dcb1b2a4c7411312dcbfc2961af8",
"assets/assets/images/onboard2.png": "64f355f503f2cd9fbf216edd94719c63",
"assets/assets/images/linkedin.png": "a96fa7c75c4fdd1566e75663faa2d41d",
"assets/assets/images/onboard1.png": "330bfcfdbb4b5406e83f2795f9ec72ae",
"assets/assets/images/4build.png": "94f990aa3ac919583d03a3caff2df4f4",
"assets/assets/images/b3.png": "ce74844c32bfe53b28237f999a0a9364",
"assets/assets/images/crown.png": "fa5d8c349e0699b5fc8928baf4a823f9",
"assets/assets/images/b2.png": "0c583bf94860f85fe48fd8f48c899963",
"assets/assets/images/expences_icon.png": "380e685c3706bc86108ec8c2214add69",
"assets/assets/images/gst_icon.png": "f8b8e02a4ae95711a7d07a00749ca34a",
"assets/assets/images/b1.png": "8e8292633d94bbf7b2ec4b2718e41e01",
"assets/assets/images/assets.png": "2ad221dbf2cec6d2922200ee2793fbe5",
"assets/assets/logos/s2p.jpeg": "2c3d238f355043ffe2a4a0597543cf85",
"assets/assets/logos/bill.png": "d3782df65e8021ba62c11d722c0c89d8",
"assets/assets/json/subscription.json": "d060f8664a5515bb755bc197840d356f",
"assets/assets/json/construction_anim.json": "dc97ef2653e2f53a89be90095f8c079b",
"assets/assets/fonts/Roboto-Medium.ttf": "68ea4734cf86bd544650aee05137d7bb",
"assets/assets/fonts/popins/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/fonts/popins/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/popins/Poppins-ExtraBold.ttf": "d45bdbc2d4a98c1ecb17821a1dbbd3a4",
"assets/assets/fonts/popins/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/popins/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/popins/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/assets/fonts/popins/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/assets/fonts/Roboto-Light.ttf": "881e150ab929e26d1f812c4342c15a7c",
"assets/assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/assets/fonts/Roboto-MediumItalic.ttf": "c16d19c2c0fd1278390a82fc245f4923",
"assets/assets/fonts/monteserrat/Montserrat-LightItalic.ttf": "c54486c33610a1fca147afc18af3034f",
"assets/assets/fonts/monteserrat/Montserrat-Medium.ttf": "bdb7ba651b7bdcda6ce527b3b6705334",
"assets/assets/fonts/monteserrat/Montserrat-BoldItalic.ttf": "a49032b6a945b021303f16b664f87e6c",
"assets/assets/fonts/monteserrat/Montserrat-Light.ttf": "94fbe93542f684134cad1d775947ca92",
"assets/assets/fonts/monteserrat/Montserrat-ThinItalic.ttf": "ff9c45e92d16324b8964447d12d1f458",
"assets/assets/fonts/monteserrat/Montserrat-ExtraLight.ttf": "a7fe50578d9aa3966c925cb9722db03a",
"assets/assets/fonts/monteserrat/Montserrat-Thin.ttf": "b3638b16904211d1d24d04ce53810c4d",
"assets/assets/fonts/monteserrat/Montserrat-Bold.ttf": "ed86af2ed5bbaf879e9f2ec2e2eac929",
"assets/assets/fonts/monteserrat/Montserrat-MediumItalic.ttf": "2ed625fc9f039d801a5aab9b6f9cd8ef",
"assets/assets/fonts/monteserrat/Montserrat-BlackItalic.ttf": "a67f4df02f4d73bb8bfd5bff421e4d1f",
"assets/assets/fonts/monteserrat/Montserrat-SemiBold.ttf": "cc10461cb5e0a6f2621c7179f4d6de17",
"assets/assets/fonts/monteserrat/Montserrat-ExtraLightItalic.ttf": "9c3e2f21cc8fba26dc3da67e89a9365d",
"assets/assets/fonts/monteserrat/Montserrat-ExtraBold.ttf": "9e07cac927a9b4d955e2138bf6136d6a",
"assets/assets/fonts/monteserrat/Montserrat-Black.ttf": "cce7ff8c1d7999f907b6760fbe75d99d",
"assets/assets/fonts/monteserrat/Montserrat-Regular.ttf": "5e077c15f6e1d334dd4e9be62b28ac75",
"assets/assets/fonts/monteserrat/Montserrat-Italic.ttf": "cc53ad8bb1c801746c831bb7ce493f74",
"assets/assets/fonts/monteserrat/Montserrat-SemiBoldItalic.ttf": "75c4176c64611f32faf01a5de7631877",
"assets/assets/fonts/monteserrat/Montserrat-ExtraBoldItalic.ttf": "8a4a6844448e210672d54f8b32932ee9",
"assets/assets/fonts/inter/Inter_18pt-ExtraBold.ttf": "a6ed481bff60bc9270904d214947ab13",
"assets/assets/fonts/inter/Inter_18pt-Bold.ttf": "7ef6f6d68c7fedc103180f2254985e8c",
"assets/assets/fonts/inter/Inter_18pt-Medium.ttf": "8540f35bf8acd509b9ce356f1111e983",
"assets/assets/fonts/inter/Inter_18pt-Light.ttf": "dfaec8b8820224135d07f1b409ceb214",
"assets/assets/fonts/inter/Inter_18pt-SemiBold.ttf": "e5532d993e2de30fa92422df0a8849dd",
"assets/assets/fonts/inter/Inter_18pt-Regular.ttf": "37dcabff629c3690303739be2e0b3524",
"assets/assets/fonts/Roboto-ThinItalic.ttf": "7bcadd0675fe47d69c2d8aaef683416f",
"assets/assets/fonts/Roboto-BoldItalic.ttf": "fd6e9700781c4aaae877999d09db9e09",
"assets/assets/fonts/Roboto-LightItalic.ttf": "5788d5ce921d7a9b4fa0eaa9bf7fec8d",
"assets/assets/fonts/Roboto-Italic.ttf": "cebd892d1acfcc455f5e52d4104f2719",
"assets/assets/fonts/LICENSE.txt": "3b83ef96387f14655fc854ddc3c6bd57",
"assets/assets/fonts/Roboto-BlackItalic.ttf": "c3332e3b8feff748ecb0c6cb75d65eae",
"assets/assets/fonts/Roboto-Bold.ttf": "b8e42971dec8d49207a8c8e2b919a6ac",
"assets/assets/fonts/Roboto-Thin.ttf": "66209ae01f484e46679622dd607fcbc5",
"assets/assets/fonts/Roboto-Black.ttf": "d6a6f8878adb0d8e69f9fa2e0b622924",
"bill.png": "d3782df65e8021ba62c11d722c0c89d8",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
