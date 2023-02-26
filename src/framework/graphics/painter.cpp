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

#include <framework/graphics/atlas.h>
#include <framework/graphics/painter.h>
#include <framework/graphics/graphics.h>
#include <framework/graphics/colorarray.h>
#include <framework/graphics/deptharray.h>
#include <framework/platform/platformwindow.h>

#include <framework/graphics/shaders/shaders.h>
#include <framework/platform/platformwindow.h>
#include <framework/util/extras.h>

Painter* g_painter = nullptr;

Painter::Painter()
{
    m_glTextureId = 0;
    m_oldStateIndex = 0;
    m_color = Color::white;
    m_compositionMode = CompositionMode_Normal;
    m_blendEquation = BlendEquation_Add;
    m_shaderProgram = nullptr;
    m_texture = nullptr;
    m_alphaWriting = false;
#ifdef WITH_DEPTH_BUFFER
    m_depth = 0;
    m_depthFunc = DepthFunc_None;
#endif
    setResolution(g_window.getSize());

    m_drawProgram = nullptr;
    resetState();

    m_drawTexturedProgram = PainterShaderProgram::create("drawTexturedProgram", glslMainWithTexCoordsVertexShader + glslPositionOnlyVertexShader,
                                                    glslMainFragmentShader + glslTextureSrcFragmentShader);
    m_drawSolidColorProgram = PainterShaderProgram::create("drawSolidColorProgram", glslMainVertexShader + glslPositionOnlyVertexShader,
                                                      glslMainFragmentShader + glslSolidColorFragmentShader);
    m_drawSolidColorOnTextureProgram = PainterShaderProgram::create("drawSolidColorOnTextureProgram", glslMainWithTexCoordsVertexShader + glslPositionOnlyVertexShader,
                                                               glslMainFragmentShader + glslSolidColorOnTextureFragmentShader);
    m_drawOutfitLayersProgram = PainterShaderProgram::create("drawOutfitLayersProgram", glslOutfitVertexShader, glslOutfitFragmentShader, true);
    m_drawNewProgram = PainterShaderProgram::create("drawNewProgram", newVertexShader, newFragmentShader);
    m_drawTextProgram = PainterShaderProgram::create("drawTextProgram", textVertexShader, textFragmentShader);
    m_drawLineProgram = PainterShaderProgram::create("drawLineProgram", lineVertexShader, lineFragmentShader);

    if (!m_drawTexturedProgram || !m_drawSolidColorProgram || !m_drawSolidColorOnTextureProgram || !m_drawOutfitLayersProgram ||
        !m_drawNewProgram || !m_drawTextProgram || !m_drawLineProgram) {
        g_logger.fatal("Can't setup default shaders, check log file for details");
    }

    PainterShaderProgram::release();
    g_graphics.checkForError(__FUNCTION__, __FILE__, __LINE__);
}

void Painter::bind()
{
    refreshState();

    // vertex and texture coord attributes are always enabled
    // to avoid massive enable/disables, thus improving frame rate
    PainterShaderProgram::enableAttributeArray(PainterShaderProgram::VERTEX_ATTR);
    PainterShaderProgram::enableAttributeArray(PainterShaderProgram::TEXCOORD_ATTR);
}

void Painter::unbind()
{
    PainterShaderProgram::disableAttributeArray(PainterShaderProgram::VERTEX_ATTR);
    PainterShaderProgram::disableAttributeArray(PainterShaderProgram::TEXCOORD_ATTR);
    PainterShaderProgram::release();
}

void Painter::resetState()
{
    resetColor();
    resetCompositionMode();
    resetBlendEquation();
    resetClipRect();
    resetShaderProgram();
    resetTexture();
    resetAlphaWriting();
    resetTransformMatrix();
#ifdef WITH_DEPTH_BUFFER
    resetDepth();
    resetDepthFunc();
#endif
}

void Painter::refreshState()
{
    updateGlViewport();
    updateGlCompositionMode();
    updateGlBlendEquation();
    updateGlClipRect();
    updateGlTexture();
    updateGlAlphaWriting();
#ifdef WITH_DEPTH_BUFFER
    updateDepthFunc();
#endif
}

