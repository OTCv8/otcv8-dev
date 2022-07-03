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

#include "spritemanager.h"
#include "game.h"
#include <framework/core/resourcemanager.h>
#include <framework/core/filestream.h>
#include <framework/graphics/image.h>
#include <framework/graphics/atlas.h>
#include <framework/util/crypt.h>
#include <framework/util/pngunpacker.h>

SpriteManager g_sprites;

SpriteManager::SpriteManager()
{
    m_spritesCount = 0;
    m_signature = 0;
}

void SpriteManager::terminate()
{
    unload();
}

bool SpriteManager::loadSpr(std::string file)
{
    m_spritesCount = 0;
    m_signature = 0;
    m_loaded = false;
    m_sprites.clear();

    auto cwmFile = g_resources.guessFilePath(file, "cwm");
    if (g_resources.fileExists(cwmFile)) {
        m_isHdMod = true;
        return loadCwmSpr(cwmFile);
    }

    auto sprFile = g_resources.guessFilePath(file, "spr");
    if (g_resources.fileExists(sprFile)) {
        return loadCasualSpr(sprFile);
    }

    return false;
}

#ifdef WITH_ENCRYPTION

void SpriteManager::saveSpr(std::string fileName)
{
    if (!m_loaded)
        stdext::throw_exception("failed to save, spr is not loaded");
    if (!m_spritesFile)
        stdext::throw_exception("not allowed");

    try {
        FileStreamPtr fin = g_resources.createFile(fileName);
        if (!fin)
            stdext::throw_exception(stdext::format("failed to open file '%s' for write", fileName));

        fin->addU32(m_signature);
        if (g_game.getFeature(Otc::GameSpritesU32))
            fin->addU32(m_spritesCount);
        else
            fin->addU16(m_spritesCount);

        uint32 offset = fin->tell();
        uint32 spriteAddress = offset + 4 * m_spritesCount;
        for (int i = 1; i <= m_spritesCount; i++)
            fin->addU32(0);

        for (int i = 1; i <= m_spritesCount; i++) {
            m_spritesFile->seek((i - 1) * 4 + m_spritesOffset);
            uint32 fromAdress = m_spritesFile->getU32();
            if (fromAdress != 0) {
                fin->seek(offset + (i - 1) * 4);
                fin->addU32(spriteAddress);
                fin->seek(spriteAddress);

                m_spritesFile->seek(fromAdress);
                fin->addU8(m_spritesFile->getU8());
                fin->addU8(m_spritesFile->getU8());
                fin->addU8(m_spritesFile->getU8());

                uint16 dataSize = m_spritesFile->getU16();
                fin->addU16(dataSize);
                std::vector<char> spriteData(m_spriteSize * m_spriteSize);
                m_spritesFile->read(spriteData.data(), dataSize);
                fin->write(spriteData.data(), dataSize);

                spriteAddress = fin->tell();
            }
            //TODO: Check for overwritten sprites.
        }

        fin->flush();
        fin->close();
    } catch (std::exception& e) {
        g_logger.error(stdext::format("Failed to save '%s': %s", fileName, e.what()));
    }
}

