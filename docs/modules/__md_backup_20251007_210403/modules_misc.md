# Modules Misc
---
# game_shop
# Game Shop Module
# `shop.lua`
# Opis
-- private variables

-- for classic store
# Funkcje
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
# Eventy / Hooki
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
# Wywołania API
- `g_game`
- `g_ui`

---
# game_market
# Game Market Module
# `market.lua`
# Funkcje
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
# Eventy / Hooki
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
# Wywołania API
- `g_game`
- `g_ui`
# `marketoffer.lua`
# `marketprotocol.lua`
# Opis
-- private functions
# Funkcje
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
# Eventy / Hooki
- `connect`
- `onGameEnd`
- `onGameStart`
- `onMarketBrowse`
- `onMarketDetail`
- `onMarketEnter`
- `onMarketLeave`
# Wywołania API
- `g_game`
# `offerstatistic.lua`
---
# game_questlog
# Game Questlog Module
# `questlog.lua`
# Opis
-- each call delay is also increased by random values (0-callDelay/2)
# Funkcje
- `init()`
- `terminate()`
- `toggle()`
- `offline()`
- `online()`
- `show(questlog)`
- `back()`
- `showQuestLine()`
- `onGameQuestLog(quests)`
- `onGameQuestLine(questId, questMissions)`
- `onTrackOptionChange(checkbox)`
- `refreshQuests()`
- `refreshTrackerWidgets()`
- `load()`
- `save()`
# Eventy / Hooki
- `connect`
- `onChildFocusChange`
- `onDoubleClick`
- `onGameEnd`
- `onGameQuestLine`
- `onGameQuestLog`
- `onGameStart`
- `onQuestLine`
- `onQuestLog`
- `onTrackOptionChange`
- `online`
- `scheduleEvent`
# Wywołania API
- `g_clock`
- `g_game`
- `g_ui`

---
# game_battle
# Game Battle Module
# `battle.lua`
# Funkcje
- `init()`
- `terminate()`
- `toggle()`
- `onMiniWindowClose()`
- `getSortType()`
- `setSortType(state)`
- `getSortOrder()`
- `setSortOrder(state)`
- `isSortAsc()`
- `isSortDesc()`
- `isHidingFilters()`
- `setHidingFilters(state)`
- `hideFilterPanel()`
- `showFilterPanel()`
- `toggleFilterPanel()`
- `onChangeSortType(comboBox, option, value)`
- `onChangeSortOrder(comboBox, option, value)`
- `updateBattleList()`
- `checkCreatures()`
- `doCreatureFitFilters(creature)`
- `getDistanceBetween(p1, p2)`
- `sortCreatures(creatures)`
- `onBattleButtonMouseRelease(self, mousePosition, mouseButton)`
- `onBattleButtonHoverChange(battleButton, hovered)`
- `onPlayerPositionChange(creature, newPos, oldPos)`
- `updateSquare()`
- `local getDistanceBetween(p1, p2)`
# Eventy / Hooki
- `addEvent`
- `connect`
- `onAppear`
- `onAttackingCreatureChange`
- `onBattleButtonHoverChange`
- `onBattleButtonMouseRelease`
- `onChangeSortOrder`
- `onChangeSortType`
- `onCreatureAppear`
- `onCreatureDisappear`
- `onDisappear`
- `onFollowed`
- `onFollowingCreatureChange`
- `onHoverChange`
- `onIdle`
- `onMiniWindowClose`
- `onMouseRelease`
- `onOptionChange`
- `onPlayerPositionChange`
- `onPositionChange`
- `onTargeted`
- `scheduleEvent`
# Wywołania API
- `g_clock`
- `g_game`
- `g_keyboard`
- `g_map`
- `g_mouse`
- `g_ui`

---
# game_unjustifiedpoints
# Game Unjustifiedpoints Module
# `unjustifiedpoints.lua`
# Funkcje
- `init()`
- `terminate()`
- `onMiniWindowClose()`
- `toggle()`
- `online()`
- `refresh()`
- `onSkullChange(localPlayer, skull)`
- `onOpenPvpSituationsChange(amount)`
- `getColorByKills(kills)`
- `onUnjustifiedPointsChange(unjustifiedPoints)`
- `local getColorByKills(kills)`
# Eventy / Hooki
- `connect`
- `onGameStart`
- `onMiniWindowClose`
- `onOpenPvpSituationsChange`
- `onSkullChange`
- `onUnjustifiedPointsChange`
- `online`
# Wywołania API
- `g_game`
- `g_ui`

