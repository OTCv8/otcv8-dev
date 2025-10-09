# Modu: Modu: `shop.lua`
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

-- private variables

-- for classic store


#### Funkcje

- `sendAction(action, data)`
- `init()`
- `terminate()`
- `check()`
- `hide()`
- `show()`
- `softHide()`
- `showTransfer()`
- `hideTransfer()`
- `toggle()`
- `createShop()`
- `createTransferWindow()`
- `onStoreInit(url, coins)`
- `onStoreCategories(categories)`
- `onStoreOffers(categoryName, offers)`
- `onStoreTransactionHistory(currentPage, hasNextPage, offers)`
- `onStorePurchase(message)`
- `onStoreError(errorType, message)`
- `onCoinBalance(coins, transferableCoins)`
- `transferCoins()`
- `onExtendedJSONOpcode(protocol, code, json_data)`
- `clearOffers()`
- `clearCategories()`
- `clearHistory()`
- `processCategories(data)`
- `processHistory(data)`
- `processMessage(data)`
- `processStatus(data)`
- `processAd(data)`
- `addCategory(data)`
- `showHistory(force)`
- `addOffer(category, data)`
- `changeCategory(widget, newCategory)`
- `buyOffer(widget)`
- `buyConfirmed()`
- `buyCanceled()`
- `local sendAction(action, data)`


#### Eventy / Hooki

- `connect`
- `onChildFocusChange`
- `onClick`
- `onCoinBalance`
- `onDestroy`
- `onDoubleClick`
- `onExtendedJSONOpcode`
- `onGameEnd`
- `onGameStart`
- `onMouseRelease`
- `onStoreCategories`
- `onStoreError`
- `onStoreInit`
- `onStoreOffers`
- `onStorePurchase`
- `onStoreTransactionHistory`
- `scheduleEvent`


#### Wywoania API

- `g_game`
- `g_ui`

---
