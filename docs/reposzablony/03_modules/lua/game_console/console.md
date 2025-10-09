---
doc_id: "lua-spec-092990b43996"
source_path: "game_console/console.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: console.lua"
summary: "Dokumentacja modułu Lua dla game_console/console.lua"
tags: ["lua", "module", "otclient"]
---

# game_console/console.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla console.

## Globals/Exports

### `none`

### `messageHistory`

### `ignoredChannels`

### `filters`

### `ignoredPlayers`

### `whitelistedPlayers`

### `channels`

### `channels`

## Functions

### `init()`

### `consolePanel.onKeyPress(self, keyCode, keyboardModifiers)`

**Parametry:**

- `self`
- `keyCode`
- `keyboardModifiers`

### `clearSelection(consoleBuffer)`

**Parametry:**

- `consoleBuffer`

### `selectAll(consoleBuffer)`

**Parametry:**

- `consoleBuffer`

### `toggleChat()`

### `enableChat(temporarily)`

**Parametry:**

- `temporarily`

### `disableChat(temporarily)`

**Parametry:**

- `temporarily`

### `isChatEnabled()`

### `terminate()`

### `save()`

### `load()`

### `onTabChange(tabBar, tab)`

**Parametry:**

- `tabBar`
- `tab`

### `clear()`

### `switchMode(newView)`

**Parametry:**

- `newView`

### `onDragEnter(widget, pos)`

**Parametry:**

- `widget`
- `pos`

### `onDragMove(widget, pos, moved)`

**Parametry:**

- `widget`
- `pos`
- `moved`

### `onDragLeave(widget, pos)`

**Parametry:**

- `widget`
- `pos`

### `clearChannel(consoleTabBar)`

**Parametry:**

- `consoleTabBar`

### `setTextEditText(text)`

**Parametry:**

- `text`

### `openHelp()`

### `openPlayerReportRuleViolationWindow()`

### `violationWindow.onEscape()`

### `violationWindow.onEnter()`

### `addTab(name, focus)`

**Parametry:**

- `name`
- `focus`

### `removeTab(tab)`

**Parametry:**

- `tab`

### `removeCurrentTab()`

### `getTab(name)`

**Parametry:**

- `name`

### `getChannelTab(channelId)`

**Parametry:**

- `channelId`

### `getRuleViolationsTab()`

### `getCurrentTab()`

### `addChannel(name, id)`

**Parametry:**

- `name`
- `id`

### `addPrivateChannel(receiver)`

**Parametry:**

- `receiver`

### `addPrivateText(text, speaktype, name, isPrivateCommand, creatureName)`

**Parametry:**

- `text`
- `speaktype`
- `name`
- `isPrivateCommand`
- `creatureName`

### `addText(text, speaktype, tabName, creatureName)`

**Parametry:**

- `text`
- `speaktype`
- `tabName`
- `creatureName`

### `getHighlightedText(text)`

Return information about start, end in the string and the highlighted words

**Parametry:**

- `text`

**Zwraca:** information about start, end in the string and the highlighted words

### `getNewHighlightedText(text, color, highlightColor)`

**Parametry:**

- `text`
- `color`
- `highlightColor`

### `addTabText(text, speaktype, tab, creatureName)`

**Parametry:**

- `text`
- `speaktype`
- `tab`
- `creatureName`

### `consoleBuffer.onMouseRelease(self, mousePos, mouseButton)`

**Parametry:**

- `self`
- `mousePos`
- `mouseButton`

### `label.onMouseRelease(self, mousePos, mouseButton)`

**Parametry:**

- `self`
- `mousePos`
- `mouseButton`

### `label.onMousePress(self, mousePos, button)`

**Parametry:**

- `self`
- `mousePos`
- `button`

### `label.onDragEnter(self, mousePos)`

**Parametry:**

- `self`
- `mousePos`

### `label.onDragLeave(self, droppedWidget, mousePos)`

**Parametry:**

- `self`
- `droppedWidget`
- `mousePos`

### `label.onDragMove(self, mousePos, mouseMoved)`

**Parametry:**

- `self`
- `mousePos`
- `mouseMoved`

### `removeTabLabelByName(tab, name)`

**Parametry:**

- `tab`
- `name`

### `processChannelTabMenu(tab, mousePos, mouseButton)`

**Parametry:**

- `tab`
- `mousePos`
- `mouseButton`

### `processMessageMenu(mousePos, mouseButton, creatureName, text, label, tab)`

**Parametry:**

- `mousePos`
- `mouseButton`
- `creatureName`
- `text`
- `label`
- `tab`

### `sendCurrentMessage()`

### `addFilter(filter)`

**Parametry:**

- `filter`

### `removeFilter(filter)`

**Parametry:**

- `filter`

### `sendMessage(message, tab)`

**Parametry:**

- `message`
- `tab`

### `sayModeChange(sayMode)`

**Parametry:**

- `sayMode`

### `getOwnPrivateTab()`

### `setIgnoreNpcMessages(ignore)`

**Parametry:**

- `ignore`

### `navigateMessageHistory(step)`

**Parametry:**

- `step`

### `applyMessagePrefixies(name, level, message)`

**Parametry:**

- `name`
- `level`
- `message`

### `onTalk(name, level, mode, message, channelId, creaturePos)`

**Parametry:**

- `name`
- `level`
- `mode`
- `message`
- `channelId`
- `creaturePos`

### `onOpenChannel(channelId, channelName)`

**Parametry:**

- `channelId`
- `channelName`

### `onOpenPrivateChannel(receiver)`

**Parametry:**

- `receiver`

