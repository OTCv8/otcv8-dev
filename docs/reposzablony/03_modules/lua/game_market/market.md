---
doc_id: "lua-spec-ad1cff3aeb78"
source_path: "game_market/market.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: market.lua"
summary: "Dokumentacja modułu Lua dla game_market/market.lua"
tags: ["lua", "module", "otclient"]
---

# game_market/market.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla market.

## Globals/Exports

### `Market`

### `selectedOffer`

### `selectedMyOffer`

### `filterButtons`

### `offerExhaust`

### `marketOffers`

### `marketItems`

### `marketItemNames`

### `information`

### `currentItems`

### `currentItems`

### `marketItemNames`

## Functions

### `isItemValid(item, category, searchFilter)`

**Parametry:**

- `item`
- `category`
- `searchFilter`

### `clearItems()`

### `clearOffers()`

### `clearMyOffers()`

### `clearFilters()`

### `clearFee()`

### `refreshTypeList()`

### `addOffer(offer, offerType)`

**Parametry:**

- `offer`
- `offerType`

### `mergeOffer(offer)`

**Parametry:**

- `offer`

### `updateOffers(offers)`

**Parametry:**

- `offers`

### `updateHistoryOffers(offers)`

**Parametry:**

- `offers`

### `updateDetails(itemId, descriptions, purchaseStats, saleStats)`

**Parametry:**

- `itemId`
- `descriptions`
- `purchaseStats`
- `saleStats`

### `updateSelectedItem(widget)`

**Parametry:**

- `widget`

### `updateBalance(balance)`

**Parametry:**

- `balance`

### `updateFee(price, amount)`

**Parametry:**

- `price`
- `amount`

### `destroyAmountWindow()`

### `cancelMyOffer(actionType)`

**Parametry:**

- `actionType`

### `openAmountWindow(callback, actionType, actionText)`

**Parametry:**

- `callback`
- `actionType`
- `actionText`

### `scrollbar.onValueChange(widget, value)`

**Parametry:**

- `widget`
- `value`

### `onSelectSellOffer(table, selectedRow, previousSelectedRow)`

**Parametry:**

- `table`
- `selectedRow`
- `previousSelectedRow`

### `onSelectBuyOffer(table, selectedRow, previousSelectedRow)`

**Parametry:**

- `table`
- `selectedRow`
- `previousSelectedRow`

### `onSelectMyBuyOffer(table, selectedRow, previousSelectedRow)`

**Parametry:**

- `table`
- `selectedRow`
- `previousSelectedRow`

### `onSelectMySellOffer(table, selectedRow, previousSelectedRow)`

**Parametry:**

- `table`
- `selectedRow`
- `previousSelectedRow`

### `onChangeCategory(combobox, option)`

**Parametry:**

- `combobox`
- `option`

### `onChangeSubCategory(combobox, option)`

**Parametry:**

- `combobox`
- `option`

### `onChangeSlotFilter(combobox, option)`

**Parametry:**

- `combobox`
- `option`

### `onChangeOfferType(combobox, option)`

**Parametry:**

- `combobox`
- `option`

### `onTotalPriceChange()`

### `onPiecePriceChange()`

### `onAmountChange()`

### `onMarketMessage(messageMode, message)`

**Parametry:**

- `messageMode`
- `message`

### `initMarketItems(items)`

**Parametry:**

- `items`

### `initInterface()`

### `mainTabBar.onTabChange(widget, tab)`

**Parametry:**

- `widget`
- `tab`

### `offersTabBar.onTabChange(widget, tab)`

**Parametry:**

- `widget`
- `tab`

### `buyButton.onClick()`

### `sellButton.onClick()`

### `buyCancelButton.onClick()`

### `sellCancelButton.onClick()`

### `init()`

### `terminate()`

### `Market.reset()`

### `Market.updateCategories()`

### `Market.displayMessage(message)`

**Parametry:**

- `message`

