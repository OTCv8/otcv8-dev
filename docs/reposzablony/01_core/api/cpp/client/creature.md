---
doc_id: "cpp-api-b0018d0869e1"
source_path: "client/creature.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: creature.h"
summary: "Dokumentacja API C++ dla client/creature.h"
tags: ["cpp", "api", "otclient"]
---

# client/creature.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu creature.

## Classes/Structs

### Klasa: `Creature`

| Member | Brief | Signature |
|--------|-------|-----------|
| `draw` |  | `virtual void draw(const Point& dest, bool animate = true, LightView* lightView = nullptr)` |
| `drawOutfit` |  | `virtual void drawOutfit(const Rect& destRect, Otc::Direction direction = Otc::InvalidDirection, const Color& color = Color::white, bool animate = fals` |
| `drawInformation` |  | `void drawInformation(const Point& point, bool useGray, const Rect& parentRect, int drawFlags)` |
| `isInsideOffset` |  | `bool isInsideOffset(Point offset)` |
| `setId` |  | `void setId(uint32 id) { m_id = id; }` |
| `setName` |  | `void setName(const std::string& name)` |
| `setManaPercent` |  | `void setManaPercent(int8 value) { m_manaPercent = value; }` |
| `setHealthPercent` |  | `void setHealthPercent(uint8 healthPercent)` |
| `setDirection` |  | `void setDirection(Otc::Direction direction)` |
| `setOutfit` |  | `void setOutfit(const Outfit& outfit)` |
| `setOutfitColor` |  | `void setOutfitColor(const Color& color, int duration)` |
| `setLight` |  | `void setLight(const Light& light) { m_light = light; }` |
| `setSpeed` |  | `void setSpeed(uint16 speed)` |
| `setBaseSpeed` |  | `void setBaseSpeed(double baseSpeed)` |
| `setSkull` |  | `void setSkull(uint8 skull)` |
| `setShield` |  | `void setShield(uint8 shield)` |
| `setEmblem` |  | `void setEmblem(uint8 emblem)` |
| `setType` |  | `void setType(uint8 type)` |
| `setIcon` |  | `void setIcon(uint8 icon)` |
| `setSkullTexture` |  | `void setSkullTexture(const std::string& filename)` |
| `setShieldTexture` |  | `void setShieldTexture(const std::string& filename, bool blink)` |
| `setEmblemTexture` |  | `void setEmblemTexture(const std::string& filename)` |
| `setTypeTexture` |  | `void setTypeTexture(const std::string& filename)` |
| `setIconTexture` |  | `void setIconTexture(const std::string& filename)` |
| `setPassable` |  | `void setPassable(bool passable) { m_passable = passable; }` |
| `setSpeedFormula` |  | `void setSpeedFormula(double speedA, double speedB, double speedC)` |
| `addTimedSquare` |  | `void addTimedSquare(uint8 color)` |
| `removeTimedSquare` |  | `void removeTimedSquare() { m_showTimedSquare = false; }` |
| `showStaticSquare` |  | `void showStaticSquare(const Color& color) { m_showStaticSquare = true; m_staticSquareColor = color; }` |
| `hideStaticSquare` |  | `void hideStaticSquare() { m_showStaticSquare = false; }` |
| `setInformationColor` |  | `void setInformationColor(const Color& color) { m_useCustomInformationColor = true; m_informationColor = color; }` |
| `resetInformationColor` |  | `void resetInformationColor() { m_useCustomInformationColor = false; setHealthPercent(getHealthPercent());  }` |
| `getInformationOffset` |  | `Point getInformationOffset() { return m_informationOffset; }` |
| `setInformationOffset` |  | `void setInformationOffset(int x, int y) { m_informationOffset = Point(x, y); }` |
| `setText` |  | `void setText(const std::string& text, const Color& color)` |
| `getText` |  | `std::string getText()` |
| `clearText` |  | `void clearText() { setText("", Color::white); }` |
| `setTitle` |  | `void setTitle(const std::string& title, const std::string& font, const Color& color)` |
| `clearTitle` |  | `void clearTitle() { setTitle("", "", Color::white); }` |
| `getTitle` |  | `std::string getTitle() { return m_titleCache.getText(); }` |
| `getId` |  | `uint32 getId() { return m_id; }` |
| `getName` |  | `std::string getName() { return m_name; }` |
| `getHealthPercent` |  | `uint8 getHealthPercent() { return m_healthPercent; }` |
| `getManaPercent` |  | `int8 getManaPercent() { return m_manaPercent; }` |
| `getDirection` |  | `Otc::Direction getDirection() { return m_direction; }` |
| `getWalkDirection` |  | `Otc::Direction getWalkDirection() { return m_walkDirection; }` |
| `getOutfit` |  | `Outfit getOutfit() { return m_outfit; }` |
| `getLight` |  | `Light getLight() { return m_light; }` |
| `getSpeed` |  | `uint16 getSpeed() { return m_speed; }` |
| `getBaseSpeed` |  | `double getBaseSpeed() { return m_baseSpeed; }` |
| `getSkull` |  | `uint8 getSkull() { return m_skull; }` |
| `getShield` |  | `uint8 getShield() { return m_shield; }` |
| `getEmblem` |  | `uint8 getEmblem() { return m_emblem; }` |
| `getType` |  | `uint8 getType() { return m_type; }` |
| `getIcon` |  | `uint8 getIcon() { return m_icon; }` |
| `isPassable` |  | `bool isPassable() { return m_passable; }` |
| `getDrawOffset` |  | `Point getDrawOffset()` |
| `getStepDuration` |  | `uint16 getStepDuration(bool ignoreDiagonal = false, Otc::Direction dir = Otc::InvalidDirection)` |
| `getWalkOffset` |  | `Point getWalkOffset(bool inNextFrame = false) { return inNextFrame ? m_walkOffsetInNextFrame : m_walkOffset; }` |
| `getLastStepFromPosition` |  | `Position getLastStepFromPosition() { return m_lastStepFromPosition; }` |
| `getLastStepToPosition` |  | `Position getLastStepToPosition() { return m_lastStepToPosition; }` |
| `getStepProgress` |  | `float getStepProgress() { return m_walkTimer.ticksElapsed() / getStepDuration(); }` |
| `getStepTicksLeft` |  | `int getStepTicksLeft() { return getStepDuration() - m_walkTimer.ticksElapsed(); }` |
| `getWalkTicksElapsed` |  | `ticks_t getWalkTicksElapsed() { return m_walkTimer.ticksElapsed(); }` |
| `getSpeedFormula` |  | `double getSpeedFormula(Otc::SpeedFormula formula) { return m_speedFormula[formula]; }` |
| `hasSpeedFormula` |  | `bool hasSpeedFormula()` |
| `getSpeedFormulaArray` |  | `std::array<double, Otc::LastSpeedFormula> getSpeedFormulaArray() { return m_speedFormula; }` |
| `getDisplacement` |  | `virtual Point getDisplacement()` |
| `getDisplacementX` |  | `virtual int getDisplacementX()` |
| `getDisplacementY` |  | `virtual int getDisplacementY()` |
| `getExactSize` |  | `virtual int getExactSize(int layer = 0, int xPattern = 0, int yPattern = 0, int zPattern = 0, int animationPhase = 0)` |
| `getJumpOffset` |  | `PointF getJumpOffset() { return m_jumpOffset; }` |
| `isTimedSquareVisible` |  | `bool isTimedSquareVisible() { return m_showTimedSquare; }` |
| `getTimedSquareColor` |  | `Color getTimedSquareColor() { return m_timedSquareColor; }` |
| `isStaticSquareVisible` |  | `bool isStaticSquareVisible() { return m_showStaticSquare; }` |
| `getStaticSquareColor` |  | `Color getStaticSquareColor() { return m_staticSquareColor; }` |
| `updateShield` |  | `void updateShield()` |
| `getWalkAnimationPhases` |  | `int getWalkAnimationPhases()` |
| `turn` |  | `virtual void turn(Otc::Direction direction)` |
| `jump` |  | `void jump(int height, int duration)` |
| `walk` |  | `virtual void walk(const Position& oldPos, const Position& newPos)` |
| `stopWalk` |  | `virtual void stopWalk()` |
| `allowAppearWalk` |  | `void allowAppearWalk(uint16_t stepSpeed) { m_allowAppearWalk = true; m_stepDuration = stepSpeed; }` |
| `isWalking` |  | `bool isWalking() { return m_walking; }` |
| `isRemoved` |  | `bool isRemoved() { return m_removed; }` |
| `isInvisible` |  | `bool isInvisible() { return m_outfit.getCategory() == ThingCategoryEffect && m_outfit.getAuxId() == 13; }` |
| `isDead` |  | `bool isDead() { return m_healthPercent <= 0; }` |
| `canBeSeen` |  | `bool canBeSeen() { return !isInvisible() \|\| isPlayer(); }` |
| `isCreature` |  | `bool isCreature() { return true; }` |
| `canShoot` |  | `bool canShoot(int distance)` |
| `onPositionChange` |  | `virtual void onPositionChange(const Position& newPos, const Position& oldPos)` |
| `onAppear` |  | `virtual void onAppear()` |
| `onDisappear` |  | `virtual void onDisappear()` |
| `onDeath` |  | `virtual void onDeath()` |
| `isPreWalking` |  | `virtual bool isPreWalking() { return false; }` |
| `getPrewalkingPosition` |  | `virtual Position getPrewalkingPosition(bool beforePrewalk = false) { return m_position; }` |
| `getWalkingTileOrTile` |  | `TilePtr getWalkingTileOrTile() {` |
| `isServerWalking` |  | `virtual bool isServerWalking() { return true; }` |
| `setElevation` |  | `void setElevation(uint8 elevation) {` |
| `getElevation` |  | `uint8 getElevation() {` |
| `m_elevation` |  | `return m_elevation` |
| `addTopWidget` |  | `void addTopWidget(const UIWidgetPtr& widget)` |
| `addBottomWidget` |  | `void addBottomWidget(const UIWidgetPtr& widget)` |
| `addDirectionalWidget` |  | `void addDirectionalWidget(const UIWidgetPtr& widget)` |
| `removeTopWidget` |  | `void removeTopWidget(const UIWidgetPtr& widget)` |
| `removeBottomWidget` |  | `void removeBottomWidget(const UIWidgetPtr& widget)` |
| `removeDirectionalWidget` |  | `void removeDirectionalWidget(const UIWidgetPtr& widget)` |
| `getTopWidgets` |  | `std::list<UIWidgetPtr> getTopWidgets()` |
| `getBottomWidgets` |  | `std::list<UIWidgetPtr> getBottomWidgets()` |
| `getDirectionalWdigets` |  | `std::list<UIWidgetPtr> getDirectionalWdigets()` |
| `clearWidgets` |  | `void clearWidgets()` |
| `clearTopWidgets` |  | `void clearTopWidgets()` |
| `clearBottomWidgets` |  | `void clearBottomWidgets()` |
| `clearDirectionalWidgets` |  | `void clearDirectionalWidgets()` |
| `drawTopWidgets` |  | `void drawTopWidgets(const Point& rect, const Otc::Direction direction)` |
| `drawBottomWidgets` |  | `void drawBottomWidgets(const Point& rect, const Otc::Direction direction)` |
| `getProgressBarPercent` |  | `uint8 getProgressBarPercent() { return m_progressBarPercent; }` |
| `setProgressBar` |  | `void setProgressBar(uint32 duration, bool ltr)` |
| `updateProgressBar` |  | `void updateProgressBar(uint32 duration, bool ltr)` |
| `updateWalkAnimation` |  | `virtual void updateWalkAnimation(uint8 totalPixelsWalked)` |
| `updateWalkOffset` |  | `virtual void updateWalkOffset(uint8 totalPixelsWalked, bool inNextFrame = false)` |
| `updateWalkingTile` |  | `void updateWalkingTile()` |
| `nextWalkUpdate` |  | `virtual void nextWalkUpdate()` |
| `updateWalk` |  | `virtual void updateWalk()` |
| `terminateWalk` |  | `virtual void terminateWalk()` |
| `updateOutfitColor` |  | `void updateOutfitColor(Color color, Color finalColor, Color delta, int duration)` |
| `updateJump` |  | `void updateJump()` |
| `m_id` |  | `uint32 m_id` |
| `m_name` |  | `std::string m_name` |
| `m_healthPercent` |  | `uint8 m_healthPercent` |
| `m_manaPercent` |  | `int8 m_manaPercent` |
| `m_direction` |  | `Otc::Direction m_direction` |
| `m_walkDirection` |  | `Otc::Direction m_walkDirection` |
| `m_outfit` |  | `Outfit m_outfit` |
| `m_light` |  | `Light m_light` |
| `m_speed` |  | `uint16 m_speed` |
| `m_baseSpeed` |  | `double m_baseSpeed` |
| `m_skull` |  | `uint8 m_skull` |
| `m_shield` |  | `uint8 m_shield` |
| `m_emblem` |  | `uint8 m_emblem` |
| `m_type` |  | `uint8 m_type` |
| `m_icon` |  | `uint8 m_icon` |
| `m_skullTexture` |  | `TexturePtr m_skullTexture` |
| `m_shieldTexture` |  | `TexturePtr m_shieldTexture` |
| `m_emblemTexture` |  | `TexturePtr m_emblemTexture` |
| `m_typeTexture` |  | `TexturePtr m_typeTexture` |
| `m_iconTexture` |  | `TexturePtr m_iconTexture` |
| `m_showShieldTexture` |  | `stdext::boolean<true> m_showShieldTexture` |
| `m_shieldBlink` |  | `stdext::boolean<false> m_shieldBlink` |
| `m_passable` |  | `stdext::boolean<false> m_passable` |
| `m_timedSquareColor` |  | `Color m_timedSquareColor` |
| `m_staticSquareColor` |  | `Color m_staticSquareColor` |
| `m_nameColor` |  | `Color m_nameColor` |
| `m_showTimedSquare` |  | `stdext::boolean<false> m_showTimedSquare` |
| `m_showStaticSquare` |  | `stdext::boolean<false> m_showStaticSquare` |
| `m_removed` |  | `stdext::boolean<true> m_removed` |
| `m_nameCache` |  | `CachedText m_nameCache` |
| `m_informationColor` |  | `Color m_informationColor` |
| `m_useCustomInformationColor` |  | `bool m_useCustomInformationColor = false` |
| `m_informationOffset` |  | `Point m_informationOffset` |
| `m_outfitColor` |  | `Color m_outfitColor` |
| `m_outfitColorUpdateEvent` |  | `ScheduledEventPtr m_outfitColorUpdateEvent` |
| `m_outfitColorTimer` |  | `Timer m_outfitColorTimer` |
| `m_titleCache` |  | `CachedText m_titleCache` |
| `m_titleColor` |  | `Color m_titleColor` |
| `m_walkAnimationPhase` |  | `int m_walkAnimationPhase` |
| `m_walkedPixels` |  | `uint8 m_walkedPixels` |
| `m_footStep` |  | `uint m_footStep` |
| `m_walkTimer` |  | `Timer m_walkTimer` |
| `m_footLastStep` |  | `ticks_t m_footLastStep` |
| `m_walkingTile` |  | `TilePtr m_walkingTile` |
| `m_walking` |  | `stdext::boolean<false> m_walking` |
| `m_allowAppearWalk` |  | `stdext::boolean<false> m_allowAppearWalk` |
| `m_walkUpdateEvent` |  | `ScheduledEventPtr m_walkUpdateEvent` |
| `m_walkFinishAnimEvent` |  | `ScheduledEventPtr m_walkFinishAnimEvent` |
| `m_disappearEvent` |  | `EventPtr m_disappearEvent` |
| `m_walkOffset` |  | `Point m_walkOffset` |
| `m_walkOffsetInNextFrame` |  | `Point m_walkOffsetInNextFrame` |
| `m_lastStepDirection` |  | `Otc::Direction m_lastStepDirection` |
| `m_lastStepFromPosition` |  | `Position m_lastStepFromPosition` |
| `m_lastStepToPosition` |  | `Position m_lastStepToPosition` |
| `m_oldPosition` |  | `Position m_oldPosition` |
| `m_elevation` |  | `uint8 m_elevation = 0` |
| `m_stepDuration` |  | `uint16 m_stepDuration = 0` |
| `m_jumpHeight` |  | `float m_jumpHeight = 0` |
| `m_jumpDuration` |  | `float m_jumpDuration = 0` |
| `m_jumpOffset` |  | `PointF m_jumpOffset` |
| `m_jumpTimer` |  | `Timer m_jumpTimer` |
| `m_text` |  | `StaticTextPtr m_text` |
| `m_bottomWidgets` |  | `std::list<UIWidgetPtr> m_bottomWidgets` |
| `m_directionalWidgets` |  | `std::list<UIWidgetPtr> m_directionalWidgets` |
| `m_topWidgets` |  | `std::list<UIWidgetPtr> m_topWidgets` |
| `m_progressBarPercent` |  | `uint8 m_progressBarPercent` |
| `m_progressBarUpdateEvent` |  | `ScheduledEventPtr m_progressBarUpdateEvent` |
| `m_progressBarTimer` |  | `Timer m_progressBarTimer` |