void SpriteManager::saveSpr64(std::string fileName)
{
    if (!m_loaded)
        stdext::throw_exception("failed to save, spr is not loaded");
    if (!m_spritesFile || m_spriteSize != 32)
        stdext::throw_exception("not allowed");

    try {
        FileStreamPtr fin = g_resources.createFile(fileName);
        if (!fin)
            stdext::throw_exception(stdext::format("failed to open file '%s' for write", fileName));

        fin->addU32(m_signature);
        if (g_game.getFeature(Otc::GameSpritesU32))
            fin->addU32(m_spritesCount);
        else
            fin->addU16(m_spritesCount);

        uint32 offset = fin->tell();
        for (int i = 1; i <= m_spritesCount; i++)
            fin->addU32(0);

        for (int i = 1; i <= m_spritesCount; i++) {
            ImagePtr sprite = getSpriteImage(i);
            if (!sprite) {
                continue;
            }
            sprite = sprite->upscale();

            uint32 spriteAddress = fin->tell();
            fin->seek(offset + (i - 1) * 4);
            fin->addU32(spriteAddress);
            fin->seek(spriteAddress);

            fin->addU8(0xff);
            fin->addU8(0x00);
            fin->addU8(0xff);

            uint8_t* pixels = sprite->getPixelData();
            int pixelCount = sprite->getPixelCount() * 4;
            std::vector<uint8_t> buffer(pixelCount + 1024, 0);
            int bufferPos = 0;

            int skipedPixels = 0;
            for (int i = 0; i < pixelCount; ) {
                int transparent = 0, colored = 0;
                for (int j = i; j < pixelCount; j += 4) {
                    if (pixels[j + 3] == 0x00) {
                        if (colored != 0) break;
                        transparent += 1;
                    } else {
                        colored += 1;
                    }
                }

                *(uint16_t*)(buffer.data() + bufferPos) = transparent;
                bufferPos += 2;
                *(uint16_t*)(buffer.data() + bufferPos) = colored;
                bufferPos += 2;

                i += transparent * 4;

                for (int c = 0; c < colored; ++c) {
                    buffer[bufferPos++] = pixels[i];
                    buffer[bufferPos++] = pixels[i + 1];
                    buffer[bufferPos++] = pixels[i + 2];
                    i += 4;
                }
            }

            fin->addU16(bufferPos);
            fin->write(buffer.data(), bufferPos);
        }

        fin->flush();
        fin->close();
    } catch (std::exception& e) {
        g_logger.error(stdext::format("Failed to save '%s': %s", fileName, e.what()));
    }
}

void SpriteManager::encryptSprites(std::string fileName)
{
    if (!m_loaded)
        stdext::throw_exception("failed to save, spr is not loaded");

    try {
        FileStreamPtr fin = g_resources.createFile(fileName);
        if (!fin)
            stdext::throw_exception(stdext::format("failed to open file '%s' for write", fileName));

        const char otcv8Signature[] = "OTV8";
        fin->addU32(*((uint32_t*)otcv8Signature));
        fin->addU32(m_signature);
        fin->addU32(m_spritesCount);

        for (int i = 1; i <= m_spritesCount; i++) {
            ImagePtr sprite = getSpriteImage(i);
            if (!sprite) {
                fin->addU16(0);
                continue;
            }
            uint8_t* pixels = sprite->getPixelData();
            int pixelCount = sprite->getPixelCount() * 4;
            std::vector<uint8_t> buffer(pixelCount + 1024, 0);
            int bufferPos = 0;

            bool hasAlpha = false;
            for (int i = 3; i < pixelCount; i += 4) {
                if (pixels[i] != 0x00 && pixels[i] != 0xFF) {
                    hasAlpha = true;
                    break;
                }
            }

            buffer[bufferPos++] = (hasAlpha ? 1 : 0);
            int skipedPixels = 0;
            for (int i = 0; i < pixelCount; ) {
                int transparent = 0, colored = 0;
                for (int j = i; j < pixelCount; j += 4) {
                    if (pixels[j + 3] == 0x00) {
                        if (colored != 0) break;
                        transparent += 1;
                    } else {
                        colored += 1;
                    }
                }

                *(uint16_t*)(buffer.data() + bufferPos) = transparent;
                bufferPos += 2;
                *(uint16_t*)(buffer.data() + bufferPos) = colored;
                bufferPos += 2;

                i += transparent * 4;

                for (int c = 0; c < colored; ++c) {
                    buffer[bufferPos++] = pixels[i];
                    buffer[bufferPos++] = pixels[i + 1];
                    buffer[bufferPos++] = pixels[i + 2];
                    if (hasAlpha) {
                        buffer[bufferPos++] = pixels[i + 3];
                    }
                    i += 4;
                }
            }

            g_crypt.bencrypt(buffer.data(), bufferPos, (uint64_t)m_signature + i);
            fin->addU16(bufferPos);
            fin->write(buffer.data(), bufferPos);
        }

        fin->flush();
        fin->close();
    }
    catch (std::exception& e) {
        g_logger.error(stdext::format("Failed to save '%s': %s", fileName, e.what()));
    }
}

