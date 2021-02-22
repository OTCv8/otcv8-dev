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
    size_t index = (pos.y / Otc::TILE_PIXELS) * m_mapSize.width() + (pos.x / Otc::TILE_PIXELS);
    if (index >= m_tiles.size()) return;
    m_tiles[index].start = start;
    m_tiles[index].color = color;
}