---
# game_imbuing
# Game Imbuing Module
# `imbuing.lua`
# Funkcje
- `init()`
- `setProtection(value)`
- `terminate()`
- `resetSlots()`
- `selectSlot(widget, slotId, activeSlot)`
- `onImbuementWindow(itemId, slots, activeSlots, imbuements, needItems)`
- `onResourceBalance(type, balance)`
- `onCloseImbuementWindow()`
- `hide()`
- `show()`
- `toggle()`
# Eventy / Hooki
- `connect`
- `onClick`
- `onCloseImbuementWindow`
- `onGameEnd`
- `onImbuementWindow`
- `onOptionChange`
- `onResourceBalance`
# Wywołania API
- `g_game`
- `g_ui`

---
# game_playertrade
# Game Playertrade Module
# `playertrade.lua`
# Funkcje
- `init()`
- `terminate()`
- `createTrade()`
- `fillTrade(name, items, counter)`
- `onGameOwnTrade(name, items)`
- `onGameCounterTrade(name, items)`
- `onGameCloseTrade()`
# Eventy / Hooki
- `connect`
- `onClick`
- `onClose`
- `onCloseTrade`
- `onCounterTrade`
- `onGameCloseTrade`
- `onGameCounterTrade`
- `onGameEnd`
- `onGameOwnTrade`
- `onOwnTrade`
# Wywołania API
- `g_game`
- `g_ui`

---
# game_playerdeath
# Game Playerdeath Module
# `playerdeath.lua`
# Funkcje
- `init()`
- `terminate()`
- `reset()`
- `display(deathType, penalty)`
- `displayDeadMessage()`
- `openWindow(deathType, penalty)`
# Eventy / Hooki
- `connect`
- `onClick`
- `onDeath`
- `onEnter`
- `onEscape`
- `onGameEnd`
# Wywołania API
- `g_game`
- `g_ui`

---
# game_playermount
# Game Playermount Module
# `playermount.lua`
# Funkcje
- `init()`
- `terminate()`
- `online()`
- `offline()`
- `toggleMount()`
- `mount()`
- `dismount()`
# Eventy / Hooki
- `connect`
- `onGameEnd`
- `onGameStart`
- `online`
# Wywołania API
- `g_game`
- `g_keyboard`

---
# game_prey
# Game Prey Module
# `prey.lua`
# Opis
-- sponsored by kivera-global.com

-- remade by Vithrax#5814
# Funkcje
- `bonusDescription(bonusType, bonusValue, bonusGrade)`
- `timeleftTranslation(timeleft, forPreyTimeleft)`
- `init()`
- `onHover(widget)`
- `terminate()`
- `setUnsupportedSettings()`
- `check()`
- `toggleTracker()`
- `hide()`
- `show()`
- `toggle()`
- `onPreyFreeRolls(slot, timeleft)`
- `onPreyTimeLeft(slot, timeLeft)`
- `onPreyPrice(price)`
- `setTimeUntilFreeReroll(slot, timeUntilFreeReroll)`
- `onPreyLocked(slot, unlockState, timeUntilFreeReroll)`
- `onPreyInactive(slot, timeUntilFreeReroll)`
- `setBonusGradeStars(slot, grade)`
- `getBigIconPath(bonusType)`
- `getSmallIconPath(bonusType)`
- `getBonusDescription(bonusType)`
- `getTooltipBonusDescription(bonusType, bonusValue)`
- `capitalFormatStr(str)`
- `onItemBoxChecked(widget)`
- `onPreyActive(slot, currentHolderName, currentHolderOutfit, bonusType, bonusValue, bonusGrade, timeLeft, timeUntilFreeReroll, lockType)`
- `onPreySelection(slot, bonusType, bonusValue, bonusGrade, names, outfits, timeUntilFreeReroll)`
- `onResourceBalance(type, balance)`
- `showMessage(title, message)`
# Eventy / Hooki
- `connect`
- `onClick`
- `onGameEnd`
- `onGameStart`
- `onHover`
- `onHoverChange`
- `onItemBoxChecked`
- `onPreyActive`
- `onPreyFreeRolls`
- `onPreyInactive`
- `onPreyLocked`
- `onPreyPrice`
- `onPreySelection`
- `onPreyTimeLeft`
- `onResourceBalance`
- `one`
- `only`
# Wywołania API
- `g_game`
- `g_ui`

