---
doc_id: "lua-spec-c8932337be53"
source_path: "game_shop/shop.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: shop.lua"
summary: "Dokumentacja modułu Lua dla game_shop/shop.lua"
tags: ["lua", "module", "otclient"]
---

# game_shop/shop.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla shop.

## Globals/Exports

### `data`

### `offers`

### `HISTORY`

### `CATEGORIES`

### `HISTORY`

### `selectedOffer`

## Functions

### `sendAction(action, data)`

**Parametry:**

- `action`
- `data`

### `init()`

public functions

### `terminate()`

### `check()`

### `hide()`

### `show()`

### `softHide()`

### `showTransfer()`

### `hideTransfer()`

### `toggle()`

### `createShop()`

### `createTransferWindow()`

### `onStoreInit(url, coins)`

**Parametry:**

- `url`
- `coins`

### `onStoreCategories(categories)`

**Parametry:**

- `categories`

### `onStoreOffers(categoryName, offers)`

**Parametry:**

- `categoryName`
- `offers`

### `onStoreTransactionHistory(currentPage, hasNextPage, offers)`

**Parametry:**

- `currentPage`
- `hasNextPage`
- `offers`

### `onStorePurchase(message)`

**Parametry:**

- `message`

### `onStoreError(errorType, message)`

**Parametry:**

- `errorType`
- `message`

### `onCoinBalance(coins, transferableCoins)`

**Parametry:**

- `coins`
- `transferableCoins`

### `transferCoins()`

### `onExtendedJSONOpcode(protocol, code, json_data)`

**Parametry:**

- `protocol`
- `code`
- `json_data`

### `clearOffers()`

### `clearCategories()`

### `clearHistory()`

### `processCategories(data)`

**Parametry:**

- `data`

### `processHistory(data)`

**Parametry:**

- `data`

### `processMessage(data)`

**Parametry:**

- `data`

### `msgWindow.onDestroy(widget)`

**Parametry:**

- `widget`

### `processStatus(data)`

**Parametry:**

- `data`

### `shop.infoPanel.buy.onMouseRelease()`

### `processAd(data)`

**Parametry:**

- `data`

### `shop.adPanel.ad.onMouseRelease()`

### `addCategory(data)`

**Parametry:**

- `data`

### `showHistory(force)`

**Parametry:**

- `force`

### `addOffer(category, data)`

**Parametry:**

- `category`
- `data`

### `offer.buyButton.onClick()`

### `changeCategory(widget, newCategory)`

**Parametry:**

- `widget`
- `newCategory`

### `buyOffer(widget)`

**Parametry:**

- `widget`

### `buyConfirmed()`

### `buyCanceled()`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `shop.categories`

**Wywołanie:** `disconnect(shop.categories, { onChildFocusChange = changeCategory })`

### `displayUI`

**Wywołanie:** `shop = g_ui.displayUI('shop')`

### `shop.categories`

**Wywołanie:** `connect(shop.categories, { onChildFocusChange = changeCategory })`

### `displayUI`

**Wywołanie:** `transferWindow = g_ui.displayUI('transfer')`

### `StoreInit`

**Wywołanie:** `function onStoreInit(url, coins)`

### `StoreCategories`

**Wywołanie:** `function onStoreCategories(categories)`

### `StoreOffers`

**Wywołanie:** `function onStoreOffers(categoryName, offers)`

### `StoreTransactionHistory`

**Wywołanie:** `function onStoreTransactionHistory(currentPage, hasNextPage, offers)`

### `StorePurchase`

**Wywołanie:** `function onStorePurchase(message)`

### `StoreError`

**Wywołanie:** `function onStoreError(errorType, message)`

### `CoinBalance`

**Wywołanie:** `function onCoinBalance(coins, transferableCoins)`

### `ExtendedJSONOpcode`

**Wywołanie:** `function onExtendedJSONOpcode(protocol, code, json_data)`

### `createWidget`

**Wywołanie:** `category = g_ui.createWidget('ShopCategoryItem', shop.categories)`

### `createWidget`

**Wywołanie:** `category = g_ui.createWidget('ShopCategoryCreature', shop.categories)`

### `createWidget`

**Wywołanie:** `category = g_ui.createWidget('ShopCategoryImage', shop.categories)`

### `History`

**Wywołanie:** `g_game.openTransactionHistory(100)`

### `createWidget`

**Wywołanie:** `offer = g_ui.createWidget('ShopOfferItem', shop.offers)`

### `createWidget`

**Wywołanie:** `offer = g_ui.createWidget('ShopOfferCreature', shop.offers)`

### `createWidget`

**Wywołanie:** `offer = g_ui.createWidget('ShopOfferImage', shop.offers)`

### `umber`

**Wywołanie:** `local id = tonumber(newCategory:getId():split("_")[2])`

### `umber`

**Wywołanie:** `local category = tonumber(split[2])`

### `umber`

**Wywołanie:** `local offer = tonumber(split[3])`

### `firmed`

**Wywołanie:** `function buyConfirmed()`
