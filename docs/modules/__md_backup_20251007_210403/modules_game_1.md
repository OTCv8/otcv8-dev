# Modules Game 1
---
# game_interface
# Game Interface Module
# `gameinterface.lua`
# Funkcje
- `init()`
- `bindKeys()`
- `terminate()`
- `onGameStart()`
- `onGameEnd()`
- `show()`
- `hide()`
- `save()`
- `load()`
- `onLoginAdvice(message)`
- `forceExit()`
- `tryExit()`
- `tryLogout(prompt)`
- `updateStretchShrink()`
- `onMouseGrabberRelease(self, mousePosition, mouseButton)`
- `onUseWith(clickedWidget, mousePosition)`
- `onTradeWith(clickedWidget, mousePosition)`
- `startUseWith(thing, subType)`
- `startTradeWith(thing)`
- `isMenuHookCategoryEmpty(category)`
- `addMenuHook(category, name, callback, condition, shortcut)`
- `removeMenuHook(category, name)`
- `createThingMenu(menuPosition, lookThing, useThing, creatureThing)`
- `processMouseAction(menuPosition, mouseButton, autoWalkPos, lookThing, useThing, creatureThing, attackCreature, marking)`
- `moveStackableItem(item, toPos)`
- `getRootPanel()`
- `getMapPanel()`
- `getRightPanel()`
- `getLeftPanel()`
- `getContainerPanel()`
- `addRightPanel()`
- `addLeftPanel()`
- `removeRightPanel()`
- `removeLeftPanel()`
- `getBottomPanel()`
- `getBottomActionPanel()`
- `getLeftActionPanel()`
- `getRightActionPanel()`
- `getTopBar()`
- `refreshViewMode()`
- `limitZoom()`
- `updateSize()`
- `setupLeftActions()`
- `resetLeftActions()`
- `getLeftAction()`
- `isChatVisible()`
- `local addRightPanel()`
- `local addLeftPanel()`
- `local removeRightPanel()`
- `local removeLeftPanel()`
# Eventy / Hooki
- `addEvent`
- `connect`
- `onClick`
- `onClose`
- `onEnter`
- `onEscape`
- `onExit`
- `onGameEnd`
- `onGameStart`
- `onGeometryChange`
- `onLeftPanelVisibilityChange`
- `onLoginAdvice`
- `onMapChangeAwareRange`
- `onMouseGrabberRelease`
- `onMouseRelease`
- `onRun`
- `onTouchRelease`
- `onTradeWith`
- `onUseWith`
- `onValueChange`
- `onVisibilityChange`
- `onVisibleDimensionChange`
- `online`
- `scheduleEvent`
# Wywołania API
- `g_clock`
- `g_game`
- `g_keyboard`
- `g_map`
- `g_mouse`
- `g_ui`
- `g_window`

---
# game_inventory
# Game Inventory Module
# `inventory.lua`
# Funkcje
- `init()`
- `terminate()`
- `toggleAdventurerStyle(hasBlessing)`
- `refresh()`
- `toggle()`
- `onMiniWindowClose()`
- `onInventoryChange(player, slot, item, oldItem)`
- `onBlessingsChange(player, blessings, oldBlessings)`
- `update()`
- `check()`
- `online()`
- `offline()`
- `onSetFightMode(self, selectedFightButton)`
- `onSetChaseMode(self, checked)`
- `onSetSafeFight(self, checked)`
- `onSetSafeFight2(self)`
- `onSetPVPMode(self, selectedPVPButton)`
- `onMountButtonClick(self, mousePos)`
- `onOutfitChange(localPlayer, outfit, oldOutfit)`
- `getPVPBoxByMode(mode)`
- `toggleIcon(bitChanged)`
- `loadIcon(bitChanged)`
- `onSoulChange(localPlayer, soul)`
- `onFreeCapacityChange(player, freeCapacity)`
- `onStatesChange(localPlayer, now, old)`
# Eventy / Hooki
- `connect`
- `onAutoWalk`
- `onBlessingsChange`
- `onChaseModeChange`
- `onCheckChange`
- `onClick`
- `onFightModeChange`
- `onFreeCapacityChange`
- `onGameEnd`
- `onGameStart`
- `onInventoryChange`
- `onMiniWindowClose`
- `onMountButtonClick`
- `onOutfitChange`
- `onPVPModeChange`
- `onSafeFightChange`
- `onSelectionChange`
- `onSetChaseMode`
- `onSetFightMode`
- `onSetPVPMode`
- `onSetSafeFight`
- `onSetSafeFight2`
- `onSoulChange`
- `onStatesChange`
- `onWalk`
- `online`
# Wywołania API
- `g_game`
- `g_keyboard`
- `g_ui`

