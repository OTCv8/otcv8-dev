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

#include "uicreature.h"
#include "spritemanager.h"
#include <framework/otml/otml.h>
#include <framework/graphics/drawqueue.h>

void UICreature::drawSelf(Fw::DrawPane drawPane)
{
    if (drawPane != Fw::ForegroundPane)
        return;

    UIWidget::drawSelf(drawPane);

    if (m_creature) {
        if (m_autoRotating) {
            auto ticks = (g_clock.millis() % 4000) / 4;
            Otc::Direction new_dir;
            if (ticks < 250) {
                new_dir = Otc::South;
            } else if (ticks < 500) {
                new_dir = Otc::East;
            } else if (ticks < 750) {
                new_dir = Otc::North;
            } else {
                new_dir = Otc::West;
            }
            if (new_dir != m_direction) {
                m_direction = new_dir;
            }
        }

        m_creature->drawOutfit(Rect(getPaddingRect().topLeft(), getSize() * m_scale), m_direction, m_imageColor, m_animate, true, m_oldScaling);
    }
}

void UICreature::setOutfit(const Outfit& outfit)
{
    if (!m_creature)
        m_creature = CreaturePtr(new Creature);
    m_direction = Otc::South;
    m_creature->setOutfit(outfit);
}

void UICreature::onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)
{
    UIWidget::onStyleApply(styleName, styleNode);

    for (const OTMLNodePtr& node : styleNode->children()) {
        if (node->tag() == "fixed-creature-size")
            setFixedCreatureSize(node->value<bool>());
        else if (node->tag() == "outfit-id") {
            Outfit outfit = getOutfit();
            outfit.setId(node->value<int>());
            setOutfit(outfit);
        } else if (node->tag() == "outfit-head") {
            Outfit outfit = getOutfit();
            outfit.setHead(node->value<int>());
            setOutfit(outfit);
        } else if (node->tag() == "outfit-body") {
            Outfit outfit = getOutfit();
            outfit.setBody(node->value<int>());
            setOutfit(outfit);
        } else if (node->tag() == "outfit-legs") {
            Outfit outfit = getOutfit();
            outfit.setLegs(node->value<int>());
            setOutfit(outfit);
        } else if (node->tag() == "outfit-feet") {
            Outfit outfit = getOutfit();
            outfit.setFeet(node->value<int>());
            setOutfit(outfit);
        } else if (node->tag() == "outfit-addons") {
            Outfit outfit = getOutfit();
            outfit.setAddons(node->value<int>());
            setOutfit(outfit);
        } else if (node->tag() == "outfit-mount") {
            Outfit outfit = getOutfit();
            outfit.setMount(node->value<int>());
            setOutfit(outfit);
        } else if (node->tag() == "outfit-wings") {
            Outfit outfit = getOutfit();
            outfit.setWings(node->value<int>());
            setOutfit(outfit);
        } else if (node->tag() == "outfit-aura") {
            Outfit outfit = getOutfit();
            outfit.setAura(node->value<int>());
            setOutfit(outfit);
        } else if (node->tag() == "outfit-shader") {
            Outfit outfit = getOutfit();
            outfit.setShader(node->value<std::string>());
            setOutfit(outfit);
        } else if (node->tag() == "outfit-center") {
            setCenter(node->value<bool>());
        } else if (node->tag() == "scale") {
            setScale(node->value<float>());
        } else if (node->tag() == "animate") {
            setAnimate(node->value<bool>());
        } else if (node->tag() == "old-scaling") {
            setOldScaling(node->value<bool>());
        }
    }
}

void UICreature::onGeometryChange(const Rect& oldRect, const Rect& newRect)
{
    UIWidget::onGeometryChange(oldRect, newRect);
}

void UICreature::setCenter(bool value)
{
    Outfit outfit = getOutfit();
    outfit.setCenter(value);
    setOutfit(outfit);
}