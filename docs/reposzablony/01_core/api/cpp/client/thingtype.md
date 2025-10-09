---
doc_id: "cpp-api-47438e367583"
source_path: "client/thingtype.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: thingtype.h"
summary: "Dokumentacja API C++ dla client/thingtype.h"
tags: ["cpp", "api", "otclient"]
---

# client/thingtype.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu thingtype.

## Classes/Structs

### Struktura: `MarketData`

### Struktura: `StoreCategory`

### Struktura: `StoreOffer`

### Struktura: `Imbuement`

### Struktura: `Light`

### Struktura: `DrawOutfitParams`

### Klasa: `ThingType`

| Member | Brief | Signature |
|--------|-------|-----------|
| `unserialize` |  | `void unserialize(uint16 clientId, ThingCategory category, const FileStreamPtr& fin)` |
| `unserializeOtml` |  | `void unserializeOtml(const OTMLNodePtr& node)` |
| `unload` |  | `void unload()` |
| `serialize` |  | `void serialize(const FileStreamPtr& fin)` |
| `exportImage` |  | `void exportImage(std::string fileName)` |
| `replaceSprites` |  | `void replaceSprites(std::map<uint32_t, ImagePtr>& replacements, std::string fileName)` |
| `drawOutfit` |  | `std::shared_ptr<DrawOutfitParams> drawOutfit(const Point& dest, int maskLayer, int xPattern, int yPattern, int zPattern, int animationPhase, Color col` |
| `getDrawSize` |  | `Rect getDrawSize(const Point& dest, int layer, int xPattern, int yPattern, int zPattern, int animationPhase)` |
| `drawWithShader` |  | `void drawWithShader(const Point& dest, int layer, int xPattern, int yPattern, int zPattern, int animationPhase, const std::string& shader, Color color` |
| `drawWithShader` |  | `void drawWithShader(const Rect& dest, int layer, int xPattern, int yPattern, int zPattern, int animationPhase, const std::string& shader, Color color ` |
| `getId` |  | `uint16 getId() { return m_id; }` |
| `getCategory` |  | `ThingCategory getCategory() { return m_category; }` |
| `isNull` |  | `bool isNull() { return m_null; }` |
| `hasAttr` |  | `bool hasAttr(ThingAttr attr) { return m_attribs.has(attr); }` |
| `isLoaded` |  | `bool isLoaded() { return m_loaded; }` |
| `getLastUsage` |  | `ticks_t getLastUsage() { return m_lastUsage; }` |
| `getSize` |  | `Size getSize() { return m_size; }` |
| `getWidth` |  | `int getWidth() { return m_size.width(); }` |
| `getHeight` |  | `int getHeight() { return m_size.height(); }` |
| `getExactSize` |  | `int getExactSize(int layer = 0, int xPattern = 0, int yPattern = 0, int zPattern = 0, int animationPhase = 0)` |
| `getRealSize` |  | `int getRealSize() { return m_realSize; }` |
| `getLayers` |  | `int getLayers() { return m_layers; }` |
| `getNumPatternX` |  | `int getNumPatternX() { return m_numPatternX; }` |
| `getNumPatternY` |  | `int getNumPatternY() { return m_numPatternY; }` |
| `getNumPatternZ` |  | `int getNumPatternZ() { return m_numPatternZ; }` |
| `getAnimationPhases` |  | `int getAnimationPhases() { return m_animationPhases; }` |
| `getAnimator` |  | `AnimatorPtr getAnimator() { return m_animator; }` |
| `getIdleAnimator` |  | `AnimatorPtr getIdleAnimator() { return m_idleAnimator; }` |
| `getDisplacement` |  | `Point getDisplacement() { return m_displacement; }` |
| `getDisplacementX` |  | `int getDisplacementX() { return getDisplacement().x; }` |
| `getDisplacementY` |  | `int getDisplacementY() { return getDisplacement().y; }` |
| `getElevation` |  | `int getElevation() { return m_elevation; }` |
| `getGroundSpeed` |  | `int getGroundSpeed() { return m_attribs.get<uint16>(ThingAttrGround); }` |
| `getMaxTextLength` |  | `int getMaxTextLength() { return m_attribs.has(ThingAttrWritableOnce) ? m_attribs.get<uint16>(ThingAttrWritableOnce) : m_attribs.get<uint16>(ThingAttrW` |
| `getLight` |  | `Light getLight() { return m_attribs.get<Light>(ThingAttrLight); }` |
| `getMinimapColor` |  | `int getMinimapColor() { return m_attribs.get<uint16>(ThingAttrMinimapColor); }` |
| `getLensHelp` |  | `int getLensHelp() { return m_attribs.get<uint16>(ThingAttrLensHelp); }` |
| `getClothSlot` |  | `int getClothSlot() { return m_attribs.get<uint16>(ThingAttrCloth); }` |
| `getMarketData` |  | `MarketData getMarketData() { return m_attribs.get<MarketData>(ThingAttrMarket); }` |
| `isGround` |  | `bool isGround() { return m_attribs.has(ThingAttrGround); }` |
| `isGroundBorder` |  | `bool isGroundBorder() { return m_attribs.has(ThingAttrGroundBorder); }` |
| `isOnBottom` |  | `bool isOnBottom() { return m_attribs.has(ThingAttrOnBottom); }` |
| `isOnTop` |  | `bool isOnTop() { return m_attribs.has(ThingAttrOnTop); }` |
| `isContainer` |  | `bool isContainer() { return m_attribs.has(ThingAttrContainer); }` |
| `isStackable` |  | `bool isStackable() { return m_attribs.has(ThingAttrStackable); }` |
| `isForceUse` |  | `bool isForceUse() { return m_attribs.has(ThingAttrForceUse); }` |
| `isMultiUse` |  | `bool isMultiUse() { return m_attribs.has(ThingAttrMultiUse); }` |
| `isWritable` |  | `bool isWritable() { return m_attribs.has(ThingAttrWritable); }` |
| `isChargeable` |  | `bool isChargeable() { return m_attribs.has(ThingAttrChargeable); }` |
| `isWritableOnce` |  | `bool isWritableOnce() { return m_attribs.has(ThingAttrWritableOnce); }` |
| `isFluidContainer` |  | `bool isFluidContainer() { return m_attribs.has(ThingAttrFluidContainer); }` |
| `isSplash` |  | `bool isSplash() { return m_attribs.has(ThingAttrSplash); }` |
| `isNotWalkable` |  | `bool isNotWalkable() { return m_attribs.has(ThingAttrNotWalkable); }` |
| `isNotMoveable` |  | `bool isNotMoveable() { return m_attribs.has(ThingAttrNotMoveable); }` |
| `blockProjectile` |  | `bool blockProjectile() { return m_attribs.has(ThingAttrBlockProjectile); }` |
| `isNotPathable` |  | `bool isNotPathable() { return m_attribs.has(ThingAttrNotPathable); }` |
| `isPickupable` |  | `bool isPickupable() { return m_attribs.has(ThingAttrPickupable); }` |
| `isHangable` |  | `bool isHangable() { return m_attribs.has(ThingAttrHangable); }` |
| `isHookSouth` |  | `bool isHookSouth() { return m_attribs.has(ThingAttrHookSouth); }` |
| `isHookEast` |  | `bool isHookEast() { return m_attribs.has(ThingAttrHookEast); }` |
| `isRotateable` |  | `bool isRotateable() { return m_attribs.has(ThingAttrRotateable); }` |
| `hasLight` |  | `bool hasLight() { return m_attribs.has(ThingAttrLight); }` |
| `isDontHide` |  | `bool isDontHide() { return m_attribs.has(ThingAttrDontHide); }` |
| `isTranslucent` |  | `bool isTranslucent() { return m_attribs.has(ThingAttrTranslucent); }` |
| `hasDisplacement` |  | `bool hasDisplacement() { return m_attribs.has(ThingAttrDisplacement); }` |
| `hasElevation` |  | `bool hasElevation() { return m_attribs.has(ThingAttrElevation); }` |
| `isLyingCorpse` |  | `bool isLyingCorpse() { return m_attribs.has(ThingAttrLyingCorpse); }` |
| `isAnimateAlways` |  | `bool isAnimateAlways() { return m_attribs.has(ThingAttrAnimateAlways); }` |
| `hasMiniMapColor` |  | `bool hasMiniMapColor() { return m_attribs.has(ThingAttrMinimapColor); }` |
| `hasLensHelp` |  | `bool hasLensHelp() { return m_attribs.has(ThingAttrLensHelp); }` |
| `isFullGround` |  | `bool isFullGround() { return m_attribs.has(ThingAttrFullGround); }` |
| `isIgnoreLook` |  | `bool isIgnoreLook() { return m_attribs.has(ThingAttrLook); }` |
| `isCloth` |  | `bool isCloth() { return m_attribs.has(ThingAttrCloth); }` |
| `isMarketable` |  | `bool isMarketable() { return m_attribs.has(ThingAttrMarket); }` |
| `isUsable` |  | `bool isUsable() { return m_attribs.has(ThingAttrUsable); }` |
| `isWrapable` |  | `bool isWrapable() { return m_attribs.has(ThingAttrWrapable); }` |
| `isUnwrapable` |  | `bool isUnwrapable() { return m_attribs.has(ThingAttrUnwrapable); }` |
| `isTopEffect` |  | `bool isTopEffect() { return m_attribs.has(ThingAttrTopEffect); }` |
| `hasBones` |  | `bool hasBones() { return m_attribs.has(ThingAttrBones); }` |
| `getSprites` |  | `std::vector<int> getSprites() { return m_spritesIndex; }` |
| `getOpacity` |  | `float getOpacity() { return m_opacity; }` |
| `isNotPreWalkable` |  | `bool isNotPreWalkable() { return m_attribs.has(ThingAttrNotPreWalkable); }` |
| `setPathable` |  | `void setPathable(bool var)` |

