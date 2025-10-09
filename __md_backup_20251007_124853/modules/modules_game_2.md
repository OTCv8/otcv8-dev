# Modules Game 2

---
# # game_hotkeys
# Game Hotkeys Module
# # `hotkeys_extra.lua`
# # # Funkcje

- `addExtraHotkey(name, description, callback)`
- `setupExtraHotkeys(combobox)`
- `executeExtraHotkey(action, repeated)`
- `translateActionToActionComboboxIndex(action)`
- `translateActionComboboxIndexToAction(index)`
- `getActionDescription(action)`
# # # Wywołania API

- `g_game`
# # `hotkeys_manager.lua`
# # # Funkcje

- `init()`
- `terminate()`
- `online()`
- `offline()`
- `show()`
- `hide()`
- `toggle()`
- `ok()`
- `cancel()`
- `load(forceDefaults)`
- `unload()`
- `reset()`
- `reload()`
- `save()`
- `onConfigChange()`
- `loadDefautComboKeys()`
- `setDefaultComboKeys(combo)`
- `onChooseItemMouseRelease(self, mousePosition, mouseButton)`
- `startChooseItem()`
- `clearObject()`
- `addHotkey()`
- `addKeyCombo(keyCombo, keySettings, focus)`
- `prepareKeyCombo(keyCombo, ticks)`
- `doKeyCombo(keyCombo, repeated)`
- `updateHotkeyLabel(hotkeyLabel)`
- `updateHotkeyForm(reset)`
- `removeHotkey()`
- `updateHotkeyAction()`
- `onHotkeyTextChange(value)`
- `onSendAutomaticallyChange(autoSend)`
- `onChangeUseType(useTypeWidget)`
- `onSelectHotkeyLabel(hotkeyLabel)`
- `hotkeyCapture(assignWindow, keyCode, keyboardModifiers)`
- `hotkeyCaptureOk(assignWindow, keyCombo)`
# # # Eventy / Hooki

- `connect`
- `onChangeUseType`
- `onChildFocusChange`
- `onChooseItemMouseRelease`
- `onConfigChange`
- `onGameEnd`
- `onGameStart`
- `onHotkeyTextChange`
- `onKeyDown`
- `onMouseRelease`
- `onSelectHotkeyLabel`
- `onSelectionChange`
- `onSendAutomaticallyChange`
- `online`
- `scheduleEvent`
# # # Wywołania API

- `g_clock`
- `g_game`
- `g_keyboard`
- `g_mouse`
- `g_ui`

---
# # game_minimap
# Game Minimap Module
# # `minimap.lua`
# # # Funkcje

- `init()`
- `terminate()`
- `toggle()`
- `onMiniWindowClose()`
- `online()`
- `offline()`
- `loadMap()`
- `saveMap()`
- `updateCameraPosition()`
- `toggleFullMap()`
# # # Eventy / Hooki

- `connect`
- `onGameEnd`
- `onGameStart`
- `onMiniWindowClose`
- `onPositionChange`
- `online`
# # # Wywołania API

- `g_game`
- `g_keyboard`
- `g_ui`

---
# # game_actionbar
# Game Actionbar Module
# # `actionbar.lua`
# # # Opis
-- servers may have different id's, change if not working properly (only for protocols 910+)

-- ek
# # # Funkcje

- `translateVocation(id)`
- `isSpell(text)`
- `init()`
- `terminate()`
- `createActionBars()`
- `offline()`
- `online()`
- `show()`
- `refresh()`
- `translateHotkeyDesc(text)`
- `destroyAssignWindows()`
- `changeLockState(widget)`
- `moveActionButtons(widget)`
- `onDropActionButton(self, mousePosition, mouseButton)`
- `setupActionBar(n)`
- `setupButton(widget)`
- `resetSlot(widget)`
- `assignItem(widget)`
- `assignText(widget)`
- `assignSpell(widget)`
- `filterByVocation(a, filter)`
- `assignHotkey(widget)`
- `setupAction(widget)`
- `onSpellCooldown(iconId, duration)`
- `onSpellGroupCooldown(groupId, duration)`
- `startCooldown(action, duration)`
- `updateCooldown(action)`
- `save()`
- `load()`
- `local translateVocation(id)`
- `local isSpell(text)`
- `local filterByVocation(a, filter)`
# # # Eventy / Hooki

- `connect`
- `onCheckChange`
- `onChildFocusChange`
- `onClick`
- `onDragEnter`
- `onDropActionButton`
- `onEnter`
- `onEscape`
- `onGameEnd`
- `onGameStart`
- `onItemChange`
- `onKeyDown`
- `onMouseRelease`
- `onMouseWheel`
- `onSelectionChange`
- `onSpellCooldown`
- `onSpellGroupCooldown`
- `onTextChange`
- `one`
- `online`
- `only`
- `scheduleEvent`
# # # Wywołania API

- `g_clock`
- `g_game`
- `g_keyboard`
- `g_mouse`
- `g_ui`