void SpriteManager::dumpSprites(std::string dir)
{
    if (dir.empty()) {
        g_logger.error("Empty dir for sprites dump");
        return;
    }
    g_resources.makeDir(dir);
    for (int i = 1; i <= m_spritesCount; i++) {
        auto img = getSpriteImage(i);
        if (!img) continue;
        img->savePNG(dir + "/" + std::to_string(i) + ".png");
    }
}

#endif

void SpriteManager::unload()
{
    m_spritesCount = 0;
    m_signature = 0;
    m_spritesFile = nullptr;
    m_sprites.clear();
}

ImagePtr SpriteManager::getSpriteImage(int id)
{
    if (m_isHdMod) {
        return getSpriteImageHd(id);
    }
    else {
        return getSpriteImageCasual(id);
    }
}

bool SpriteManager::loadCasualSpr(std::string file)
{
    m_spriteSize = 32u;
    try {
        file = g_resources.guessFilePath(file, "spr");

        m_spritesFile = g_resources.openFile(file, g_game.getFeature(Otc::GameDontCacheFiles));

        m_signature = m_spritesFile->getU32();
        if (m_signature == *((uint32_t*)"OTV8")) {
            m_signature = m_spritesFile->getU32();
            m_spritesCount = m_spritesFile->getU32();
            m_sprites.resize(m_spritesCount + 1);
            for (int i = 1; i <= m_spritesCount; ++i) {
                int bufferSize = m_spritesFile->getU16();
                if (bufferSize == 0) continue;
                m_sprites[i].resize(bufferSize + 1);
                m_sprites[i][0] = 0;
                m_spritesFile->read(m_sprites[i].data() + 1, bufferSize);
            }
            m_spritesFile = nullptr;
        }
        else {
            m_spritesCount = g_game.getFeature(Otc::GameSpritesU32) ? m_spritesFile->getU32() : m_spritesFile->getU16();
            m_spritesOffset = m_spritesFile->tell();
        }
        m_loaded = true;
        g_lua.callGlobalField("g_sprites", "onLoadSpr", file);
        return true;
    }
    catch (stdext::exception& e) {
        g_logger.error(stdext::format("Failed to load sprites from '%s': %s", file, e.what()));
        return false;
    }
}

bool SpriteManager::loadCwmSpr(std::string file)
{
    try {
        auto inFilePath = g_resources.guessFilePath(file, "cwm");
        auto spritesFile = g_resources.openFile(inFilePath, g_game.getFeature(Otc::GameDontCacheFiles));

        uint8_t version = spritesFile->getU8();
        if (version != 0x01) {
            g_logger.error(stdext::format("Invalid CWM file version - %s", file));
            return false;
        }

        m_spriteSize = spritesFile->getU16();
        m_cachedData = std::move(PngUnpacker::unpack(spritesFile));
        m_spritesCount = m_cachedData.size();

        if (m_spritesCount == 0) {
            g_logger.error(stdext::format("Failed to load sprites from '%s' - no sprites", file));
            return false;
        }

        m_loaded = true;
        return true;
    }
    catch (stdext::exception& e) {
        g_logger.error(stdext::format("Failed to load sprites from '%s': %s", file, e.what()));
        return false;
    }

    return false;
}

