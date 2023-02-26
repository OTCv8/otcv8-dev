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

#include "framebuffer.h"
#include "graphics.h"
#include "texture.h"

#include <framework/platform/platformwindow.h>
#include <framework/core/application.h>
#include <framework/core/eventdispatcher.h>
#include <framework/core/asyncdispatcher.h>
#include <framework/graphics/image.h>

uint FrameBuffer::boundFbo = 0;

FrameBuffer::FrameBuffer(bool withDepth)
{
#ifdef WITH_DEPTH_BUFFER
    m_depth = withDepth;
#else
    if(withDepth)
        g_logger.fatal("Depth buffer is not supported. Compile OTCv8 with WITH_DEPTH_BUFFER definition.");
#endif
    internalCreate();
}

void FrameBuffer::internalCreate()
{
    m_prevBoundFbo = 0;
    m_fbo = 0;
    glGenFramebuffers(1, &m_fbo);
    if (!m_fbo)
        g_logger.fatal("Unable to create framebuffer object");
#ifdef WITH_DEPTH_BUFFER
    if (m_depth) {
        glGenRenderbuffers(1, &m_depthRbo);
        if (!m_depthRbo)
            g_logger.fatal("Unable to create renderbuffer object");
    }
#endif
    g_graphics.checkForError(__FUNCTION__, __FILE__, __LINE__);
}

FrameBuffer::~FrameBuffer()
{
    VALIDATE(!g_app.isTerminated());
    if (g_graphics.ok() && m_fbo != 0) {
        if (m_fbo != 0)
            glDeleteFramebuffers(1, &m_fbo);
#ifdef WITH_DEPTH_BUFFER
        if (m_depthRbo != 0)
            glDeleteRenderbuffers(1, &m_depthRbo);
#endif
    }
    g_graphics.checkForError(__FUNCTION__, __FILE__, __LINE__);
}

void FrameBuffer::resize(const Size& size)
{
    if (!size.isValid())
        g_logger.fatal(stdext::format("Invalid framebuffer size: %ix%i", size.width(), size.height()));

    if (m_texture && m_texture->getSize() == size)
        return;

    m_texture = TexturePtr(new Texture(size, false, m_smooth, true));
    m_texture->update();

#ifdef WITH_DEPTH_BUFFER
    if (m_depth) {
        glBindRenderbuffer(GL_RENDERBUFFER, m_depthRbo);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, size.width(), size.height());
    }
#endif

    internalBind();
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, m_texture->getId(), 0);

#ifdef WITH_DEPTH_BUFFER
    if (m_depth) {
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, m_depthRbo);
    }
#endif

    GLenum status = glCheckFramebufferStatus(GL_FRAMEBUFFER);
    if (status != GL_FRAMEBUFFER_COMPLETE)
        g_logger.fatal(stdext::format("Unable to setup framebuffer object - %i - %ix%i", status, size.width(), size.height()));
    internalRelease();
    g_graphics.checkForError(__FUNCTION__, __FILE__, __LINE__);
}

void FrameBuffer::bind(const FrameBufferPtr& depthFramebuffer)
{
    g_painter->saveAndResetState();
    internalBind();
    g_painter->setResolution(m_texture->getSize());
#ifdef WITH_DEPTH_BUFFER
    if (!m_depth && depthFramebuffer && depthFramebuffer->hasDepth()) {
        m_depthRbo = depthFramebuffer->getDepthRenderBuffer();
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, m_depthRbo);
    }
#endif
    g_graphics.checkForError(__FUNCTION__, __FILE__, __LINE__);
}

void FrameBuffer::release()
{
#ifdef WITH_DEPTH_BUFFER
    if (!m_depth && m_depthRbo) {
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, 0);
        m_depthRbo = 0;
    }
#endif
    internalRelease();
    g_painter->restoreSavedState();
    g_graphics.checkForError(__FUNCTION__, __FILE__, __LINE__);
}

void FrameBuffer::draw()
{
    Rect rect(0, 0, getSize());
    g_painter->drawTexturedRect(rect, m_texture, rect);
}

void FrameBuffer::draw(const Rect& dest, const Rect& src)
{
    g_painter->drawTexturedRect(dest, m_texture, src);
}

void FrameBuffer::draw(const Rect& dest)
{
    g_painter->drawTexturedRect(dest, m_texture, Rect(0, 0, getSize()));
}

std::vector<uint32_t> FrameBuffer::readPixels()
{
    internalBind();
    Size size = getSize();
    int width = size.width();
    int height = size.height();
    std::vector<uint32_t> ret(width * height * sizeof(GLubyte), 0);
    glReadPixels(0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, (GLubyte*)(ret.data()));
    internalRelease();
    int halfWidth = width / 2;
    for (int y = 0; y < height; ++y) {
        for (int x = 0; x < halfWidth; ++x) {
            std::swap(ret[y * width + x], ret[y * width + width - x - 1]);
        }
    }
    for (int y = 0; y < height; ++y) {
        for (int x = 0; x < halfWidth; ++x) {
            std::swap(ret[y * width + x], ret[(height - y - 1) * width + width - x - 1]);
        }
    }
    return ret;
}

void FrameBuffer::internalBind()
{
    VALIDATE(boundFbo != m_fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, m_fbo);
    m_prevBoundFbo = boundFbo;
    boundFbo = m_fbo;
}

void FrameBuffer::internalRelease()
{
    VALIDATE(boundFbo == m_fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, m_prevBoundFbo);
    boundFbo = m_prevBoundFbo;
}

Size FrameBuffer::getSize()
{
    return m_texture->getSize();
}

void FrameBuffer::setSmooth(bool value)
{
    if (!m_texture || m_smooth == value) return;

    m_smooth = value;
    m_texture->setSmooth(value);
}

void FrameBuffer::doScreenshot(std::string fileName)
{
    if (g_mainThreadId != std::this_thread::get_id()) {
        g_graphicsDispatcher.addEvent(std::bind(&FrameBuffer::doScreenshot, this, fileName));
        return;
    }

    if (fileName.empty()) {
        fileName = "screenshot_map.png";
    }

    internalBind();
    Size size = getSize();
    int width = size.width();
    int height = size.height();
    auto pixels = std::make_shared<std::vector<uint8_t>>(width * height * 4 * sizeof(GLubyte), 0);
    glReadPixels(0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, (GLubyte*)(pixels->data()));
    internalRelease();

    g_asyncDispatcher.dispatch([size, pixels, fileName] {
        for (int line = 0, h = size.height(), w = size.width(); line != h / 2; ++line) {
            std::swap_ranges(
                pixels->begin() + 4 * w * line,
                pixels->begin() + 4 * w * (line + 1),
                pixels->begin() + 4 * w * (h - line - 1));
        }
        try {
            Image image(size, 4, pixels->data());
            image.savePNG(fileName);
        }
        catch (stdext::exception& e) {
            g_logger.error(std::string("Can't do map screenshot: ") + e.what());
        }
    });
}