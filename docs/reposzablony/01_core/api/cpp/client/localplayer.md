---
doc_id: "cpp-api-46110359ac22"
source_path: "client/localplayer.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: localplayer.h"
summary: "Dokumentacja API C++ dla client/localplayer.h"
tags: ["cpp", "api", "otclient"]
---

# client/localplayer.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu localplayer.

## Classes/Structs

### Klasa: `LocalPlayer`

| Member | Brief | Signature |
|--------|-------|-----------|
| `draw` |  | `void draw(const Point& dest, bool animate = true, LightView* lightView = nullptr) override` |
| `unlockWalk` |  | `void unlockWalk() { m_walkLockExpiration = 0; }` |
| `lockWalk` |  | `void lockWalk(int millis = 200)` |
| `stopAutoWalk` |  | `void stopAutoWalk()` |
| `autoWalk` |  | `bool autoWalk(Position destination, bool retry = false)` |
| `canWalk` |  | `bool canWalk(Otc::Direction direction, bool ignoreLock = false)` |
| `isWalkLocked` |  | `bool isWalkLocked() {` |
| `turn` |  | `void turn(Otc::Direction) override` |
| `setStates` |  | `void setStates(int states)` |
| `setSkill` |  | `void setSkill(uint8_t skill, int level, int levelPercent)` |
| `setBaseSkill` |  | `void setBaseSkill(uint8_t skill, int baseLevel)` |
| `setHealth` |  | `void setHealth(double health, double maxHealth)` |
| `setFreeCapacity` |  | `void setFreeCapacity(double freeCapacity)` |
| `setTotalCapacity` |  | `void setTotalCapacity(double totalCapacity)` |
| `setExperience` |  | `void setExperience(double experience)` |
| `setLevel` |  | `void setLevel(double level, double levelPercent)` |
| `setMana` |  | `void setMana(double mana, double maxMana)` |
| `setMagicLevel` |  | `void setMagicLevel(double magicLevel, double magicLevelPercent)` |
| `setBaseMagicLevel` |  | `void setBaseMagicLevel(double baseMagicLevel)` |
| `setSoul` |  | `void setSoul(double soul)` |
| `setStamina` |  | `void setStamina(double stamina)` |
| `setKnown` |  | `void setKnown(bool known) { m_known = known; }` |
| `setPendingGame` |  | `void setPendingGame(bool pending) { m_pending = pending; }` |
| `setInventoryItem` |  | `void setInventoryItem(Otc::InventorySlot inventory, const ItemPtr& item)` |
| `setVocation` |  | `void setVocation(int vocation)` |
| `setPremium` |  | `void setPremium(bool premium)` |
| `setRegenerationTime` |  | `void setRegenerationTime(double regenerationTime)` |
| `setOfflineTrainingTime` |  | `void setOfflineTrainingTime(double offlineTrainingTime)` |
| `setSpells` |  | `void setSpells(const std::vector<int>& spells)` |
| `setBlessings` |  | `void setBlessings(int blessings)` |
| `getStates` |  | `int getStates() { return m_states; }` |
| `getSkillLevel` |  | `int getSkillLevel(uint8_t skill) { return skill < m_skillsLevel.size() ? m_skillsLevel[skill] : 0; }` |
| `getSkillBaseLevel` |  | `int getSkillBaseLevel(uint8_t skill) { return skill < m_skillsBaseLevel.size() ? m_skillsBaseLevel[skill] : 0; }` |
| `getSkillLevelPercent` |  | `int getSkillLevelPercent(uint8_t skill) { return skill < m_skillsLevelPercent.size() ? m_skillsLevelPercent[skill] : 0; }` |
| `getVocation` |  | `int getVocation() { return m_vocation; }` |
| `getHealth` |  | `double getHealth() { return m_health; }` |
| `getMaxHealth` |  | `double getMaxHealth() { return m_maxHealth; }` |
| `getFreeCapacity` |  | `double getFreeCapacity() { return m_freeCapacity; }` |
| `getTotalCapacity` |  | `double getTotalCapacity() { return m_totalCapacity; }` |
| `getExperience` |  | `double getExperience() { return m_experience; }` |
| `getLevel` |  | `double getLevel() { return m_level; }` |
| `getLevelPercent` |  | `double getLevelPercent() { return m_levelPercent; }` |
| `getMana` |  | `double getMana() { return m_mana; }` |
| `getMaxMana` |  | `double getMaxMana() { return std::max<double>(m_mana, m_maxMana); }` |
| `getMagicLevel` |  | `double getMagicLevel() { return m_magicLevel; }` |
| `getMagicLevelPercent` |  | `double getMagicLevelPercent() { return m_magicLevelPercent; }` |
| `getBaseMagicLevel` |  | `double getBaseMagicLevel() { return m_baseMagicLevel; }` |
| `getSoul` |  | `double getSoul() { return m_soul; }` |
| `getStamina` |  | `double getStamina() { return m_stamina; }` |
| `getRegenerationTime` |  | `double getRegenerationTime() { return m_regenerationTime; }` |
| `getOfflineTrainingTime` |  | `double getOfflineTrainingTime() { return m_offlineTrainingTime; }` |
| `getSpells` |  | `std::vector<int> getSpells() { return m_spells; }` |
| `getInventoryItem` |  | `ItemPtr getInventoryItem(Otc::InventorySlot inventory) { return m_inventoryItems[inventory]; }` |
| `getBlessings` |  | `int getBlessings() { return m_blessings; }` |
| `hasSight` |  | `bool hasSight(const Position& pos)` |
| `isKnown` |  | `bool isKnown() { return m_known; }` |
| `isAutoWalking` |  | `bool isAutoWalking() { return m_autoWalkDestination.isValid(); }` |
| `isServerWalking` |  | `bool isServerWalking() override { return m_serverWalking; }` |
| `isPremium` |  | `bool isPremium() { return m_premium; }` |
| `isPendingGame` |  | `bool isPendingGame() { return m_pending; }` |
| `asLocalPlayer` |  | `LocalPlayerPtr asLocalPlayer() { return static_self_cast<LocalPlayer>(); }` |
| `isLocalPlayer` |  | `bool isLocalPlayer() override { return true; }` |
| `onAppear` |  | `void onAppear() override` |
| `onPositionChange` |  | `void onPositionChange(const Position& newPos, const Position& oldPos) override` |
| `preWalk` |  | `void preWalk(Otc::Direction direction)` |
| `isPreWalking` |  | `bool isPreWalking() override { return !m_preWalking.empty(); }` |
| `getPrewalkingPosition` |  | `Position getPrewalkingPosition(bool beforePrewalk = false) override {` |
| `m_position` |  | `return m_position` |
| `if` |  | `else if (!beforePrewalk && m_preWalking.size() == 1)` |
| `m_position` |  | `return m_position` |
| `ret` |  | `auto ret = m_preWalking.rbegin()` |
| `getWalkPrediction` |  | `uint32_t getWalkPrediction(const Position& pos)` |
| `dumpWalkMatrix` |  | `std::string dumpWalkMatrix()` |
| `startServerWalking` |  | `void startServerWalking() { m_serverWalking = true; }` |
| `finishServerWalking` |  | `void finishServerWalking() { m_serverWalking = false; }` |
| `walk` |  | `void walk(const Position& oldPos, const Position& newPos) override` |
| `cancelWalk` |  | `void cancelWalk(Otc::Direction direction = Otc::InvalidDirection)` |
| `cancelNewWalk` |  | `void cancelNewWalk(Otc::Direction dir)` |
| `predictiveCancelWalk` |  | `bool predictiveCancelWalk(const Position& pos, uint32_t predictionId, Otc::Direction dir)` |
| `retryAutoWalk` |  | `bool retryAutoWalk()` |
| `stopWalk` |  | `void stopWalk() override` |
| `updateWalkOffset` |  | `void updateWalkOffset(uint8 totalPixelsWalked, bool inNextFrame = false) override` |
| `updateWalk` |  | `void updateWalk() override` |
| `terminateWalk` |  | `void terminateWalk() override` |