### `Market.clearSelectedItem()`

### `Market.isItemSelected()`

### `Market.isOfferSelected(type)`

**Parametry:**

- `type`

### `Market.getDepotCount(itemId)`

**Parametry:**

- `itemId`

### `Market.enableCreateOffer(enable)`

**Parametry:**

- `enable`

### `Market.close(notify)`

**Parametry:**

- `notify`

### `Market.incrementAmount()`

### `Market.decrementAmount()`

### `Market.updateCurrentItems()`

### `Market.resetCreateOffer(resetFee)`

**Parametry:**

- `resetFee`

### `Market.refreshItemsWidget(selectItem)`

**Parametry:**

- `selectItem`

### `Market.refreshOffers()`

### `Market.refreshMyOffers()`

### `Market.refreshMyOffersHistory()`

### `Market.loadMarketItems(category)`

**Parametry:**

- `category`

### `Market.createNewOffer()`

### `Market.acceptMarketOffer(amount, timestamp, counter)`

**Parametry:**

- `amount`
- `timestamp`
- `counter`

### `Market.onItemBoxChecked(widget)`

**Parametry:**

- `widget`

### `Market.onMarketEnter(depotItems, offers, balance, vocation, items)`

protocol callback functions

**Parametry:**

- `depotItems`
- `offers`
- `balance`
- `vocation`
- `items`

### `Market.onMarketLeave()`

### `Market.onMarketDetail(itemId, descriptions, purchaseStats, saleStats)`

**Parametry:**

- `itemId`
- `descriptions`
- `purchaseStats`
- `saleStats`

### `Market.onMarketBrowse(offers, offersType)`

**Parametry:**

- `offers`
- `offersType`

### `Market.onCoinBalance(coins, transferableCoins)`

**Parametry:**

- `coins`
- `transferableCoins`

## Events/Callbacks

### `s`

**Wywołanie:** `offerTypeList:clearOptions()`

### `Name`

**Wywołanie:** `{text = getMarketDescriptionName(desc[1])..':'},`

### `s`

**Wywołanie:** `transactions = transactions + stat:getTransactions()`

### `s`

**Wywołanie:** `transactions = transactions + stat:getTransactions()`

### `umber`

**Wywołanie:** `local balance = tonumber(balance)`

### `createWidget`

**Wywołanie:** `amountWindow = g_ui.createWidget('AmountWindow', rootWidget)`

### `SelectSellOffer`

**Wywołanie:** `local function onSelectSellOffer(table, selectedRow, previousSelectedRow)`

### `SelectBuyOffer`

**Wywołanie:** `local function onSelectBuyOffer(table, selectedRow, previousSelectedRow)`

### `SelectMyBuyOffer`

**Wywołanie:** `local function onSelectMyBuyOffer(table, selectedRow, previousSelectedRow)`

### `SelectMySellOffer`

**Wywołanie:** `local function onSelectMySellOffer(table, selectedRow, previousSelectedRow)`

### `ChangeCategory`

**Wywołanie:** `local function onChangeCategory(combobox, option)`

### `ChangeSubCategory`

**Wywołanie:** `local function onChangeSubCategory(combobox, option)`

### `s`

**Wywołanie:** `slotFilterList:clearOptions()`

### `ChangeSlotFilter`

**Wywołanie:** `local function onChangeSlotFilter(combobox, option)`

### `ChangeOfferType`

**Wywołanie:** `local function onChangeOfferType(combobox, option)`

### `TotalPriceChange`

**Wywołanie:** `local function onTotalPriceChange()`

### `PiecePriceChange`

**Wywołanie:** `local function onPiecePriceChange()`

### `AmountChange`

**Wywołanie:** `local function onAmountChange()`

### `MarketMessage`

**Wywołanie:** `local function onMarketMessage(messageMode, message)`

### `tentWidget`

**Wywołanie:** `mainTabBar:setContentWidget(marketWindow:getChildById('mainTabContent'))`

