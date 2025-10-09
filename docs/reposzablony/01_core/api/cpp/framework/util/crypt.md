---
doc_id: "cpp-api-de37a03e5f6d"
source_path: "framework/util/crypt.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: crypt.h"
summary: "Dokumentacja API C++ dla framework/util/crypt.h"
tags: ["cpp", "api", "otclient"]
---

# framework/util/crypt.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu crypt.

## Classes/Structs

### Klasa: `Crypt`

| Member | Brief | Signature |
|--------|-------|-----------|
| `base64Encode` |  | `std::string base64Encode(const std::string& decoded_string)` |
| `base64Decode` |  | `std::string base64Decode(const std::string& encoded_string)` |
| `xorCrypt` |  | `std::string xorCrypt(const std::string& buffer, const std::string& key)` |
| `encrypt` |  | `std::string encrypt(const std::string& decrypted_string) { return _encrypt(decrypted_string, true); }` |
| `decrypt` |  | `std::string decrypt(const std::string& encrypted_string) { return _decrypt(encrypted_string, true); }` |
| `genUUID` |  | `std::string genUUID()` |
| `setMachineUUID` |  | `bool setMachineUUID(std::string uuidstr)` |
| `getMachineUUID` |  | `std::string getMachineUUID()` |
| `md5Encode` |  | `std::string md5Encode(const std::string& decoded_string, bool upperCase)` |
| `sha1Encode` |  | `std::string sha1Encode(const std::string& decoded_string, bool upperCase)` |
| `sha256Encode` |  | `std::string sha256Encode(const std::string& decoded_string, bool upperCase)` |
| `sha512Encode` |  | `std::string sha512Encode(const std::string& decoded_string, bool upperCase)` |
| `crc32` |  | `std::string crc32(const std::string& decoded_string, bool upperCase)` |
| `rsaGenerateKey` |  | `void rsaGenerateKey(int bits, int e)` |
| `rsaSetPublicKey` |  | `void rsaSetPublicKey(const std::string& n, const std::string& e)` |
| `rsaSetPrivateKey` |  | `void rsaSetPrivateKey(const std::string &p, const std::string &q, const std::string &d)` |
| `rsaCheckKey` |  | `bool rsaCheckKey()` |
| `rsaEncrypt` |  | `bool rsaEncrypt(unsigned char *msg, int size)` |
| `rsaDecrypt` |  | `bool rsaDecrypt(unsigned char *msg, int size)` |
| `rsaGetSize` |  | `int rsaGetSize()` |
| `bencrypt` |  | `void bencrypt(uint8_t * buffer, int len, uint64_t k)` |
| `bdecrypt` |  | `void bdecrypt(uint8_t * buffer, int len, uint64_t k)` |

## Functions

### `base64Encode`

**Sygnatura:** `std::string base64Encode(const std::string& decoded_string)`

### `base64Decode`

**Sygnatura:** `std::string base64Decode(const std::string& encoded_string)`

### `xorCrypt`

**Sygnatura:** `std::string xorCrypt(const std::string& buffer, const std::string& key)`

### `encrypt`

**Sygnatura:** `std::string encrypt(const std::string& decrypted_string) { return _encrypt(decrypted_string, true); }`

### `decrypt`

**Sygnatura:** `std::string decrypt(const std::string& encrypted_string) { return _decrypt(encrypted_string, true); }`

### `genUUID`

**Sygnatura:** `std::string genUUID()`

### `setMachineUUID`

**Sygnatura:** `bool setMachineUUID(std::string uuidstr)`

### `getMachineUUID`

**Sygnatura:** `std::string getMachineUUID()`

### `md5Encode`

**Sygnatura:** `std::string md5Encode(const std::string& decoded_string, bool upperCase)`

### `sha1Encode`

**Sygnatura:** `std::string sha1Encode(const std::string& decoded_string, bool upperCase)`

### `sha256Encode`

**Sygnatura:** `std::string sha256Encode(const std::string& decoded_string, bool upperCase)`

### `sha512Encode`

**Sygnatura:** `std::string sha512Encode(const std::string& decoded_string, bool upperCase)`

### `crc32`

**Sygnatura:** `std::string crc32(const std::string& decoded_string, bool upperCase)`

### `rsaGenerateKey`

**Sygnatura:** `void rsaGenerateKey(int bits, int e)`

### `rsaSetPublicKey`

**Sygnatura:** `void rsaSetPublicKey(const std::string& n, const std::string& e)`

### `rsaSetPrivateKey`

**Sygnatura:** `void rsaSetPrivateKey(const std::string &p, const std::string &q, const std::string &d)`

### `rsaCheckKey`

**Sygnatura:** `bool rsaCheckKey()`

### `rsaEncrypt`

**Sygnatura:** `bool rsaEncrypt(unsigned char *msg, int size)`

### `rsaDecrypt`

**Sygnatura:** `bool rsaDecrypt(unsigned char *msg, int size)`

### `rsaGetSize`

**Sygnatura:** `int rsaGetSize()`

### `bencrypt`

**Sygnatura:** `void bencrypt(uint8_t * buffer, int len, uint64_t k)`

### `bdecrypt`

**Sygnatura:** `void bdecrypt(uint8_t * buffer, int len, uint64_t k)`

### `_encrypt`

**Sygnatura:** `std::string _encrypt(const std::string& decrypted_string, bool useMachineUUID)`

### `_decrypt`

**Sygnatura:** `std::string _decrypt(const std::string& encrypted_string, bool useMachineUUID)`

### `getCryptKey`

**Sygnatura:** `std::string getCryptKey(bool useMachineUUID)`

## Types/Aliases

### `RSA`

**Typedef:** `struct rsa_st`

## Class Diagram

Zobacz: [../diagrams/crypt.mmd](../diagrams/crypt.mmd)