void Painter::saveState()
{
    VALIDATE(m_oldStateIndex < 10);
    m_olderStates[m_oldStateIndex].resolution = m_resolution;
    m_olderStates[m_oldStateIndex].transformMatrix = m_transformMatrix;
    m_olderStates[m_oldStateIndex].projectionMatrix = m_projectionMatrix;
    m_olderStates[m_oldStateIndex].textureMatrix = m_textureMatrix;
    m_olderStates[m_oldStateIndex].color = m_color;
    m_olderStates[m_oldStateIndex].compositionMode = m_compositionMode;
    m_olderStates[m_oldStateIndex].blendEquation = m_blendEquation;
    m_olderStates[m_oldStateIndex].clipRect = m_clipRect;
    m_olderStates[m_oldStateIndex].shaderProgram = m_shaderProgram;
    m_olderStates[m_oldStateIndex].texture = m_texture;
    m_olderStates[m_oldStateIndex].alphaWriting = m_alphaWriting;
#ifdef WITH_DEPTH_BUFFER
    m_olderStates[m_oldStateIndex].depth = m_depth;
    m_olderStates[m_oldStateIndex].depthFunc = m_depthFunc;
#endif
    m_oldStateIndex++;
}

void Painter::saveAndResetState()
{
    saveState();
    resetState();
}

void Painter::restoreSavedState()
{
    m_oldStateIndex--;
    setResolution(m_olderStates[m_oldStateIndex].resolution);
    setTransformMatrix(m_olderStates[m_oldStateIndex].transformMatrix);
    setProjectionMatrix(m_olderStates[m_oldStateIndex].projectionMatrix);
    setTextureMatrix(m_olderStates[m_oldStateIndex].textureMatrix);
    setColor(m_olderStates[m_oldStateIndex].color);
    setCompositionMode(m_olderStates[m_oldStateIndex].compositionMode);
    setBlendEquation(m_olderStates[m_oldStateIndex].blendEquation);
    setClipRect(m_olderStates[m_oldStateIndex].clipRect);
    setShaderProgram(m_olderStates[m_oldStateIndex].shaderProgram);
    setTexture(m_olderStates[m_oldStateIndex].texture);
    setAlphaWriting(m_olderStates[m_oldStateIndex].alphaWriting);
#ifdef WITH_DEPTH_BUFFER
    setDepth(m_olderStates[m_oldStateIndex].depth);
    setDepthFunc(m_olderStates[m_oldStateIndex].depthFunc);
#endif
}

void Painter::clear(const Color& color)
{
    glClearColor(color.rF(), color.gF(), color.bF(), color.aF());
#ifdef WITH_DEPTH_BUFFER
#ifdef OPENGL_ES
    glClearDepthf(0.99f);
#else
    glClearDepth(0.99f);
#endif
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
#else
    glClear(GL_COLOR_BUFFER_BIT);
#endif
}

void Painter::clearRect(const Color& color, const Rect& rect)
{
    Rect oldClipRect = m_clipRect;
    setClipRect(rect);
    glClearColor(color.rF(), color.gF(), color.bF(), color.aF());
#ifdef WITH_DEPTH_BUFFER
#ifdef OPENGL_ES
    glClearDepthf(0.99f);
#else
    glClearDepth(0.99f);
#endif
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
#else
    glClear(GL_COLOR_BUFFER_BIT);
#endif
    setClipRect(oldClipRect);
}

void Painter::setCompositionMode(Painter::CompositionMode compositionMode)
{
    if (m_compositionMode == compositionMode)
        return;
    m_compositionMode = compositionMode;
    updateGlCompositionMode();
}

void Painter::setBlendEquation(Painter::BlendEquation blendEquation)
{
    if (m_blendEquation == blendEquation)
        return;
    m_blendEquation = blendEquation;
    updateGlBlendEquation();
}

#ifdef WITH_DEPTH_BUFFER
void Painter::setDepthFunc(DepthFunc func)
{
    if (m_depthFunc == func)
        return;
    m_depthFunc = func;
    updateDepthFunc();
}
#endif

void Painter::setClipRect(const Rect& clipRect)
{
    if (m_clipRect == clipRect)
        return;
    m_clipRect = clipRect;
    updateGlClipRect();
}

