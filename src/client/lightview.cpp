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

#include "lightview.h"
#include "spritemanager.h"
#include <framework/graphics/painter.h>

void LightView::addLight(const Point& pos, uint8_t color, uint8_t intensity)
{
    if (!m_lights.empty()) {
        Light& prevLight = m_lights.back();
        if (prevLight.pos == pos && prevLight.color == color) {
            prevLight.intensity = std::max(prevLight.intensity, intensity);
            return;
        }
    }
    m_lights.push_back(Light{ pos, color, intensity });
}

void LightView::setFieldBrightness(const Point& pos, size_t start, uint8_t color)
{
    size_t index = (pos.y / g_sprites.spriteSize()) * m_mapSize.width() + (pos.x / g_sprites.spriteSize());
    if (index >= m_tiles.size()) return;
    m_tiles[index].start = start;
    m_tiles[index].color = color;
}

void LightView::draw() // render thread
{
    // TODO: optimize in the future for big areas
    static std::vector<uint8_t> buffer;
    if (buffer.size() < 4u * m_mapSize.area())
        buffer.resize(m_mapSize.area() * 4);

    for (int x = 0; x < m_mapSize.width(); ++x) {
        for (int y = 0; y < m_mapSize.height(); ++y) {
            Point pos(x * g_sprites.spriteSize() + g_sprites.spriteSize() / 2, y * g_sprites.spriteSize() + g_sprites.spriteSize() / 2);
            int index = (y * m_mapSize.width() + x);
            int colorIndex = index * 4;
            buffer[colorIndex] = m_globalLight.r();
            buffer[colorIndex + 1] = m_globalLight.g();
            buffer[colorIndex + 2] = m_globalLight.b();
            buffer[colorIndex + 3] = 255; // alpha channel
            for (size_t i = m_tiles[index].start; i < m_lights.size(); ++i) {
                Light& light = m_lights[i];
                float distance = std::sqrt((pos.x - light.pos.x) * (pos.x - light.pos.x) +
                                           (pos.y - light.pos.y) * (pos.y - light.pos.y));
                distance /= g_sprites.spriteSize();
                float intensity = (-distance + light.intensity) * 0.2f;
                if (intensity < 0.01f) continue;
                if (intensity > 1.0f) intensity = 1.0f;
                Color lightColor = Color::from8bit(light.color) * intensity;
                buffer[colorIndex] = std::max<int>(buffer[colorIndex], lightColor.r());
                buffer[colorIndex + 1] = std::max<int>(buffer[colorIndex + 1], lightColor.g());
                buffer[colorIndex + 2] = std::max<int>(buffer[colorIndex + 2], lightColor.b());
            }
        }
    }

    m_lightTexture->update();
    glBindTexture(GL_TEXTURE_2D, m_lightTexture->getId());
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, m_mapSize.width(), m_mapSize.height(), 0, GL_RGBA, GL_UNSIGNED_BYTE, buffer.data());

    Point offset = m_src.topLeft();
    Size size = m_src.size();
    CoordsBuffer coords;
    coords.addRect(RectF(m_dest.left(), m_dest.top(), m_dest.width(), m_dest.height()),
                   RectF((float)offset.x / g_sprites.spriteSize(), (float)offset.y / g_sprites.spriteSize(),
                         (float)size.width() / g_sprites.spriteSize(), (float)size.height() / g_sprites.spriteSize()));

    g_painter->resetColor();
    g_painter->setCompositionMode(Painter::CompositionMode_Multiply);
    g_painter->drawTextureCoords(coords, m_lightTexture);
    g_painter->resetCompositionMode();
}
