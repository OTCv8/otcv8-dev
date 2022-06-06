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

#ifndef UICREATURE_H
#define UICREATURE_H

#include "declarations.h"
#include <framework/ui/uiwidget.h>
#include "creature.h"

class UICreature : public UIWidget
{
public:
    void drawSelf(Fw::DrawPane drawPane);

    void setCreature(const CreaturePtr& creature) { m_creature = creature; }
    void setFixedCreatureSize(bool fixed) { m_scale = fixed ? 1.0 : 0; }
    void setOutfit(const Outfit& outfit);

    CreaturePtr getCreature() { return m_creature; }
    Outfit getOutfit() { return m_creature ? m_creature->getOutfit() : Outfit(); }
    bool isFixedCreatureSize() { return m_scale > 0; }

    void setAutoRotating(bool value) { m_autoRotating = value; }
    void setDirection(Otc::Direction direction) { m_direction = direction; }
    Otc::Direction getDirection() { return m_direction; }

    void setScale(float scale) { m_scale = scale; }
    float getScale() { return m_scale; }

    void setAnimate(bool value) { m_animate = value; }
    bool isAnimating() { return m_animate; }

    void setCenter(bool value);

    void setOldScaling(bool value) { m_oldScaling = value; }

protected:
    void onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode);
    void onGeometryChange(const Rect& oldRect, const Rect& newRect) override;

    CreaturePtr m_creature;
    stdext::boolean<false> m_autoRotating;
    stdext::boolean<false> m_animate;
    stdext::boolean<false> m_oldScaling;
    Otc::Direction m_direction = Otc::South;
    float m_scale = 1.0;
};

#endif