### `loadUI`

setup 'Market Offer' section tabs

**Wywołanie:** `marketOffersPanel = g_ui.loadUI('ui/marketoffers')`

### `tentWidget`

**Wywołanie:** `selectionTabBar:setContentWidget(marketOffersPanel:getChildById('leftTabContent'))`

### `loadUI`

**Wywołanie:** `browsePanel = g_ui.loadUI('ui/marketoffers/browse')`

### `loadUI`

Currently not used "Reserved for more functionality later"

**Wywołanie:** `--overviewPanel = g_ui.loadUI('ui/marketoffers/overview')`

### `tentWidget`

**Wywołanie:** `displaysTabBar:setContentWidget(marketOffersPanel:getChildById('rightTabContent'))`

### `loadUI`

**Wywołanie:** `itemStatsPanel = g_ui.loadUI('ui/marketoffers/itemstats')`

### `loadUI`

**Wywołanie:** `itemDetailsPanel = g_ui.loadUI('ui/marketoffers/itemdetails')`

### `loadUI`

**Wywołanie:** `itemOffersPanel = g_ui.loadUI('ui/marketoffers/itemoffers')`

### `loadUI`

setup 'My Offer' section tabs

**Wywołanie:** `myOffersPanel = g_ui.loadUI('ui/myoffers')`

### `tentWidget`

**Wywołanie:** `offersTabBar:setContentWidget(myOffersPanel:getChildById('offersTabContent'))`

### `loadUI`

**Wywołanie:** `currentOffersPanel = g_ui.loadUI('ui/myoffers/currentoffers')`

### `loadUI`

**Wywołanie:** `offerHistoryPanel = g_ui.loadUI('ui/myoffers/offerhistory')`

### `importStyle`

**Wywołanie:** `g_ui.importStyle('market')`

### `importStyle`

**Wywołanie:** `g_ui.importStyle('ui/general/markettabs')`

### `importStyle`

**Wywołanie:** `g_ui.importStyle('ui/general/marketbuttons')`

### `importStyle`

**Wywołanie:** `g_ui.importStyle('ui/general/marketcombobox')`

### `importStyle`

**Wywołanie:** `g_ui.importStyle('ui/general/amountwindow')`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameEnd = Market.reset })`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameEnd = Market.close })`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameStart = Market.updateCategories })`

### `g_game`

**Wywołanie:** `connect(g_game, { onCoinBalance = Market.onCoinBalance })`

### `createWidget`

**Wywołanie:** `marketWindow = g_ui.createWidget('MarketWindow', rootWidget)`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameEnd = Market.reset })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameEnd = Market.close })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameStart = Market.updateCategories })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onCoinBalance = Market.onCoinBalance })`

### `s`

**Wywołanie:** `categoryList:clearOptions()`

### `s`

**Wywołanie:** `subCategoryList:clearOptions()`

### `s`

**Wywołanie:** `offerTypeList:clearOptions()`

### `createWidget`

**Wywołanie:** `local itemBox = g_ui.createWidget('MarketItemBox', itemsPanel)`

### `ItemBoxChecked`

**Wywołanie:** `Market.onItemBoxChecked(selectedItem.ref)`

### `ItemBoxChecked`

**Wywołanie:** `function Market.onItemBoxChecked(widget)`

### `MarketEnter`

protocol callback functions

**Wywołanie:** `function Market.onMarketEnter(depotItems, offers, balance, vocation, items)`

### `MarketLeave`

**Wywołanie:** `function Market.onMarketLeave()`

### `MarketDetail`

**Wywołanie:** `function Market.onMarketDetail(itemId, descriptions, purchaseStats, saleStats)`

### `MarketBrowse`

**Wywołanie:** `function Market.onMarketBrowse(offers, offersType)`

### `CoinBalance`

**Wywołanie:** `function Market.onCoinBalance(coins, transferableCoins)`
