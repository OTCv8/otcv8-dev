# Modu: Modu: `prey.lua`
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
#### Opis

-- sponsored by kivera-global.com

-- remade by Vithrax#5814


#### Funkcje

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


#### Eventy / Hooki

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


#### Wywoania API

- `g_game`
- `g_ui`

---
