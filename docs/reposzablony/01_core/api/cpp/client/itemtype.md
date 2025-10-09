---
doc_id: "cpp-api-65bd953e4ded"
source_path: "client/itemtype.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: itemtype.h"
summary: "Dokumentacja API C++ dla client/itemtype.h"
tags: ["cpp", "api", "otclient"]
---

# client/itemtype.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu itemtype.

## Classes/Structs

### Klasa: `ItemType`

| Member | Brief | Signature |
|--------|-------|-----------|
| `unserialize` |  | `void unserialize(const BinaryTreePtr& node)` |
| `setServerId` |  | `void setServerId(uint16 serverId) { m_attribs.set(ItemTypeAttrServerId, serverId); }` |
| `getServerId` |  | `uint16 getServerId() { return m_attribs.get<uint16>(ItemTypeAttrServerId); }` |
| `setClientId` |  | `void setClientId(uint16 clientId) { m_attribs.set(ItemTypeAttrClientId, clientId); }` |
| `getClientId` |  | `uint16 getClientId() { return m_attribs.get<uint16>(ItemTypeAttrClientId); }` |
| `setCategory` |  | `void setCategory(ItemCategory category) { m_category = category; }` |
| `getCategory` |  | `ItemCategory getCategory() { return m_category; }` |
| `setName` |  | `void setName(const std::string& name) { m_attribs.set(ItemTypeAttrName, name); }` |
| `getName` |  | `std::string getName() { return m_attribs.get<std::string>(ItemTypeAttrName); }` |
| `setDesc` |  | `void setDesc(const std::string& desc) { m_attribs.set(ItemTypeAttrDesc, desc); }` |
| `getDesc` |  | `std::string getDesc() { return m_attribs.get<std::string>(ItemTypeAttrDesc); }` |
| `isNull` |  | `bool isNull() { return m_null; }` |
| `isWritable` |  | `bool isWritable() { return m_attribs.get<bool>(ItemTypeAttrWritable); }` |

## Enums

### `ItemCategory`

**Wartości:**

- `ItemCategoryInvalid`
- `ItemCategoryGround`
- `ItemCategoryContainer`
- `ItemCategoryWeapon`
- `ItemCategoryAmmunition`
- `ItemCategoryArmor`
- `ItemCategoryCharges`
- `ItemCategoryTeleport`
- `ItemCategoryMagicField`
- `ItemCategoryWritable`
- `ItemCategoryKey`
- `ItemCategorySplash`
- `ItemCategoryFluid`
- `ItemCategoryDoor`
- `ItemCategoryDeprecated`
- `ItemCategoryLast`

### `ItemTypeAttr`

**Wartości:**

- `ItemTypeAttrServerId`
- `ItemTypeAttrClientId`
- `ItemTypeAttrName`
- `ItemTypeAttrDesc`
- `ItemTypeAttrSpeed`
- `ItemTypeAttrSlot`
- `ItemTypeAttrMaxItems`
- `ItemTypeAttrWeight`
- `ItemTypeAttrWeapon`
- `ItemTypeAttrAmmunition`
- `ItemTypeAttrArmor`
- `ItemTypeAttrMagicLevel`
- `ItemTypeAttrMagicField`
- `ItemTypeAttrWritable`
- `ItemTypeAttrRotateTo`
- `ItemTypeAttrDecay`
- `ItemTypeAttrSpriteHash`
- `ItemTypeAttrMinimapColor`
- `ItemTypeAttr07`
- `ItemTypeAttr08`
- `ItemTypeAttrLight`
- `ItemTypeAttrDecay2`
- `ItemTypeAttrWeapon2`
- `ItemTypeAttrAmmunition2`
- `ItemTypeAttrArmor2`
- `ItemTypeAttrWritable2`
- `ItemTypeAttrLight2`
- `ItemTypeAttrTopOrder`
- `ItemTypeAttrWrtiable3`
- `ItemTypeAttrWareId`
- `ItemTypeAttrLast`

### `ClientVersion`

**Wartości:**

- `ClientVersion750`
- `ClientVersion755`
- `ClientVersion760`
- `ClientVersion770`
- `ClientVersion780`
- `ClientVersion790`
- `ClientVersion792`
- `ClientVersion800`
- `ClientVersion810`
- `ClientVersion811`
- `ClientVersion820`
- `ClientVersion830`
- `ClientVersion840`
- `ClientVersion841`
- `ClientVersion842`
- `ClientVersion850`
- `ClientVersion854_OLD`
- `ClientVersion854`
- `ClientVersion855`
- `ClientVersion860_OLD`
- `ClientVersion860`
- `ClientVersion861`
- `ClientVersion862`
- `ClientVersion870`
- `ClientVersion871`
- `ClientVersion872`
- `ClientVersion873`
- `ClientVersion900`
- `ClientVersion910`
- `ClientVersion920`
- `ClientVersion940`
- `ClientVersion944_V1`
- `ClientVersion944_V2`
- `ClientVersion944_V3`
- `ClientVersion944_V4`
- `ClientVersion946`
- `ClientVersion950`
- `ClientVersion952`
- `ClientVersion953`
- `ClientVersion954`
- `ClientVersion960`
- `ClientVersion961`

## Functions

### `unserialize`

**Sygnatura:** `void unserialize(const BinaryTreePtr& node)`

### `setServerId`

**Sygnatura:** `void setServerId(uint16 serverId) { m_attribs.set(ItemTypeAttrServerId, serverId); }`

### `getServerId`

**Sygnatura:** `uint16 getServerId() { return m_attribs.get<uint16>(ItemTypeAttrServerId); }`

### `setClientId`

**Sygnatura:** `void setClientId(uint16 clientId) { m_attribs.set(ItemTypeAttrClientId, clientId); }`

### `getClientId`

**Sygnatura:** `uint16 getClientId() { return m_attribs.get<uint16>(ItemTypeAttrClientId); }`

### `setCategory`

**Sygnatura:** `void setCategory(ItemCategory category) { m_category = category; }`

### `getCategory`

**Sygnatura:** `ItemCategory getCategory() { return m_category; }`

### `setName`

**Sygnatura:** `void setName(const std::string& name) { m_attribs.set(ItemTypeAttrName, name); }`

### `getName`

**Sygnatura:** `std::string getName() { return m_attribs.get<std::string>(ItemTypeAttrName); }`

### `setDesc`

**Sygnatura:** `void setDesc(const std::string& desc) { m_attribs.set(ItemTypeAttrDesc, desc); }`

### `getDesc`

**Sygnatura:** `std::string getDesc() { return m_attribs.get<std::string>(ItemTypeAttrDesc); }`

### `isNull`

**Sygnatura:** `bool isNull() { return m_null; }`

### `isWritable`

**Sygnatura:** `bool isWritable() { return m_attribs.get<bool>(ItemTypeAttrWritable); }`

## Class Diagram

Zobacz: [../diagrams/itemtype.mmd](../diagrams/itemtype.mmd)
