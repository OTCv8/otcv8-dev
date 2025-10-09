---
doc_id: "cpp-api-e48112ea0c0e"
source_path: "framework/core/resourcemanager.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: resourcemanager.h"
summary: "Dokumentacja API C++ dla framework/core/resourcemanager.h"
tags: ["cpp", "api", "otclient"]
---

# framework/core/resourcemanager.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu resourcemanager.

## Classes/Structs

### Klasa: `ResourceManager`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init(const char *argv0)` |
| `terminate` |  | `void terminate()` |
| `launchCorrect` |  | `bool launchCorrect(const std::string& product, const std::string& app)` |
| `setupWriteDir` |  | `bool setupWriteDir(const std::string& product, const std::string& app)` |
| `setup` |  | `bool setup()` |
| `getCompactName` |  | `std::string getCompactName()` |
| `loadDataFromSelf` |  | `bool loadDataFromSelf(bool unmountIfMounted = false)` |
| `fileExists` |  | `bool fileExists(const std::string& fileName)` |
| `directoryExists` |  | `bool directoryExists(const std::string& directoryName)` |
| `readFileStream` |  | `void readFileStream(const std::string& fileName, std::iostream& out)` |
| `readFileContents` |  | `std::string readFileContents(const std::string& fileName, bool safe = false)` |
| `readFileContentsSafe` |  | `std::string readFileContentsSafe(const std::string& fileName) { return readFileContents(fileName, true); }` |
| `isFileEncryptedOrCompressed` |  | `bool isFileEncryptedOrCompressed(const std::string& fileName)` |
| `writeFileBuffer` |  | `bool writeFileBuffer(const std::string& fileName, const uchar* data, uint size)` |
| `writeFileContents` |  | `bool writeFileContents(const std::string& fileName, const std::string& data)` |
| `writeFileStream` |  | `bool writeFileStream(const std::string& fileName, std::iostream& in)` |
| `openFile` |  | `FileStreamPtr openFile(const std::string& fileName, bool dontCache = false)` |
| `appendFile` |  | `FileStreamPtr appendFile(const std::string& fileName)` |
| `createFile` |  | `FileStreamPtr createFile(const std::string& fileName)` |
| `deleteFile` |  | `bool deleteFile(const std::string& fileName)` |
| `makeDir` |  | `bool makeDir(const std::string directory)` |
| `listDirectoryFiles` |  | `std::list<std::string> listDirectoryFiles(const std::string & directoryPath = "", bool fullPath = false, bool raw = false)` |
| `resolvePath` |  | `std::string resolvePath(std::string path)` |
| `getWorkDir` |  | `std::string getWorkDir() { return "/"; }` |
| `getWriteDir` |  | `std::string getWriteDir() { return "/"; }` |
| `getBinaryName` |  | `std::string getBinaryName() { return "otclientv8.apk"; }` |
| `getWriteDir` |  | `std::string getWriteDir() { return m_writeDir.string(); }` |
| `getBinaryName` |  | `std::string getBinaryName() { return m_binaryPath.filename().string(); }` |
| `guessFilePath` |  | `std::string guessFilePath(const std::string& filename, const std::string& type)` |
| `isFileType` |  | `bool isFileType(const std::string& filename, const std::string& type)` |
| `isLoadedFromArchive` |  | `bool isLoadedFromArchive() { return m_loadedFromArchive; }` |
| `isLoadedFromMemory` |  | `bool isLoadedFromMemory() { return m_loadedFromMemory; }` |
| `fileChecksum` |  | `std::string fileChecksum(const std::string& path)` |
| `filesChecksums` |  | `std::map<std::string, std::string> filesChecksums()` |
| `selfChecksum` |  | `std::string selfChecksum()` |
| `readCrashLog` |  | `std::string readCrashLog(bool txt)` |
| `deleteCrashLog` |  | `void deleteCrashLog()` |
| `updateData` |  | `void updateData(const std::set<std::string>& files, bool reMount)` |
| `updateExecutable` |  | `void updateExecutable(std::string fileName)` |
| `createArchive` |  | `std::string createArchive(const std::map<std::string, std::string>& files)` |
| `decompressArchive` |  | `std::map<std::string, std::string> decompressArchive(std::string dataOrPath)` |
| `encrypt` |  | `void encrypt(const std::string& seed = "")` |
| `encryptBuffer` |  | `bool encryptBuffer(std::string & buffer, uint32_t seed = 0)` |
| `decryptBuffer` |  | `bool decryptBuffer(std::string & buffer)` |
| `installDlls` |  | `void installDlls(std::filesystem::path dest)` |
| `setLayout` |  | `void setLayout(std::string layout)` |
| `getLayout` |  | `std::string getLayout()` |
| `m_layout` |  | `return m_layout` |

## Functions

### `init`

**Sygnatura:** `void init(const char *argv0)`

### `terminate`

**Sygnatura:** `void terminate()`

### `launchCorrect`

**Sygnatura:** `bool launchCorrect(const std::string& product, const std::string& app)`

### `setupWriteDir`

