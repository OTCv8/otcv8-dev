---
doc_id: "cpp-api-f3bb11a5b088"
source_path: "framework/graphics/drawqueue.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: drawqueue.h"
summary: "Dokumentacja API C++ dla framework/graphics/drawqueue.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/drawqueue.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu drawqueue.

## Classes/Structs

### Klasa: `DrawQueue`

### Struktura: `DrawQueueItem`

### Struktura: `DrawQueueItem`

### Struktura: `DrawQueueItemTexturedRect`

### Struktura: `DrawQueueItemTextureCoords`

### Struktura: `DrawQueueItemColoredTextureCoords`

### Struktura: `DrawQueueItemImageWithShader`

### Struktura: `DrawQueueItemFilledRect`

### Struktura: `DrawQueueItemClearRect`

### Struktura: `DrawQueueItemFillCoords`

### Struktura: `DrawQueueItemText`

### Struktura: `DrawQueueItemTextColored`

### Struktura: `DrawQueueItemLine`

### Struktura: `DrawQueueCondition`

### Struktura: `DrawQueueConditionClip`

### Struktura: `DrawQueueConditionRotation`

### Struktura: `DrawQueueConditionMark`

### Klasa: `DrawQueue`

## Enums

### `DrawType`

**Wartości:**

- `DRAW_ALL`
- `DRAW_BEFORE_MAP`
- `DRAW_AFTER_MAP`

## Functions

### `draw`

**Sygnatura:** `void draw()`

### `draw`

**Sygnatura:** `void draw(const Point& pos)`

### `cache`

**Sygnatura:** `bool cache()`

### `draw`

**Sygnatura:** `void draw()`

### `draw`

**Sygnatura:** `void draw() override`

### `draw`

**Sygnatura:** `void draw(const Point& pos) override`

### `cache`

**Sygnatura:** `bool cache() override {`

### `cache`

**Sygnatura:** `bool cache()`

### `draw`

**Sygnatura:** `void draw()`

### `cache`

**Sygnatura:** `bool cache()`

### `draw`

**Sygnatura:** `void draw()`

### `draw`

**Sygnatura:** `void draw()`

### `draw`

**Sygnatura:** `void draw()`

### `start`

**Sygnatura:** `void start(DrawQueue* queue) override`

### `end`

**Sygnatura:** `void end(DrawQueue* queue) override`

### `start`

**Sygnatura:** `void start(DrawQueue* queue) override`

### `end`

**Sygnatura:** `void end(DrawQueue* queue) override`

### `start`

**Sygnatura:** `void start(DrawQueue* queue) override`

### `end`

**Sygnatura:** `void end(DrawQueue* queue) override`

### `draw`

**Sygnatura:** `void draw(DrawType drawType = DRAW_ALL)`

### `add`

**Sygnatura:** `void add(DrawQueueItem* item)`

### `addTextureCoords`

**Sygnatura:** `void addTextureCoords(CoordsBuffer& coords, const TexturePtr& texture, const Color& color = Color::white)`

### `addColoredTextureCoords`

**Sygnatura:** `void addColoredTextureCoords(CoordsBuffer& coords, const TexturePtr& texture, const std::vector<std::pair<int, Color>>& colors)`

### `addFilledRect`

**Sygnatura:** `void addFilledRect(const Rect& dest, const Color& color = Color::white)`

### `addFillCoords`

**Sygnatura:** `void addFillCoords(CoordsBuffer& coords, const Color& color = Color::white)`

### `addClearRect`

**Sygnatura:** `void addClearRect(const Rect& dest, const Color& color = Color::white)`

### `addText`

**Sygnatura:** `void addText(BitmapFontPtr font, const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align = Fw::AlignTopLeft, const Color& color = Color::white, bool shadow = false)`

### `addColoredText`

**Sygnatura:** `void addColoredText(BitmapFontPtr font, const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align, const std::vector<std::pair<int, Color>>& colors, bool shadow = false)`

### `addFilledTriangle`

**Sygnatura:** `void addFilledTriangle(const Point& a, const Point& b, const Point& c, const Color& color = Color::white)`

### `addBoundingRect`

**Sygnatura:** `void addBoundingRect(const Rect& dest, int innerLineWidth, const Color& color = Color::white)`

### `addLine`

**Sygnatura:** `void addLine(const std::vector<Point>& points, int width, const Color& color = Color::white)`

### `setFrameBuffer`

**Sygnatura:** `void setFrameBuffer(const Rect& dest, const Size& size, const Rect& src)`

### `hasFrameBuffer`

**Sygnatura:** `bool hasFrameBuffer()`

### `getFrameBufferDest`

**Sygnatura:** `Rect getFrameBufferDest()`

### `getFrameBufferSize`

**Sygnatura:** `Size getFrameBufferSize()`

### `getFrameBufferSrc`

**Sygnatura:** `Rect getFrameBufferSrc()`

### `size`

**Sygnatura:** `size_t size()`

### `setOpacity`

**Sygnatura:** `void setOpacity(size_t start, float opacity)`

### `setClip`

**Sygnatura:** `void setClip(size_t start, const Rect& clip)`

### `setRotation`

**Sygnatura:** `void setRotation(size_t start, const Point& center, float angle)`

### `setMark`

**Sygnatura:** `void setMark(size_t start, const Color& color)`

### `markMapPosition`

**Sygnatura:** `void markMapPosition()`

### `correctOutfit`

**Sygnatura:** `void correctOutfit(const Rect& dest, int fromPos, bool oldScaling)`

### `setShader`

**Sygnatura:** `void setShader(const std::string& shader)`

### `getShader`

**Sygnatura:** `std::string getShader()`

## Class Diagram

Zobacz: [../diagrams/drawqueue.mmd](../diagrams/drawqueue.mmd)