## Functions

### `draw`

**Sygnatura:** `void draw(const Point& dest, bool animate = true, LightView* lightView = nullptr) override`

### `unlockWalk`

**Sygnatura:** `void unlockWalk() { m_walkLockExpiration = 0; }`

### `lockWalk`

**Sygnatura:** `void lockWalk(int millis = 200)`

### `stopAutoWalk`

**Sygnatura:** `void stopAutoWalk()`

### `autoWalk`

**Sygnatura:** `bool autoWalk(Position destination, bool retry = false)`

### `canWalk`

**Sygnatura:** `bool canWalk(Otc::Direction direction, bool ignoreLock = false)`

### `isWalkLocked`

**Sygnatura:** `bool isWalkLocked() {`

### `turn`

**Sygnatura:** `void turn(Otc::Direction) override`

### `setStates`

**Sygnatura:** `void setStates(int states)`

### `setSkill`

**Sygnatura:** `void setSkill(uint8_t skill, int level, int levelPercent)`

### `setBaseSkill`

**Sygnatura:** `void setBaseSkill(uint8_t skill, int baseLevel)`

### `setHealth`

**Sygnatura:** `void setHealth(double health, double maxHealth)`

### `setFreeCapacity`

**Sygnatura:** `void setFreeCapacity(double freeCapacity)`

