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

#ifndef VERTEXARRAY_H
#define VERTEXARRAY_H

#include "declarations.h"
#include "hardwarebuffer.h"
#include <framework/util/databuffer.h>

class VertexArray
{
    enum {
        CACHE_MIN_VERTICES_COUNT = 48
    };
public:
    VertexArray() {}
    ~VertexArray()
    {
        if (m_hardwareBuffer)
            delete m_hardwareBuffer;
    }
    VertexArray(VertexArray& c) : m_buffer(c.m_buffer)
    {
        m_hardwareBuffer = nullptr;
    }
    VertexArray& operator=(VertexArray& c) = delete;

    inline void addVertex(float x, float y) { m_buffer << x << y; }
    inline void addTriangle(const Point& a, const Point& b, const Point& c) {
        addVertex(a.x, a.y);
        addVertex(b.x, b.y);
        addVertex(c.x, c.y);
    }
    inline void addRect(const Rect& rect)
    {
        float top = rect.top();
        float right = rect.right() + 1;
        float bottom = rect.bottom() + 1;
        float left = rect.left();

        addVertex(left, top);
        addVertex(right, top);
        addVertex(left, bottom);
        addVertex(left, bottom);
        addVertex(right, top);
        addVertex(right, bottom);
    }
    inline void addRect(const RectF& rect)
    {
        float top = rect.top();
        float right = rect.right() + 1.f;
        float bottom = rect.bottom() + 1.f;
        float left = rect.left();

        addVertex(left, top);
        addVertex(right, top);
        addVertex(left, bottom);
        addVertex(left, bottom);
        addVertex(right, top);
        addVertex(right, bottom);
    }

    inline void addQuad(const Rect& rect) {
        float top = rect.top();
        float right = rect.right()+1;
        float bottom = rect.bottom()+1;
        float left = rect.left();

        addVertex(left, top);
        addVertex(right, top);
        addVertex(left, bottom);
        addVertex(right, bottom);
    }

    inline void addUpsideDownQuad(const Rect& rect) {
        float top = rect.top();
        float right = rect.right()+1;
        float bottom = rect.bottom()+1;
        float left = rect.left();

        addVertex(left, bottom);
        addVertex(right, bottom);
        addVertex(left, top);
        addVertex(right, top);
    }

    void clear() { m_buffer.reset(); }
    float *vertices() const { return m_buffer.data(); }
    int vertexCount() const { return m_buffer.size() / 2; }
    int size() const { return m_buffer.size(); }

    // cache
    void cache()
    {
        if (m_buffer.size() < CACHE_MIN_VERTICES_COUNT) return;
        if (m_hardwareBuffer) return;
        m_hardwareBuffer = new HardwareBuffer(HardwareBuffer::VertexBuffer);
        m_hardwareBuffer->bind();
        m_hardwareBuffer->write((void*)m_buffer.data(), m_buffer.size() * sizeof(float), HardwareBuffer::StaticDraw);
    }
    bool isCached() { return m_hardwareBuffer != nullptr; }
    HardwareBuffer* getHardwareCache() { return m_hardwareBuffer; }

private:
    DataBuffer<float> m_buffer;
    HardwareBuffer* m_hardwareBuffer = nullptr;
};

#endif
