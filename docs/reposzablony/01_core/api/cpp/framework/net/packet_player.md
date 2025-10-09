---
doc_id: "cpp-api-b3ae73a63415"
source_path: "framework/net/packet_player.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: packet_player.h"
summary: "Dokumentacja API C++ dla framework/net/packet_player.h"
tags: ["cpp", "api", "otclient"]
---

# framework/net/packet_player.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu packet_player.

## Classes/Structs

### Klasa: `PacketPlayer`

## Functions

### `start`

**Sygnatura:** `void start(std::function<void(std::shared_ptr<std::vector<uint8_t>>)> recvCallback, std::function<void(boost::system::error_code)> disconnectCallback)`

### `stop`

**Sygnatura:** `void stop()`

### `onOutputPacket`

**Sygnatura:** `void onOutputPacket(const OutputMessagePtr& packet)`

### `process`

**Sygnatura:** `void process()`

## Class Diagram

Zobacz: [../diagrams/packet_player.mmd](../diagrams/packet_player.mmd)
