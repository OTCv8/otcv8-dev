---
doc_id: "cpp-api-0ff474997f0a"
source_path: "client/thing.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: thing.h"
summary: "Dokumentacja API C++ dla client/thing.h"
tags: ["cpp", "api", "otclient"]
---

# client/thing.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu thing.

## Classes/Structs

### Klasa: `Thing`

| Member | Brief | Signature |
|--------|-------|-----------|
| `draw` |  | `virtual void draw(const Point& dest, bool animate = true, LightView* lightView = nullptr) { }` |
| `setId` |  | `virtual void setId(uint32 id) { }` |
| `setPosition` |  | `void setPosition(const Position& position)` |
| `getId` |  | `virtual uint32 getId() { return 0; }` |
| `getPosition` |  | `Position getPosition() { return m_position; }` |
| `getStackPriority` |  | `int getStackPriority()` |
| `getParentContainer` |  | `ContainerPtr getParentContainer()` |
| `getStackPos` |  | `int getStackPos()` |
| `setMarked` |  | `void setMarked(const std::string& color) {` |
| `updatedMarkedColor` |  | `Color updatedMarkedColor()` |
| `isItem` |  | `virtual bool isItem() { return false; }` |
| `isEffect` |  | `virtual bool isEffect() { return false; }` |
| `isMissile` |  | `virtual bool isMissile() { return false; }` |
| `isCreature` |  | `virtual bool isCreature() { return false; }` |
| `isNpc` |  | `virtual bool isNpc() { return false; }` |
| `isMonster` |  | `virtual bool isMonster() { return false; }` |
| `isPlayer` |  | `virtual bool isPlayer() { return false; }` |
| `isLocalPlayer` |  | `virtual bool isLocalPlayer() { return false; }` |
| `isAnimatedText` |  | `virtual bool isAnimatedText() { return false; }` |
| `isStaticText` |  | `virtual bool isStaticText() { return false; }` |
| `getSize` |  | `Size getSize() { return rawGetThingType()->getSize(); }` |
| `getWidth` |  | `int getWidth() { return rawGetThingType()->getWidth(); }` |
| `getHeight` |  | `int getHeight() { return rawGetThingType()->getHeight(); }` |
| `getDisplacement` |  | `virtual Point getDisplacement() { return rawGetThingType()->getDisplacement(); }` |
| `getDisplacementX` |  | `virtual int getDisplacementX() { return rawGetThingType()->getDisplacementX(); }` |
| `getDisplacementY` |  | `virtual int getDisplacementY() { return rawGetThingType()->getDisplacementY(); }` |
| `getExactSize` |  | `virtual int getExactSize(int layer, int xPattern, int yPattern, int zPattern, int animationPhase) { return rawGetThingType()->getExactSize(layer, xPat` |
| `getLayers` |  | `int getLayers() { return rawGetThingType()->getLayers(); }` |
| `getNumPatternX` |  | `int getNumPatternX() { return rawGetThingType()->getNumPatternX(); }` |
| `getNumPatternY` |  | `int getNumPatternY() { return rawGetThingType()->getNumPatternY(); }` |
| `getNumPatternZ` |  | `int getNumPatternZ() { return rawGetThingType()->getNumPatternZ(); }` |
| `getAnimationPhases` |  | `int getAnimationPhases() { return rawGetThingType()->getAnimationPhases(); }` |
| `getAnimator` |  | `AnimatorPtr getAnimator() { return rawGetThingType()->getAnimator(); }` |
| `getIdleAnimator` |  | `AnimatorPtr getIdleAnimator() { return rawGetThingType()->getIdleAnimator(); }` |
| `getGroundSpeed` |  | `int getGroundSpeed() { return rawGetThingType()->getGroundSpeed(); }` |
| `getMaxTextLength` |  | `int getMaxTextLength() { return rawGetThingType()->getMaxTextLength(); }` |
| `getLight` |  | `Light getLight() { return rawGetThingType()->getLight(); }` |
| `getMinimapColor` |  | `int getMinimapColor() { return rawGetThingType()->getMinimapColor(); }` |
| `getLensHelp` |  | `int getLensHelp() { return rawGetThingType()->getLensHelp(); }` |
| `getClothSlot` |  | `int getClothSlot() { return rawGetThingType()->getClothSlot(); }` |
| `getElevation` |  | `int getElevation() { return rawGetThingType()->getElevation(); }` |
| `isGround` |  | `bool isGround() { return rawGetThingType()->isGround(); }` |
| `isGroundBorder` |  | `bool isGroundBorder() { return rawGetThingType()->isGroundBorder(); }` |
| `isOnBottom` |  | `bool isOnBottom() { return rawGetThingType()->isOnBottom(); }` |
| `isOnTop` |  | `bool isOnTop() { return rawGetThingType()->isOnTop(); }` |
| `isContainer` |  | `bool isContainer() { return rawGetThingType()->isContainer(); }` |
| `isStackable` |  | `bool isStackable() { return rawGetThingType()->isStackable(); }` |
| `isForceUse` |  | `bool isForceUse() { return rawGetThingType()->isForceUse(); }` |
| `isMultiUse` |  | `bool isMultiUse() { return rawGetThingType()->isMultiUse(); }` |
| `isWritable` |  | `bool isWritable() { return rawGetThingType()->isWritable(); }` |
| `isChargeable` |  | `bool isChargeable() { return rawGetThingType()->isChargeable(); }` |
| `isWritableOnce` |  | `bool isWritableOnce() { return rawGetThingType()->isWritableOnce(); }` |
| `isFluidContainer` |  | `bool isFluidContainer() { return rawGetThingType()->isFluidContainer(); }` |
| `isSplash` |  | `bool isSplash() { return rawGetThingType()->isSplash(); }` |
| `isNotWalkable` |  | `bool isNotWalkable() { return rawGetThingType()->isNotWalkable(); }` |
| `isNotMoveable` |  | `bool isNotMoveable() { return rawGetThingType()->isNotMoveable(); }` |
| `blockProjectile` |  | `bool blockProjectile() { return rawGetThingType()->blockProjectile(); }` |
| `isNotPathable` |  | `bool isNotPathable() { return rawGetThingType()->isNotPathable(); }` |
| `isPickupable` |  | `bool isPickupable() { return rawGetThingType()->isPickupable(); }` |
| `isHangable` |  | `bool isHangable() { return rawGetThingType()->isHangable(); }` |
| `isHookSouth` |  | `bool isHookSouth() { return rawGetThingType()->isHookSouth(); }` |
| `isHookEast` |  | `bool isHookEast() { return rawGetThingType()->isHookEast(); }` |
| `isRotateable` |  | `bool isRotateable() { return rawGetThingType()->isRotateable(); }` |
| `hasLight` |  | `bool hasLight() { return rawGetThingType()->hasLight(); }` |
| `isDontHide` |  | `bool isDontHide() { return rawGetThingType()->isDontHide(); }` |
| `isTranslucent` |  | `bool isTranslucent() { return rawGetThingType()->isTranslucent(); }` |
| `hasDisplacement` |  | `bool hasDisplacement() { return rawGetThingType()->hasDisplacement(); }` |
| `hasElevation` |  | `bool hasElevation() { return rawGetThingType()->hasElevation(); }` |
| `isLyingCorpse` |  | `bool isLyingCorpse() { return rawGetThingType()->isLyingCorpse(); }` |
| `isAnimateAlways` |  | `bool isAnimateAlways() { return rawGetThingType()->isAnimateAlways(); }` |
| `hasMiniMapColor` |  | `bool hasMiniMapColor() { return rawGetThingType()->hasMiniMapColor(); }` |
| `hasLensHelp` |  | `bool hasLensHelp() { return rawGetThingType()->hasLensHelp(); }` |
| `isFullGround` |  | `bool isFullGround() { return rawGetThingType()->isFullGround(); }` |
| `isIgnoreLook` |  | `bool isIgnoreLook() { return rawGetThingType()->isIgnoreLook(); }` |
| `isCloth` |  | `bool isCloth() { return rawGetThingType()->isCloth(); }` |
| `isMarketable` |  | `bool isMarketable() { return rawGetThingType()->isMarketable(); }` |
| `isUsable` |  | `bool isUsable() { return rawGetThingType()->isUsable(); }` |
| `isWrapable` |  | `bool isWrapable() { return rawGetThingType()->isWrapable(); }` |
| `isUnwrapable` |  | `bool isUnwrapable() { return rawGetThingType()->isUnwrapable(); }` |
| `isTopEffect` |  | `bool isTopEffect() { return rawGetThingType()->isTopEffect(); }` |
| `getMarketData` |  | `MarketData getMarketData() { return rawGetThingType()->getMarketData(); }` |
| `hide` |  | `void hide() { m_hidden = true; }` |
| `show` |  | `void show() { m_hidden = false; }` |
| `setHidden` |  | `void setHidden(bool value) { m_hidden = value; }` |
| `isHidden` |  | `bool isHidden() { return m_hidden; }` |
| `onPositionChange` |  | `virtual void onPositionChange(const Position& newPos, const Position& oldPos) { }` |
| `onAppear` |  | `virtual void onAppear() { }` |
| `onDisappear` |  | `virtual void onDisappear() { }` |
| `m_position` |  | `Position m_position` |
| `m_datId` |  | `uint16 m_datId` |
| `m_marked` |  | `bool m_marked = false` |
| `m_hidden` |  | `bool m_hidden = false` |
| `m_markedColor` |  | `Color m_markedColor` |

