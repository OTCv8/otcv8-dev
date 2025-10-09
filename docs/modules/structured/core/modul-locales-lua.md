# Modu: Modu: `locales.lua`
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
#### Opis

-- private variables


#### Funkcje

- `createWindow()`
- `selectFirstLocale(name)`
- `init()`
- `terminate()`
- `generateNewTranslationTable(localename)`
- `installLocale(locale)`
- `installLocales(directory)`
- `setLocale(name)`
- `getInstalledLocales()`
- `getCurrentLocale()`
- `_G.tr(text, ...)`


#### Eventy / Hooki

- `addEvent`
- `connect`
- `onClick`
- `onLocaleChanged`
- `onRun`


#### Wywoania API

- `g_ui`