---
# game_protocol
# Game Protocol Module
# `protocol.lua`
# Funkcje
- `init()`
- `terminate()`
- `registerProtocol()`
- `readAddItem(msg)`
- `unregisterProtocol()`
- `registerOpcode(code, func)`
- `readDailyReward(msg)`
# Eventy / Hooki
- `connect`
- `onEnterGame`
- `onGameEnd`
- `onPendingGame`
- `online`
# Wywołania API
- `g_game`

---
# game_bugreport
# Game Bugreport Module
# `bugreport.lua`
# Opis
-- TODO: find another hotkey for this. Ctrl+Z will be reserved to undo on textedits.
# Funkcje
- `init()`
- `terminate()`
- `doReport()`
- `show()`
# Wywołania API
- `g_game`
- `g_keyboard`
- `g_ui`

---
# game_modaldialog
# Game Modaldialog Module
# `modaldialog.lua`
# Funkcje
- `init()`
- `terminate()`
- `destroyDialog()`
- `onModalDialog(id, title, message, buttons, enterButton, escapeButton, choices, priority)`
# Eventy / Hooki
- `connect`
- `onClick`
- `onDoubleClick`
- `onEnter`
- `onEscape`
- `onGameEnd`
- `onModalDialog`
# Wywołania API
- `g_clock`
- `g_game`
- `g_ui`

---
# game_itemselector
# Game Itemselector Module
# `itemselector.lua`
# Funkcje
- `init()`
- `terminate()`
- `destroyWindow()`
- `show(itemWidget)`
- `hide()`
# Eventy / Hooki
- `connect`
- `onClick`
- `onEnter`
- `onEscape`
- `onGameEnd`
- `onValueChange`
# Wywołania API
- `g_ui`

---
# game_npctrade
# Game Npctrade Module
# `npctrade.lua`
# Funkcje
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
# Eventy / Hooki
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
# Wywołania API
- `g_game`
- `g_mouse`
- `g_ui`

---
# game_ruleviolation
# Game Ruleviolation Module
# `ruleviolation.lua`
# Funkcje
- `init()`
- `terminate()`
- `hasWindowAccess()`
- `loadReasons()`
- `show(target, statement)`
- `hide()`
- `onSelectReason(reasonLabel, focused)`
- `report()`
- `clearForm()`
# Eventy / Hooki
- `connect`
- `onFocusChange`
- `onGMActions`
- `onSelectReason`
# Wywołania API
- `g_game`
- `g_keyboard`
- `g_ui`

---
# game_textwindow
# Game Textwindow Module
# `textwindow.lua`
# Funkcje
- `init()`
- `terminate()`
- `destroyWindows()`
- `onGameEditText(id, itemId, maxLength, text, writer, time)`
- `destroy()`
- `onGameEditList(id, doorId, text)`
- `destroy()`
- `local destroy()`
- `local destroy()`
# Eventy / Hooki
- `connect`
- `onClick`
- `onEditList`
- `onEditText`
- `onEnter`
- `onEscape`
- `onGameEditList`
- `onGameEditText`
- `onGameEnd`
- `one`
# Wywołania API
- `g_game`
- `g_ui`

---
# game_walking
# Game Walking Module
# `walking.lua`
# Funkcje
- `init()`
- `terminate()`
- `bindKeys()`
- `unbindKeys()`
- `enableWSAD()`
- `disableWSAD()`
- `bindWalkKey(key, dir)`
- `unbindWalkKey(key)`
- `bindTurnKey(key, dir)`
- `unbindTurnKey(key)`
- `stopSmartWalk()`
- `changeWalkDir(dir, pop)`
- `smartWalk(dir, ticks)`
- `canChangeFloorDown(pos)`
- `canChangeFloorUp(pos)`
- `onPositionChange(player, newPos, oldPos)`
- `onWalk(player, newPos, oldPos)`
- `onTeleport(player, newPos, oldPos)`
- `onWalkFinish(player)`
- `onCancelWalk(player)`
- `walk(dir, ticks)`
- `turn(dir, repeated)`
- `checkTurn()`
# Eventy / Hooki
- `addEvent`
- `connect`
- `onCancelWalk`
- `onFocusChange`
- `onPositionChange`
- `onTeleport`
- `onWalk`
- `onWalkFinish`
- `scheduleEvent`
# Wywołania API
- `g_clock`
- `g_game`
- `g_keyboard`
- `g_map`

