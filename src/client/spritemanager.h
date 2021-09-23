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

#ifndef SPRITEMANAGER_H
#define SPRITEMANAGER_H

#include "const.h"
#include <framework/core/declarations.h>
#include <framework/graphics/declarations.h>

//@bindsingleton g_sprites
class SpriteManager
{
public:
    SpriteManager();

    void terminate();

    bool loadSpr(std::string file);
    void unload();

#ifdef WITH_ENCRYPTION
    void saveSpr(std::string fileName);
    void saveSpr64(std::string fileName);
    void encryptSprites(std::string fileName);
    void dumpSprites(std::string dir);
#endif

    uint32 getSignature() { return m_signature; }
    int getSpritesCount() { return m_spritesCount; }

    ImagePtr getSpriteImage(int id);
    bool isLoaded() { return m_loaded; }

    int spriteSize() { return m_spriteSize; }
    float getOffsetFactor() const { return static_cast<float>(m_spriteSize) / 32.0f; }
    bool isHdMod() const { return m_isHdMod; }

private:
    bool loadCasualSpr(std::string file);
    bool loadCwmSpr(std::string file);

    ImagePtr getSpriteImageCasual(int id);
    ImagePtr getSpriteImageHd(int id);
    bool m_loaded = false;
    bool m_isHdMod = false;
    uint32 m_signature;
    int m_spritesCount;
    int m_spritesOffset;
    int m_spriteSize;
    FileStreamPtr m_spritesFile;
    std::vector<std::vector<uint8_t>> m_sprites;
    std::unordered_map<uint32, std::string> m_cachedData;
};

extern SpriteManager g_sprites;

#endif
