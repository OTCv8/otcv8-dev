---
doc_id: "cpp-api-6fea54eb6c21"
source_path: "framework/util/qrcodegen.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: qrcodegen.h"
summary: "Dokumentacja API C++ dla framework/util/qrcodegen.h"
tags: ["cpp", "api", "otclient"]
---

# framework/util/qrcodegen.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu qrcodegen.

## Classes/Structs

### Struktura: `qrcodegen_Segment`

A segment of character/binary/control data in a QR Code symbol. * The mid-level way to create a segment is to take the payload data * and call a factory function such as qrcodegen_makeNumeric(). * The low-level way to create a segment is to custom-make the bit buffer * and initialize a qrcodegen_Segment struct with appropriate values. * Even in the most favorable conditions, a QR Code can only hold 7089 characters of data. * Any segment longer than this is meaningless for the purpose of generating QR Codes. * Moreover, the maximum allowed bit length is 32767 because * the largest QR Code (version 40) has 31329 modules.

### Struktura: `qrcodegen_Segment`

Returns a segment representing the given binary data encoded in * byte mode. All input byte arrays are acceptable. Any text string * can be converted to UTF-8 bytes and encoded as a byte mode segment.

### Struktura: `qrcodegen_Segment`

Returns a segment representing the given string of decimal digits encoded in numeric mode.

### Struktura: `qrcodegen_Segment`

Returns a segment representing the given text string encoded in alphanumeric mode. * The characters allowed are: 0 to 9, A to Z (uppercase only), space, * dollar, percent, asterisk, plus, hyphen, period, slash, colon.

### Struktura: `qrcodegen_Segment`

Returns a segment representing an Extended Channel Interpretation * (ECI) designator with the given assignment value.

## Enums

### `qrcodegen_Ecc`

The error correction level in a QR Code symbol.

**Wartości:**

- `qrcodegen_Ecc_LOW`
- `qrcodegen_Ecc_MEDIUM`
- `qrcodegen_Ecc_QUARTILE`
- `qrcodegen_Ecc_HIGH`

### `qrcodegen_Mask`

The mask pattern used in a QR Code symbol.

**Wartości:**

- `qrcodegen_Mask_AUTO`
- `qrcodegen_Mask_0`
- `qrcodegen_Mask_1`
- `qrcodegen_Mask_2`
- `qrcodegen_Mask_3`
- `qrcodegen_Mask_4`
- `qrcodegen_Mask_5`
- `qrcodegen_Mask_6`
- `qrcodegen_Mask_7`

### `qrcodegen_Mode`

Describes how a segment's data bits are interpreted.

**Wartości:**

- `qrcodegen_Mode_NUMERIC`
- `qrcodegen_Mode_ALPHANUMERIC`
- `qrcodegen_Mode_BYTE`
- `qrcodegen_Mode_KANJI`
- `qrcodegen_Mode_ECI`

### `qrcodegen_Mode`

**Wartości:**

- `int`
- `uint8_t`
- `int`

### `qrcodegen_Ecc`

**Wartości:**

- `bool`
- `enum`
- `bool`
- `enum`
- `bool`
- `int`
- `bool`
- `bool`
- `size_t`
- `struct`
- `struct`
- `struct`
- `struct`
- `int`
- `bool`

### `qrcodegen_Ecc`

**Wartości:**

- `bool`
- `enum`
- `bool`
- `int`
- `bool`
- `bool`
- `size_t`
- `struct`
- `struct`
- `struct`
- `struct`
- `int`
- `bool`

### `qrcodegen_Ecc`

**Wartości:**

- `bool`
- `int`
- `bool`
- `bool`
- `size_t`
- `struct`
- `struct`
- `struct`
- `struct`
- `int`
- `bool`

## Functions

### `qrcodegen_isAlphanumeric`

Tests whether the given string can be encoded as a segment in alphanumeric mode. * A string is encodable iff each character is in the following set: 0 to 9, A to Z * (uppercase only), space, dollar, percent, asterisk, plus, hyphen, period, slash, colon.

**Sygnatura:** `bool qrcodegen_isAlphanumeric(const char *text)`

### `qrcodegen_isNumeric`

Tests whether the given string can be encoded as a segment in numeric mode. * A string is encodable iff each character is in the range 0 to 9.

**Sygnatura:** `bool qrcodegen_isNumeric(const char *text)`

### `qrcodegen_calcSegmentBufferSize`

Returns the number of bytes (uint8_t) needed for the data buffer of a segment * containing the given number of characters using the given mode. Notes: * - Returns SIZE_MAX on failure, i.e. numChars > INT16_MAX or *   the number of needed bits exceeds INT16_MAX (i.e. 32767). * - Otherwise, all valid results are in the range [0, ceil(INT16_MAX / 8)], i.e. at most 4096. * - It is okay for the user to allocate more bytes for the buffer than needed. * - For byte mode, numChars measures the number of bytes, not Unicode code points. * - For ECI mode, numChars must be 0, and the worst-case number of bytes is returned. *   An actual ECI segment can have shorter data. For non-ECI modes, the result is exact.

**Sygnatura:** `size_t qrcodegen_calcSegmentBufferSize(enum qrcodegen_Mode mode, size_t numChars)`

### `qrcodegen_getSize`

Returns the side length of the given QR Code, assuming that encoding succeeded. * The result is in the range [21, 177]. Note that the length of the array buffer * is related to the side length - every 'uint8_t qrcode[]' must have length at least * qrcodegen_BUFFER_LEN_FOR_VERSION(version), which equals ceil(size^2 / 8 + 1).

**Sygnatura:** `int qrcodegen_getSize(const uint8_t qrcode[])`

### `qrcodegen_getModule`

Returns the color of the module (pixel) at the given coordinates, which is false * for white or true for black. The top left corner has the coordinates (x=0, y=0). * If the given coordinates are out of bounds, then false (white) is returned.

**Sygnatura:** `bool qrcodegen_getModule(const uint8_t qrcode[], int x, int y)`

## Class Diagram

Zobacz: [../diagrams/qrcodegen.mmd](../diagrams/qrcodegen.mmd)
