---
doc_id: "cpp-api-ef7b25633406"
source_path: "client/position.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: position.h"
summary: "Dokumentacja API C++ dla client/position.h"
tags: ["cpp", "api", "otclient"]
---

# client/position.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu position.

## Classes/Structs

### Klasa: `Position`

| Member | Brief | Signature |
|--------|-------|-----------|
| `translatedToDirection` |  | `Position translatedToDirection(Otc::Direction direction) {` |
| `pos` |  | `Position pos = *this` |
| `pos` |  | `return pos` |
| `translatedToReverseDirection` |  | `Position translatedToReverseDirection(Otc::Direction direction) {` |
| `pos` |  | `Position pos = *this` |
| `pos` |  | `return pos` |
| `translatedToDirections` |  | `std::vector<Position> translatedToDirections(const std::vector<Otc::Direction>& dirs) const {` |
| `lastPos` |  | `Position lastPos = *this` |
| `positions` |  | `std::vector<Position> positions` |
| `positions` |  | `return positions` |
| `positions` |  | `return positions` |
| `getAngleFromPositions` |  | `static double getAngleFromPositions(const Position& fromPos, const Position& toPos) {` |
| `dx` |  | `int dx = toPos.x - fromPos.x` |
| `dy` |  | `int dy = toPos.y - fromPos.y` |
| `angle` |  | `float angle = std::atan2(dy * -1, dx)` |
| `angle` |  | `return angle` |
| `getAngleFromPosition` |  | `double getAngleFromPosition(const Position& position) const {` |
| `getAngleFromPositions` |  | `return getAngleFromPositions(*this, position)` |
| `angle` |  | `float angle = getAngleFromPositions(fromPos, toPos) * RAD_TO_DEC` |
| `if` |  | `else if(angle >= 45 - 22.5 && angle < 45 + 22.5)` |
| `if` |  | `else if(angle >= 90 - 22.5 && angle < 90 + 22.5)` |
| `if` |  | `else if(angle >= 135 - 22.5 && angle < 135 + 22.5)` |
| `if` |  | `else if(angle >= 180 - 22.5 && angle < 180 + 22.5)` |
| `if` |  | `else if(angle >= 225 - 22.5 && angle < 225 + 22.5)` |
| `if` |  | `else if(angle >= 270 - 22.5 && angle < 270 + 22.5)` |
| `if` |  | `else if(angle >= 315 - 22.5 && angle < 315 + 22.5)` |
| `getDirectionFromPosition` |  | `Otc::Direction getDirectionFromPosition(const Position& position) const {` |
| `getDirectionFromPositions` |  | `return getDirectionFromPositions(*this, position)` |
| `isMapPosition` |  | `bool isMapPosition() const { return (x >=0 && y >= 0 && z >= 0 && x < 65535 && y < 65535 && z <= Otc::MAX_Z); }` |
| `isValid` |  | `bool isValid() const { return !(x == 65535 && y == 65535 && z == 255); }` |
| `distance` |  | `float distance(const Position& pos) const { return sqrt(pow((pos.x - x), 2) + pow((pos.y - y), 2)); }` |
| `manhattanDistance` |  | `int manhattanDistance(const Position& pos) const { return std::abs(pos.x - x) + std::abs(pos.y - y); }` |
| `translate` |  | `void translate(int dx, int dy, short dz = 0) { x += dx; y += dy; z += dz; }` |
| `translated` |  | `Position translated(int dx, int dy, short dz = 0) const { Position pos = *this; pos.x += dx; pos.y += dy; pos.z += dz; return pos; }` |
| `operator` |  | `bool operator==(const Position& other) const { return other.x == x && other.y == y && other.z == z; }` |
| `isInRange` |  | `bool isInRange(const Position& pos, int xRange, int yRange, int zRange = 0) const { return std::abs(x-pos.x) <= xRange && std::abs(y-pos.y) <= yRange ` |
| `isInRange` |  | `bool isInRange(const Position& pos, int minXRange, int maxXRange, int minYRange, int maxYRange) const {` |
| `up` |  | `bool up(int n = 1) {` |
| `nz` |  | `int nz = z-n` |
| `true` |  | `return true` |
| `false` |  | `return false` |
| `down` |  | `bool down(int n = 1) {` |
| `nz` |  | `int nz = z+n` |
| `true` |  | `return true` |
| `false` |  | `return false` |
| `coveredUp` |  | `bool coveredUp(int n = 1) {` |
| `nx` |  | `int nx = x+n, ny = y+n, nz = z-n` |
| `true` |  | `return true` |
| `false` |  | `return false` |
| `coveredDown` |  | `bool coveredDown(int n = 1) {` |
| `nx` |  | `int nx = x-n, ny = y-n, nz = z+n` |
| `true` |  | `return true` |
| `false` |  | `return false` |
| `toString` |  | `std::string toString()` |
| `x` |  | `int x` |
| `y` |  | `int y` |
| `z` |  | `short z` |