### `onOpenOwnPrivateChannel(channelId, channelName)`

**Parametry:**

- `channelId`
- `channelName`

### `onCloseChannel(channelId)`

**Parametry:**

- `channelId`

### `processViolation(name, text)`

**Parametry:**

- `name`
- `text`

### `onRuleViolationChannel(channelId)`

**Parametry:**

- `channelId`

### `onRuleViolationRemove(name)`

**Parametry:**

- `name`

### `onRuleViolationCancel(name)`

**Parametry:**

- `name`

### `onRuleViolationLock()`

### `doChannelListSubmit()`

### `onChannelList(channelList)`

**Parametry:**

- `channelList`

### `channelsWindow.onDestroy()`

### `loadCommunicationSettings()`

### `saveCommunicationSettings()`

### `getIgnoredPlayers()`

### `getWhitelistedPlayers()`

### `isUsingIgnoreList()`

### `isUsingWhiteList()`

### `isIgnored(name)`

**Parametry:**

- `name`

### `addIgnoredPlayer(name)`

**Parametry:**

- `name`

### `removeIgnoredPlayer(name)`

**Parametry:**

- `name`

### `isWhitelisted(name)`

**Parametry:**

- `name`

### `addWhitelistedPlayer(name)`

**Parametry:**

- `name`

### `removeWhitelistedPlayer(name)`

**Parametry:**

- `name`

### `isIgnoringPrivate()`

### `isIgnoringYelling()`

### `isAllowingVIPs()`

### `onClickIgnoreButton()`

### `communicationWindow.onDestroy()`

### `ignoreListPanel.onChildFocusChange()`

### `removeIgnoreButton.onClick()`

### `whiteListPanel.onChildFocusChange()`

### `removeWhitelistButton.onClick()`

### `communicationWindow.onEnter()`

### `saveButton.onClick()`

### `cancelButton.onClick()`

### `online()`

### `offline()`

### `onChannelEvent(channelId, name, type)`

**Parametry:**

- `channelId`
- `name`
- `type`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `loadUI`

**Wywołanie:** `consolePanel = g_ui.loadUI('console', modules.game_interface.getBottomPanel())`

### `tentWidget`

**Wywołanie:** `consoleTabBar:setContentWidget(consoleContentPanel)`

### `line`

**Wywołanie:** `online()`

### `cat`

**Wywołanie:** `consoleBuffer.selectionText = table.concat(text, '\n')`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `Settings`

**Wywołanie:** `saveCommunicationSettings()`

### `Settings`

**Wywołanie:** `loadCommunicationSettings()`

### `TabChange`

**Wywołanie:** `function onTabChange(tabBar, tab)`

### `DragEnter`

**Wywołanie:** `function onDragEnter(widget, pos)`

### `DragMove`

**Wywołanie:** `function onDragMove(widget, pos, moved)`

### `DragLeave`

**Wywołanie:** `function onDragLeave(widget, pos)`

### `Window`

**Wywołanie:** `function openPlayerReportRuleViolationWindow()`

### `loadUI`

**Wywołanie:** `violationWindow = g_ui.loadUI('violationwindow', rootWidget)`

### `sTab`

**Wywołanie:** `function getRuleViolationsTab()`

### `createWidget`

**Wywołanie:** `label = g_ui.createWidget('ConsoleLabel', consoleBuffer)`

### `cat`

**Wywołanie:** `consoleBuffer.selectionText = table.concat(text, '\n')`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(filepath, table.concat(lines, '\n'))`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

### `sTab`

**Wywołanie:** `if tab == serverTab or tab == getRuleViolationsTab() then`

### `Talk`

**Wywołanie:** `function onTalk(name, level, mode, message, channelId, creaturePos)`

### `OpenChannel`

**Wywołanie:** `function onOpenChannel(channelId, channelName)`

### `OpenPrivateChannel`

**Wywołanie:** `function onOpenPrivateChannel(receiver)`

### `OpenOwnPrivateChannel`

**Wywołanie:** `function onOpenOwnPrivateChannel(channelId, channelName)`

### `CloseChannel`

**Wywołanie:** `function onCloseChannel(channelId)`

### `RuleViolationChannel`

**Wywołanie:** `function onRuleViolationChannel(channelId)`

### `RuleViolationRemove`

**Wywołanie:** `function onRuleViolationRemove(name)`

### `sTab`

**Wywołanie:** `local tab = getRuleViolationsTab()`

### `RuleViolationCancel`

**Wywołanie:** `function onRuleViolationCancel(name)`

### `RuleViolationLock`

**Wywołanie:** `function onRuleViolationLock()`

### `ChannelList`

**Wywołanie:** `function onChannelList(channelList)`

### `displayUI`

**Wywołanie:** `channelsWindow = g_ui.displayUI('channelswindow')`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget('ChannelListLabel', channelListPanel)`

### `Settings`

**Wywołanie:** `function loadCommunicationSettings()`

### `Settings`

**Wywołanie:** `function saveCommunicationSettings()`

### `ClickIgnoreButton`

**Wywołanie:** `function onClickIgnoreButton()`

### `displayUI`

**Wywołanie:** `communicationWindow = g_ui.displayUI('communicationwindow')`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget('IgnoreListLabel', ignoreListPanel)`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget('WhiteListLabel', whiteListPanel)`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget('IgnoreListLabel', ignoreListPanel)`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget('WhiteListLabel', whiteListPanel)`

### `line`

**Wywołanie:** `function online()`

### `umber`

**Wywołanie:** `channelId = tonumber(channelId)`

### `ChannelEvent`

**Wywołanie:** `function onChannelEvent(channelId, name, type)`
