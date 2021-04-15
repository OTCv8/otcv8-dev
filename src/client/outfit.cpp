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

#include "outfit.h"
#include "game.h"
#include "spritemanager.h"

#include <framework/graphics/painter.h>
#include <framework/graphics/drawcache.h>
#include <framework/graphics/drawqueue.h>
#include <framework/graphics/atlas.h>
#include <framework/graphics/texturemanager.h>
#include <framework/graphics/image.h>
#include <framework/graphics/framebuffermanager.h>
#include <framework/graphics/shadermanager.h>

Outfit::Outfit()
{
    m_category = ThingCategoryCreature;
    m_id = 128;
    m_auxId = 0;
    resetClothes();
}

void Outfit::draw(Point dest, Otc::Direction direction, uint walkAnimationPhase, bool animate, LightView* lightView)
{
    // direction correction
    if (m_category != ThingCategoryCreature)
        direction = Otc::North;
    else if (direction == Otc::NorthEast || direction == Otc::SouthEast)
        direction = Otc::East;
    else if (direction == Otc::NorthWest || direction == Otc::SouthWest)
        direction = Otc::West;

    Point wingDest = dest;
    if (g_game.getFeature(Otc::GameWingOffset) && m_wings)
        dest -= Point(6, 6);

    auto type = g_things.rawGetThingType(m_category == ThingCategoryCreature ? m_id : m_auxId, m_category);
    if (!type) return;
    int animationPhase = walkAnimationPhase;

    auto wingBounce = [&] {
        int maxoffset = 4;
        uint floatingTicks = 8;
        uint tick = (g_clock.millis() % (1000)) / (1000 / floatingTicks);
        int offset = 0;
        if (walkAnimationPhase > 0) {
            auto idleAnimator = type->getIdleAnimator();
            if (idleAnimator) {
                animationPhase = idleAnimator->getPhase();
            }             else {
                animationPhase = 0;
            }
        }
        offset = tick <= floatingTicks / 2 ? tick * (maxoffset / (floatingTicks / 2)) : (2 * maxoffset) - tick * (maxoffset / (floatingTicks / 2));
        dest -= Point(offset, offset);
        wingDest -= Point(offset, offset);
    };

    if (animate && m_category == ThingCategoryCreature) {
        auto idleAnimator = type->getIdleAnimator();
        if (idleAnimator) {
            if (walkAnimationPhase > 0) {
                animationPhase += idleAnimator->getAnimationPhases() - 1;;
            } else {
                animationPhase = idleAnimator->getPhase();
            }
        } else if (type->isAnimateAlways()) {
            int phases = type->getAnimator() ? type->getAnimator()->getAnimationPhases() : type->getAnimationPhases();
            int ticksPerFrame = 1000 / phases;
            animationPhase = (g_clock.millis() % (ticksPerFrame * phases)) / ticksPerFrame;
        }
        if (g_game.getFeature(Otc::GameWingOffset) && m_wings) {
            wingBounce();
        }
    } else if (animate) {
        int animationPhases = type->getAnimationPhases();
        int animateTicks = g_game.getFeature(Otc::GameEnhancedAnimations) ? Otc::ITEM_TICKS_PER_FRAME_FAST : Otc::ITEM_TICKS_PER_FRAME;

        if (m_category == ThingCategoryEffect) {
            animationPhases = std::max<int>(1, animationPhases - 2);
            animateTicks = g_game.getFeature(Otc::GameEnhancedAnimations) ? Otc::INVISIBLE_TICKS_PER_FRAME_FAST : Otc::INVISIBLE_TICKS_PER_FRAME;
        }

        if (animationPhases > 1)
            animationPhase = (g_clock.millis() % (animateTicks * animationPhases)) / animateTicks;
        if (m_category == ThingCategoryEffect)
            animationPhase = std::min<int>(animationPhase + 1, animationPhases);
    }

    int zPattern = m_mount > 0 ? std::min<int>(1, type->getNumPatternZ() - 1) : 0;
    auto drawMount = [&] {
        if (zPattern > 0) {
            int mountAnimationPhase = walkAnimationPhase;
            auto mountType = g_things.rawGetThingType(m_mount, ThingCategoryCreature);
            auto idleAnimator = mountType->getIdleAnimator();
            if (idleAnimator && animate) {
                if (walkAnimationPhase > 0) {
                    mountAnimationPhase += idleAnimator->getAnimationPhases() - 1;
                } else {
                    mountAnimationPhase = idleAnimator->getPhase();
                }
            }

            dest -= mountType->getDisplacement();
            mountType->draw(dest, 0, direction, 0, 0, mountAnimationPhase, Color::white, lightView);
            dest += type->getDisplacement();
        }
    };

    auto drawWings = [&] {
        int wingAnimationPhase = walkAnimationPhase;
        auto wingsType = g_things.rawGetThingType(m_wings, ThingCategoryCreature);
        int wingsZPattern = m_mount > 0 ? std::min<int>(1, wingsType->getNumPatternZ() - 1) : 0;
        auto idleAnimator = wingsType->getIdleAnimator();
        if (animate) {
            if (idleAnimator) {
                if (walkAnimationPhase > 0) {
                    wingAnimationPhase += idleAnimator->getAnimationPhases() - 1;
                }                 else {
                    wingAnimationPhase = idleAnimator->getPhase();
                }
            }             else if (wingsType->isAnimateAlways()) {
                int phases = wingsType->getAnimator() ? wingsType->getAnimator()->getAnimationPhases() : wingsType->getAnimationPhases();
                int ticksPerFrame = 1000 / phases;
                wingAnimationPhase = (g_clock.millis() % (ticksPerFrame * phases)) / ticksPerFrame;
            }
        }
        wingsType->draw(wingDest, 0, direction, 0, wingsZPattern, wingAnimationPhase, Color::white, lightView);
    };

    auto drawAura = [&] {
        int auraAnimationPhase = 0;
        auto auraType = g_things.rawGetThingType(m_aura, ThingCategoryCreature);
        int auraZPattern = m_mount > 0 ? std::min<int>(1, auraType->getNumPatternZ() - 1) : 0;
        auto auraAnimator = auraType->getAnimator();
        if (animate) {
            if (auraAnimator) {
                auraAnimationPhase = auraAnimator->getPhase();
            } else {
                auraAnimationPhase = (stdext::millis() / 75) % auraType->getAnimationPhases();
            }
        }
        auraType->draw(dest, 0, direction, 0, auraZPattern, auraAnimationPhase, Color::white, lightView);
    };

    Point topAuraDest = dest;
    auto drawTopAura = [&] {
        int auraAnimationPhase = 0;
        auto auraType = g_things.rawGetThingType(m_aura, ThingCategoryCreature);
        auto auraAnimator = auraType->getAnimator();
        if (animate) {
            if (auraAnimator) {
                auraAnimationPhase = auraAnimator->getPhase();
            }
            else {
                auraAnimationPhase = (stdext::millis() / 75) % auraType->getAnimationPhases();
            }
        }
        auraType->draw(topAuraDest, 1, direction, 0, 0, auraAnimationPhase, Color::white, lightView);
    };

    if (m_aura && (!g_game.getFeature(Otc::GameDrawAuraOnTop) or g_game.getFeature(Otc::GameAuraFrontAndBack)) ) {
        drawAura();
    }
  
    drawMount();

    if (m_wings && (direction == Otc::South || direction == Otc::East)) {
        if (g_game.getFeature(Otc::GameWingOffset) && zPattern > 0) {
            if (direction == Otc::East)
                wingDest -= Point(6, 2);
            else
                wingDest -= Point(0, 6);
        }
        drawWings();
    }

    Point center;
    for (int yPattern = 0; yPattern < type->getNumPatternY(); yPattern++) {
        if (yPattern > 0 && !(getAddons() & (1 << (yPattern - 1)))) {
            continue;
        }

        if (type->getLayers() <= 1) {
            if (!m_shader.empty()) {
                std::shared_ptr<DrawOutfitParams> outfitParams = type->drawOutfit(dest, 0, direction, yPattern, zPattern, animationPhase, Color::white, lightView);
                if (!outfitParams)
                    continue;
                if (yPattern == 0)
                    center = outfitParams->dest.center();
                DrawQueueItemTexturedRect* outfit = new DrawQueueItemOutfitWithShader(outfitParams->dest, outfitParams->texture, outfitParams->src, outfitParams->offset, center, 0, m_shader);
                g_drawQueue->add(outfit);
                continue;
            }
            type->draw(dest, 0, direction, yPattern, zPattern, animationPhase, Color::white, lightView);
            continue;
        }

        uint32_t colors = m_head + (m_body << 8) + (m_legs << 16) + (m_feet << 24);
        std::shared_ptr<DrawOutfitParams> outfitParams = type->drawOutfit(dest, 1, direction, yPattern, zPattern, animationPhase, Color::white, lightView);
        if (!outfitParams)
            continue;

        DrawQueueItemTexturedRect* outfit = nullptr;
        if (m_shader.empty())
            outfit = new DrawQueueItemOutfit(outfitParams->dest, outfitParams->texture, outfitParams->src, outfitParams->offset, colors, outfitParams->color);
        else {
            if (yPattern == 0)
                center = outfitParams->dest.center();
            outfit = new DrawQueueItemOutfitWithShader(outfitParams->dest, outfitParams->texture, outfitParams->src, outfitParams->offset, center, colors, m_shader);
        }
        g_drawQueue->add(outfit);
    }

    if (m_wings && (direction == Otc::North || direction == Otc::West)) {
        if (g_game.getFeature(Otc::GameWingOffset) && zPattern > 0)
            wingDest += Point(4, 6);

        drawWings();
    }
    
    if (m_aura && (g_game.getFeature(Otc::GameDrawAuraOnTop) || g_game.getFeature(Otc::GameAuraFrontAndBack))) {
        if (g_game.getFeature(Otc::GameAuraFrontAndBack)){
            if (zPattern > 0) {
                if (direction == Otc::East)
                    topAuraDest -= Point(12, 6);
                else if (direction == Otc::South)
                    topAuraDest -= Point(1, 12);
                else
                    topAuraDest -= Point(4, 6);
            }
            drawTopAura();
        }
        else {
            drawAura();
        }
    }
}

