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

#ifndef HEALTHBARS_H
#define HEALTHBARS_H

#include "declarations.h"
#include <framework/graphics/declarations.h>

class HealthBar : public stdext::shared_object
{
public:
    void setPath(const std::string& path) {
        m_path = path;
    }
    std::string getPath() { return m_path; }

    void setTexture(const std::string& path);
    TexturePtr getTexture() { return m_texture; }

    void setOffset(int x, int y) {
        m_offset = Point(x, y);
    }
    Point getOffset() { return m_offset; }

    void setBarOffset(int x, int y) {
        m_barOffset = Point(x, y);
    }
    Point getBarOffset() { return m_barOffset; }

    void setHeight(int height) {
        m_height = height;
    }

    int getHeight() { return m_height; }

private:
    std::string m_path;
    TexturePtr m_texture;

    Point m_offset;
    Point m_barOffset;

    int m_height;
};

//@bindsingleton g_healthBars
class HealthBars
{
public:
    void init();
    void terminate();

    void addHealthBackground(const std::string& path, int offsetX, int offsetY, int barOffsetX, int barOffsetY, int height);
    void addManaBackground(const std::string& path, int offsetX, int offsetY, int barOffsetX, int barOffsetY, int height);

    HealthBarPtr getHealthBar(int id) { return m_healthBars[id]; }
    HealthBarPtr getManaBar(int id) { return m_manaBars[id]; }

    std::string getHealthBarPath(int id);
    std::string getManaBarPath(int id);

    Point getHealthBarOffset(int id);
    Point getManaBarOffset(int id);

    Point getHealthBarOffsetBar(int id);
    Point getManaBarOffsetBar(int id);

    int getHealthBarHeight(int id);
    int getManaBarHeight(int id);

private:
    std::vector<HealthBarPtr> m_healthBars;
    std::vector<HealthBarPtr> m_manaBars;
};

extern HealthBars g_healthBars;

#endif