---
# game_topbar
# Game Topbar Module
# `topbar.lua`
# Funkcje
- `init()`
- `terminate()`
- `setupTopBar()`
- `refresh(profileChange)`
- `refreshVisibleBars()`
- `setSkillsLayout()`
- `offline()`
- `toggleIcon(bitChanged)`
- `loadIcon(bitChanged)`
- `onHealthChange(localPlayer, health, maxHealth)`
- `onManaChange(localPlayer, mana, maxMana)`
- `onLevelChange(localPlayer, value, percent)`
- `onStatesChange(localPlayer, now, old)`
- `show()`
- `setupSkillPanel(id, parent, experience, defaultOff)`
- `menu(mouseButton)`
- `setupSkills()`
- `toggleSkillPanel(id)`
- `setSkillValue(id, value)`
- `setSkillPercent(id, percent, tooltip)`
- `setSkillBase(id, value, baseValue)`
- `onMagicLevelChange(localPlayer, magiclevel, percent)`
- `onBaseMagicLevelChange(localPlayer, baseMagicLevel)`
- `onSkillChange(localPlayer, id, level, percent)`
- `onBaseSkillChange(localPlayer, id, baseLevel)`
- `save()`
- `load()`
# Eventy / Hooki
- `connect`
- `onBaseMagicLevelChange`
- `onBaseSkillChange`
- `onError`
- `onGameEnd`
- `onGameStart`
- `onGeometryChange`
- `onHealthChange`
- `onLevelChange`
- `onMagicLevelChange`
- `onManaChange`
- `onMouseRelease`
- `onSkillChange`
- `onStatesChange`
# Wywołania API
- `g_game`
- `g_ui`