void Outfit::draw(const Rect& dest, Otc::Direction direction, uint animationPhase, bool animate)
{
    int size = g_drawQueue->size();
    draw(Point(0, 0), direction, animationPhase, animate);
    g_drawQueue->correctOutfit(dest, size);
}

void Outfit::resetClothes()
{
    setHead(0);
    setBody(0);
    setLegs(0);
    setFeet(0);
    setMount(0);
    setWings(0);
    setAura(0);
    resetShader();
}

// drawing

bool DrawQueueItemOutfit::cache()
{
    m_texture->update();
    uint64_t hash = (((uint64_t)m_texture->getUniqueId()) << 48) +
        (((uint64_t)m_src.x()) << 36) +
        (((uint64_t)m_src.y()) << 24) +
        (((uint64_t)m_src.width()) << 12) +
        (((uint64_t)m_src.height())) +
        (((uint64_t)m_colors) * 1125899906842597ULL);
    bool drawNow = false;
    Point atlasPos = g_atlas.cache(hash, m_src.size(), drawNow);
    if (atlasPos.x < 0) { return false; } // can't be cached
    if (drawNow) { g_drawCache.bind(); draw(atlasPos); }

    if (!g_drawCache.hasSpace(6))
        return false;

    g_drawCache.addTexturedRect(m_dest, Rect(atlasPos, m_src.size()), m_color);
    return true;
}

