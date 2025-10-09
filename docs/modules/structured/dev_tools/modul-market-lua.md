# Modu: Modu: `market.lua`
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
#### Funkcje

- `isItemValid(item, category, searchFilter)`
- `clearItems()`
- `clearOffers()`
- `clearMyOffers()`
- `clearFilters()`
- `clearFee()`
- `refreshTypeList()`
- `addOffer(offer, offerType)`
- `mergeOffer(offer)`
- `updateOffers(offers)`
- `updateHistoryOffers(offers)`
- `updateDetails(itemId, descriptions, purchaseStats, saleStats)`
- `updateSelectedItem(widget)`
- `updateBalance(balance)`
- `updateFee(price, amount)`
- `destroyAmountWindow()`
- `cancelMyOffer(actionType)`
- `openAmountWindow(callback, actionType, actionText)`
- `onSelectSellOffer(table, selectedRow, previousSelectedRow)`
- `onSelectBuyOffer(table, selectedRow, previousSelectedRow)`
- `onSelectMyBuyOffer(table, selectedRow, previousSelectedRow)`
- `onSelectMySellOffer(table, selectedRow, previousSelectedRow)`
- `onChangeCategory(combobox, option)`
- `onChangeSubCategory(combobox, option)`
- `onChangeSlotFilter(combobox, option)`
- `onChangeOfferType(combobox, option)`
- `onTotalPriceChange()`
- `onPiecePriceChange()`
- `onAmountChange()`
- `onMarketMessage(messageMode, message)`
- `initMarketItems(items)`
- `initInterface()`
- `init()`
- `terminate()`
- `Market.reset()`
- `Market.updateCategories()`
- `Market.displayMessage(message)`
- `Market.clearSelectedItem()`
- `Market.isItemSelected()`
- `Market.isOfferSelected(type)`
- `Market.getDepotCount(itemId)`
- `Market.enableCreateOffer(enable)`
- `Market.close(notify)`
- `Market.incrementAmount()`
- `Market.decrementAmount()`
- `Market.updateCurrentItems()`
- `Market.resetCreateOffer(resetFee)`
- `Market.refreshItemsWidget(selectItem)`
- `Market.refreshOffers()`
- `Market.refreshMyOffers()`
- `Market.refreshMyOffersHistory()`
- `Market.loadMarketItems(category)`
- `Market.createNewOffer()`
- `Market.acceptMarketOffer(amount, timestamp, counter)`
- `Market.onItemBoxChecked(widget)`
- `Market.onMarketEnter(depotItems, offers, balance, vocation, items)`
- `Market.onMarketLeave()`
- `Market.onMarketDetail(itemId, descriptions, purchaseStats, saleStats)`
- `Market.onMarketBrowse(offers, offersType)`
- `Market.onCoinBalance(coins, transferableCoins)`
- `local isItemValid(item, category, searchFilter)`
- `local clearItems()`
- `local clearOffers()`
- `local clearMyOffers()`
- `local clearFilters()`
- `local clearFee()`
- `local refreshTypeList()`
- `local addOffer(offer, offerType)`
- `local mergeOffer(offer)`
- `local updateOffers(offers)`
- `local updateHistoryOffers(offers)`
- `local updateDetails(itemId, descriptions, purchaseStats, saleStats)`
- `local updateSelectedItem(widget)`
- `local updateBalance(balance)`
- `local updateFee(price, amount)`
- `local destroyAmountWindow()`
- `local cancelMyOffer(actionType)`
- `local openAmountWindow(callback, actionType, actionText)`
- `local onSelectSellOffer(table, selectedRow, previousSelectedRow)`
- `local onSelectBuyOffer(table, selectedRow, previousSelectedRow)`
- `local onSelectMyBuyOffer(table, selectedRow, previousSelectedRow)`
- `local onSelectMySellOffer(table, selectedRow, previousSelectedRow)`
- `local onChangeCategory(combobox, option)`
- `local onChangeSubCategory(combobox, option)`
- `local onChangeSlotFilter(combobox, option)`
- `local onChangeOfferType(combobox, option)`
- `local onTotalPriceChange()`
- `local onPiecePriceChange()`
- `local onAmountChange()`
- `local onMarketMessage(messageMode, message)`
- `local initMarketItems(items)`
- `local initInterface()`


#### Eventy / Hooki

- `connect`
- `onAmountChange`
- `onChangeCategory`
- `onChangeOfferType`
- `onChangeSlotFilter`
- `onChangeSubCategory`
- `onCheckChange`
- `onClick`
- `onCoinBalance`
- `onEnter`
- `onEscape`
- `onGameEnd`
- `onGameStart`
- `onItemBoxChecked`
- `onMarketBrowse`
- `onMarketDetail`
- `onMarketEnter`
- `onMarketLeave`
- `onMarketMessage`
- `onOptionChange`
- `onPiecePriceChange`
- `onSelectBuyOffer`
- `onSelectMyBuyOffer`
- `onSelectMySellOffer`
- `onSelectSellOffer`
- `onSelectionChange`
- `onTabChange`
- `onTotalPriceChange`
- `onValueChange`


#### Wywoania API

- `g_game`
- `g_ui`
