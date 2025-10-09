---
doc_id: "lua-spec-be70d0ae3ea6"
source_path: "game_interface/gameinterface.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: gameinterface.lua"
summary: "Dokumentacja modułu Lua dla game_interface/gameinterface.lua"
tags: ["lua", "module", "otclient"]
---

# game_interface/gameinterface.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla gameinterface.

## Globals/Exports

### `hookedMenuOptions`

### `hookedMenuOptions`

## Functions

### `init()`

### `bindKeys()`

### `terminate()`

### `onGameStart()`

### `onGameEnd()`

### `show()`

### `hide()`

### `save()`

### `load()`

### `onLoginAdvice(message)`

**Parametry:**

- `message`

### `forceExit()`

### `tryExit()`

### `tryLogout(prompt)`

**Parametry:**

- `prompt`

### `yesCallback()`

### `yesCallback()`

### `updateStretchShrink()`

### `onMouseGrabberRelease(self, mousePosition, mouseButton)`

**Parametry:**

- `self`
- `mousePosition`
- `mouseButton`

### `onUseWith(clickedWidget, mousePosition)`

**Parametry:**

- `clickedWidget`
- `mousePosition`

### `onTradeWith(clickedWidget, mousePosition)`

**Parametry:**

- `clickedWidget`
- `mousePosition`

### `startUseWith(thing, subType)`

**Parametry:**

- `thing`
- `subType`

### `startTradeWith(thing)`

**Parametry:**

- `thing`

### `isMenuHookCategoryEmpty(category)`

**Parametry:**

- `category`

### `addMenuHook(category, name, callback, condition, shortcut)`

**Parametry:**

- `category`
- `name`
- `callback`
- `condition`
- `shortcut`

### `removeMenuHook(category, name)`

**Parametry:**

- `category`
- `name`

### `createThingMenu(menuPosition, lookThing, useThing, creatureThing)`

**Parametry:**

- `menuPosition`
- `lookThing`
- `useThing`
- `creatureThing`

### `processMouseAction(menuPosition, mouseButton, autoWalkPos, lookThing, useThing, creatureThing, attackCreature, marking)`

**Parametry:**

- `menuPosition`
- `mouseButton`
- `autoWalkPos`
- `lookThing`
- `useThing`
- `creatureThing`
- `attackCreature`
- `marking`

### `moveStackableItem(item, toPos)`

**Parametry:**

- `item`
- `toPos`

### `scrollbar.onValueChange(self, value)`

**Parametry:**

- `self`
- `value`

### `getRootPanel()`

### `getMapPanel()`

### `getRightPanel()`

### `getLeftPanel()`

### `getContainerPanel()`

### `addRightPanel()`

### `addLeftPanel()`

### `removeRightPanel()`

### `removeLeftPanel()`

### `getBottomPanel()`

### `getBottomActionPanel()`

### `getLeftActionPanel()`

### `getRightActionPanel()`

### `getTopBar()`

### `refreshViewMode()`

### `limitZoom()`

### `updateSize()`

### `setupLeftActions()`

### `widget.onClick()`

### `gameLeftActions.use.doubleClickAction()`

### `gameLeftActions.attack.doubleClickAction()`

### `gameLeftActions.follow.doubleClickAction()`

### `gameLeftActions.look.doubleClickAction()`

### `gameLeftActions.chat.onClick()`

### `resetLeftActions()`

### `getLeftAction()`

### `isChatVisible()`

## Events/Callbacks

### `importStyle`

**Wywołanie:** `g_ui.importStyle('styles/countwindow')`

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `g_app`

Call load AFTER game window has been created and resized to a stable state, otherwise the saved settings can get overridden by false onGeometryChange events

**Wywołanie:** `connect(g_app, {`

### `displayUI`

**Wywołanie:** `gameRootPanel = g_ui.displayUI('gameinterface')`

### `gameLeftPanel`

**Wywołanie:** `connect(gameLeftPanel, { onVisibilityChange = onLeftPanelVisibilityChange })`

### `createWidget`

**Wywołanie:** `gameRightPanels:addChild(g_ui.createWidget('GameSidePanel'))`

### `s`

**Wywołanie:** `setupLeftActions()`

### `gameMapPanel`

**Wywołanie:** `connect(gameMapPanel, { onGeometryChange = updateSize, onVisibleDimensionChange = updateSize })`

### `g_game`

**Wywołanie:** `connect(g_game, { onMapChangeAwareRange = updateSize })`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `gameMapPanel`

**Wywołanie:** `disconnect(gameMapPanel, { onGeometryChange = updateSize })`

### `gameMapPanel`

**Wywołanie:** `connect(gameMapPanel, { onGeometryChange = updateSize, onVisibleDimensionChange = updateSize })`