void DrawQueueItemOutfit::draw()
{
    if (!m_texture) return;
    Matrix4 mat4;
    for (int x = 0; x < 4; ++x) {
        Color color = Color::getOutfitColor((m_colors >> (x * 8)) & 0xFF);
        mat4(x + 1, 1) = color.rF();
        mat4(x + 1, 2) = color.gF();
        mat4(x + 1, 3) = color.bF();
        mat4(x + 1, 4) = color.aF();
    }
    g_painter->setDrawOutfitLayersProgram();
    g_painter->setMatrixColor(mat4);
    g_painter->setOffset(m_offset);
    g_painter->drawTexturedRect(m_dest, m_texture, m_src);
    g_painter->resetShaderProgram();
}

void DrawQueueItemOutfit::draw(const Point& pos)
{
    if (!m_texture) return;
    Matrix4 mat4;
    for (int x = 0; x < 4; ++x) {
        Color color = Color::getOutfitColor((m_colors >> (x * 8)) & 0xFF);
        mat4(x + 1, 1) = color.rF();
        mat4(x + 1, 2) = color.gF();
        mat4(x + 1, 3) = color.bF();
        mat4(x + 1, 4) = color.aF();
    }
    g_painter->setDrawOutfitLayersProgram();
    g_painter->setMatrixColor(mat4);
    g_painter->setOffset(m_offset);
    g_painter->drawTexturedRect(Rect(pos, m_src.size()), m_texture, m_src);
    g_painter->resetShaderProgram();
}

void DrawQueueItemOutfitWithShader::draw()
{
    if (!m_texture) return;
    PainterShaderProgramPtr shader = g_shaders.getShader(m_shader);
    if (!shader) return DrawQueueItemTexturedRect::draw();
    bool useFramebuffer = m_dest.size() != m_src.size();

    if (useFramebuffer) {
        g_framebuffers.getTemporaryFrameBuffer()->resize(m_src.size());
        g_framebuffers.getTemporaryFrameBuffer()->bind();
        g_painter->clear(Color::alpha);
    }

    Matrix4 mat4;
    for (int x = 0; x < 4; ++x) {
        Color color = Color::getOutfitColor((m_colors >> (x * 8)) & 0xFF);
        mat4(x + 1, 1) = color.rF();
        mat4(x + 1, 2) = color.gF();
        mat4(x + 1, 3) = color.bF();
        mat4(x + 1, 4) = color.aF();
    }
    g_painter->setShaderProgram(shader);
    g_painter->setOffset(m_offset);
    shader->setMatrixColor(mat4);
    shader->setCenter(m_center);
    shader->bindMultiTextures();
    if (useFramebuffer) {
        g_painter->drawTexturedRect(Rect(0, 0, m_src.size()), m_texture, m_src);
    } else {
        g_painter->drawTexturedRect(m_dest, m_texture, m_src);
    }
    g_painter->resetShaderProgram();

    if (useFramebuffer) {
        g_framebuffers.getTemporaryFrameBuffer()->release();
        g_painter->resetColor();
        g_framebuffers.getTemporaryFrameBuffer()->draw(m_dest);
    }
}