### `setTotalCapacity`

**Sygnatura:** `void setTotalCapacity(double totalCapacity)`

### `setExperience`

**Sygnatura:** `void setExperience(double experience)`

### `setLevel`

**Sygnatura:** `void setLevel(double level, double levelPercent)`

### `setMana`

**Sygnatura:** `void setMana(double mana, double maxMana)`

### `setMagicLevel`

**Sygnatura:** `void setMagicLevel(double magicLevel, double magicLevelPercent)`

### `setBaseMagicLevel`

**Sygnatura:** `void setBaseMagicLevel(double baseMagicLevel)`

### `setSoul`

**Sygnatura:** `void setSoul(double soul)`

### `setStamina`

**Sygnatura:** `void setStamina(double stamina)`

### `setKnown`

**Sygnatura:** `void setKnown(bool known) { m_known = known; }`

### `setPendingGame`

**Sygnatura:** `void setPendingGame(bool pending) { m_pending = pending; }`

### `setInventoryItem`

**Sygnatura:** `void setInventoryItem(Otc::InventorySlot inventory, const ItemPtr& item)`

### `setVocation`

**Sygnatura:** `void setVocation(int vocation)`

### `setPremium`

**Sygnatura:** `void setPremium(bool premium)`

### `setRegenerationTime`

**Sygnatura:** `void setRegenerationTime(double regenerationTime)`

### `setOfflineTrainingTime`

**Sygnatura:** `void setOfflineTrainingTime(double offlineTrainingTime)`

### `setSpells`

**Sygnatura:** `void setSpells(const std::vector<int>& spells)`

### `setBlessings`

**Sygnatura:** `void setBlessings(int blessings)`

### `getStates`

**Sygnatura:** `int getStates() { return m_states; }`

### `getSkillLevel`

**Sygnatura:** `int getSkillLevel(uint8_t skill) { return skill < m_skillsLevel.size() ? m_skillsLevel[skill] : 0; }`

### `getSkillBaseLevel`

**Sygnatura:** `int getSkillBaseLevel(uint8_t skill) { return skill < m_skillsBaseLevel.size() ? m_skillsBaseLevel[skill] : 0; }`

### `getSkillLevelPercent`

**Sygnatura:** `int getSkillLevelPercent(uint8_t skill) { return skill < m_skillsLevelPercent.size() ? m_skillsLevelPercent[skill] : 0; }`

### `getVocation`

**Sygnatura:** `int getVocation() { return m_vocation; }`

### `getHealth`

**Sygnatura:** `double getHealth() { return m_health; }`

### `getMaxHealth`

**Sygnatura:** `double getMaxHealth() { return m_maxHealth; }`

### `getFreeCapacity`

**Sygnatura:** `double getFreeCapacity() { return m_freeCapacity; }`

### `getTotalCapacity`

**Sygnatura:** `double getTotalCapacity() { return m_totalCapacity; }`

### `getExperience`

**Sygnatura:** `double getExperience() { return m_experience; }`

### `getLevel`

**Sygnatura:** `double getLevel() { return m_level; }`

### `getLevelPercent`

**Sygnatura:** `double getLevelPercent() { return m_levelPercent; }`

### `getMana`

**Sygnatura:** `double getMana() { return m_mana; }`

### `getMaxMana`