---
# # game_skills
# Game Skills Module
# # `skills.lua`
# # # Funkcje

- `init()`
- `terminate()`
- `expForLevel(level)`
- `expToAdvance(currentLevel, currentExp)`
- `resetSkillColor(id)`
- `toggleSkill(id, state)`
- `setSkillBase(id, value, baseValue)`
- `setSkillValue(id, value)`
- `setSkillColor(id, value)`
- `setSkillTooltip(id, value)`
- `setSkillPercent(id, percent, tooltip, color)`
- `checkAlert(id, value, maxValue, threshold, greaterThan)`
- `update()`
- `refresh()`
- `offline()`
- `toggle()`
- `checkExpSpeed()`
- `onMiniWindowClose()`
- `onSkillButtonClick(button)`
- `onExperienceChange(localPlayer, value)`
- `onLevelChange(localPlayer, value, percent)`
- `onHealthChange(localPlayer, health, maxHealth)`
- `onManaChange(localPlayer, mana, maxMana)`
- `onSoulChange(localPlayer, soul)`
- `onFreeCapacityChange(localPlayer, freeCapacity)`
- `onTotalCapacityChange(localPlayer, totalCapacity)`
- `onStaminaChange(localPlayer, stamina)`
- `onOfflineTrainingChange(localPlayer, offlineTrainingTime)`
- `onRegenerationChange(localPlayer, regenerationTime)`
- `onSpeedChange(localPlayer, speed)`
- `onBaseSpeedChange(localPlayer, baseSpeed)`
- `onMagicLevelChange(localPlayer, magiclevel, percent)`
- `onBaseMagicLevelChange(localPlayer, baseMagicLevel)`
- `onSkillChange(localPlayer, id, level, percent)`
- `onBaseSkillChange(localPlayer, id, baseLevel)`
# # # Eventy / Hooki

- `connect`
- `onBaseMagicLevelChange`
- `onBaseSkillChange`
- `onBaseSpeedChange`
- `onExperienceChange`
- `onFreeCapacityChange`
- `onGameEnd`
- `onGameStart`
- `onHealthChange`
- `onLevelChange`
- `onMagicLevelChange`
- `onManaChange`
- `onMiniWindowClose`
- `onOfflineTrainingChange`
- `onRegenerationChange`
- `onSkillButtonClick`
- `onSkillChange`
- `onSoulChange`
- `onSpeedChange`
- `onStaminaChange`
- `onTotalCapacityChange`
- `only`
# # # Wywołania API

- `g_clock`
- `g_game`
- `g_ui`

---
# # game_stats
# Game Stats Module
# # `stats.lua`
# # # Funkcje

- `init()`
- `terminate()`
- `update()`
- `show()`
- `hide()`
# # # Eventy / Hooki

- `scheduleEvent`
# # # Wywołania API

- `g_game`
- `g_ui`

---
# # game_viplist
# Game Viplist Module
# # `viplist.lua`
# # # Funkcje

- `init()`
- `terminate()`
- `loadVipInfo()`
- `saveVipInfo()`
- `refresh()`
- `clear()`
- `toggle()`
- `onMiniWindowClose()`
- `createAddWindow()`
- `createEditWindow(widget)`
- `destroyAddWindow()`
- `addVip()`
- `removeVip(widgetOrName)`
- `hideOffline(state)`
- `isHiddingOffline()`
- `getSortedBy()`
- `sortBy(state)`
- `onAddVip(id, name, state, description, iconId, notify)`
- `onVipStateChange(id, state)`
- `onVipListMousePress(widget, mousePos, mouseButton)`
- `onVipListLabelMousePress(widget, mousePos, mouseButton)`
# # # Eventy / Hooki

- `connect`
- `onAddVip`
- `onClick`
- `onDoubleClick`
- `onEnter`
- `onEscape`
- `onGameEnd`
- `onGameStart`
- `onMiniWindowClose`
- `onMousePress`
- `onVipListLabelMousePress`
- `onVipListMousePress`
- `onVipStateChange`
# # # Wywołania API

- `g_game`
- `g_keyboard`
- `g_ui`
- `g_window`

---
# # game_spelllist
# Game Spelllist Module
# # `spelllist.lua`
# # # Funkcje

- `getSpelllistProfile()`
- `setSpelllistProfile(name)`
- `online()`
- `offline()`
- `init()`
- `terminate()`
- `initializeSpelllist()`
- `changeSpelllistProfile(oldProfile)`
- `updateSpelllist()`
- `updateSpellInformation(widget)`
- `toggle()`
- `toggleFilter(widget, selectedWidget)`
- `resizeWindow()`
- `resetWindow()`
# # # Eventy / Hooki

- `connect`
- `onChildFocusChange`
- `onClick`
- `onGameEnd`
- `onGameStart`
- `onSelectionChange`
- `online`
- `only`
# # # Wywołania API

- `g_game`
- `g_keyboard`
- `g_ui`

