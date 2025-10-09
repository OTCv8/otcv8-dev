# Modu: Modu: `http.lua`
**Rola:** *(krtko  13 zdania co robi modu i gdzie jest uywany).*

## Zakres
-

## Punkty wejcia
- **Lua:**
- **C++/IPC:**

## UI / OTUI
- Pliki OTUI:
- Kluczowe widety:

## Integracje i zalenoci
- Wsppracuje z:

## Scenariusze
1.
2.

## API (linki)
- [API Lua  klient](../../api/lua/luafunctions_client.md)
- [Engine  Spec UI](../../api/engine/otclient_v_8_specyfikacja_ui.md)

---

> **Uwagi migracyjne**
>
> Ten modu pochodzi z: modules/modules_core.md

### Zaimportowana tre (legacy)
#### Funkcje

- `HTTP.get(url, callback)`
- `HTTP.getJSON(url, callback)`
- `HTTP.post(url, data, callback)`
- `HTTP.postJSON(url, data, callback)`
- `HTTP.download(url, file, callback, progressCallback)`
- `HTTP.downloadImage(url, callback)`
- `HTTP.webSocket(url, callbacks, timeout, jsonWebsocket)`
- `HTTP.webSocketJSON(url, callbacks, timeout)`
- `HTTP.cancel(operationId)`
- `HTTP.onGet(operationId, url, err, data)`
- `HTTP.onGetProgress(operationId, url, progress)`
- `HTTP.onPost(operationId, url, err, data)`
- `HTTP.onPostProgress(operationId, url, progress)`
- `HTTP.onDownload(operationId, url, err, path, checksum)`
- `HTTP.onDownloadProgress(operationId, url, progress, speed)`
- `HTTP.onWsOpen(operationId, message)`
- `HTTP.onWsMessage(operationId, message)`
- `HTTP.onWsClose(operationId, message)`
- `HTTP.onWsError(operationId, message)`


#### Eventy / Hooki

- `connect`
- `onClose`
- `onDownload`
- `onDownloadProgress`
- `onError`
- `onGet`
- `onGetProgress`
- `onMessage`
- `onOpen`
- `onPost`
- `onPostProgress`
- `onWsClose`
- `onWsError`
- `onWsMessage`
- `onWsOpen`
