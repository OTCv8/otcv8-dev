# Modu: Modu: `updater.lua`
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
> Ten modu pochodzi z: modules/modules_misc.md

### Zaimportowana tre (legacy)
#### Opis

--


#### Funkcje

- `onLog(level, message, time)`
- `initAppWindow()`
- `loadModules()`
- `downloadFiles(url, files, index, retries, doneCallback)`
- `updateFiles(data, keepCurrentFiles)`
- `Updater.init(loadModulesFunc)`
- `Updater.terminate()`
- `Updater.abort()`
- `Updater.check(args)`
- `progressUpdater(value)`
- `Updater.error(message)`
- `Updater.changeUrl()`
- `local onLog(level, message, time)`
- `local initAppWindow()`
- `local loadModules()`
- `local downloadFiles(url, files, index, retries, doneCallback)`
- `local updateFiles(data, keepCurrentFiles)`
- `local progressUpdater(value)`


#### Eventy / Hooki

- `onLog`
- `onOk`
- `scheduleEvent`


#### Wywoania API

- `g_ui`
- `g_window`