### Struktura: `DrawQueueItemThingWithShader`

## Enums

### `NewDrawType`

**Wartości:**

- `NewDrawNormal`
- `NewDrawMount`
- `NewDrawOutfit`
- `NewDrawOutfitLayers`
- `NewDrawMissle`

### `FrameGroupType`

**Wartości:**

- `FrameGroupDefault`
- `FrameGroupIdle`
- `FrameGroupMoving`

### `ThingCategory`

**Wartości:**

- `ThingCategoryItem`
- `ThingCategoryCreature`
- `ThingCategoryEffect`
- `ThingCategoryMissile`
- `ThingInvalidCategory`
- `ThingLastCategory`

### `ThingAttr`

**Wartości:**

- `ThingAttrGround`
- `ThingAttrGroundBorder`
- `ThingAttrOnBottom`
- `ThingAttrOnTop`
- `ThingAttrContainer`
- `ThingAttrStackable`
- `ThingAttrForceUse`
- `ThingAttrMultiUse`
- `ThingAttrWritable`
- `ThingAttrWritableOnce`
- `ThingAttrFluidContainer`
- `ThingAttrSplash`
- `ThingAttrNotWalkable`
- `ThingAttrNotMoveable`
- `ThingAttrBlockProjectile`
- `ThingAttrNotPathable`
- `ThingAttrPickupable`
- `ThingAttrHangable`
- `ThingAttrHookSouth`
- `ThingAttrHookEast`
- `ThingAttrRotateable`
- `ThingAttrLight`
- `ThingAttrDontHide`
- `ThingAttrTranslucent`
- `ThingAttrDisplacement`
- `ThingAttrElevation`
- `ThingAttrLyingCorpse`
- `ThingAttrAnimateAlways`
- `ThingAttrMinimapColor`
- `ThingAttrLensHelp`
- `ThingAttrFullGround`
- `ThingAttrLook`
- `ThingAttrCloth`
- `ThingAttrMarket`
- `ThingAttrUsable`
- `ThingAttrWrapable`
- `ThingAttrUnwrapable`
- `ThingAttrTopEffect`
- `ThingAttrBones`
- `ThingAttrOpacity`
- `ThingAttrNotPreWalkable`
- `ThingAttrFloorChange`
- `ThingAttrNoMoveAnimation`
- `ThingAttrChargeable`
- `ThingLastAttr`