### Klasa: `Npc`

| Member | Brief | Signature |
|--------|-------|-----------|
| `isNpc` |  | `bool isNpc() { return true; }` |

### Klasa: `Monster`

| Member | Brief | Signature |
|--------|-------|-----------|
| `isMonster` |  | `bool isMonster() { return true; }` |

## Functions

### `drawInformation`

**Sygnatura:** `void drawInformation(const Point& point, bool useGray, const Rect& parentRect, int drawFlags)`

### `isInsideOffset`

**Sygnatura:** `bool isInsideOffset(Point offset)`

### `setId`

**Sygnatura:** `void setId(uint32 id) { m_id = id; }`

### `setName`

**Sygnatura:** `void setName(const std::string& name)`

### `setManaPercent`

**Sygnatura:** `void setManaPercent(int8 value) { m_manaPercent = value; }`

### `setHealthPercent`

**Sygnatura:** `void setHealthPercent(uint8 healthPercent)`

### `setDirection`

**Sygnatura:** `void setDirection(Otc::Direction direction)`

### `setOutfit`

**Sygnatura:** `void setOutfit(const Outfit& outfit)`

### `setOutfitColor`

**Sygnatura:** `void setOutfitColor(const Color& color, int duration)`

### `setLight`

**Sygnatura:** `void setLight(const Light& light) { m_light = light; }`

