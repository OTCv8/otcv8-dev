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

#include "uiitem.h"
#include "spritemanager.h"
#include "game.h"
#include <framework/otml/otml.h>
#include <framework/graphics/graphics.h>
#include <framework/graphics/fontmanager.h>

UIItem::UIItem()
{
    m_draggable = true;
}

void UIItem::drawSelf(Fw::DrawPane drawPane)
{
    if(drawPane != Fw::ForegroundPane)
        return;
    // draw style components in order
    if(m_backgroundColor.aF() > Fw::MIN_ALPHA) {
        Rect backgroundDestRect = m_rect;
        backgroundDestRect.expand(-m_borderWidth.top, -m_borderWidth.right, -m_borderWidth.bottom, -m_borderWidth.left);
        drawBackground(m_rect);
    }

    drawImage(m_rect);

    if(m_itemVisible && m_item) {
        Rect drawRect = getPaddingRect();

        int exactSize = std::max<int>(g_sprites.spriteSize(), m_item->getExactSize());
        if(exactSize == 0)
            return;

        m_item->setColor(m_color);
        m_item->draw(drawRect);

        if(m_font && m_showCount && (m_item->isStackable() || m_item->isChargeable()) && m_item->getCountOrSubType() > 1) {
            g_drawQueue->addText(m_font, m_countText, Rect(m_rect.topLeft(), m_rect.bottomRight() - Point(3, 0)), Fw::AlignBottomRight, Color(231, 231, 231));
        }

        if (m_showId) {
            g_drawQueue->addText(m_font, std::to_string(m_item->getServerId()), m_rect, Fw::AlignBottomRight, Color(231, 231, 231));
        }
    }

    drawBorder(m_rect);
    drawIcon(m_rect);
    drawText(m_rect);
}

void UIItem::setItemId(int id)
{
    if (!m_item && id != 0)
        m_item = Item::create(id);
    else {
        // remove item
        if (id == 0)
            m_item = nullptr;
        else
            m_item->setId(id);
    }

    if (m_item)
        m_item->setShader(m_shader);

    callLuaField("onItemChange");
}

void UIItem::setItemCount(int count)
{
    if (m_item) {
        m_item->setCount(count);
        callLuaField("onItemChange");
        cacheCountText();
    }
}
void UIItem::setItemSubType(int subType)
{
    if (m_item) {
        m_item->setSubType(subType);
        callLuaField("onItemChange");
    }
}

void UIItem::setItem(const ItemPtr& item)
{
    m_item = item;
    if (m_item) {
        m_item->setShader(m_shader);
        cacheCountText();
        callLuaField("onItemChange");
    }
}

void UIItem::setItemShader(const std::string& str)
{
    m_shader = str;

    if (m_item) {
        m_item->setShader(m_shader);
        callLuaField("onItemChange");
    }
}

void UIItem::onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)
{
    UIWidget::onStyleApply(styleName, styleNode);

    for(const OTMLNodePtr& node : styleNode->children()) {
        if(node->tag() == "item-id")
            setItemId(node->value<int>());
        else if(node->tag() == "item-count")
            setItemCount(node->value<int>());
        else if(node->tag() == "item-visible")
            setItemVisible(node->value<bool>());
        else if(node->tag() == "virtual")
            setVirtual(node->value<bool>());
        else if(node->tag() == "show-id")
            m_showId = node->value<bool>();
        else if(node->tag() == "shader")
            setItemShader(node->value());
    }
}

void UIItem::cacheCountText()
{
    int count = m_item->getCountOrSubType();
    if (!g_game.getFeature(Otc::GameCountU16) || count < 1000) {
        m_countText = std::to_string(count);
        return;
    }

    m_countText = stdext::format("%.0fk", count / 1000.0);
}