## Functions

### `setPosition`

**Sygnatura:** `void setPosition(const Position& position)`

### `getPosition`

**Sygnatura:** `Position getPosition() { return m_position; }`

### `getStackPriority`

**Sygnatura:** `int getStackPriority()`

### `getParentContainer`

**Sygnatura:** `ContainerPtr getParentContainer()`

### `getStackPos`

**Sygnatura:** `int getStackPos()`

### `setMarked`

**Sygnatura:** `void setMarked(const std::string& color) {`

### `updatedMarkedColor`

**Sygnatura:** `Color updatedMarkedColor()`

### `getSize`

**Sygnatura:** `Size getSize() { return rawGetThingType()->getSize(); }`

### `getWidth`

**Sygnatura:** `int getWidth() { return rawGetThingType()->getWidth(); }`

### `getHeight`

**Sygnatura:** `int getHeight() { return rawGetThingType()->getHeight(); }`

### `getLayers`

**Sygnatura:** `int getLayers() { return rawGetThingType()->getLayers(); }`

### `getNumPatternX`

**Sygnatura:** `int getNumPatternX() { return rawGetThingType()->getNumPatternX(); }`

### `getNumPatternY`

**Sygnatura:** `int getNumPatternY() { return rawGetThingType()->getNumPatternY(); }`