### `setSpeed`

**Sygnatura:** `void setSpeed(uint16 speed)`

### `setBaseSpeed`

**Sygnatura:** `void setBaseSpeed(double baseSpeed)`

### `setSkull`

**Sygnatura:** `void setSkull(uint8 skull)`

### `setShield`

**Sygnatura:** `void setShield(uint8 shield)`

### `setEmblem`

**Sygnatura:** `void setEmblem(uint8 emblem)`

### `setType`

**Sygnatura:** `void setType(uint8 type)`

### `setIcon`

**Sygnatura:** `void setIcon(uint8 icon)`

### `setSkullTexture`

**Sygnatura:** `void setSkullTexture(const std::string& filename)`

### `setShieldTexture`

**Sygnatura:** `void setShieldTexture(const std::string& filename, bool blink)`

### `setEmblemTexture`

**Sygnatura:** `void setEmblemTexture(const std::string& filename)`

### `setTypeTexture`

**Sygnatura:** `void setTypeTexture(const std::string& filename)`

### `setIconTexture`

**Sygnatura:** `void setIconTexture(const std::string& filename)`

### `setPassable`

**Sygnatura:** `void setPassable(bool passable) { m_passable = passable; }`

### `setSpeedFormula`

**Sygnatura:** `void setSpeedFormula(double speedA, double speedB, double speedC)`

