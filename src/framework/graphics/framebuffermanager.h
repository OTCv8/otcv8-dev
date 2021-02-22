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


#ifndef FRAMEBUFFERMANAGER_H
#define FRAMEBUFFERMANAGER_H

#include "framebuffer.h"

class FrameBufferManager
{
public:
    void init();
    void terminate();
    void clear();

    FrameBufferPtr createFrameBuffer(bool withDepth = false);
    const FrameBufferPtr& getTemporaryFrameBuffer() { return m_temporaryFramebuffer; }
    const FrameBufferPtr& getDrawQueueTemporaryFrameBuffer() { return m_drawQueueTemporaryFramebuffer; }

protected:
    FrameBufferPtr m_temporaryFramebuffer;
    FrameBufferPtr m_drawQueueTemporaryFramebuffer;
    std::vector<FrameBufferPtr> m_framebuffers;
};

extern FrameBufferManager g_framebuffers;

#endif