### `getNumPatternZ`

**Sygnatura:** `int getNumPatternZ() { return rawGetThingType()->getNumPatternZ(); }`

### `getAnimationPhases`

**Sygnatura:** `int getAnimationPhases() { return rawGetThingType()->getAnimationPhases(); }`

### `getAnimator`

**Sygnatura:** `AnimatorPtr getAnimator() { return rawGetThingType()->getAnimator(); }`

### `getIdleAnimator`

**Sygnatura:** `AnimatorPtr getIdleAnimator() { return rawGetThingType()->getIdleAnimator(); }`

### `getGroundSpeed`

**Sygnatura:** `int getGroundSpeed() { return rawGetThingType()->getGroundSpeed(); }`

### `getMaxTextLength`

**Sygnatura:** `int getMaxTextLength() { return rawGetThingType()->getMaxTextLength(); }`

### `getLight`

**Sygnatura:** `Light getLight() { return rawGetThingType()->getLight(); }`

### `getMinimapColor`

**Sygnatura:** `int getMinimapColor() { return rawGetThingType()->getMinimapColor(); }`

### `getLensHelp`

**Sygnatura:** `int getLensHelp() { return rawGetThingType()->getLensHelp(); }`

### `getClothSlot`

**Sygnatura:** `int getClothSlot() { return rawGetThingType()->getClothSlot(); }`

### `getElevation`

**Sygnatura:** `int getElevation() { return rawGetThingType()->getElevation(); }`

### `isGround`

**Sygnatura:** `bool isGround() { return rawGetThingType()->isGround(); }`

### `isGroundBorder`

**Sygnatura:** `bool isGroundBorder() { return rawGetThingType()->isGroundBorder(); }`

### `isOnBottom`

**Sygnatura:** `bool isOnBottom() { return rawGetThingType()->isOnBottom(); }`

### `isOnTop`

**Sygnatura:** `bool isOnTop() { return rawGetThingType()->isOnTop(); }`

### `isContainer`

**Sygnatura:** `bool isContainer() { return rawGetThingType()->isContainer(); }`

### `isStackable`

**Sygnatura:** `bool isStackable() { return rawGetThingType()->isStackable(); }`

### `isForceUse`

**Sygnatura:** `bool isForceUse() { return rawGetThingType()->isForceUse(); }`

### `isMultiUse`

**Sygnatura:** `bool isMultiUse() { return rawGetThingType()->isMultiUse(); }`

### `isWritable`