### `addTimedSquare`

**Sygnatura:** `void addTimedSquare(uint8 color)`

### `removeTimedSquare`

**Sygnatura:** `void removeTimedSquare() { m_showTimedSquare = false; }`

### `showStaticSquare`

**Sygnatura:** `void showStaticSquare(const Color& color) { m_showStaticSquare = true; m_staticSquareColor = color; }`

### `hideStaticSquare`

**Sygnatura:** `void hideStaticSquare() { m_showStaticSquare = false; }`

### `setInformationColor`

**Sygnatura:** `void setInformationColor(const Color& color) { m_useCustomInformationColor = true; m_informationColor = color; }`

### `resetInformationColor`

**Sygnatura:** `void resetInformationColor() { m_useCustomInformationColor = false; setHealthPercent(getHealthPercent());  }`

### `getInformationOffset`

**Sygnatura:** `Point getInformationOffset() { return m_informationOffset; }`

### `setInformationOffset`

**Sygnatura:** `void setInformationOffset(int x, int y) { m_informationOffset = Point(x, y); }`

### `setText`

**Sygnatura:** `void setText(const std::string& text, const Color& color)`

### `getText`

**Sygnatura:** `std::string getText()`

### `clearText`

**Sygnatura:** `void clearText() { setText("", Color::white); }`