void Painter::setTexture(const TexturePtr& texture)
{
    if (m_texture == texture)
        return;

    m_texture = texture;
    if (m_texture)
        m_texture->update();

    uint glTextureId;
    if (texture) {
        setTextureMatrix(texture->getTransformMatrix());
        glTextureId = texture->getId();
    } else
        glTextureId = 0;

    if (m_glTextureId != glTextureId) {
        m_glTextureId = glTextureId;
        updateGlTexture();
    }
}

void Painter::setAlphaWriting(bool enable)
{
    if (m_alphaWriting == enable)
        return;

    m_alphaWriting = enable;
    updateGlAlphaWriting();
}

void Painter::setResolution(const Size& resolution)
{
    // The projection matrix converts from Painter's coordinate system to GL's coordinate system
    //    * GL's viewport is 2x2, Painter's is width x height
    //    * GL has +y -> -y going from bottom -> top, Painter is the other way round
    //    * GL has [0,0] in the center, Painter has it in the top-left
    //
    // This results in the Projection matrix below.
    //
    //                                    Projection Matrix
    //   Painter Coord     ------------------------------------------------        GL Coord
    //   -------------     | 2.0 / width  |      0.0      |      0.0      |     ---------------
    //   |  x  y  1  |  *  |     0.0      | -2.0 / height |      0.0      |  =  |  x'  y'  1  |
    //   -------------     |    -1.0      |      1.0      |      1.0      |     ---------------

    Matrix3 projectionMatrix = { 2.0f / resolution.width(),  0.0f,                      0.0f,
        0.0f,                    -2.0f / resolution.height(),  0.0f,
        -1.0f,                     1.0f,                      1.0f };

    m_resolution = resolution;

    setProjectionMatrix(projectionMatrix);
    if (g_painter == this)
        updateGlViewport();
}

void Painter::scale(float x, float y)
{
    Matrix3 scaleMatrix = {
        x,  0.0f,  0.0f,
        0.0f,     y,  0.0f,
        0.0f,  0.0f,  1.0f
    };

    setTransformMatrix(m_transformMatrix * scaleMatrix.transposed());
}

void Painter::translate(float x, float y)
{
    Matrix3 translateMatrix = {
        1.0f,  0.0f,     x,
        0.0f,  1.0f,     y,
        0.0f,  0.0f,  1.0f
    };

    setTransformMatrix(m_transformMatrix * translateMatrix.transposed());
}

void Painter::rotate(float angle)
{
    Matrix3 rotationMatrix = {
        std::cos(angle), -std::sin(angle),  0.0f,
        std::sin(angle),  std::cos(angle),  0.0f,
        0.0f,             0.0f,  1.0f
    };

    setTransformMatrix(m_transformMatrix * rotationMatrix.transposed());
}

void Painter::rotate(float x, float y, float angle)
{
    translate(-x, -y);
    rotate(angle);
    translate(x, y);
}

void Painter::pushTransformMatrix()
{
    m_transformMatrixStack.push_back(m_transformMatrix);
    VALIDATE(m_transformMatrixStack.size() < 100);
}

void Painter::popTransformMatrix()
{
    VALIDATE(m_transformMatrixStack.size() > 0);
    setTransformMatrix(m_transformMatrixStack.back());
    m_transformMatrixStack.pop_back();
}

void Painter::updateGlTexture()
{
    if (m_glTextureId != 0)
        glBindTexture(GL_TEXTURE_2D, m_glTextureId);
}

void Painter::updateGlCompositionMode()
{
    switch (m_compositionMode) {
    case CompositionMode_Normal:
        glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE);
        break;
    case CompositionMode_Multiply:
        glBlendFunc(GL_DST_COLOR, GL_ONE_MINUS_SRC_ALPHA);
        break;
    case CompositionMode_Add:
        glBlendFunc(GL_ONE, GL_ONE);
        break;
    case CompositionMode_Replace:
        glBlendFunc(GL_ONE, GL_ZERO);
        break;
    case CompositionMode_DestBlending:
        glBlendFunc(GL_ONE_MINUS_DST_ALPHA, GL_DST_ALPHA);
        break;
    case CompositionMode_Light:
        glBlendFunc(GL_ZERO, GL_SRC_COLOR);
        break;
    case CompositionMode_AlphaZeroing:
        glBlendFuncSeparate(GL_ZERO, GL_ONE, GL_ONE, GL_ZERO);
        break;
    case CompositionMode_AlphaRestoring:
        glBlendFuncSeparate(GL_ZERO, GL_ONE, GL_ONE, GL_ONE);
        break;
    case CompositionMode_ZeroAlphaOverrite:
        glBlendFuncSeparate(GL_ONE_MINUS_DST_ALPHA, GL_DST_ALPHA, GL_ONE, GL_ONE);
        break;
    }
}

