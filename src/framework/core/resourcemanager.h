/*
 * Copyright (c) 2010-2017 OTClient <https://github.com/edubart/otclient>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#ifndef RESOURCES_H
#define RESOURCES_H

#include "declarations.h"

// @bindsingleton g_resources
class ResourceManager
{
public:
    // @dontbind
    void init(const char *argv0);
    // @dontbind
    void terminate();

    bool launchCorrect(const std::string& product, const std::string& app);
    bool setupWriteDir(const std::string& product, const std::string& app);
    bool setup();

    std::string getCompactName();
    bool loadDataFromSelf(bool unmountIfMounted = false);

    bool fileExists(const std::string& fileName);
    bool directoryExists(const std::string& directoryName);

    // @dontbind
    void readFileStream(const std::string& fileName, std::iostream& out);
    std::string readFileContents(const std::string& fileName, bool safe = false);
    std::string readFileContentsSafe(const std::string& fileName) { return readFileContents(fileName, true); }
    bool isFileEncryptedOrCompressed(const std::string& fileName);
    // @dontbind
    bool writeFileBuffer(const std::string& fileName, const uchar* data, uint size);
    bool writeFileContents(const std::string& fileName, const std::string& data);
    // @dontbind
    bool writeFileStream(const std::string& fileName, std::iostream& in);

    FileStreamPtr openFile(const std::string& fileName, bool dontCache = false);
    FileStreamPtr appendFile(const std::string& fileName);
    FileStreamPtr createFile(const std::string& fileName);
    bool deleteFile(const std::string& fileName);

    bool makeDir(const std::string directory);
    std::list<std::string> listDirectoryFiles(const std::string & directoryPath = "", bool fullPath = false, bool raw = false);

    std::string resolvePath(std::string path);
    std::string getWorkDir() { return "/"; }
#ifdef ANDROID
    std::string getWriteDir() { return "/"; }
    std::string getBinaryName() { return "otclientv8.apk"; }
#else
    std::string getWriteDir() { return m_writeDir.string(); }
    std::string getBinaryName() { return m_binaryPath.filename().string(); }
#endif

    std::string guessFilePath(const std::string& filename, const std::string& type);
    bool isFileType(const std::string& filename, const std::string& type);

    bool isLoadedFromArchive() { return m_loadedFromArchive; }
    bool isLoadedFromMemory() { return m_loadedFromMemory; }

    std::string fileChecksum(const std::string& path);
    
    std::map<std::string, std::string> filesChecksums();
    std::string selfChecksum();

    std::string readCrashLog(bool txt);
    void deleteCrashLog();

    void updateData(const std::set<std::string>& files, bool reMount);
    void updateExecutable(std::string fileName);

    std::string createArchive(const std::map<std::string, std::string>& files);
    std::map<std::string, std::string> decompressArchive(std::string dataOrPath);

#ifdef WITH_ENCRYPTION
    void encrypt(const std::string& seed = "");
    bool encryptBuffer(std::string & buffer, uint32_t seed = 0);
#endif
    bool decryptBuffer(std::string & buffer);
#if defined(WIN32) && not(defined(FREE_VERSION))
    void installDlls(std::filesystem::path dest);
#endif

    void setLayout(std::string layout);
    std::string getLayout()
    {
        return m_layout;
    }

private:
    bool mountMemoryData(const std::shared_ptr<std::vector<uint8_t>>& data);
    void unmountMemoryData();

#ifndef ANDROID
    std::filesystem::path m_binaryPath, m_writeDir;
#endif
    bool m_loadedFromMemory = false;
    bool m_loadedFromArchive = false;
    std::shared_ptr<std::vector<uint8_t>> m_memoryData;
    uint32_t m_customEncryption = 0;
    std::string m_layout;
};

extern ResourceManager g_resources;

#endif