### `SpriteMask`

**Wartości:**

- `SpriteMask`

## Functions

### `unserialize`

**Sygnatura:** `void unserialize(uint16 clientId, ThingCategory category, const FileStreamPtr& fin)`

### `unserializeOtml`

**Sygnatura:** `void unserializeOtml(const OTMLNodePtr& node)`

### `unload`

**Sygnatura:** `void unload()`

### `serialize`

**Sygnatura:** `void serialize(const FileStreamPtr& fin)`

### `exportImage`

**Sygnatura:** `void exportImage(std::string fileName)`

### `replaceSprites`

**Sygnatura:** `void replaceSprites(std::map<uint32_t, ImagePtr>& replacements, std::string fileName)`

### `drawOutfit`

**Sygnatura:** `std::shared_ptr<DrawOutfitParams> drawOutfit(const Point& dest, int maskLayer, int xPattern, int yPattern, int zPattern, int animationPhase, Color color = Color::white, LightView* lightView = nullptr)`

### `getDrawSize`

**Sygnatura:** `Rect getDrawSize(const Point& dest, int layer, int xPattern, int yPattern, int zPattern, int animationPhase)`

### `drawWithShader`

**Sygnatura:** `void drawWithShader(const Point& dest, int layer, int xPattern, int yPattern, int zPattern, int animationPhase, const std::string& shader, Color color = Color::white, LightView* lightView = nullptr)`

