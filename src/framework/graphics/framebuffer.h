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

#ifndef FRAMEBUFFER_H
#define FRAMEBUFFER_H

#include "declarations.h"
#include "texture.h"

class FrameBuffer : public stdext::shared_object
{
public:
    FrameBuffer(bool withDepth = false);

protected:
    friend class FrameBufferManager;

public:
    virtual ~FrameBuffer();

    void resize(const Size& size);
    void bind(const FrameBufferPtr& depthFramebuffer = nullptr);
    void release();
    void draw();
    void draw(const Rect& dest);
    void draw(const Rect& dest, const Rect& src);

    void setSmooth(bool enabled);

    TexturePtr getTexture() { return m_texture; }
    Size getSize();
    bool isSmooth() { return m_smooth; }

#ifdef WITH_DEPTH_BUFFER
    uint getDepthRenderBuffer() { return m_depthRbo; }
    bool hasDepth() { return m_depth; }
#endif

    std::vector<uint32_t> readPixels();

    void doScreenshot(std::string fileName);

private:
    void internalCreate();
    void internalBind();
    void internalRelease();

    TexturePtr m_texture;
    TexturePtr m_screenBackup;
    Size m_oldViewportSize;
    uint m_fbo;
    uint m_prevBoundFbo;
    bool m_smooth = true;

#ifdef WITH_DEPTH_BUFFER
    uint m_depthRbo = 0;
    bool m_depth = false;
#endif

    static uint boundFbo;
};

#endif