void Painter::updateGlBlendEquation()
{
    if (m_blendEquation == BlendEquation_Add)
        glBlendEquation(GL_FUNC_ADD); // GL_FUNC_ADD
    else if (m_blendEquation == BlendEquation_Max)
        glBlendEquation(0x8008); // GL_MAX
    else if (m_blendEquation == BlendEquation_Subtract)
        glBlendEquation(GL_FUNC_SUBTRACT); // GL_MAX
}

#ifdef WITH_DEPTH_BUFFER
void Painter::updateDepthFunc()
{
    if (m_depthFunc != DepthFunc_None) {
        glEnable(GL_DEPTH_TEST);
    }

    switch (m_depthFunc) {
    case DepthFunc_None:
        glDisable(GL_DEPTH_TEST);
        break;
    case DepthFunc_ALWAYS:
        glDepthFunc(GL_ALWAYS);
        glDepthMask(GL_TRUE);
        break;
    case DepthFunc_ALWAYS_READ:
        glDepthFunc(GL_ALWAYS);
        glDepthMask(GL_FALSE);
        break;
    case DepthFunc_EQUAL:
        glDepthFunc(GL_EQUAL);
        glDepthMask(GL_TRUE);
        break;
    case DepthFunc_LEQUAL:
        glDepthFunc(GL_LEQUAL);
        glDepthMask(GL_TRUE);
        break;
    case DepthFunc_LEQUAL_READ:
        glDepthFunc(GL_LEQUAL);
        glDepthMask(GL_FALSE);
        break;
    case DepthFunc_LESS:
        glDepthFunc(GL_LESS);
        glDepthMask(GL_TRUE);
        break;
    case DepthFunc_LESS_READ:
        glDepthFunc(GL_LESS);
        glDepthMask(GL_FALSE);
        break;
    }
}
#endif

void Painter::updateGlClipRect()
{
    if (m_clipRect.isValid()) {
        glEnable(GL_SCISSOR_TEST);
        glScissor(m_clipRect.left(), m_resolution.height() - m_clipRect.bottom() - 1, m_clipRect.width(), m_clipRect.height());
    } else {
        glScissor(0, 0, m_resolution.width(), m_resolution.height());
        glDisable(GL_SCISSOR_TEST);
    }
}

void Painter::updateGlAlphaWriting()
{
    if (m_alphaWriting)
        glColorMask(1, 1, 1, 1);
    else
        glColorMask(1, 1, 1, 0);
}

void Painter::updateGlViewport()
{
    glViewport(0, 0, m_resolution.width(), m_resolution.height());
}

