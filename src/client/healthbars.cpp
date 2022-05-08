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

#include "healthbars.h"

#include <framework/graphics/texturemanager.h>

HealthBars g_healthBars;

void HealthBars::init()
{
    m_healthBars.reserve(21);
    m_healthBars.push_back(nullptr); // 0 = default bar
    m_manaBars.reserve(21);
    m_manaBars.push_back(nullptr); // 0 = default bar
}

void HealthBars::terminate()
{
    m_healthBars.clear();
    m_manaBars.clear();
}

void HealthBars::addHealthBackground(const std::string& path, int offsetX, int offsetY, int barOffsetX, int barOffsetY, int height) {
    HealthBarPtr bar(new HealthBar);
    bar->setPath(path);
    bar->setTexture(path);
    bar->setOffset(offsetX, offsetY);
    bar->setBarOffset(barOffsetX, barOffsetY);
    bar->setHeight(height);
    m_healthBars.push_back(bar);
}

void HealthBars::addManaBackground(const std::string& path, int offsetX, int offsetY, int barOffsetX, int barOffsetY, int height) {
    HealthBarPtr bar(new HealthBar);
    bar->setPath(path);
    bar->setTexture(path);
    bar->setOffset(offsetX, offsetY);
    bar->setBarOffset(barOffsetX, barOffsetY);
    bar->setHeight(height);
    m_manaBars.push_back(bar);
}

std::string HealthBars::getHealthBarPath(int id)
{
    HealthBarPtr bar = getHealthBar(id);
    if (bar) {
        return bar->getPath();
    }

    return std::string();
}

std::string HealthBars::getManaBarPath(int id)
{
    HealthBarPtr bar = getManaBar(id);
    if (bar) {
        return bar->getPath();
    }

    return std::string();
}

Point HealthBars::getHealthBarOffset(int id)
{
    HealthBarPtr bar = getHealthBar(id);
    if (bar) {
        return bar->getOffset();
    }

    return Point();
}

Point HealthBars::getManaBarOffset(int id)
{
    HealthBarPtr bar = getManaBar(id);
    if (bar) {
        return bar->getOffset();
    }

    return Point();
}

Point HealthBars::getHealthBarOffsetBar(int id)
{
    HealthBarPtr bar = getHealthBar(id);
    if (bar) {
        return bar->getBarOffset();
    }

    return Point();
}

Point HealthBars::getManaBarOffsetBar(int id)
{
    HealthBarPtr bar = getManaBar(id);
    if (bar) {
        return bar->getBarOffset();
    }

    return Point();
}

int HealthBars::getHealthBarHeight(int id)
{
    HealthBarPtr bar = getHealthBar(id);
    if (bar) {
        return bar->getHeight();
    }

    return 0;
}

int HealthBars::getManaBarHeight(int id)
{
    HealthBarPtr bar = getManaBar(id);
    if (bar) {
        return bar->getHeight();
    }

    return 0;
}

void HealthBar::setTexture(const std::string& path)
{
    m_texture = g_textures.getTexture(path);
}
