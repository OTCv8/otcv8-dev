---
doc_id: "cpp-api-7c73d31850c1"
source_path: "framework/graphics/painter.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: painter.h"
summary: "Dokumentacja API C++ dla framework/graphics/painter.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/painter.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu painter.

## Classes/Structs

### Klasa: `Painter`

### Struktura: `PainterState`

## Enums

### `BlendEquation`

**Wartości:**

- `BlendEquation_Add`
- `BlendEquation_Max`
- `BlendEquation_Subtract`

### `CompositionMode`

**Wartości:**

- `CompositionMode_Normal`
- `CompositionMode_Multiply`
- `CompositionMode_Add`
- `CompositionMode_Replace`
- `CompositionMode_DestBlending`
- `CompositionMode_Light`
- `CompositionMode_AlphaZeroing`
- `CompositionMode_AlphaRestoring`
- `CompositionMode_ZeroAlphaOverrite`

### `DepthFunc`

**Wartości:**

- `DepthFunc_None`
- `DepthFunc_LESS`
- `DepthFunc_LESS_READ`
- `DepthFunc_LEQUAL`
- `DepthFunc_LEQUAL_READ`
- `DepthFunc_EQUAL`
- `DepthFunc_ALWAYS`
- `DepthFunc_ALWAYS_READ`

### `DrawMode`

**Wartości:**

- `Triangles`
- `TriangleStrip`

## Functions

### `bind`

**Sygnatura:** `void bind()`

### `unbind`

**Sygnatura:** `void unbind()`

### `resetState`

**Sygnatura:** `void resetState()`

### `refreshState`

**Sygnatura:** `void refreshState()`

### `saveState`

**Sygnatura:** `void saveState()`

### `saveAndResetState`

**Sygnatura:** `void saveAndResetState()`

### `restoreSavedState`

**Sygnatura:** `void restoreSavedState()`

### `clear`

**Sygnatura:** `void clear(const Color& color)`

### `clearRect`

**Sygnatura:** `void clearRect(const Color& color, const Rect& rect)`

### `setTransformMatrix`

**Sygnatura:** `void setTransformMatrix(const Matrix3& transformMatrix) { m_transformMatrix = transformMatrix; }`

### `setProjectionMatrix`

**Sygnatura:** `void setProjectionMatrix(const Matrix3& projectionMatrix) { m_projectionMatrix = projectionMatrix; }`

### `setTextureMatrix`

**Sygnatura:** `void setTextureMatrix(const Matrix3& textureMatrix) { m_textureMatrix = textureMatrix; }`

### `setCompositionMode`

**Sygnatura:** `void setCompositionMode(CompositionMode compositionMode)`

### `setBlendEquation`

**Sygnatura:** `void setBlendEquation(BlendEquation blendEquation)`

### `setDepthFunc`

**Sygnatura:** `void setDepthFunc(DepthFunc func)`

### `setClipRect`

**Sygnatura:** `void setClipRect(const Rect& clipRect)`

### `setShaderProgram`

**Sygnatura:** `void setShaderProgram(PainterShaderProgram* shaderProgram) { m_shaderProgram = shaderProgram; }`

### `setTexture`

**Sygnatura:** `void setTexture(const TexturePtr& texture)`

### `setAlphaWriting`

**Sygnatura:** `void setAlphaWriting(bool enable)`

### `setResolution`

**Sygnatura:** `void setResolution(const Size& resolution)`

### `scale`

**Sygnatura:** `void scale(float x, float y)`

### `translate`

**Sygnatura:** `void translate(float x, float y)`

### `rotate`

**Sygnatura:** `void rotate(float angle)`

### `rotate`

**Sygnatura:** `void rotate(float x, float y, float angle)`

### `pushTransformMatrix`

**Sygnatura:** `void pushTransformMatrix()`

### `popTransformMatrix`

**Sygnatura:** `void popTransformMatrix()`

### `getTransformMatrix`

**Sygnatura:** `Matrix3 getTransformMatrix() { return m_transformMatrix; }`

### `getProjectionMatrix`

**Sygnatura:** `Matrix3 getProjectionMatrix() { return m_projectionMatrix; }`

### `getTextureMatrix`

**Sygnatura:** `Matrix3 getTextureMatrix() { return m_textureMatrix; }`

### `getBlendEquation`

**Sygnatura:** `BlendEquation getBlendEquation() { return m_blendEquation; }`

### `getAlphaWriting`

**Sygnatura:** `bool getAlphaWriting() { return m_alphaWriting; }`

### `resetBlendEquation`

**Sygnatura:** `void resetBlendEquation() { setBlendEquation(BlendEquation_Add); }`

### `resetTexture`

**Sygnatura:** `void resetTexture() { setTexture(nullptr); }`

### `resetAlphaWriting`

**Sygnatura:** `void resetAlphaWriting() { setAlphaWriting(true); }`

### `resetTransformMatrix`

**Sygnatura:** `void resetTransformMatrix() { setTransformMatrix(Matrix3()); }`

### `drawCoords`

org

**Sygnatura:** `void drawCoords(CoordsBuffer& coordsBuffer, DrawMode drawMode = Triangles, ColorArray* colorBuffer = nullptr, const std::vector<std::pair<int, Color>>* colors = nullptr)`

### `drawFillCoords`

**Sygnatura:** `void drawFillCoords(CoordsBuffer& coordsBuffer)`

### `drawTextureCoords`

