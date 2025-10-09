---
doc_id: "cpp-api-a514227db8b7"
source_path: "client/uiitem.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: uiitem.h"
summary: "Dokumentacja API C++ dla client/uiitem.h"
tags: ["cpp", "api", "otclient"]
---

# client/uiitem.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu uiitem.

## Classes/Structs

### Klasa: `UIItem`

| Member | Brief | Signature |
|--------|-------|-----------|
| `drawSelf` |  | `void drawSelf(Fw::DrawPane drawPane)` |
| `setItemId` |  | `void setItemId(int id)` |
| `setItemCount` |  | `void setItemCount(int count)` |
| `setItemSubType` |  | `void setItemSubType(int subType)` |
| `setItemVisible` |  | `void setItemVisible(bool visible) { m_itemVisible = visible; }` |
| `setItem` |  | `void setItem(const ItemPtr& item)` |
| `setVirtual` |  | `void setVirtual(bool virt) { m_virtual = virt; }` |
| `clearItem` |  | `void clearItem() { setItemId(0); }` |
| `setShowCount` |  | `void setShowCount(bool value) { m_showCount = value; }` |
| `setItemShader` |  | `void setItemShader(const std::string& str)` |
| `getItemId` |  | `int getItemId() { return m_item ? m_item->getId() : 0; }` |
| `getItemCount` |  | `int getItemCount() { return m_item ? m_item->getCount() : 0; }` |
| `getItemSubType` |  | `int getItemSubType() { return m_item ? m_item->getSubType() : 0; }` |
| `getItemCountOrSubType` |  | `int getItemCountOrSubType() { return m_item ? m_item->getCountOrSubType() : 0; }` |
| `getItem` |  | `ItemPtr getItem() { return m_item; }` |
| `isVirtual` |  | `bool isVirtual() { return m_virtual; }` |
| `isItemVisible` |  | `bool isItemVisible() { return m_itemVisible; }` |
| `onStyleApply` |  | `void onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)` |
| `cacheCountText` |  | `void cacheCountText()` |
| `m_item` |  | `ItemPtr m_item` |
| `m_virtual` |  | `stdext::boolean<false> m_virtual` |
| `m_itemVisible` |  | `stdext::boolean<true> m_itemVisible` |
| `m_showId` |  | `stdext::boolean<false> m_showId` |
| `m_showCount` |  | `stdext::boolean<true> m_showCount` |
| `m_shader` |  | `std::string m_shader` |
| `m_countText` |  | `std::string m_countText` |

## Functions

### `drawSelf`

**Sygnatura:** `void drawSelf(Fw::DrawPane drawPane)`

### `setItemId`

**Sygnatura:** `void setItemId(int id)`

### `setItemCount`

**Sygnatura:** `void setItemCount(int count)`

### `setItemSubType`

**Sygnatura:** `void setItemSubType(int subType)`

### `setItemVisible`

**Sygnatura:** `void setItemVisible(bool visible) { m_itemVisible = visible; }`

### `setItem`

**Sygnatura:** `void setItem(const ItemPtr& item)`

### `setVirtual`

**Sygnatura:** `void setVirtual(bool virt) { m_virtual = virt; }`

### `clearItem`

**Sygnatura:** `void clearItem() { setItemId(0); }`

### `setShowCount`

**Sygnatura:** `void setShowCount(bool value) { m_showCount = value; }`

### `setItemShader`

**Sygnatura:** `void setItemShader(const std::string& str)`

### `getItemId`

**Sygnatura:** `int getItemId() { return m_item ? m_item->getId() : 0; }`

### `getItemCount`

**Sygnatura:** `int getItemCount() { return m_item ? m_item->getCount() : 0; }`

### `getItemSubType`

**Sygnatura:** `int getItemSubType() { return m_item ? m_item->getSubType() : 0; }`

### `getItemCountOrSubType`

**Sygnatura:** `int getItemCountOrSubType() { return m_item ? m_item->getCountOrSubType() : 0; }`

### `getItem`

**Sygnatura:** `ItemPtr getItem() { return m_item; }`

### `isVirtual`

**Sygnatura:** `bool isVirtual() { return m_virtual; }`

### `isItemVisible`

**Sygnatura:** `bool isItemVisible() { return m_itemVisible; }`

### `onStyleApply`

**Sygnatura:** `void onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)`

### `cacheCountText`

**Sygnatura:** `void cacheCountText()`

## Class Diagram

Zobacz: [../diagrams/uiitem.mmd](../diagrams/uiitem.mmd)