**Sygnatura:** `bool setupWriteDir(const std::string& product, const std::string& app)`

### `setup`

**Sygnatura:** `bool setup()`

### `getCompactName`

**Sygnatura:** `std::string getCompactName()`

### `loadDataFromSelf`

**Sygnatura:** `bool loadDataFromSelf(bool unmountIfMounted = false)`

### `fileExists`

**Sygnatura:** `bool fileExists(const std::string& fileName)`

### `directoryExists`

**Sygnatura:** `bool directoryExists(const std::string& directoryName)`

### `readFileStream`

**Sygnatura:** `void readFileStream(const std::string& fileName, std::iostream& out)`

### `readFileContents`

**Sygnatura:** `std::string readFileContents(const std::string& fileName, bool safe = false)`

### `readFileContentsSafe`

**Sygnatura:** `std::string readFileContentsSafe(const std::string& fileName) { return readFileContents(fileName, true); }`

### `isFileEncryptedOrCompressed`

**Sygnatura:** `bool isFileEncryptedOrCompressed(const std::string& fileName)`

### `writeFileBuffer`

**Sygnatura:** `bool writeFileBuffer(const std::string& fileName, const uchar* data, uint size)`

### `writeFileContents`

**Sygnatura:** `bool writeFileContents(const std::string& fileName, const std::string& data)`

### `writeFileStream`

**Sygnatura:** `bool writeFileStream(const std::string& fileName, std::iostream& in)`

### `openFile`

**Sygnatura:** `FileStreamPtr openFile(const std::string& fileName, bool dontCache = false)`

### `appendFile`

**Sygnatura:** `FileStreamPtr appendFile(const std::string& fileName)`

### `createFile`

**Sygnatura:** `FileStreamPtr createFile(const std::string& fileName)`

### `deleteFile`

**Sygnatura:** `bool deleteFile(const std::string& fileName)`

### `makeDir`

**Sygnatura:** `bool makeDir(const std::string directory)`

### `listDirectoryFiles`

**Sygnatura:** `std::list<std::string> listDirectoryFiles(const std::string & directoryPath = "", bool fullPath = false, bool raw = false)`

### `resolvePath`

**Sygnatura:** `std::string resolvePath(std::string path)`

### `getWorkDir`

**Sygnatura:** `std::string getWorkDir() { return "/"; }`

### `getWriteDir`

**Sygnatura:** `std::string getWriteDir() { return "/"; }`

### `getBinaryName`

**Sygnatura:** `std::string getBinaryName() { return "otclientv8.apk"; }`

### `getWriteDir`

**Sygnatura:** `std::string getWriteDir() { return m_writeDir.string(); }`

### `getBinaryName`

**Sygnatura:** `std::string getBinaryName() { return m_binaryPath.filename().string(); }`

### `guessFilePath`

**Sygnatura:** `std::string guessFilePath(const std::string& filename, const std::string& type)`

### `isFileType`

**Sygnatura:** `bool isFileType(const std::string& filename, const std::string& type)`

### `isLoadedFromArchive`

**Sygnatura:** `bool isLoadedFromArchive() { return m_loadedFromArchive; }`

### `isLoadedFromMemory`

**Sygnatura:** `bool isLoadedFromMemory() { return m_loadedFromMemory; }`

### `fileChecksum`

**Sygnatura:** `std::string fileChecksum(const std::string& path)`

### `filesChecksums`

**Sygnatura:** `std::map<std::string, std::string> filesChecksums()`

### `selfChecksum`

**Sygnatura:** `std::string selfChecksum()`

### `readCrashLog`

**Sygnatura:** `std::string readCrashLog(bool txt)`

### `deleteCrashLog`

**Sygnatura:** `void deleteCrashLog()`

### `updateData`

**Sygnatura:** `void updateData(const std::set<std::string>& files, bool reMount)`

### `updateExecutable`

**Sygnatura:** `void updateExecutable(std::string fileName)`

### `createArchive`

**Sygnatura:** `std::string createArchive(const std::map<std::string, std::string>& files)`

### `decompressArchive`

**Sygnatura:** `std::map<std::string, std::string> decompressArchive(std::string dataOrPath)`

### `encrypt`

**Sygnatura:** `void encrypt(const std::string& seed = "")`

### `encryptBuffer`

**Sygnatura:** `bool encryptBuffer(std::string & buffer, uint32_t seed = 0)`

### `decryptBuffer`

**Sygnatura:** `bool decryptBuffer(std::string & buffer)`

### `installDlls`

**Sygnatura:** `void installDlls(std::filesystem::path dest)`

### `setLayout`

**Sygnatura:** `void setLayout(std::string layout)`

### `getLayout`

**Sygnatura:** `std::string getLayout()`

### `mountMemoryData`

**Sygnatura:** `bool mountMemoryData(const std::shared_ptr<std::vector<uint8_t>>& data)`

### `unmountMemoryData`

**Sygnatura:** `void unmountMemoryData()`

## Class Diagram

Zobacz: [../diagrams/resourcemanager.mmd](../diagrams/resourcemanager.mmd)