### `drawWithShader`

**Sygnatura:** `void drawWithShader(const Rect& dest, int layer, int xPattern, int yPattern, int zPattern, int animationPhase, const std::string& shader, Color color = Color::white)`

### `getId`

**Sygnatura:** `uint16 getId() { return m_id; }`

### `getCategory`

**Sygnatura:** `ThingCategory getCategory() { return m_category; }`

### `isNull`

**Sygnatura:** `bool isNull() { return m_null; }`

### `hasAttr`

**Sygnatura:** `bool hasAttr(ThingAttr attr) { return m_attribs.has(attr); }`

### `isLoaded`

**Sygnatura:** `bool isLoaded() { return m_loaded; }`

### `getLastUsage`

**Sygnatura:** `ticks_t getLastUsage() { return m_lastUsage; }`

### `getSize`

**Sygnatura:** `Size getSize() { return m_size; }`

### `getWidth`

**Sygnatura:** `int getWidth() { return m_size.width(); }`

### `getHeight`

**Sygnatura:** `int getHeight() { return m_size.height(); }`

### `getExactSize`

**Sygnatura:** `int getExactSize(int layer = 0, int xPattern = 0, int yPattern = 0, int zPattern = 0, int animationPhase = 0)`

### `getRealSize`

**Sygnatura:** `int getRealSize() { return m_realSize; }`

### `getLayers`

**Sygnatura:** `int getLayers() { return m_layers; }`

### `getNumPatternX`

**Sygnatura:** `int getNumPatternX() { return m_numPatternX; }`

### `getNumPatternY`

**Sygnatura:** `int getNumPatternY() { return m_numPatternY; }`

### `getNumPatternZ`

**Sygnatura:** `int getNumPatternZ() { return m_numPatternZ; }`

### `getAnimationPhases`

**Sygnatura:** `int getAnimationPhases() { return m_animationPhases; }`

### `getAnimator`

**Sygnatura:** `AnimatorPtr getAnimator() { return m_animator; }`

### `getIdleAnimator`

**Sygnatura:** `AnimatorPtr getIdleAnimator() { return m_idleAnimator; }`