### `setTitle`

**Sygnatura:** `void setTitle(const std::string& title, const std::string& font, const Color& color)`

### `clearTitle`

**Sygnatura:** `void clearTitle() { setTitle("", "", Color::white); }`

### `getTitle`

**Sygnatura:** `std::string getTitle() { return m_titleCache.getText(); }`

### `getId`

**Sygnatura:** `uint32 getId() { return m_id; }`

### `getName`

**Sygnatura:** `std::string getName() { return m_name; }`

### `getHealthPercent`

**Sygnatura:** `uint8 getHealthPercent() { return m_healthPercent; }`

### `getManaPercent`

**Sygnatura:** `int8 getManaPercent() { return m_manaPercent; }`

### `getDirection`

**Sygnatura:** `Otc::Direction getDirection() { return m_direction; }`

### `getWalkDirection`

**Sygnatura:** `Otc::Direction getWalkDirection() { return m_walkDirection; }`

### `getOutfit`

**Sygnatura:** `Outfit getOutfit() { return m_outfit; }`

### `getLight`

**Sygnatura:** `Light getLight() { return m_light; }`

### `getSpeed`

**Sygnatura:** `uint16 getSpeed() { return m_speed; }`

### `getBaseSpeed`

**Sygnatura:** `double getBaseSpeed() { return m_baseSpeed; }`

