---
doc_id: "cpp-api-cb075ca3d702"
source_path: "client/container.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: container.h"
summary: "Dokumentacja API C++ dla client/container.h"
tags: ["cpp", "api", "otclient"]
---

# client/container.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu container.

## Classes/Structs

### Klasa: `Container`

| Member | Brief | Signature |
|--------|-------|-----------|
| `getItem` |  | `ItemPtr getItem(int slot)` |
| `getItems` |  | `std::deque<ItemPtr> getItems() { return m_items; }` |
| `getItemsCount` |  | `int getItemsCount() { return m_items.size(); }` |
| `getSlotPosition` |  | `Position getSlotPosition(int slot) { return Position(0xffff, m_id \| 0x40, slot); }` |
| `getId` |  | `int getId() { return m_id; }` |
| `getCapacity` |  | `int getCapacity() { return m_capacity; }` |
| `getContainerItem` |  | `ItemPtr getContainerItem() { return m_containerItem; }` |
| `getName` |  | `std::string getName() { return m_name; }` |
| `hasParent` |  | `bool hasParent() { return m_hasParent; }` |
| `isClosed` |  | `bool isClosed() { return m_closed; }` |
| `isUnlocked` |  | `bool isUnlocked() { return m_unlocked; }` |
| `hasPages` |  | `bool hasPages() { return m_hasPages; }` |
| `getSize` |  | `int getSize() { return m_size; }` |
| `getFirstIndex` |  | `int getFirstIndex() { return m_firstIndex; }` |
| `findItemById` |  | `ItemPtr findItemById(uint itemId, int subType)` |
| `onOpen` |  | `void onOpen(const ContainerPtr& previousContainer)` |
| `onClose` |  | `void onClose()` |
| `onAddItem` |  | `void onAddItem(const ItemPtr& item, int slot)` |
| `onAddItems` |  | `void onAddItems(const std::vector<ItemPtr>& items)` |
| `onUpdateItem` |  | `void onUpdateItem(int slot, const ItemPtr& item)` |
| `onRemoveItem` |  | `void onRemoveItem(int slot, const ItemPtr& lastItem)` |

## Functions

### `getItem`

**Sygnatura:** `ItemPtr getItem(int slot)`

### `getItems`

**Sygnatura:** `std::deque<ItemPtr> getItems() { return m_items; }`

### `getItemsCount`

**Sygnatura:** `int getItemsCount() { return m_items.size(); }`

### `getSlotPosition`

**Sygnatura:** `Position getSlotPosition(int slot) { return Position(0xffff, m_id | 0x40, slot); }`

### `getId`

**Sygnatura:** `int getId() { return m_id; }`

### `getCapacity`

**Sygnatura:** `int getCapacity() { return m_capacity; }`

### `getContainerItem`

**Sygnatura:** `ItemPtr getContainerItem() { return m_containerItem; }`

### `getName`

**Sygnatura:** `std::string getName() { return m_name; }`

### `hasParent`

**Sygnatura:** `bool hasParent() { return m_hasParent; }`

### `isClosed`

**Sygnatura:** `bool isClosed() { return m_closed; }`

### `isUnlocked`

**Sygnatura:** `bool isUnlocked() { return m_unlocked; }`

### `hasPages`

**Sygnatura:** `bool hasPages() { return m_hasPages; }`

### `getSize`

**Sygnatura:** `int getSize() { return m_size; }`

### `getFirstIndex`

**Sygnatura:** `int getFirstIndex() { return m_firstIndex; }`

### `findItemById`

**Sygnatura:** `ItemPtr findItemById(uint itemId, int subType)`

### `onOpen`

**Sygnatura:** `void onOpen(const ContainerPtr& previousContainer)`

### `onClose`

**Sygnatura:** `void onClose()`

### `onAddItem`

**Sygnatura:** `void onAddItem(const ItemPtr& item, int slot)`

### `onAddItems`

**Sygnatura:** `void onAddItems(const std::vector<ItemPtr>& items)`

### `onUpdateItem`

**Sygnatura:** `void onUpdateItem(int slot, const ItemPtr& item)`

### `onRemoveItem`

**Sygnatura:** `void onRemoveItem(int slot, const ItemPtr& lastItem)`

### `updateItemsPositions`

**Sygnatura:** `void updateItemsPositions()`

## Class Diagram

Zobacz: [../diagrams/container.mmd](../diagrams/container.mmd)
