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

#ifndef OUTFIT_H
#define OUTFIT_H

#include <framework/util/color.h>
#include "thingtypemanager.h"
#include <framework/graphics/drawqueue.h>

class Outfit
{
public:
    Outfit();

    static Color getColor(int color)
    {
        return Color::getOutfitColor(color);
    }

    void draw(Point dest, Otc::Direction direction, uint walkAnimationPhase, bool animate = true, LightView* lightView = nullptr, bool ui = false);
    void draw(const Rect& dest, Otc::Direction direction, uint animationPhase, bool animate = true, bool ui = false, bool oldScaling = false);

    void setId(int id) { m_id = id; }
    void setAuxId(int id) { m_auxId = id; }
    void setHead(int head) { m_head = head; }
    void setBody(int body) { m_body = body; }
    void setLegs(int legs) { m_legs = legs; }
    void setFeet(int feet) { m_feet = feet; }
    void setAddons(int addons) { m_addons = addons; }
    void setMount(int mount) { m_mount = mount; }
    void setWings(int wings) { m_wings = wings; }
    void setAura(int aura) { m_aura = aura; }
    void setCategory(ThingCategory category) { m_category = category; }
    void setShader(const std::string& shader) { m_shader = shader; }
    void setHealthBar(uint8 id) { m_healthBar = id; }
    void setManaBar(uint8 id) { m_manaBar = id; }
    void setCenter(bool value) { m_center = value; }

    void resetClothes();
    void resetShader() { m_shader = ""; }

    int getId() const { return m_id; }
    int getAuxId() const { return m_auxId; }
    int getHead() const { return m_head; }
    int getBody() const { return m_body; }
    int getLegs() const { return m_legs; }
    int getFeet() const { return m_feet; }
    int getAddons() const { return m_addons; }
    int getMount() const { return m_mount; }
    int getWings() const { return m_wings; }
    int getAura() const { return m_aura; }
    ThingCategory getCategory() const { return m_category; }
    std::string getShader() const { return m_shader; }
    int getHealthBar() const { return m_healthBar; }
    int getManaBar() const { return m_manaBar; }

private:
    ThingCategory m_category;
    int m_id, m_auxId, m_head, m_body, m_legs, m_feet, m_addons, m_mount = 0, m_wings = 0, m_aura = 0;
    int m_healthBar = 0, m_manaBar = 0;
    std::string m_shader;
    bool m_center = false;
};

struct DrawQueueItemOutfit : public DrawQueueItemTexturedRect {
    DrawQueueItemOutfit(const Rect& rect, const TexturePtr& texture, const Rect& src, const Point& offset, int32_t colors, const Color& color, bool doCenter) :
        DrawQueueItemTexturedRect(rect, texture, src, color), m_offset(offset), m_colors(colors), m_doCenter(doCenter)
    {};

    void draw() override;
    void draw(const Point& pos) override;
    bool cache() override;

    Point m_offset;
    int32_t m_colors;
    bool m_doCenter;
};

struct DrawQueueItemOutfitWithShader : public DrawQueueItemTexturedRect {
    DrawQueueItemOutfitWithShader(const Rect& rect, const TexturePtr& texture, const Rect& src, const Point& offset, const Point& center, int32_t colors, const std::string& shader, bool doCenter) :
        DrawQueueItemTexturedRect(rect, texture, src, Color::white), m_offset(offset), m_center(center), m_colors(colors), m_shader(shader), m_doCenter(doCenter)
    {};

    void draw() override;
    void draw(const Point& pos) override
    {}
    bool cache() override
    {
        return false;
    }

    Point m_offset;
    Point m_center;
    int32_t m_colors;
    std::string m_shader;
    bool m_doCenter;
};

#endif
