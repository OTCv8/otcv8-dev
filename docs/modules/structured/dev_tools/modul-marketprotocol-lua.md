# Modu: Modu: `marketprotocol.lua`
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

-- private functions


#### Funkcje

- `send(msg)`
- `readMarketOffer(msg, action, var)`
- `parseMarketEnter(protocol, msg)`
- `parseMarketLeave(protocol, msg)`
- `parseMarketDetail(protocol, msg)`
- `parseMarketBrowse(protocol, msg)`
- `initProtocol()`
- `terminateProtocol()`
- `MarketProtocol.updateProtocol(_protocol)`
- `MarketProtocol.registerProtocol()`
- `MarketProtocol.unregisterProtocol()`
- `MarketProtocol.silent(mode)`
- `MarketProtocol.sendMarketLeave()`
- `MarketProtocol.sendMarketBrowse(browseId)`
- `MarketProtocol.sendMarketBrowseMyOffers()`
- `MarketProtocol.sendMarketBrowseMyHistory()`
- `MarketProtocol.sendMarketCreateOffer(type, spriteId, amount, price, anonymous)`
- `MarketProtocol.sendMarketCancelOffer(timestamp, counter)`
- `MarketProtocol.sendMarketAcceptOffer(timestamp, counter, amount)`
- `local send(msg)`
- `local readMarketOffer(msg, action, var)`
- `local parseMarketEnter(protocol, msg)`
- `local parseMarketLeave(protocol, msg)`
- `local parseMarketDetail(protocol, msg)`
- `local parseMarketBrowse(protocol, msg)`


#### Eventy / Hooki

- `connect`
- `onGameEnd`
- `onGameStart`
- `onMarketBrowse`
- `onMarketDetail`
- `onMarketEnter`
- `onMarketLeave`


#### Wywoania API

- `g_game`
