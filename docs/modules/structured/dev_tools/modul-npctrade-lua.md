# Modu: Modu: `npctrade.lua`
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

- `init()`
- `terminate()`
- `show()`
- `hide()`
- `onItemBoxChecked(widget)`
- `onQuantityValueChange(quantity)`
- `onTradeTypeChange(radioTabs, selected, deselected)`
- `onTradeClick()`
- `onSearchTextChange()`
- `itemPopup(self, mousePosition, mouseButton)`
- `onBuyWithBackpackChange()`
- `onIgnoreCapacityChange()`
- `onIgnoreEquippedChange()`
- `onShowAllItemsChange()`
- `setCurrency(currency, decimal)`
- `setShowWeight(state)`
- `setShowYourCapacity(state)`
- `clearSelectedItem()`
- `getCurrentTradeType()`
- `getItemPrice(item, single)`
- `getSellQuantity(item)`
- `canTradeItem(item)`
- `refreshItem(item)`
- `refreshTradeItems()`
- `refreshPlayerGoods()`
- `onOpenNpcTrade(items)`
- `closeNpcTrade()`
- `onCloseNpcTrade()`
- `onPlayerGoods(money, items)`
- `onFreeCapacityChange(localPlayer, freeCapacity, oldFreeCapacity)`
- `onInventoryChange(inventory, item, oldItem)`
- `getTradeItemData(id, type)`
- `checkSellAllTooltip()`
- `formatCurrency(amount)`
- `getMaxAmount()`
- `sellAll(delayed, exceptions)`


#### Eventy / Hooki

- `addEvent`
- `connect`
- `onBuyWithBackpackChange`
- `onCloseNpcTrade`
- `onFreeCapacityChange`
- `onGameEnd`
- `onIgnoreCapacityChange`
- `onIgnoreEquippedChange`
- `onInventoryChange`
- `onItemBoxChecked`
- `onMouseRelease`
- `onOpenNpcTrade`
- `onPlayerGoods`
- `onQuantityValueChange`
- `onSearchTextChange`
- `onSelectionChange`
- `onShowAllItemsChange`
- `onTradeClick`
- `onTradeTypeChange`
- `scheduleEvent`


#### Wywoania API

- `g_game`
- `g_mouse`
- `g_ui`

---
