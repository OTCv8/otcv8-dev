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

#ifndef PAINTER_H
#define PAINTER_H

#include <framework/graphics/declarations.h>
#include <framework/graphics/coordsbuffer.h>
#include <framework/graphics/paintershaderprogram.h>
#include <framework/graphics/texture.h>
#include <framework/graphics/colorarray.h>
#include <framework/graphics/drawqueue.h>

class Painter {
public:
    enum BlendEquation {
        BlendEquation_Add,
        BlendEquation_Max,
        BlendEquation_Subtract
    };
    enum CompositionMode {
        CompositionMode_Normal,
        CompositionMode_Multiply,
        CompositionMode_Add,
        CompositionMode_Replace,
        CompositionMode_DestBlending,
        CompositionMode_Light,
        CompositionMode_AlphaZeroing,
        CompositionMode_AlphaRestoring,
        CompositionMode_ZeroAlphaOverrite

    };
    enum DepthFunc {
        DepthFunc_None,
        DepthFunc_LESS,
        DepthFunc_LESS_READ,
        DepthFunc_LEQUAL,
        DepthFunc_LEQUAL_READ,
        DepthFunc_EQUAL,
        DepthFunc_ALWAYS,
        DepthFunc_ALWAYS_READ
    };
    enum DrawMode {
        Triangles = GL_TRIANGLES,
        TriangleStrip = GL_TRIANGLE_STRIP
    };

    struct PainterState {
        Size resolution;
        Matrix3 transformMatrix;
        Matrix3 projectionMatrix;
        Matrix3 textureMatrix;
        Color color;
        Painter::CompositionMode compositionMode;
        Painter::BlendEquation blendEquation;
        Rect clipRect;
        TexturePtr texture;
        PainterShaderProgram* shaderProgram;
        bool alphaWriting;
#ifdef WITH_DEPTH_BUFFER
        Painter::DepthFunc depthFunc;
        float depth;
#endif
    };

    Painter();
    ~Painter() {}

    void bind();
    void unbind();

    void resetState();
    void refreshState();
    void saveState();
    void saveAndResetState();
    void restoreSavedState();

    void clear(const Color& color);
    void clearRect(const Color& color, const Rect& rect);

    void setTransformMatrix(const Matrix3& transformMatrix) { m_transformMatrix = transformMatrix; }
    void setProjectionMatrix(const Matrix3& projectionMatrix) { m_projectionMatrix = projectionMatrix; }
    void setTextureMatrix(const Matrix3& textureMatrix) { m_textureMatrix = textureMatrix; }
    void setCompositionMode(CompositionMode compositionMode);
    void setBlendEquation(BlendEquation blendEquation);
#ifdef WITH_DEPTH_BUFFER
    void setDepthFunc(DepthFunc func);
#endif
    void setClipRect(const Rect& clipRect);
    void setShaderProgram(PainterShaderProgram* shaderProgram) { m_shaderProgram = shaderProgram; }
    void setTexture(const TexturePtr& texture);
    void setAlphaWriting(bool enable);

    void setResolution(const Size& resolution);

    void scale(float x, float y);
    void translate(float x, float y);
    void rotate(float angle);
    void rotate(float x, float y, float angle);

    void pushTransformMatrix();
    void popTransformMatrix();

    Matrix3 getTransformMatrix() { return m_transformMatrix; }
    Matrix3 getProjectionMatrix() { return m_projectionMatrix; }
    Matrix3 getTextureMatrix() { return m_textureMatrix; }
    BlendEquation getBlendEquation() { return m_blendEquation; }
    PainterShaderProgram* getShaderProgram() { return m_shaderProgram; }
    bool getAlphaWriting() { return m_alphaWriting; }

    void resetBlendEquation() { setBlendEquation(BlendEquation_Add); }
    void resetTexture() { setTexture(nullptr); }
    void resetAlphaWriting() { setAlphaWriting(true); }
    void resetTransformMatrix() { setTransformMatrix(Matrix3()); }