ImagePtr SpriteManager::getSpriteImageCasual(int id)
{
    try {
        int spriteDataSize = m_spriteSize * m_spriteSize * 4;

        if (!m_sprites.empty()) {
            if (id >= (int)m_sprites.size())
                return nullptr;
            auto& buffer = m_sprites[id];
            if (buffer.size() < 5)
                return nullptr;
            if (buffer[0] == 0) {
                buffer[0] = 1;
                g_crypt.bdecrypt(buffer.data() + 1, buffer.size() - 1, (uint64_t)m_signature + id);
            }

            if (buffer[1] > 1) {
                stdext::throw_exception("Invalid sprite encryption");
            }

            bool hasAlpha = (buffer[1] == 1);

            ImagePtr image(new Image(Size(m_spriteSize, m_spriteSize)));
            uint8* pixels = image->getPixelData();
            int writePos = 0;

            size_t bufferPos = 2;
            while (bufferPos != buffer.size()) {
                uint16_t transparentPixels = *(uint16_t*)(&buffer[bufferPos]);
                bufferPos += 2;
                uint16_t coloredPixels = *(uint16_t*)(&buffer[bufferPos]);
                bufferPos += 2;

                writePos += transparentPixels * 4;
                for (int i = 0; i < coloredPixels; ++i) {
                    pixels[writePos++] = buffer[bufferPos++];
                    pixels[writePos++] = buffer[bufferPos++];
                    pixels[writePos++] = buffer[bufferPos++];
                    if (hasAlpha) {
                        pixels[writePos] = buffer[bufferPos++];
                    }
                    else {
                        pixels[writePos] = 0xFF;
                    }
                    writePos += 1;
                }
            }

            return image;
        }

        if (id == 0 || !m_spritesFile)
            return nullptr;

        m_spritesFile->seek(((id - 1) * 4) + m_spritesOffset);

        uint32 spriteAddress = m_spritesFile->getU32();

        // no sprite? return an empty texture
        if (spriteAddress == 0)
            return nullptr;

        m_spritesFile->seek(spriteAddress);

        // color key
        m_spritesFile->getU8();
        m_spritesFile->getU8();
        m_spritesFile->getU8();

        uint16 pixelDataSize = m_spritesFile->getU16();

        ImagePtr image(new Image(Size(m_spriteSize, m_spriteSize)));

        uint8* pixels = image->getPixelData();
        int writePos = 0;
        int read = 0;
        bool useAlpha = g_game.getFeature(Otc::GameSpritesAlphaChannel);

        // decompress pixels
        while (read < pixelDataSize && writePos < spriteDataSize) {
            uint16 transparentPixels = m_spritesFile->getU16();
            uint16 coloredPixels = m_spritesFile->getU16();

            writePos += transparentPixels * 4;

            if (useAlpha) {
                m_spritesFile->read(&pixels[writePos], std::min<uint16>(coloredPixels * 4, spriteDataSize - writePos));
                writePos += coloredPixels * 4;
                read += 4 + (4 * coloredPixels);
            }
            else {
                for (int i = 0; i < coloredPixels && writePos < spriteDataSize; i++) {
                    pixels[writePos + 0] = m_spritesFile->getU8();
                    pixels[writePos + 1] = m_spritesFile->getU8();
                    pixels[writePos + 2] = m_spritesFile->getU8();
                    pixels[writePos + 3] = 0xFF;
                    writePos += 4;
                }
                read += 4 + (3 * coloredPixels);
            }
        }

        return image;
    }
    catch (stdext::exception& e) {
        g_logger.error(stdext::format("Failed to get sprite id %d: %s", id, e.what()));
        return nullptr;
    }
}

ImagePtr SpriteManager::getSpriteImageHd(int id)
{
    if (id == 0 || !m_loaded)
        return nullptr;

    if (m_cachedData.find(id) == m_cachedData.end())
    {
        return nullptr;
    }

    try {
        return Image::loadPNG(m_cachedData[id].data(), m_cachedData[id].size());
    } catch (...) {}
    return nullptr;
}