### `getDisplacement`

**Sygnatura:** `Point getDisplacement() { return m_displacement; }`

### `getDisplacementX`

**Sygnatura:** `int getDisplacementX() { return getDisplacement().x; }`

### `getDisplacementY`

**Sygnatura:** `int getDisplacementY() { return getDisplacement().y; }`

### `getElevation`

**Sygnatura:** `int getElevation() { return m_elevation; }`

### `getGroundSpeed`

**Sygnatura:** `int getGroundSpeed() { return m_attribs.get<uint16>(ThingAttrGround); }`

### `getMaxTextLength`

**Sygnatura:** `int getMaxTextLength() { return m_attribs.has(ThingAttrWritableOnce) ? m_attribs.get<uint16>(ThingAttrWritableOnce) : m_attribs.get<uint16>(ThingAttrWritable); }`

### `getLight`

**Sygnatura:** `Light getLight() { return m_attribs.get<Light>(ThingAttrLight); }`

### `getMinimapColor`

**Sygnatura:** `int getMinimapColor() { return m_attribs.get<uint16>(ThingAttrMinimapColor); }`

### `getLensHelp`

**Sygnatura:** `int getLensHelp() { return m_attribs.get<uint16>(ThingAttrLensHelp); }`

### `getClothSlot`

**Sygnatura:** `int getClothSlot() { return m_attribs.get<uint16>(ThingAttrCloth); }`

### `getMarketData`

**Sygnatura:** `MarketData getMarketData() { return m_attribs.get<MarketData>(ThingAttrMarket); }`

### `isGround`

**Sygnatura:** `bool isGround() { return m_attribs.has(ThingAttrGround); }`

### `isGroundBorder`

**Sygnatura:** `bool isGroundBorder() { return m_attribs.has(ThingAttrGroundBorder); }`

### `isOnBottom`

**Sygnatura:** `bool isOnBottom() { return m_attribs.has(ThingAttrOnBottom); }`

### `isOnTop`

**Sygnatura:** `bool isOnTop() { return m_attribs.has(ThingAttrOnTop); }`

### `isContainer`

**Sygnatura:** `bool isContainer() { return m_attribs.has(ThingAttrContainer); }`

### `isStackable`

**Sygnatura:** `bool isStackable() { return m_attribs.has(ThingAttrStackable); }`

### `isForceUse`

**Sygnatura:** `bool isForceUse() { return m_attribs.has(ThingAttrForceUse); }`

### `isMultiUse`

**Sygnatura:** `bool isMultiUse() { return m_attribs.has(ThingAttrMultiUse); }`

### `isWritable`

**Sygnatura:** `bool isWritable() { return m_attribs.has(ThingAttrWritable); }`

### `isChargeable`

**Sygnatura:** `bool isChargeable() { return m_attribs.has(ThingAttrChargeable); }`

### `isWritableOnce`

**Sygnatura:** `bool isWritableOnce() { return m_attribs.has(ThingAttrWritableOnce); }`

### `isFluidContainer`

**Sygnatura:** `bool isFluidContainer() { return m_attribs.has(ThingAttrFluidContainer); }`

### `isSplash`

**Sygnatura:** `bool isSplash() { return m_attribs.has(ThingAttrSplash); }`

### `isNotWalkable`

**Sygnatura:** `bool isNotWalkable() { return m_attribs.has(ThingAttrNotWalkable); }`

### `isNotMoveable`

**Sygnatura:** `bool isNotMoveable() { return m_attribs.has(ThingAttrNotMoveable); }`

### `blockProjectile`

**Sygnatura:** `bool blockProjectile() { return m_attribs.has(ThingAttrBlockProjectile); }`

### `isNotPathable`

**Sygnatura:** `bool isNotPathable() { return m_attribs.has(ThingAttrNotPathable); }`

### `isPickupable`

**Sygnatura:** `bool isPickupable() { return m_attribs.has(ThingAttrPickupable); }`

### `isHangable`