### `GameStart`

**Wywołanie:** `function onGameStart()`

### `GameEnd`

**Wywołanie:** `function onGameEnd()`

### `g_app`

**Wywołanie:** `connect(g_app, { onClose = tryExit })`

### `event`

**Wywołanie:** `addEvent(function()`

### `g_app`

**Wywołanie:** `disconnect(g_app, { onClose = tryExit })`

### `LoginAdvice`

**Wywołanie:** `function onLoginAdvice(message)`

### `nectionOk`

**Wywołanie:** `if not g_game.isConnectionOk() then`

### `MouseGrabberRelease`

**Wywołanie:** `function onMouseGrabberRelease(self, mousePosition, mouseButton)`

### `UseWith`

**Wywołanie:** `onUseWith(clickedWidget, mousePosition)`

### `TradeWith`

**Wywołanie:** `onTradeWith(clickedWidget, mousePosition)`

### `UseWith`

**Wywołanie:** `function onUseWith(clickedWidget, mousePosition)`

### `tainer`

**Wywołanie:** `if selectedThing:isFluidContainer() or selectedThing:isMultiUse() then`

### `Offset`

**Wywołanie:** `g_game.useWith(selectedThing, tile:getTopMultiUseThingEx(clickedWidget:getPositionOffset(mousePosition)), selectedSubtype)`

### `TradeWith`

**Wywołanie:** `function onTradeWith(clickedWidget, mousePosition)`

### `Offset`

**Wywołanie:** `g_game.requestTrade(selectedThing, tile:getTopCreatureEx(clickedWidget:getPositionOffset(mousePosition)))`

### `isMouseGrabbed`

**Wywołanie:** `if g_ui.isMouseGrabbed() then`

### `isMouseGrabbed`

**Wywołanie:** `if g_ui.isMouseGrabbed() then`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

### `tainer`

**Wywołanie:** `if useThing:isContainer() then`

### `tainer`

**Wywołanie:** `if useThing:getParentContainer() then`

### `tainer`

**Wywołanie:** `menu:addOption(tr('Open'), function() g_game.open(useThing, useThing:getParentContainer()) end, shortcut)`

### `tainer`

**Wywołanie:** `local parentContainer = lookThing:getParentContainer()`

### `tainer`

**Wywołanie:** `menu:addOption(tr('Move up'), function() g_game.moveToParentContainer(lookThing, lookThing:getCount()) end)`

### `dition`

**Wywołanie:** `if opt and opt.condition(menuPosition, lookThing, useThing, creatureThing) then`

### `s`

**Wywołanie:** `resetLeftActions()`

### `s`

**Wywołanie:** `resetLeftActions()`

### `tainer`

**Wywołanie:** `if useThing:isContainer() then`

### `tainer`

**Wywołanie:** `if useThing:getParentContainer() then`

### `tainer`

**Wywołanie:** `g_game.open(useThing, useThing:getParentContainer())`

### `s`

**Wywołanie:** `resetLeftActions()`

### `s`

**Wywołanie:** `resetLeftActions()`

### `s`

**Wywołanie:** `resetLeftActions()`

### `s`

**Wywołanie:** `resetLeftActions()`

### `tainer`

**Wywołanie:** `if useThing:isContainer() then`

### `tainer`

**Wywołanie:** `if useThing:getParentContainer() then`

### `tainer`

**Wywołanie:** `g_game.open(useThing, useThing:getParentContainer())`

### `tainer`

**Wywołanie:** `elseif useThing:isContainer() then`

### `tainer`

**Wywołanie:** `if useThing:getParentContainer() then`

### `tainer`

**Wywołanie:** `g_game.open(useThing, useThing:getParentContainer())`

### `createWidget`

**Wywołanie:** `countWindow = g_ui.createWidget('CountWindow', rootWidget)`

### `s`

**Wywołanie:** `spinbox:hideButtons()`

### `tainerPanel`

**Wywołanie:** `function getContainerPanel()`

### `createWidget`

**Wywołanie:** `local panel = g_ui.createWidget('GameSidePanel')`

### `createWidget`

**Wywołanie:** `local panel = g_ui.createWidget('GameSidePanel')`

### `Panel`

**Wywołanie:** `function getBottomActionPanel()`

### `Panel`

**Wywołanie:** `function getLeftActionPanel()`

### `Panel`

**Wywołanie:** `function getRightActionPanel()`

### `GeometryChange`

**Wywołanie:** `child.onGeometryChange(child)`

### `s`

**Wywołanie:** `function setupLeftActions()`

### `s`

**Wywołanie:** `resetLeftActions()`

### `s`

**Wywołanie:** `function resetLeftActions()`