**Sygnatura:** `void drawTextureCoords(CoordsBuffer& coordsBuffer, const TexturePtr& texture, const std::vector<std::pair<int, Color>>* colors = nullptr)`

### `drawTexturedRect`

**Sygnatura:** `void drawTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src)`

### `drawTexturedRect`

**Sygnatura:** `inline void drawTexturedRect(const Rect& dest, const TexturePtr& texture) { drawTexturedRect(dest, texture, Rect(Point(0, 0), texture->getSize())); }`

### `drawColorOnTexturedRect`

**Sygnatura:** `void drawColorOnTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src)`

### `drawUpsideDownTexturedRect`

**Sygnatura:** `void drawUpsideDownTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src)`

### `drawRepeatedTexturedRect`

**Sygnatura:** `void drawRepeatedTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src)`

### `drawFilledRect`

**Sygnatura:** `void drawFilledRect(const Rect& dest)`

### `setDrawProgram`

**Sygnatura:** `void setDrawProgram(PainterShaderProgram* drawProgram) { m_drawProgram = drawProgram; }`

### `hasShaders`

**Sygnatura:** `bool hasShaders() { return true; }`

### `drawText`

**Sygnatura:** `void drawText(const Point& pos, CoordsBuffer& coordsBuffer, const Color& color, const TexturePtr& texture)`

### `drawText`

**Sygnatura:** `void drawText(const Point& pos, CoordsBuffer& coordsBuffer, const std::vector<std::pair<int, Color>>& colors, const TexturePtr& texture)`

### `drawLine`

**Sygnatura:** `void drawLine(const std::vector<float>& vertex, int size, int width = 1)`

### `setSecondTexture`

**Sygnatura:** `void setSecondTexture(const TexturePtr& texture)`

### `setOffset`

**Sygnatura:** `void setOffset(const Point& offset)`

### `setAtlasTextures`

**Sygnatura:** `void setAtlasTextures(const TexturePtr& atlas)`

### `drawCache`

**Sygnatura:** `void drawCache(const std::vector<float>& vertex, const std::vector<float>& texture, const std::vector<float>& color, int size)`

### `setColor`

**Sygnatura:** `void setColor(const Color& color) { m_color = color; }`

### `setShaderProgram`

**Sygnatura:** `void setShaderProgram(const PainterShaderProgramPtr& shaderProgram) { setShaderProgram(shaderProgram.get()); }`

### `scale`

**Sygnatura:** `void scale(float factor) { scale(factor, factor); }`

### `translate`

**Sygnatura:** `void translate(const Point& p) { translate(p.x, p.y); }`

### `rotate`

**Sygnatura:** `void rotate(const Point& p, float angle) { rotate(p.x, p.y, angle); }`

### `setDepth`

**Sygnatura:** `void setDepth(float depth) { m_depth = depth; }`

### `getDepth`

**Sygnatura:** `float getDepth() { return m_depth; }`

### `getDepthFunc`

**Sygnatura:** `DepthFunc getDepthFunc() { return m_depthFunc; }`

### `resetDepth`

**Sygnatura:** `void resetDepth() { return setDepth(0.0f); }`

### `resetDepthFunc`

**Sygnatura:** `void resetDepthFunc() { setDepthFunc(DepthFunc_None); }`

### `getResolution`

**Sygnatura:** `Size getResolution() { return m_resolution; }`

### `getColor`

**Sygnatura:** `Color getColor() { return m_color; }`

### `getClipRect`

**Sygnatura:** `Rect getClipRect() { return m_clipRect; }`

### `getCompositionMode`

**Sygnatura:** `CompositionMode getCompositionMode() { return m_compositionMode; }`

### `resetClipRect`

**Sygnatura:** `void resetClipRect() { setClipRect(Rect()); }`

### `resetCompositionMode`

**Sygnatura:** `void resetCompositionMode() { setCompositionMode(CompositionMode_Normal); }`

### `resetColor`

**Sygnatura:** `void resetColor() { setColor(Color::white); }`

### `resetShaderProgram`

**Sygnatura:** `void resetShaderProgram() { setShaderProgram(nullptr); }`

### `draws`

**Sygnatura:** `int draws() { return m_draws; }`

### `calls`

**Sygnatura:** `int calls() { return m_calls; }`

### `resetDraws`

**Sygnatura:** `void resetDraws() { m_draws = m_calls = 0; }`

### `setDrawColorOnTextureShaderProgram`

**Sygnatura:** `void setDrawColorOnTextureShaderProgram()`

### `setMatrixColor`

**Sygnatura:** `void setMatrixColor(const Matrix4& mat4)`

### `setDrawOutfitLayersProgram`

**Sygnatura:** `void setDrawOutfitLayersProgram()`

### `updateGlTexture`

**Sygnatura:** `void updateGlTexture()`

### `updateGlCompositionMode`

**Sygnatura:** `void updateGlCompositionMode()`

### `updateGlBlendEquation`

**Sygnatura:** `void updateGlBlendEquation()`

### `updateGlClipRect`

**Sygnatura:** `void updateGlClipRect()`

### `updateGlAlphaWriting`

**Sygnatura:** `void updateGlAlphaWriting()`

### `updateGlViewport`

**Sygnatura:** `void updateGlViewport()`

### `updateDepthFunc`

**Sygnatura:** `void updateDepthFunc()`

## Class Diagram

Zobacz: [../diagrams/painter.mmd](../diagrams/painter.mmd)
