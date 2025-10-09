# Modu: Modu: `bot.lua`
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


#### Eventy / Hooki

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


#### Wywoania API

- `g_clock`
- `g_game`
- `g_sounds`
- `g_ui`
