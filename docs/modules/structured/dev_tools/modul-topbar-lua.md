# Modu: Modu: `topbar.lua`
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


#### Eventy / Hooki

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


#### Wywoania API

- `g_game`
- `g_ui`

---