---
# game_console
# Game Console Module
# `console.lua`
# Funkcje
- `init()`
- `clearSelection(consoleBuffer)`
- `selectAll(consoleBuffer)`
- `toggleChat()`
- `enableChat(temporarily)`
- `disableChat(temporarily)`
- `isChatEnabled()`
- `terminate()`
- `save()`
- `load()`
- `onTabChange(tabBar, tab)`
- `clear()`
- `switchMode(newView)`
- `onDragEnter(widget, pos)`
- `onDragMove(widget, pos, moved)`
- `onDragLeave(widget, pos)`
- `clearChannel(consoleTabBar)`
- `setTextEditText(text)`
- `openHelp()`
- `openPlayerReportRuleViolationWindow()`
- `addTab(name, focus)`
- `removeTab(tab)`
- `removeCurrentTab()`
- `getTab(name)`
- `getChannelTab(channelId)`
- `getRuleViolationsTab()`
- `getCurrentTab()`
- `addChannel(name, id)`
- `addPrivateChannel(receiver)`
- `addPrivateText(text, speaktype, name, isPrivateCommand, creatureName)`
- `addText(text, speaktype, tabName, creatureName)`
- `getHighlightedText(text)`
- `getNewHighlightedText(text, color, highlightColor)`
- `addTabText(text, speaktype, tab, creatureName)`
- `removeTabLabelByName(tab, name)`
- `processChannelTabMenu(tab, mousePos, mouseButton)`
- `processMessageMenu(mousePos, mouseButton, creatureName, text, label, tab)`
- `sendCurrentMessage()`
- `addFilter(filter)`
- `removeFilter(filter)`
- `sendMessage(message, tab)`
- `sayModeChange(sayMode)`
- `getOwnPrivateTab()`
- `setIgnoreNpcMessages(ignore)`
- `navigateMessageHistory(step)`
- `applyMessagePrefixies(name, level, message)`
- `onTalk(name, level, mode, message, channelId, creaturePos)`
- `onOpenChannel(channelId, channelName)`
- `onOpenPrivateChannel(receiver)`
- `onOpenOwnPrivateChannel(channelId, channelName)`
- `onCloseChannel(channelId)`
- `processViolation(name, text)`
- `onRuleViolationChannel(channelId)`
- `onRuleViolationRemove(name)`
- `onRuleViolationCancel(name)`
- `onRuleViolationLock()`
- `doChannelListSubmit()`
- `onChannelList(channelList)`
- `loadCommunicationSettings()`
- `saveCommunicationSettings()`
- `getIgnoredPlayers()`
- `getWhitelistedPlayers()`
- `isUsingIgnoreList()`
- `isUsingWhiteList()`
- `isIgnored(name)`
- `addIgnoredPlayer(name)`
- `removeIgnoredPlayer(name)`
- `isWhitelisted(name)`
- `addWhitelistedPlayer(name)`
- `removeWhitelistedPlayer(name)`
- `isIgnoringPrivate()`
- `isIgnoringYelling()`
- `isAllowingVIPs()`
- `onClickIgnoreButton()`
- `online()`
- `offline()`
- `onChannelEvent(channelId, name, type)`
# Eventy / Hooki
- `connect`
- `onChannelEvent`
- `onChannelList`
- `onChildFocusChange`
- `onClick`
- `onClickIgnoreButton`
- `onCloseChannel`
- `onDestroy`
- `onDoubleClick`
- `onDragEnter`
- `onDragLeave`
- `onDragMove`
- `onEnter`
- `onEscape`
- `onGameEnd`
- `onGameStart`
- `onKeyPress`
- `onMousePress`
- `onMouseRelease`
- `onOpenChannel`
- `onOpenOwnPrivateChannel`
- `onOpenPrivateChannel`
- `onRuleViolationCancel`
- `onRuleViolationChannel`
- `onRuleViolationLock`
- `onRuleViolationRemove`
- `onTabChange`
- `onTalk`
- `online`
- `scheduleEvent`
# Wywołania API
- `g_game`
- `g_keyboard`
- `g_map`
- `g_ui`
- `g_window`

---
# game_things
# Game Things Module
# `things.lua`
# Funkcje
- `setFileName(name)`
- `isLoaded()`
- `load()`
# Eventy / Hooki
- `addEvent`
# Wywołania API
- `g_game`

---
# game_textmessage
# Game Textmessage Module
# `textmessage.lua`
# Funkcje
- `init()`
- `terminate()`
- `calculateVisibleTime(text)`
- `displayMessage(mode, text)`
- `displayPrivateMessage(text)`
- `displayStatusMessage(text)`
- `displayFailureMessage(text)`
- `displayGameMessage(text)`
- `displayBroadcastMessage(text)`
- `clearMessages()`
# Eventy / Hooki
- `connect`
- `onAutoWalkFail`
- `onGameEnd`
- `scheduleEvent`
# Wywołania API
- `g_game`
- `g_ui`

---
# game_buttons
# Game Buttons Module
# `buttons.lua`
# Funkcje
- `init()`
- `terminate()`
- `takeButtons(buttons)`
- `takeButton(button, dontUpdateOrder)`
- `updateOrder()`
# Wywołania API
- `g_ui`

