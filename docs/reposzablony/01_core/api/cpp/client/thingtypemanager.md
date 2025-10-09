---
doc_id: "cpp-api-b674b3c32a3c"
source_path: "client/thingtypemanager.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: thingtypemanager.h"
summary: "Dokumentacja API C++ dla client/thingtypemanager.h"
tags: ["cpp", "api", "otclient"]
---

# client/thingtypemanager.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu thingtypemanager.

## Classes/Structs

### Klasa: `ThingTypeManager`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `check` |  | `void check()` |
| `loadDat` |  | `bool loadDat(std::string file)` |
| `loadOtml` |  | `bool loadOtml(std::string file)` |
| `loadOtb` |  | `void loadOtb(const std::string& file)` |
| `loadXml` |  | `void loadXml(const std::string& file)` |
| `parseItemType` |  | `void parseItemType(uint16 id, TiXmlElement *elem)` |
| `saveDat` |  | `void saveDat(std::string fileName)` |
| `dumpTextures` |  | `void dumpTextures(std::string dir)` |
| `replaceTextures` |  | `void replaceTextures(std::string dir)` |
| `addItemType` |  | `void addItemType(const ItemTypePtr& itemType)` |
| `findItemTypesByName` |  | `ItemTypeList findItemTypesByName(std::string name)` |
| `findItemTypesByString` |  | `ItemTypeList findItemTypesByString(std::string str)` |
| `getMarketCategories` |  | `std::set<int> getMarketCategories()` |
| `m_marketCategories` |  | `return m_marketCategories` |
| `findThingTypeByAttr` |  | `ThingTypeList findThingTypeByAttr(ThingAttr attr, ThingCategory category)` |
| `findItemTypeByCategory` |  | `ItemTypeList findItemTypeByCategory(ItemCategory category)` |
| `getDatSignature` |  | `uint32 getDatSignature() { return m_datSignature; }` |
| `getOtbMajorVersion` |  | `uint32 getOtbMajorVersion() { return m_otbMajorVersion; }` |
| `getOtbMinorVersion` |  | `uint32 getOtbMinorVersion() { return m_otbMinorVersion; }` |
| `getContentRevision` |  | `uint16 getContentRevision() { return m_contentRevision; }` |
| `isDatLoaded` |  | `bool isDatLoaded() { return m_datLoaded; }` |
| `isXmlLoaded` |  | `bool isXmlLoaded() { return m_xmlLoaded; }` |
| `isOtbLoaded` |  | `bool isOtbLoaded() { return m_otbLoaded; }` |
| `isValidDatId` |  | `bool isValidDatId(uint16 id, ThingCategory category) { return id >= 1 && id < m_thingTypes[category].size(); }` |
| `isValidOtbId` |  | `bool isValidOtbId(uint16 id) { return id >= 1 && id < m_itemTypes.size(); }` |

## Functions

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `check`

**Sygnatura:** `void check()`

### `loadDat`

**Sygnatura:** `bool loadDat(std::string file)`

### `loadOtml`

**Sygnatura:** `bool loadOtml(std::string file)`

### `loadOtb`

**Sygnatura:** `void loadOtb(const std::string& file)`

### `loadXml`

**Sygnatura:** `void loadXml(const std::string& file)`

### `parseItemType`

**Sygnatura:** `void parseItemType(uint16 id, TiXmlElement *elem)`

### `saveDat`

**Sygnatura:** `void saveDat(std::string fileName)`

### `dumpTextures`

**Sygnatura:** `void dumpTextures(std::string dir)`

### `replaceTextures`

**Sygnatura:** `void replaceTextures(std::string dir)`

### `addItemType`

**Sygnatura:** `void addItemType(const ItemTypePtr& itemType)`

### `findItemTypesByName`

**Sygnatura:** `ItemTypeList findItemTypesByName(std::string name)`

### `findItemTypesByString`

**Sygnatura:** `ItemTypeList findItemTypesByString(std::string str)`

### `getMarketCategories`

**Sygnatura:** `std::set<int> getMarketCategories()`

### `findThingTypeByAttr`

**Sygnatura:** `ThingTypeList findThingTypeByAttr(ThingAttr attr, ThingCategory category)`

### `findItemTypeByCategory`

**Sygnatura:** `ItemTypeList findItemTypeByCategory(ItemCategory category)`

### `getDatSignature`

**Sygnatura:** `uint32 getDatSignature() { return m_datSignature; }`

### `getOtbMajorVersion`

**Sygnatura:** `uint32 getOtbMajorVersion() { return m_otbMajorVersion; }`

### `getOtbMinorVersion`

**Sygnatura:** `uint32 getOtbMinorVersion() { return m_otbMinorVersion; }`

### `getContentRevision`

**Sygnatura:** `uint16 getContentRevision() { return m_contentRevision; }`

### `isDatLoaded`

**Sygnatura:** `bool isDatLoaded() { return m_datLoaded; }`

### `isXmlLoaded`

**Sygnatura:** `bool isXmlLoaded() { return m_xmlLoaded; }`

### `isOtbLoaded`

**Sygnatura:** `bool isOtbLoaded() { return m_otbLoaded; }`

### `isValidDatId`

**Sygnatura:** `bool isValidDatId(uint16 id, ThingCategory category) { return id >= 1 && id < m_thingTypes[category].size(); }`

### `isValidOtbId`

**Sygnatura:** `bool isValidOtbId(uint16 id) { return id >= 1 && id < m_itemTypes.size(); }`

## Class Diagram

Zobacz: [../diagrams/thingtypemanager.mmd](../diagrams/thingtypemanager.mmd)