**Sygnatura:** `bool isHangable() { return m_attribs.has(ThingAttrHangable); }`

### `isHookSouth`

**Sygnatura:** `bool isHookSouth() { return m_attribs.has(ThingAttrHookSouth); }`

### `isHookEast`

**Sygnatura:** `bool isHookEast() { return m_attribs.has(ThingAttrHookEast); }`

### `isRotateable`

**Sygnatura:** `bool isRotateable() { return m_attribs.has(ThingAttrRotateable); }`

### `hasLight`

**Sygnatura:** `bool hasLight() { return m_attribs.has(ThingAttrLight); }`

### `isDontHide`

**Sygnatura:** `bool isDontHide() { return m_attribs.has(ThingAttrDontHide); }`

### `isTranslucent`

**Sygnatura:** `bool isTranslucent() { return m_attribs.has(ThingAttrTranslucent); }`

### `hasDisplacement`

**Sygnatura:** `bool hasDisplacement() { return m_attribs.has(ThingAttrDisplacement); }`

### `hasElevation`

**Sygnatura:** `bool hasElevation() { return m_attribs.has(ThingAttrElevation); }`

### `isLyingCorpse`

**Sygnatura:** `bool isLyingCorpse() { return m_attribs.has(ThingAttrLyingCorpse); }`

### `isAnimateAlways`

**Sygnatura:** `bool isAnimateAlways() { return m_attribs.has(ThingAttrAnimateAlways); }`

### `hasMiniMapColor`

**Sygnatura:** `bool hasMiniMapColor() { return m_attribs.has(ThingAttrMinimapColor); }`

### `hasLensHelp`

**Sygnatura:** `bool hasLensHelp() { return m_attribs.has(ThingAttrLensHelp); }`

### `isFullGround`

**Sygnatura:** `bool isFullGround() { return m_attribs.has(ThingAttrFullGround); }`

### `isIgnoreLook`

**Sygnatura:** `bool isIgnoreLook() { return m_attribs.has(ThingAttrLook); }`

### `isCloth`

**Sygnatura:** `bool isCloth() { return m_attribs.has(ThingAttrCloth); }`

### `isMarketable`

**Sygnatura:** `bool isMarketable() { return m_attribs.has(ThingAttrMarket); }`

### `isUsable`

**Sygnatura:** `bool isUsable() { return m_attribs.has(ThingAttrUsable); }`

### `isWrapable`

**Sygnatura:** `bool isWrapable() { return m_attribs.has(ThingAttrWrapable); }`

### `isUnwrapable`

**Sygnatura:** `bool isUnwrapable() { return m_attribs.has(ThingAttrUnwrapable); }`

### `isTopEffect`

**Sygnatura:** `bool isTopEffect() { return m_attribs.has(ThingAttrTopEffect); }`

### `hasBones`

**Sygnatura:** `bool hasBones() { return m_attribs.has(ThingAttrBones); }`

### `getSprites`

**Sygnatura:** `std::vector<int> getSprites() { return m_spritesIndex; }`

### `getOpacity`

**Sygnatura:** `float getOpacity() { return m_opacity; }`

### `isNotPreWalkable`

**Sygnatura:** `bool isNotPreWalkable() { return m_attribs.has(ThingAttrNotPreWalkable); }`

### `setPathable`

**Sygnatura:** `void setPathable(bool var)`

### `getBestTextureDimension`

**Sygnatura:** `Size getBestTextureDimension(int w, int h, int count)`

### `getSpriteIndex`

**Sygnatura:** `uint getSpriteIndex(int w, int h, int l, int x, int y, int z, int a)`

### `getTextureIndex`

**Sygnatura:** `uint getTextureIndex(int l, int x, int y, int z)`

### `draw`

**Sygnatura:** `void draw() override`

### `draw`

**Sygnatura:** `void draw(const Point& pos) override`

### `cache`

**Sygnatura:** `bool cache() override`

## Class Diagram

Zobacz: [../diagrams/thingtype.mmd](../diagrams/thingtype.mmd)
