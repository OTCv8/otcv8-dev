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

#include "fontmanager.h"

#include "painter.h"

#include <framework/graphics/atlas.h>
#include <framework/graphics/graphics.h>
#include <framework/graphics/texture.h>
#include "texturemanager.h"
#include "framebuffermanager.h"
#include <framework/platform/platformwindow.h>
#include <framework/graphics/textrender.h>

Graphics g_graphics;

Graphics::Graphics()
{
    m_maxTextureSize = 2048;
}

void Graphics::init()
{
    g_graphics.checkForError(__FUNCTION__, __FILE__, __LINE__);
    glGetString(GL_NONE); glGetError(); // REQUIRED, DON'T REMOVE
    m_vendor = std::string((const char*)glGetString(GL_VENDOR) ? (const char*)glGetString(GL_VENDOR) : "");
    m_renderer = std::string((const char*)glGetString(GL_RENDERER) ? (const char*)glGetString(GL_RENDERER) : "");
    m_version = std::string((const char*)glGetString(GL_VERSION) ? (const char*)glGetString(GL_VERSION) : "");
    m_extensions = std::string((const char*)glGetString(GL_EXTENSIONS) ? (const char*)glGetString(GL_EXTENSIONS) : "");

    g_logger.info(stdext::format("GPU %s (%s)", m_renderer, m_vendor));
    g_logger.info(stdext::format("OpenGL %s", m_version));

    // init GL extensions
#ifndef OPENGL_ES
    float glVersion = 1.0;
    try {
        glVersion = std::atof(m_version.c_str());
    }
    catch (const std::exception&) {}

    if (glVersion < 2.0) {
        g_logger.fatal(stdext::format("Your device doesn't support OpenGL >= 2.0, try to use DX version or install graphics drivers. GPU: %s OpenGL: %s (%f), Ext: %s",
            m_renderer, m_version, glVersion, m_extensions));
    }

    GLenum err = glewInit();
    if(err != GLEW_OK)
        g_logger.fatal(stdext::format("Unable to init GLEW: %s", glewGetErrorString(err)));

    // overwrite framebuffer API if needed
    if(GLEW_EXT_framebuffer_object && !GLEW_ARB_framebuffer_object) {
        glGenFramebuffers = glGenFramebuffersEXT;
        glDeleteFramebuffers = glDeleteFramebuffersEXT;
        glBindFramebuffer = glBindFramebufferEXT;
        glFramebufferTexture2D = glFramebufferTexture2DEXT;
        glCheckFramebufferStatus = glCheckFramebufferStatusEXT;
        glGenerateMipmap = glGenerateMipmapEXT;
    }
#endif

    // blending is always enabled
    glEnable(GL_BLEND);

    int maxTextureSize = 0;
    glGetIntegerv(GL_MAX_TEXTURE_SIZE, &maxTextureSize);
    if (m_maxTextureSize == -1 || m_maxTextureSize < maxTextureSize)
        m_maxTextureSize = maxTextureSize;

#ifdef WITH_DEPTH_BUFFER
    checkDepthSupport();
#endif
    g_graphics.checkForError(__FUNCTION__, __FILE__, __LINE__);

    m_ok = true;

    g_painter = new Painter();
    g_painter->bind();

    g_textures.init();
    g_framebuffers.init();
    g_atlas.init();
    g_text.init();
    g_graphics.checkForError(__FUNCTION__, __FILE__, __LINE__);
}

void Graphics::terminate()
{
    g_fonts.terminate();
    g_framebuffers.terminate();
    g_textures.terminate();
    g_atlas.terminate();
    g_text.terminate();

    if (g_painter) {
        g_painter->unbind();
        delete g_painter;
        g_painter = nullptr;
    }

    m_ok = false;
}

void Graphics::resize(const Size& size)
{
    m_viewportSize = size;
    if(g_painter)
        g_painter->setResolution(size);
}

#ifdef WITH_DEPTH_BUFFER
void Graphics::checkDepthSupport() 
{
    glGetError(); // clear error
    uint32 rbo = 0;
    glGenRenderbuffers(1, &rbo);
    if (rbo) {
        glBindRenderbuffer(GL_RENDERBUFFER, rbo);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, 64, 64);
        glDeleteRenderbuffers(1, &rbo);
        if (glGetError() == GL_NO_ERROR)
            return;
    }
    g_logger.fatal("Depth buffer is not supported. Your computer or graphics drivers are too old to use this program.")
}
#endif

void Graphics::checkForError(const std::string& function, const std::string& file, int line)
{
    auto error = glGetError();
    if (error != GL_NO_ERROR) {
#ifndef NDEBUG
        g_logger.fatal(
#else
        g_logger.error(
#endif
        stdext::format("Render error: %i in %s (%s:%i)", error, function, file, line));
    }
}