### `getSkull`

**Sygnatura:** `uint8 getSkull() { return m_skull; }`

### `getShield`

**Sygnatura:** `uint8 getShield() { return m_shield; }`

### `getEmblem`

**Sygnatura:** `uint8 getEmblem() { return m_emblem; }`

### `getType`

**Sygnatura:** `uint8 getType() { return m_type; }`

### `getIcon`

**Sygnatura:** `uint8 getIcon() { return m_icon; }`

### `isPassable`

**Sygnatura:** `bool isPassable() { return m_passable; }`

### `getDrawOffset`

**Sygnatura:** `Point getDrawOffset()`

### `getStepDuration`

**Sygnatura:** `uint16 getStepDuration(bool ignoreDiagonal = false, Otc::Direction dir = Otc::InvalidDirection)`

### `getWalkOffset`

**Sygnatura:** `Point getWalkOffset(bool inNextFrame = false) { return inNextFrame ? m_walkOffsetInNextFrame : m_walkOffset; }`

### `getLastStepFromPosition`

**Sygnatura:** `Position getLastStepFromPosition() { return m_lastStepFromPosition; }`

### `getLastStepToPosition`

**Sygnatura:** `Position getLastStepToPosition() { return m_lastStepToPosition; }`

### `getStepProgress`

**Sygnatura:** `float getStepProgress() { return m_walkTimer.ticksElapsed() / getStepDuration(); }`

### `getStepTicksLeft`

**Sygnatura:** `int getStepTicksLeft() { return getStepDuration() - m_walkTimer.ticksElapsed(); }`

### `getWalkTicksElapsed`

**Sygnatura:** `ticks_t getWalkTicksElapsed() { return m_walkTimer.ticksElapsed(); }`

### `getSpeedFormula`

**Sygnatura:** `double getSpeedFormula(Otc::SpeedFormula formula) { return m_speedFormula[formula]; }`

### `hasSpeedFormula`

**Sygnatura:** `bool hasSpeedFormula()`

### `getSpeedFormulaArray`

**Sygnatura:** `std::array<double, Otc::LastSpeedFormula> getSpeedFormulaArray() { return m_speedFormula; }`

### `getJumpOffset`

**Sygnatura:** `PointF getJumpOffset() { return m_jumpOffset; }`

### `isTimedSquareVisible`

**Sygnatura:** `bool isTimedSquareVisible() { return m_showTimedSquare; }`

### `getTimedSquareColor`

**Sygnatura:** `Color getTimedSquareColor() { return m_timedSquareColor; }`

### `isStaticSquareVisible`

