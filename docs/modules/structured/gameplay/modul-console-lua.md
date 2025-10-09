# Modu: Modu: `console.lua`
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
> Ten modu pochodzi z: modules/modules_game_1.md

### Zaimportowana tre (legacy)
#### Funkcje

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


#### Eventy / Hooki

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


#### Wywoania API

- `g_game`
- `g_keyboard`
- `g_map`
- `g_ui`
- `g_window`

---