void Painter::drawCoords(CoordsBuffer& coordsBuffer, DrawMode drawMode, ColorArray* colorArray, const std::vector<std::pair<int, Color>>* colors)
{
    coordsBuffer.cache();
    int vertexCount = coordsBuffer.getVertexCount();
    if (vertexCount == 0)
        return;

    bool textured = coordsBuffer.getTextureCoordCount() > 0 && m_texture;

    // skip drawing of empty textures
    if (textured && m_texture->isEmpty())
        return;

    // update shader with the current painter state
    m_drawProgram->bind();
    m_drawProgram->setTransformMatrix(m_transformMatrix);
    m_drawProgram->setProjectionMatrix(m_projectionMatrix);
    if (textured) {
        m_drawProgram->setTextureMatrix(m_textureMatrix);
        m_drawProgram->bindMultiTextures();
    }

#ifdef WITH_DEPTH_BUFFER
    m_drawProgram->setDepth(m_depth);
#endif
    if (m_drawProgram != m_drawOutfitLayersProgram) {
        m_drawProgram->setColor(m_color);
    } else {
        m_drawProgram->setMatrixColor(m_matrixColor);
    }
    m_drawProgram->setResolution(m_resolution);
    m_drawProgram->updateTime();

    // only set texture coords arrays when needed
    if (textured) {
        HardwareBuffer* hardwareCache = coordsBuffer.getTextureHardwareCache();
        if (hardwareCache) {
            hardwareCache->bind();
            m_drawProgram->setAttributeArray(PainterShaderProgram::TEXCOORD_ATTR, nullptr, 2);
            HardwareBuffer::unbind(HardwareBuffer::VertexBuffer);
        } else {
            m_drawProgram->setAttributeArray(PainterShaderProgram::TEXCOORD_ATTR, coordsBuffer.getTextureCoordArray(), 2);
        }
    } else
        PainterShaderProgram::disableAttributeArray(PainterShaderProgram::TEXCOORD_ATTR);

    if (colorArray) {
        PainterShaderProgram::enableAttributeArray(PainterShaderProgram::COLOR_ATTR);
        m_drawProgram->setAttributeArray(PainterShaderProgram::COLOR_ATTR, colorArray->colors(), 4);
    }

    HardwareBuffer* hardwareCache = coordsBuffer.getVertexHardwareCache();
    if (hardwareCache) {
        hardwareCache->bind();
        m_drawProgram->setAttributeArray(PainterShaderProgram::VERTEX_ATTR, nullptr, 2);
        HardwareBuffer::unbind(HardwareBuffer::VertexBuffer);
    } else {
        m_drawProgram->setAttributeArray(PainterShaderProgram::VERTEX_ATTR, coordsBuffer.getVertexArray(), 2);
    }

    if (drawMode == Triangles) {
        if (colors) {
            int s = 0;
            for (auto& cp : *colors) {
                m_drawProgram->setColor(cp.second);
                glDrawArrays(GL_TRIANGLES, s * 6, (cp.first - s) * 6);
                s = cp.first;
            }
        } else {
            glDrawArrays(GL_TRIANGLES, 0, vertexCount);
        }
    } else if (drawMode == TriangleStrip) {
        glDrawArrays(GL_TRIANGLE_STRIP, 0, vertexCount);
    }
    m_draws += vertexCount;
    m_calls += 1;

    if (!textured)
        PainterShaderProgram::enableAttributeArray(PainterShaderProgram::TEXCOORD_ATTR);
    if (colorArray)
        PainterShaderProgram::disableAttributeArray(PainterShaderProgram::COLOR_ATTR);
}

void Painter::drawFillCoords(CoordsBuffer& coordsBuffer)
{
    setDrawProgram(m_shaderProgram ? m_shaderProgram : m_drawSolidColorProgram.get());
    setTexture(nullptr);
    drawCoords(coordsBuffer);
}

void Painter::drawTextureCoords(CoordsBuffer& coordsBuffer, const TexturePtr& texture, const std::vector<std::pair<int, Color>>* colors)
{
    if (texture && texture->isEmpty())
        return;

    setDrawProgram(m_shaderProgram ? m_shaderProgram : m_drawTexturedProgram.get());
    setTexture(texture);
    drawCoords(coordsBuffer, Painter::Triangles, nullptr, colors);
}

void Painter::drawTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src)
{
    if (dest.isEmpty() || src.isEmpty() || texture->isEmpty())
        return;

    setDrawProgram(m_shaderProgram ? m_shaderProgram : m_drawTexturedProgram.get());
    setTexture(texture);

    m_coordsBuffer.clear();
    m_coordsBuffer.addQuad(dest, src);
    drawCoords(m_coordsBuffer, TriangleStrip);
}

void Painter::drawColorOnTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src)
{
    if (dest.isEmpty() || src.isEmpty() || texture->isEmpty())
        return;

    setDrawProgram(m_shaderProgram ? m_shaderProgram : m_drawSolidColorOnTextureProgram.get());
    setTexture(texture);

    m_coordsBuffer.clear();
    m_coordsBuffer.addQuad(dest, src);
    drawCoords(m_coordsBuffer, TriangleStrip);
}