### Struktura: `PositionHasher`

## Functions

### `translatedToDirection`

**Sygnatura:** `Position translatedToDirection(Otc::Direction direction) {`

### `translatedToReverseDirection`

**Sygnatura:** `Position translatedToReverseDirection(Otc::Direction direction) {`

### `translatedToDirections`

**Sygnatura:** `std::vector<Position> translatedToDirections(const std::vector<Otc::Direction>& dirs) const {`

### `getAngleFromPositions`

**Sygnatura:** `static double getAngleFromPositions(const Position& fromPos, const Position& toPos) {`

### `getAngleFromPosition`

**Sygnatura:** `double getAngleFromPosition(const Position& position) const {`

### `getAngleFromPositions`

**Sygnatura:** `return getAngleFromPositions(*this, position)`

### `if`

**Sygnatura:** `else if(angle >= 45 - 22.5 && angle < 45 + 22.5)`

### `if`

**Sygnatura:** `else if(angle >= 90 - 22.5 && angle < 90 + 22.5)`

### `if`

**Sygnatura:** `else if(angle >= 135 - 22.5 && angle < 135 + 22.5)`

### `if`

**Sygnatura:** `else if(angle >= 180 - 22.5 && angle < 180 + 22.5)`

### `if`

**Sygnatura:** `else if(angle >= 225 - 22.5 && angle < 225 + 22.5)`

### `if`

**Sygnatura:** `else if(angle >= 270 - 22.5 && angle < 270 + 22.5)`

### `if`

**Sygnatura:** `else if(angle >= 315 - 22.5 && angle < 315 + 22.5)`

### `getDirectionFromPosition`

**Sygnatura:** `Otc::Direction getDirectionFromPosition(const Position& position) const {`

### `getDirectionFromPositions`

**Sygnatura:** `return getDirectionFromPositions(*this, position)`

### `isMapPosition`

**Sygnatura:** `bool isMapPosition() const { return (x >=0 && y >= 0 && z >= 0 && x < 65535 && y < 65535 && z <= Otc::MAX_Z); }`

### `isValid`

**Sygnatura:** `bool isValid() const { return !(x == 65535 && y == 65535 && z == 255); }`

### `distance`

**Sygnatura:** `float distance(const Position& pos) const { return sqrt(pow((pos.x - x), 2) + pow((pos.y - y), 2)); }`

### `manhattanDistance`

**Sygnatura:** `int manhattanDistance(const Position& pos) const { return std::abs(pos.x - x) + std::abs(pos.y - y); }`

### `translate`

**Sygnatura:** `void translate(int dx, int dy, short dz = 0) { x += dx; y += dy; z += dz; }`

### `translated`

**Sygnatura:** `Position translated(int dx, int dy, short dz = 0) const { Position pos = *this; pos.x += dx; pos.y += dy; pos.z += dz; return pos; }`

### `isInRange`

**Sygnatura:** `bool isInRange(const Position& pos, int xRange, int yRange, int zRange = 0) const { return std::abs(x-pos.x) <= xRange && std::abs(y-pos.y) <= yRange && std::abs(z - pos.z) <= zRange; }`

### `isInRange`

**Sygnatura:** `bool isInRange(const Position& pos, int minXRange, int maxXRange, int minYRange, int maxYRange) const {`

### `up`

**Sygnatura:** `bool up(int n = 1) {`

### `down`

**Sygnatura:** `bool down(int n = 1) {`

### `coveredUp`

**Sygnatura:** `bool coveredUp(int n = 1) {`

### `coveredDown`

**Sygnatura:** `bool coveredDown(int n = 1) {`

### `toString`

**Sygnatura:** `std::string toString()`

### `operator`

**Sygnatura:** `std::size_t operator()(const Position& pos) const {`

## Class Diagram

Zobacz: [../diagrams/position.mmd](../diagrams/position.mmd)
