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

#include "texturemanager.h"
#include "animatedtexture.h"
#include "graphics.h"
#include "image.h"

#include <framework/core/resourcemanager.h>
#include <framework/core/clock.h>
#include <framework/core/eventdispatcher.h>
#include <framework/graphics/apngloader.h>
#include <framework/util/stats.h>

TextureManager g_textures;

void TextureManager::init()
{
}

void TextureManager::terminate()
{
    m_textures.clear();
    m_animatedTextures.clear();
}

void TextureManager::clearCache()
{
    m_animatedTextures.clear();
    m_textures.clear();
}

void TextureManager::reload()
{
    for(auto& it : m_textures) {
        const std::string& path = g_resources.guessFilePath(it.first, "png");
        const TexturePtr& tex = it.second;

        ImagePtr image = Image::load(path);
        if(!image)
            continue;
        tex->replace(image);
        tex->setTime(stdext::time());
    }
}

TexturePtr TextureManager::getTexture(const std::string& fileName)
{
    auto it = m_textures.find(fileName);
    if (it != m_textures.end()) {
        return it->second;
    }

    TexturePtr texture;

    // before must resolve filename to full path
    std::string filePath = g_resources.resolvePath(fileName);

    // check if the texture is already loaded
    it = m_textures.find(filePath);
    if(it != m_textures.end()) {
        texture = it->second;
    }

    // texture not found, load it
    if(!texture) {
        try {
            std::string filePathEx = g_resources.guessFilePath(filePath, "png");

            // load texture file data
            std::stringstream fin;
            g_resources.readFileStream(filePathEx, fin);
            texture = loadTexture(fin, filePath);
        } catch(stdext::exception& e) {
            g_logger.error(stdext::format("Unable to load texture '%s': %s", fileName, e.what()));
            texture = nullptr;
        }

        if(texture) {
            texture->setTime(stdext::time());
            texture->setSmooth(true);
            m_textures[filePath] = texture;
            m_textures[fileName] = texture;
        }
    }

    return texture;
}

TexturePtr TextureManager::loadTexture(std::stringstream& file, const std::string& source)
{
    TexturePtr texture;

    apng_data apng;
    if(load_apng(file, &apng) == 0) {
        Size imageSize(apng.width, apng.height);
#ifndef NDEBUG
        if ((apng.width > 512 || apng.height > 512) && source.find("background") == std::string::npos) {
            // this warnining is disabled for background image
            g_logger.warning(stdext::format("Texture %s has size %ix%i. Too keep highest performance you shouldn't use textures bigger than 512x512 (they can't be cached)", source, apng.width, apng.height));
        }
#endif
        if(apng.num_frames > 1) { // animated texture
            std::vector<ImagePtr> frames;
            std::vector<int> framesDelay;
            for(uint i=0;i<apng.num_frames;++i) {
                uchar *frameData = apng.pdata + ((apng.first_frame+i) * imageSize.area() * apng.bpp);
                int frameDelay = apng.frames_delay[i];

                framesDelay.push_back(frameDelay);
                frames.push_back(ImagePtr(new Image(imageSize, apng.bpp, frameData)));
            }
            AnimatedTexturePtr animatedTexture = new AnimatedTexture(imageSize, frames, framesDelay);
            m_animatedTextures.push_back(animatedTexture);
            texture = animatedTexture;
        } else {
            ImagePtr image = ImagePtr(new Image(imageSize, apng.bpp, apng.pdata));
            if (!image) {
                g_logger.error(stdext::format("Can't load texture: %s", source));
            } else {
                texture = TexturePtr(new Texture(image));
            }
        }
        free_apng(&apng);
    }

    return texture;
}