**Sygnatura:** `bool isStaticSquareVisible() { return m_showStaticSquare; }`

### `getStaticSquareColor`

**Sygnatura:** `Color getStaticSquareColor() { return m_staticSquareColor; }`

### `updateShield`

**Sygnatura:** `void updateShield()`

### `getWalkAnimationPhases`

**Sygnatura:** `int getWalkAnimationPhases()`

### `jump`

**Sygnatura:** `void jump(int height, int duration)`

### `allowAppearWalk`

**Sygnatura:** `void allowAppearWalk(uint16_t stepSpeed) { m_allowAppearWalk = true; m_stepDuration = stepSpeed; }`

### `isWalking`

**Sygnatura:** `bool isWalking() { return m_walking; }`

### `isRemoved`

**Sygnatura:** `bool isRemoved() { return m_removed; }`

### `isInvisible`

**Sygnatura:** `bool isInvisible() { return m_outfit.getCategory() == ThingCategoryEffect && m_outfit.getAuxId() == 13; }`

### `isDead`

**Sygnatura:** `bool isDead() { return m_healthPercent <= 0; }`

### `canBeSeen`

**Sygnatura:** `bool canBeSeen() { return !isInvisible() || isPlayer(); }`

### `isCreature`

**Sygnatura:** `bool isCreature() { return true; }`

### `canShoot`

**Sygnatura:** `bool canShoot(int distance)`

### `getWalkingTileOrTile`

**Sygnatura:** `TilePtr getWalkingTileOrTile() {`

### `setElevation`

**Sygnatura:** `void setElevation(uint8 elevation) {`

### `getElevation`

**Sygnatura:** `uint8 getElevation() {`

### `addTopWidget`

**Sygnatura:** `void addTopWidget(const UIWidgetPtr& widget)`

### `addBottomWidget`

**Sygnatura:** `void addBottomWidget(const UIWidgetPtr& widget)`

### `addDirectionalWidget`

**Sygnatura:** `void addDirectionalWidget(const UIWidgetPtr& widget)`

### `removeTopWidget`

**Sygnatura:** `void removeTopWidget(const UIWidgetPtr& widget)`

### `removeBottomWidget`

**Sygnatura:** `void removeBottomWidget(const UIWidgetPtr& widget)`

### `removeDirectionalWidget`

**Sygnatura:** `void removeDirectionalWidget(const UIWidgetPtr& widget)`

### `getTopWidgets`

**Sygnatura:** `std::list<UIWidgetPtr> getTopWidgets()`

### `getBottomWidgets`

**Sygnatura:** `std::list<UIWidgetPtr> getBottomWidgets()`

### `getDirectionalWdigets`

**Sygnatura:** `std::list<UIWidgetPtr> getDirectionalWdigets()`

### `clearWidgets`

**Sygnatura:** `void clearWidgets()`

### `clearTopWidgets`

**Sygnatura:** `void clearTopWidgets()`

### `clearBottomWidgets`

**Sygnatura:** `void clearBottomWidgets()`

### `clearDirectionalWidgets`

**Sygnatura:** `void clearDirectionalWidgets()`

### `drawTopWidgets`

**Sygnatura:** `void drawTopWidgets(const Point& rect, const Otc::Direction direction)`

### `drawBottomWidgets`

**Sygnatura:** `void drawBottomWidgets(const Point& rect, const Otc::Direction direction)`

### `getProgressBarPercent`

**Sygnatura:** `uint8 getProgressBarPercent() { return m_progressBarPercent; }`

### `setProgressBar`

**Sygnatura:** `void setProgressBar(uint32 duration, bool ltr)`

### `updateProgressBar`

**Sygnatura:** `void updateProgressBar(uint32 duration, bool ltr)`

### `updateWalkingTile`

**Sygnatura:** `void updateWalkingTile()`

### `updateOutfitColor`

**Sygnatura:** `void updateOutfitColor(Color color, Color finalColor, Color delta, int duration)`

### `updateJump`

**Sygnatura:** `void updateJump()`

### `isNpc`

**Sygnatura:** `bool isNpc() { return true; }`

### `isMonster`

**Sygnatura:** `bool isMonster() { return true; }`

## Class Diagram

Zobacz: [../diagrams/creature.mmd](../diagrams/creature.mmd)