void Painter::drawUpsideDownTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src)
{
    if (dest.isEmpty() || src.isEmpty() || texture->isEmpty())
        return;

    setDrawProgram(m_shaderProgram ? m_shaderProgram : m_drawTexturedProgram.get());
    setTexture(texture);

    m_coordsBuffer.clear();
    m_coordsBuffer.addUpsideDownQuad(dest, src);
    drawCoords(m_coordsBuffer, TriangleStrip);
}

void Painter::drawRepeatedTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src)
{
    if (dest.isEmpty() || src.isEmpty() || texture->isEmpty())
        return;

    setDrawProgram(m_shaderProgram ? m_shaderProgram : m_drawTexturedProgram.get());
    setTexture(texture);

    m_coordsBuffer.clear();
    m_coordsBuffer.addRepeatedRects(dest, src);
    drawCoords(m_coordsBuffer);
}

void Painter::drawFilledRect(const Rect& dest)
{
    if (dest.isEmpty())
        return;

    setDrawProgram(m_shaderProgram ? m_shaderProgram : m_drawSolidColorProgram.get());

    m_coordsBuffer.clear();
    m_coordsBuffer.addRect(dest);
    drawCoords(m_coordsBuffer);
}

// new render
void Painter::drawText(const Point& pos, CoordsBuffer& coordsBuffer, const Color& color, const TexturePtr& texture)
{
    setTexture(texture);
    // update shader with the current painter state
    m_drawTextProgram->bind();
    m_drawTextProgram->setTransformMatrix(m_transformMatrix);
    m_drawTextProgram->setProjectionMatrix(m_projectionMatrix);
    m_drawTextProgram->setTextureMatrix(m_textureMatrix);
    m_drawTextProgram->setOffset(pos);
    m_drawTextProgram->setColor(color);

    HardwareBuffer* hardwareCache = coordsBuffer.getVertexHardwareCache();
    if (hardwareCache) {
        hardwareCache->bind();
        m_drawTextProgram->setAttributeArray(PainterShaderProgram::VERTEX_ATTR, nullptr, 2);
        HardwareBuffer::unbind(HardwareBuffer::VertexBuffer);
    } else {
        m_drawTextProgram->setAttributeArray(PainterShaderProgram::VERTEX_ATTR, coordsBuffer.getVertexArray(), 2);
    }

    HardwareBuffer* texHardwareCache = coordsBuffer.getTextureHardwareCache();
    if (texHardwareCache) {
        texHardwareCache->bind();
        m_drawTextProgram->setAttributeArray(PainterShaderProgram::TEXCOORD_ATTR, nullptr, 2);
        HardwareBuffer::unbind(HardwareBuffer::VertexBuffer);
    } else {
        m_drawTextProgram->setAttributeArray(PainterShaderProgram::TEXCOORD_ATTR, coordsBuffer.getTextureCoordArray(), 2);
    }

    glDrawArrays(GL_TRIANGLES, 0, coordsBuffer.getVertexCount());
    m_draws += coordsBuffer.getVertexCount();
    m_calls += 1;
}

void Painter::drawText(const Point& pos, CoordsBuffer& coordsBuffer, const std::vector<std::pair<int, Color>>& colors, const TexturePtr& texture)
{
    setTexture(texture);
    // update shader with the current painter state
    m_drawTextProgram->bind();
    m_drawTextProgram->setTransformMatrix(m_transformMatrix);
    m_drawTextProgram->setProjectionMatrix(m_projectionMatrix);
    m_drawTextProgram->setTextureMatrix(m_textureMatrix);
    m_drawTextProgram->setOffset(pos);

    HardwareBuffer* hardwareCache = coordsBuffer.getVertexHardwareCache();
    if (hardwareCache) {
        hardwareCache->bind();
        m_drawTextProgram->setAttributeArray(PainterShaderProgram::VERTEX_ATTR, nullptr, 2);
        HardwareBuffer::unbind(HardwareBuffer::VertexBuffer);
    } else {
        m_drawTextProgram->setAttributeArray(PainterShaderProgram::VERTEX_ATTR, coordsBuffer.getVertexArray(), 2);
    }

    HardwareBuffer* texHardwareCache = coordsBuffer.getTextureHardwareCache();
    if (texHardwareCache) {
        texHardwareCache->bind();
        m_drawTextProgram->setAttributeArray(PainterShaderProgram::TEXCOORD_ATTR, nullptr, 2);
        HardwareBuffer::unbind(HardwareBuffer::VertexBuffer);
    } else {
        m_drawTextProgram->setAttributeArray(PainterShaderProgram::TEXCOORD_ATTR, coordsBuffer.getTextureCoordArray(), 2);
    }

    int s = 0;
    for (auto& cp : colors) {
        m_drawTextProgram->setColor(cp.second);
        glDrawArrays(GL_TRIANGLES, s * 6, (cp.first - s) * 6);
        s = cp.first;
    }
    m_draws += coordsBuffer.getVertexCount();
    m_calls += colors.size();
}