    /* org */
    void drawCoords(CoordsBuffer& coordsBuffer, DrawMode drawMode = Triangles, ColorArray* colorBuffer = nullptr, const std::vector<std::pair<int, Color>>* colors = nullptr);
    void drawFillCoords(CoordsBuffer& coordsBuffer);
    void drawTextureCoords(CoordsBuffer& coordsBuffer, const TexturePtr& texture, const std::vector<std::pair<int, Color>>* colors = nullptr);
    void drawTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src);
    inline void drawTexturedRect(const Rect& dest, const TexturePtr& texture) { drawTexturedRect(dest, texture, Rect(Point(0, 0), texture->getSize())); }
    void drawColorOnTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src);
    void drawUpsideDownTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src);
    void drawRepeatedTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src);
    void drawFilledRect(const Rect& dest);

    void setDrawProgram(PainterShaderProgram* drawProgram) { m_drawProgram = drawProgram; }
    bool hasShaders() { return true; }

    void drawText(const Point& pos, CoordsBuffer& coordsBuffer, const Color& color, const TexturePtr& texture);
    void drawText(const Point& pos, CoordsBuffer& coordsBuffer, const std::vector<std::pair<int, Color>>& colors, const TexturePtr& texture);

    void drawLine(const std::vector<float>& vertex, int size, int width = 1);

    void setSecondTexture(const TexturePtr& texture);
    void setOffset(const Point& offset);

    void setAtlasTextures(const TexturePtr& atlas);
    void drawCache(const std::vector<float>& vertex, const std::vector<float>& texture, const std::vector<float>& color, int size);

    void setColor(const Color& color) { m_color = color; }
    void setShaderProgram(const PainterShaderProgramPtr& shaderProgram) { setShaderProgram(shaderProgram.get()); }

    void scale(float factor) { scale(factor, factor); }
    void translate(const Point& p) { translate(p.x, p.y); }
    void rotate(const Point& p, float angle) { rotate(p.x, p.y, angle); }

#ifdef WITH_DEPTH_BUFFER
    void setDepth(float depth) { m_depth = depth; }
    float getDepth() { return m_depth; }
    DepthFunc getDepthFunc() { return m_depthFunc; }
    void resetDepth() { return setDepth(0.0f); }
    void resetDepthFunc() { setDepthFunc(DepthFunc_None); }
#endif

    Size getResolution() { return m_resolution; }
    Color getColor() { return m_color; }
    Rect getClipRect() { return m_clipRect; }
    CompositionMode getCompositionMode() { return m_compositionMode; }

    void resetClipRect() { setClipRect(Rect()); }
    void resetCompositionMode() { setCompositionMode(CompositionMode_Normal); }
    void resetColor() { setColor(Color::white); }
    void resetShaderProgram() { setShaderProgram(nullptr); }

    int draws() { return m_draws; }
    int calls() { return m_calls; }
    void resetDraws() { m_draws = m_calls = 0; }

    void setDrawColorOnTextureShaderProgram()
    {
        setShaderProgram(m_drawSolidColorOnTextureProgram);
    }

    void setMatrixColor(const Matrix4& mat4)
    {
        m_matrixColor = mat4;
    }
    void setDrawOutfitLayersProgram()
    {
        setShaderProgram(m_drawOutfitLayersProgram);
    }

protected:
    void updateGlTexture();
    void updateGlCompositionMode();
    void updateGlBlendEquation();
    void updateGlClipRect();
    void updateGlAlphaWriting();
    void updateGlViewport();
#ifdef WITH_DEPTH_BUFFER
    void updateDepthFunc();
#endif

    CoordsBuffer m_coordsBuffer;

    std::vector<Matrix3> m_transformMatrixStack;
    Matrix3 m_transformMatrix;
    Matrix3 m_projectionMatrix;
    Matrix3 m_textureMatrix;
    Matrix3 m_atlasTextureMatrix;

    BlendEquation m_blendEquation;
    TexturePtr m_texture;
    bool m_alphaWriting;

    PainterState m_olderStates[10];
    int m_oldStateIndex;

    uint m_glTextureId;

    PainterShaderProgram* m_shaderProgram;
    CompositionMode m_compositionMode;
    Color m_color;
    Matrix4 m_matrixColor;
    Size m_resolution;
    Rect m_clipRect;
#ifdef WITH_DEPTH_BUFFER
    DepthFunc m_depthFunc;
    float m_depth;
#endif
    int m_draws = 0;
    int m_calls = 0;

private:
    PainterShaderProgram* m_drawProgram;
    PainterShaderProgramPtr m_drawTexturedProgram;
    PainterShaderProgramPtr m_drawSolidColorProgram;
    PainterShaderProgramPtr m_drawSolidColorOnTextureProgram;
    PainterShaderProgramPtr m_drawOutfitLayersProgram;

    PainterShaderProgramPtr m_drawNewProgram;

    PainterShaderProgramPtr m_drawTextProgram;
    PainterShaderProgramPtr m_drawLineProgram;
};

extern Painter* g_painter;

#endif