**Sygnatura:** `bool isWritable() { return rawGetThingType()->isWritable(); }`

### `isChargeable`

**Sygnatura:** `bool isChargeable() { return rawGetThingType()->isChargeable(); }`

### `isWritableOnce`

**Sygnatura:** `bool isWritableOnce() { return rawGetThingType()->isWritableOnce(); }`

### `isFluidContainer`

**Sygnatura:** `bool isFluidContainer() { return rawGetThingType()->isFluidContainer(); }`

### `isSplash`

**Sygnatura:** `bool isSplash() { return rawGetThingType()->isSplash(); }`

### `isNotWalkable`

**Sygnatura:** `bool isNotWalkable() { return rawGetThingType()->isNotWalkable(); }`

### `isNotMoveable`

**Sygnatura:** `bool isNotMoveable() { return rawGetThingType()->isNotMoveable(); }`

### `blockProjectile`

**Sygnatura:** `bool blockProjectile() { return rawGetThingType()->blockProjectile(); }`

### `isNotPathable`

**Sygnatura:** `bool isNotPathable() { return rawGetThingType()->isNotPathable(); }`

### `isPickupable`

**Sygnatura:** `bool isPickupable() { return rawGetThingType()->isPickupable(); }`

### `isHangable`

**Sygnatura:** `bool isHangable() { return rawGetThingType()->isHangable(); }`

### `isHookSouth`

**Sygnatura:** `bool isHookSouth() { return rawGetThingType()->isHookSouth(); }`

### `isHookEast`

**Sygnatura:** `bool isHookEast() { return rawGetThingType()->isHookEast(); }`

### `isRotateable`

**Sygnatura:** `bool isRotateable() { return rawGetThingType()->isRotateable(); }`

### `hasLight`

**Sygnatura:** `bool hasLight() { return rawGetThingType()->hasLight(); }`

### `isDontHide`

**Sygnatura:** `bool isDontHide() { return rawGetThingType()->isDontHide(); }`

### `isTranslucent`

**Sygnatura:** `bool isTranslucent() { return rawGetThingType()->isTranslucent(); }`

### `hasDisplacement`

**Sygnatura:** `bool hasDisplacement() { return rawGetThingType()->hasDisplacement(); }`

### `hasElevation`

**Sygnatura:** `bool hasElevation() { return rawGetThingType()->hasElevation(); }`

### `isLyingCorpse`

**Sygnatura:** `bool isLyingCorpse() { return rawGetThingType()->isLyingCorpse(); }`

### `isAnimateAlways`

**Sygnatura:** `bool isAnimateAlways() { return rawGetThingType()->isAnimateAlways(); }`

### `hasMiniMapColor`

**Sygnatura:** `bool hasMiniMapColor() { return rawGetThingType()->hasMiniMapColor(); }`

### `hasLensHelp`

**Sygnatura:** `bool hasLensHelp() { return rawGetThingType()->hasLensHelp(); }`

### `isFullGround`

**Sygnatura:** `bool isFullGround() { return rawGetThingType()->isFullGround(); }`

### `isIgnoreLook`

**Sygnatura:** `bool isIgnoreLook() { return rawGetThingType()->isIgnoreLook(); }`

### `isCloth`

**Sygnatura:** `bool isCloth() { return rawGetThingType()->isCloth(); }`

### `isMarketable`

**Sygnatura:** `bool isMarketable() { return rawGetThingType()->isMarketable(); }`

### `isUsable`

**Sygnatura:** `bool isUsable() { return rawGetThingType()->isUsable(); }`

### `isWrapable`

**Sygnatura:** `bool isWrapable() { return rawGetThingType()->isWrapable(); }`

### `isUnwrapable`

**Sygnatura:** `bool isUnwrapable() { return rawGetThingType()->isUnwrapable(); }`

### `isTopEffect`

**Sygnatura:** `bool isTopEffect() { return rawGetThingType()->isTopEffect(); }`

### `getMarketData`

**Sygnatura:** `MarketData getMarketData() { return rawGetThingType()->getMarketData(); }`

### `hide`

**Sygnatura:** `void hide() { m_hidden = true; }`

### `show`

**Sygnatura:** `void show() { m_hidden = false; }`

### `setHidden`

**Sygnatura:** `void setHidden(bool value) { m_hidden = value; }`

### `isHidden`

**Sygnatura:** `bool isHidden() { return m_hidden; }`

## Class Diagram

Zobacz: [../diagrams/thing.mmd](../diagrams/thing.mmd)