---
# # game_outfit
# Game Outfit Module
# # `outfit.lua`
# # # Funkcje

- `init()`
- `terminate()`
- `onMovementChange(checkBox, checked)`
- `onShowFloorChange(checkBox, checked)`
- `onShowMountChange(checkBox, checked)`
- `onShowOutfitChange(checkBox, checked)`
- `onShowAuraChange(checkBox, checked)`
- `onShowWingsChange(checkBox, checked)`
- `onShowShaderChange(checkBox, checked)`
- `onShowBarsChange(checkBox, checked)`
- `create(currentOutfit, outfitList, mountList, wingList, auraList, shaderList, healthBarList, manaBarList)`
- `destroy()`
- `configureAddons(addons)`
- `newPreset()`
- `deletePreset()`
- `savePreset()`
- `renamePreset()`
- `saveRename(presetId)`
- `onAppearanceChange(widget, selectedWidget)`
- `showPresets()`
- `showOutfits()`
- `showMounts()`
- `showAuras()`
- `showWings()`
- `showShaders()`
- `showHealthBars()`
- `showManaBars()`
- `onPresetSelect(list, focusedChild, unfocusedChild, reason)`
- `onOutfitSelect(list, focusedChild, unfocusedChild, reason)`
- `onMountSelect(list, focusedChild, unfocusedChild, reason)`
- `onAuraSelect(list, focusedChild, unfocusedChild, reason)`
- `onWingsSelect(list, focusedChild, unfocusedChild, reason)`
- `onShaderSelect(list, focusedChild, unfocusedChild, reason)`
- `onHealthBarSelect(list, focusedChild, unfocusedChild, reason)`
- `onManaBarSelect(list, focusedChild, unfocusedChild, reason)`
- `updateAppearanceText(widget, text)`
- `updateAppearanceTexts(outfit)`
- `deselectPreset()`
- `onAddonChange(widget, checked)`
- `onColorModeChange(widget, selectedWidget)`
- `onColorCheckChange(widget, selectedWidget)`
- `updatePreview()`
- `rotate(value)`
- `onFilterSearch()`
- `saveSettings()`
- `loadSettings()`
- `loadDefaultSettings()`
- `accept()`
# # # Eventy / Hooki

- `addEvent`
- `connect`
- `onAddonChange`
- `onAppearanceChange`
- `onAuraSelect`
- `onCheckChange`
- `onChildFocusChange`
- `onClick`
- `onColorCheckChange`
- `onColorModeChange`
- `onFilterSearch`
- `onGameEnd`
- `onHealthBarSelect`
- `onKeyPress`
- `onManaBarSelect`
- `onMountSelect`
- `onMovementChange`
- `onOpenOutfitWindow`
- `onOutfitSelect`
- `onPresetSelect`
- `onSelectionChange`
- `onShaderSelect`
- `onShowAuraChange`
- `onShowBarsChange`
- `onShowFloorChange`
- `onShowMountChange`
- `onShowOutfitChange`
- `onShowShaderChange`
- `onShowWingsChange`
- `onWingsSelect`
# # # Wywołania API

- `g_clock`
- `g_game`
- `g_ui`

---
# # game_shaders
# Game Shaders Module
# # `shaders.lua`
# # # Opis
-- add manually your shaders from /data/shaders

-- map shaders

-- use modules.game_interface.gameMapPanel:setShader("map_rainbow") to set shader

-- outfit shaders
# # # Funkcje

- `init()`
- `terminate()`
# # # Wywołania API

- `g_shaders`

---
# # game_cooldown
# Game Cooldown Module
# # `cooldown.lua`
# # # Funkcje

- `init()`
- `terminate()`
- `loadIcon(iconId)`
- `onMiniWindowClose()`
- `toggle()`
- `online()`
- `refresh()`
- `removeCooldown(progressRect)`
- `turnOffCooldown(progressRect)`
- `initCooldown(progressRect, updateCallback, finishCallback)`
- `updateCooldown(progressRect, duration)`
- `isGroupCooldownIconActive(groupId)`
- `isCooldownIconActive(iconId)`
- `onSpellCooldown(iconId, duration)`
- `onSpellGroupCooldown(groupId, duration)`
# # # Eventy / Hooki

- `connect`
- `onEffectEnd`
- `onGameStart`
- `onMiniWindowClose`
- `onSpellCooldown`
- `onSpellGroupCooldown`
- `online`
- `scheduleEvent`
# # # Wywołania API

- `g_game`
- `g_ui`

---
# # game_features
# Game Features Module
# # `features.lua`
# # # Opis
-- you can add custom features here, list of them is in the modules\gamelib\const.lua

--g_game.enableFeature(GameExtendedOpcode)
# # # Funkcje

- `init()`
- `terminate()`
- `updateFeatures(version)`
# # # Eventy / Hooki

- `connect`
- `onClientVersionChange`
- `only`
# # # Wywołania API

- `g_game`
