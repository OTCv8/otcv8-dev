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

#include "coordsbuffer.h"
#include "graphics.h"

CoordsBuffer::CoordsBuffer()
{
    m_vertexArray = std::make_shared<VertexArray>();
    m_textureCoordArray = std::make_shared<VertexArray>();
}

CoordsBuffer::~CoordsBuffer()
{
}

void CoordsBuffer::addBoudingRect(const Rect& dest, int innerLineWidth)
{
    if (m_locked)
        unlock();

    int left = dest.left();
    int right = dest.right();
    int top = dest.top();
    int bottom = dest.bottom();
    int width = dest.width();
    int height = dest.height();
    int w = innerLineWidth;

    addRect(Rect(left, top, width - w, w)); // top
    addRect(Rect(right - w + 1, top, w, height - w)); // right
    addRect(Rect(left + w, bottom - w + 1, width - w, w)); // bottom
    addRect(Rect(left, top + w, w, height - w)); // left
}

void CoordsBuffer::addRepeatedRects(const Rect& dest, const Rect& src)
{
    if(dest.isEmpty() || src.isEmpty())
        return;
    if (m_locked)
        unlock();

    Rect virtualDest(0, 0, dest.size());
    for(int y = 0; y <= virtualDest.height(); y += src.height()) {
        for(int x = 0; x <= virtualDest.width(); x += src.width()) {
            Rect partialDest(x, y, src.size());
            Rect partialSrc(src);

            // partialCoords to screenCoords bottomRight
            if(partialDest.bottom() > virtualDest.bottom()) {
                partialSrc.setBottom(partialSrc.bottom() + (virtualDest.bottom() - partialDest.bottom()));
                partialDest.setBottom(virtualDest.bottom());
            }
            if(partialDest.right() > virtualDest.right()) {
                partialSrc.setRight(partialSrc.right() + (virtualDest.right() - partialDest.right()));
                partialDest.setRight(virtualDest.right());
            }

            partialDest.translate(dest.topLeft());
            m_vertexArray->addRect(partialDest);
            m_textureCoordArray->addRect(partialSrc);
        }
    }
}

void CoordsBuffer::unlock(bool clear)
{
    m_locked = false;
    if (clear) {
        m_vertexArray = std::make_shared<VertexArray>();
        m_textureCoordArray = std::make_shared<VertexArray>();
    } else {
        m_vertexArray = std::make_shared<VertexArray>(*m_vertexArray);
        m_textureCoordArray = std::make_shared<VertexArray>(*m_textureCoordArray);
    }
}

Rect CoordsBuffer::getTextureRect()
{
    float* vertices = getTextureCoordArray();
    int size = getTextureCoordCount() * 2;
    float x1 = 0, y1 = 0, x2 = 0, y2 = 0;
    for (int i = 0; i < size; i += 2) {
        float x = vertices[i];
        float y = vertices[i + 1]; 
        if (x < x1)
            x1 = x;
        else if (x > x2)
            x2 = x;
        if (y < y1)
            y1 = y;
        else if (y > y2)
            y2 = y;
    }
    return Rect(Point(x1, y1), Point(x2, y2));
}
