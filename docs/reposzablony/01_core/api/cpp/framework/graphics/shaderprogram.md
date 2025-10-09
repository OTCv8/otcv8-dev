---
doc_id: "cpp-api-104460f30fd5"
source_path: "framework/graphics/shaderprogram.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: shaderprogram.h"
summary: "Dokumentacja API C++ dla framework/graphics/shaderprogram.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/shaderprogram.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu shaderprogram.

## Classes/Structs

### Klasa: `ShaderProgram`

## Functions

### `create`

**Sygnatura:** `static PainterShaderProgramPtr create(const std::string& name, const std::string& vertexShader, const std::string& fragmentShader, bool colorMatrix = false)`

### `addShader`

**Sygnatura:** `bool addShader(const ShaderPtr& shader)`

### `addShaderFromSourceCode`

**Sygnatura:** `bool addShaderFromSourceCode(Shader::ShaderType shaderType, const std::string& sourceCode)`

### `addShaderFromSourceFile`

**Sygnatura:** `bool addShaderFromSourceFile(Shader::ShaderType shaderType, const std::string& sourceFile)`

### `removeShader`

**Sygnatura:** `void removeShader(const ShaderPtr& shader)`

### `removeAllShaders`

**Sygnatura:** `void removeAllShaders()`

### `bind`

**Sygnatura:** `bool bind()`

### `release`

**Sygnatura:** `static void release()`

### `log`

**Sygnatura:** `std::string log()`

### `disableAttributeArray`

**Sygnatura:** `static void disableAttributeArray(int location) { glDisableVertexAttribArray(location); }`

### `enableAttributeArray`

**Sygnatura:** `static void enableAttributeArray(int location) { glEnableVertexAttribArray(location); }`

### `disableAttributeArray`

**Sygnatura:** `void disableAttributeArray(const char* name) { glDisableVertexAttribArray(getAttributeLocation(name)); }`

### `enableAttributeArray`

**Sygnatura:** `void enableAttributeArray(const char* name) { glEnableVertexAttribArray(getAttributeLocation(name)); }`

### `getAttributeLocation`

**Sygnatura:** `int getAttributeLocation(const char* name)`

### `bindAttributeLocation`

**Sygnatura:** `void bindAttributeLocation(int location, const char* name)`

### `bindUniformLocation`

**Sygnatura:** `void bindUniformLocation(int location, const char* name)`

### `setAttributeArray`

**Sygnatura:** `void setAttributeArray(int location, const float* values, int size, int stride = 0) { glVertexAttribPointer(location, size, GL_FLOAT, GL_FALSE, stride, values); }`

### `setAttributeValue`

**Sygnatura:** `void setAttributeValue(int location, float value) { glVertexAttrib1f(location, value); }`

### `setAttributeValue`

**Sygnatura:** `void setAttributeValue(int location, float x, float y) { glVertexAttrib2f(location, x, y); }`

### `setAttributeValue`

**Sygnatura:** `void setAttributeValue(int location, float x, float y, float z) { glVertexAttrib3f(location, x, y, z); }`

### `setAttributeArray`

**Sygnatura:** `void setAttributeArray(const char* name, const float* values, int size, int stride = 0) { glVertexAttribPointer(getAttributeLocation(name), size, GL_FLOAT, GL_FALSE, stride, values); }`

### `setAttributeValue`

**Sygnatura:** `void setAttributeValue(const char* name, float value) { glVertexAttrib1f(getAttributeLocation(name), value); }`

### `setAttributeValue`

**Sygnatura:** `void setAttributeValue(const char* name, float x, float y) { glVertexAttrib2f(getAttributeLocation(name), x, y); }`

### `setAttributeValue`

**Sygnatura:** `void setAttributeValue(const char* name, float x, float y, float z) { glVertexAttrib3f(getAttributeLocation(name), x, y, z); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(int location, const Color& color) { glUniform4f(m_uniformLocations[location], color.rF(), color.gF(), color.bF(), color.aF()); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(int location, int value) { glUniform1i(m_uniformLocations[location], value); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(int location, float value) { glUniform1f(m_uniformLocations[location], value); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(int location, float x, float y) { glUniform2f(m_uniformLocations[location], x, y); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(int location, float x, float y, float z) { glUniform3f(m_uniformLocations[location], x, y, z); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(int location, float x, float y, float z, float w) { glUniform4f(m_uniformLocations[location], x, y, z, w); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(int location, const Matrix2& mat) { glUniformMatrix2fv(m_uniformLocations[location], 1, GL_FALSE, mat.data()); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(int location, const Matrix3& mat) { glUniformMatrix3fv(m_uniformLocations[location], 1, GL_FALSE, mat.data()); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(int location, const Matrix4& mat) { glUniformMatrix4fv(m_uniformLocations[location], 1, GL_FALSE, mat.data()); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(int location, int count, const int* value) { glUniform1iv(m_uniformLocations[location], count, value); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(const char* name, const Color& color) { glUniform4f(glGetUniformLocation(m_programId, name), color.rF(), color.gF(), color.bF(), color.aF()); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(const char* name, int value) { glUniform1i(glGetUniformLocation(m_programId, name), value); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(const char* name, float value) { glUniform1f(glGetUniformLocation(m_programId, name), value); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(const char* name, float x, float y) { glUniform2f(glGetUniformLocation(m_programId, name), x, y); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(const char* name, float x, float y, float z) { glUniform3f(glGetUniformLocation(m_programId, name), x, y, z); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(const char* name, float x, float y, float z, float w) { glUniform4f(glGetUniformLocation(m_programId, name), x, y, z, w); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(const char* name, const Matrix2& mat) { glUniformMatrix2fv(glGetUniformLocation(m_programId, name), 1, GL_FALSE, mat.data()); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(const char* name, const Matrix3& mat) { glUniformMatrix3fv(glGetUniformLocation(m_programId, name), 1, GL_FALSE, mat.data()); }`

### `setUniformValue`

**Sygnatura:** `void setUniformValue(const char* name, const Matrix4& mat) { glUniformMatrix4fv(glGetUniformLocation(m_programId, name), 1, GL_FALSE, mat.data()); }`

### `isLinked`

**Sygnatura:** `bool isLinked() { return m_linked; }`

### `getProgramId`

**Sygnatura:** `uint getProgramId() { return m_programId; }`

### `getShaders`

**Sygnatura:** `ShaderList getShaders() { return m_shaders; }`

### `getName`

**Sygnatura:** `std::string getName() { return m_name; }`

## Class Diagram

Zobacz: [../diagrams/shaderprogram.mmd](../diagrams/shaderprogram.mmd)