**Sygnatura:** `double getMaxMana() { return std::max<double>(m_mana, m_maxMana); }`

### `getMagicLevel`

**Sygnatura:** `double getMagicLevel() { return m_magicLevel; }`

### `getMagicLevelPercent`

**Sygnatura:** `double getMagicLevelPercent() { return m_magicLevelPercent; }`

### `getBaseMagicLevel`

**Sygnatura:** `double getBaseMagicLevel() { return m_baseMagicLevel; }`

### `getSoul`

**Sygnatura:** `double getSoul() { return m_soul; }`

### `getStamina`

**Sygnatura:** `double getStamina() { return m_stamina; }`

### `getRegenerationTime`

**Sygnatura:** `double getRegenerationTime() { return m_regenerationTime; }`

### `getOfflineTrainingTime`

**Sygnatura:** `double getOfflineTrainingTime() { return m_offlineTrainingTime; }`

### `getSpells`

**Sygnatura:** `std::vector<int> getSpells() { return m_spells; }`

### `getInventoryItem`

**Sygnatura:** `ItemPtr getInventoryItem(Otc::InventorySlot inventory) { return m_inventoryItems[inventory]; }`

### `getBlessings`

**Sygnatura:** `int getBlessings() { return m_blessings; }`

### `hasSight`

**Sygnatura:** `bool hasSight(const Position& pos)`

### `isKnown`

**Sygnatura:** `bool isKnown() { return m_known; }`

### `isAutoWalking`

**Sygnatura:** `bool isAutoWalking() { return m_autoWalkDestination.isValid(); }`

### `isServerWalking`

**Sygnatura:** `bool isServerWalking() override { return m_serverWalking; }`

### `isPremium`

**Sygnatura:** `bool isPremium() { return m_premium; }`

### `isPendingGame`

**Sygnatura:** `bool isPendingGame() { return m_pending; }`

### `asLocalPlayer`

**Sygnatura:** `LocalPlayerPtr asLocalPlayer() { return static_self_cast<LocalPlayer>(); }`

### `isLocalPlayer`

**Sygnatura:** `bool isLocalPlayer() override { return true; }`

### `onAppear`

**Sygnatura:** `void onAppear() override`

### `onPositionChange`

**Sygnatura:** `void onPositionChange(const Position& newPos, const Position& oldPos) override`

### `preWalk`

**Sygnatura:** `void preWalk(Otc::Direction direction)`

### `isPreWalking`

**Sygnatura:** `bool isPreWalking() override { return !m_preWalking.empty(); }`

### `getPrewalkingPosition`

**Sygnatura:** `Position getPrewalkingPosition(bool beforePrewalk = false) override {`

### `if`

**Sygnatura:** `else if (!beforePrewalk && m_preWalking.size() == 1)`

### `getWalkPrediction`

**Sygnatura:** `uint32_t getWalkPrediction(const Position& pos)`

### `dumpWalkMatrix`

**Sygnatura:** `std::string dumpWalkMatrix()`

### `startServerWalking`

**Sygnatura:** `void startServerWalking() { m_serverWalking = true; }`

### `finishServerWalking`

**Sygnatura:** `void finishServerWalking() { m_serverWalking = false; }`

### `walk`

**Sygnatura:** `void walk(const Position& oldPos, const Position& newPos) override`

### `cancelWalk`

**Sygnatura:** `void cancelWalk(Otc::Direction direction = Otc::InvalidDirection)`

### `cancelNewWalk`

**Sygnatura:** `void cancelNewWalk(Otc::Direction dir)`

### `predictiveCancelWalk`

**Sygnatura:** `bool predictiveCancelWalk(const Position& pos, uint32_t predictionId, Otc::Direction dir)`

### `retryAutoWalk`

**Sygnatura:** `bool retryAutoWalk()`

### `stopWalk`

**Sygnatura:** `void stopWalk() override`

### `updateWalkOffset`

**Sygnatura:** `void updateWalkOffset(uint8 totalPixelsWalked, bool inNextFrame = false) override`

### `updateWalk`

**Sygnatura:** `void updateWalk() override`

### `terminateWalk`

**Sygnatura:** `void terminateWalk() override`

## Class Diagram

Zobacz: [../diagrams/localplayer.mmd](../diagrams/localplayer.mmd)