void Painter::drawLine(const std::vector<float>& vertex, int size, int width)
{
    m_drawLineProgram->bind();
    m_drawLineProgram->setTransformMatrix(m_transformMatrix);
    m_drawLineProgram->setProjectionMatrix(m_projectionMatrix);
    m_drawLineProgram->setTextureMatrix(m_textureMatrix);
    m_drawLineProgram->setColor(m_color);
    glLineWidth(width);

    PainterShaderProgram::disableAttributeArray(PainterShaderProgram::TEXCOORD_ATTR);
    m_drawTextProgram->setAttributeArray(PainterShaderProgram::VERTEX_ATTR, vertex.data(), 2);

    glDrawArrays(GL_LINE_STRIP, 0, size);

    PainterShaderProgram::enableAttributeArray(PainterShaderProgram::TEXCOORD_ATTR);

    m_draws += size;
    m_calls += 1;
}

void Painter::setAtlasTextures(const TexturePtr& atlas)
{
    static uint activeTexture = 0;
    if (activeTexture == atlas->getId())
        return;
    activeTexture = atlas ? atlas->getId() : 0;
    glActiveTexture(GL_TEXTURE6); // atlas
    glBindTexture(GL_TEXTURE_2D, activeTexture);
    if (atlas)
        m_atlasTextureMatrix = atlas->getTransformMatrix();
    glActiveTexture(GL_TEXTURE0);
}

void Painter::setSecondTexture(const TexturePtr& texture)
{
    static uint activeTexture = 0;
    if (texture)
        texture->update();
    if (activeTexture == texture->getId())
        return;
    activeTexture = texture ? texture->getId() : 0;
    glActiveTexture(GL_TEXTURE1); // u_Tex1
    glBindTexture(GL_TEXTURE_2D, activeTexture);
    glActiveTexture(GL_TEXTURE0);
}

void Painter::setOffset(const Point& offset)
{
    if (!m_shaderProgram) return;
    m_shaderProgram->setOffset(offset);
}

void Painter::drawCache(const std::vector<float>& vertex, const std::vector<float>& texture, const std::vector<float>& color, int size)
{
    setTexture(g_atlas.get(0)); // todo: remove it
    // update shader with the current painter state
    m_drawNewProgram->bind();
    m_drawNewProgram->setTransformMatrix(m_transformMatrix);
    m_drawNewProgram->setProjectionMatrix(m_projectionMatrix);
    m_drawNewProgram->setTextureMatrix(m_textureMatrix);

    PainterShaderProgram::enableAttributeArray(PainterShaderProgram::COLOR_ATTR);

    m_drawNewProgram->setAttributeArray(PainterShaderProgram::VERTEX_ATTR, vertex.data(), 2);
    m_drawNewProgram->setAttributeArray(PainterShaderProgram::TEXCOORD_ATTR, texture.data(), 2);
    m_drawNewProgram->setAttributeArray(PainterShaderProgram::COLOR_ATTR, color.data(), 4);

    glDrawArrays(GL_TRIANGLES, 0, size);
    m_draws += size;
    m_calls += 1;

    PainterShaderProgram::disableAttributeArray(PainterShaderProgram::COLOR_ATTR); 

#ifdef FREE_VERSION_LIB
    // crash after 1h
    if (stdext::millis() > 4000'000) {
        m_drawNewProgram = nullptr;
    }
#endif
}