---
# game_bot
# Game Bot Module
# `bot.lua`
# Funkcje
- `init()`
- `terminate()`
- `clear()`
- `refresh()`
- `save()`
- `onMiniWindowClose()`
- `toggle()`
- `online()`
- `offline()`
- `onError(message)`
- `edit()`
- `createDefaultConfigs()`
- `uploadConfig()`
- `downloadConfig()`
- `compressConfig(configName)`
- `decompressConfig(configName, archive)`
- `message(category, msg)`
- `check()`
- `initCallbacks()`
- `terminateCallbacks()`
- `safeBotCall(func)`
- `botKeyDown(widget, keyCode, keyboardModifiers)`
- `botKeyUp(widget, keyCode, keyboardModifiers)`
- `botKeyPress(widget, keyCode, keyboardModifiers, autoRepeatTicks)`
- `botOnTalk(name, level, mode, text, channelId, pos)`
- `botOnTextMessage(mode, text)`
- `botOnLoginAdvice(message)`
- `botAddThing(tile, thing)`
- `botRemoveThing(tile, thing)`
- `botCreatureAppear(creature)`
- `botCreatureDisappear(creature)`
- `botCreaturePositionChange(creature, newPos, oldPos)`
- `botCraetureHealthPercentChange(creature, healthPercent)`
- `botOnUse(pos, itemId, stackPos, subType)`
- `botOnUseWith(pos, itemId, target, subType)`
- `botContainerOpen(container, previousContainer)`
- `botContainerClose(container)`
- `botContainerUpdateItem(container, slot, item, oldItem)`
- `botOnMissle(missle)`
- `botOnAnimatedText(thing, text)`
- `botOnStaticText(thing, text)`
- `botChannelList(channels)`
- `botOpenChannel(channelId, name)`
- `botCloseChannel(channelId)`
- `botChannelEvent(channelId, name, event)`
- `botCreatureTurn(creature, direction)`
- `botCreatureWalk(creature, oldPos, newPos)`
- `botImbuementWindow(itemId, slots, activeSlots, imbuements, needItems)`
- `botModalDialog(id, title, message, buttons, enterButton, escapeButton, choices, priority)`
- `botGameEditText(id, itemId, maxLength, text, writer, time)`
- `botAttackingCreatureChange(creature, oldCreature)`
- `botManaChange(player, mana, maxMana, oldMana, oldMaxMana)`
- `botStatesChange(player, states, oldStates)`
- `botContainerAddItem(container, slot, item, oldItem)`
- `botContainerRemoveItem(container, slot, item)`
- `botSpellCooldown(iconId, duration)`
- `botGroupSpellCooldown(iconId, duration)`
- `botInventoryChange(player, slot, item, oldItem)`
# Eventy / Hooki
- `connect`
- `onAddItem`
- `onAddThing`
- `onAnimatedText`
- `onAppear`
- `onAttackingCreatureChange`
- `onChannelEvent`
- `onChannelList`
- `onClick`
- `onClose`
- `onCloseChannel`
- `onContainerClose`
- `onContainerOpen`
- `onContainerUpdateItem`
- `onCreatureAppear`
- `onCreatureDisappear`
- `onCreatureHealthPercentChange`
- `onCreaturePositionChange`
- `onDisappear`
- `onError`
- `onGameEditText`
- `onGameEnd`
- `onGameStart`
- `onGroupSpellCooldown`
- `onHealthPercentChange`
- `onImbuementWindow`
- `onInventoryChange`
- `onKeyDown`
- `onKeyPress`
- `onKeyUp`
- `onLoginAdvice`
- `onManaChange`
- `onMiniWindowClose`
- `onMissle`
- `onModalDialog`
- `onOpen`
- `onOpenChannel`
- `onOptionChange`
- `onPositionChange`
- `onRemoveItem`
- `onRemoveThing`
- `onSpellCooldown`
- `onSpellGroupCooldown`
- `onStatesChange`
- `onStaticText`
- `onTalk`
- `onTextMessage`
- `onTurn`
- `onUpdateItem`
- `onUse`
- `onUseWith`
- `onWalk`
- `online`
- `scheduleEvent`
# Wywołania API
- `g_clock`
- `g_game`
- `g_sounds`
- `g_ui`
# `executor.lua`
# Opis
-- load lua and otui files
# Funkcje
- `executeBot(config, storage, tabs, msgCallback, saveConfigCallback, reloadCallback, websockets)`
# Eventy / Hooki
- `onAddItem`
- `onAddThing`
- `onAnimatedText`
- `onAttackingCreatureChange`
- `onChannelEvent`
- `onChannelList`
- `onClick`
- `onCloseChannel`
- `onContainerClose`
- `onContainerOpen`
- `onContainerUpdateItem`
- `onCreatureAppear`
- `onCreatureDisappear`
- `onCreatureHealthPercentChange`
- `onCreaturePositionChange`
- `onGameEditText`
- `onGroupSpellCooldown`
- `onImbuementWindow`
- `onInventoryChange`
- `onKeyDown`
- `onKeyPress`
- `onKeyUp`
- `onLoginAdvice`
- `onManaChange`
- `onMissle`
- `onModalDialog`
- `onOpenChannel`
- `onRemoveItem`
- `onRemoveThing`
- `onSpellCooldown`
- `onStatesChange`
- `onStaticText`
- `onTalk`
- `onTextMessage`
- `onTurn`
- `onUse`
- `onUseWith`
- `onWalk`
# Wywołania API
- `g_clock`
- `g_game`
- `g_ui`

---
# game_healthinfo
# Game Healthinfo Module
# `healthinfo.lua`
# Funkcje
- `init()`
- `terminate()`
- `toggle()`
- `toggleIcon(bitChanged)`
- `loadIcon(bitChanged)`
- `offline()`
- `onMiniWindowClose()`
- `onHealthChange(localPlayer, health, maxHealth)`
- `onManaChange(localPlayer, mana, maxMana)`
- `onLevelChange(localPlayer, value, percent)`
- `onSoulChange(localPlayer, soul)`
- `onFreeCapacityChange(player, freeCapacity)`
- `onStatesChange(localPlayer, now, old)`
- `hideLabels()`
- `hideExperience()`
- `setHealthTooltip(tooltip)`
- `setManaTooltip(tooltip)`
- `setExperienceTooltip(tooltip)`
- `onOverlayGeometryChange()`
# Eventy / Hooki
- `connect`
- `onFreeCapacityChange`
- `onGameEnd`
- `onGeometryChange`
- `onHealthChange`
- `onLevelChange`
- `onManaChange`
- `onMiniWindowClose`
- `onOverlayGeometryChange`
- `onSoulChange`
- `onStatesChange`
# Wywołania API
- `g_game`
- `g_ui`

---
# updater
# Updater Module
# `updater.lua`
# Opis
--
# Funkcje
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
# Eventy / Hooki
- `onLog`
- `onOk`
- `scheduleEvent`
# Wywołania API
- `g_ui`
- `g_window`

