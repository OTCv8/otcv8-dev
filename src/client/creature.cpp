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

#include "creature.h"
#include "thingtypemanager.h"
#include "localplayer.h"
#include "map.h"
#include "tile.h"
#include "item.h"
#include "game.h"
#include "effect.h"
#include "luavaluecasts_client.h"
#include "lightview.h"
#include "healthbars.h"

#include <framework/graphics/graphics.h>
#include <framework/core/eventdispatcher.h>
#include <framework/core/clock.h>
#include <framework/core/graphicalapplication.h>

#include <framework/graphics/paintershaderprogram.h>
#include <framework/graphics/texturemanager.h>
#include <framework/graphics/framebuffermanager.h>
#include "spritemanager.h"

#include <framework/util/stats.h>
#include <framework/util/extras.h>

std::array<double, Otc::LastSpeedFormula> Creature::m_speedFormula = { -1,-1,-1 };

Creature::Creature() : Thing()
{
    m_id = 0;
    m_healthPercent = 100;
    m_manaPercent = -1;
    m_speed = 200;
    m_direction = Otc::South;
    m_walkDirection = Otc::South;
    m_walkAnimationPhase = 0;
    m_walkedPixels = 0;
    m_skull = Otc::SkullNone;
    m_shield = Otc::ShieldNone;
    m_emblem = Otc::EmblemNone;
    m_type = Proto::CreatureTypeUnknown;
    m_icon = Otc::NpcIconNone;
    m_lastStepDirection = Otc::InvalidDirection;
    m_footLastStep = 0;
    m_nameCache.setFont(g_fonts.getFont("verdana-11px-rounded"));
    m_nameCache.setAlign(Fw::AlignTopCenter);
    m_footStep = 0;
    //m_speedFormula.fill(-1);
    m_outfitColor = Color::white;
    m_progressBarPercent = 0;
    m_progressBarUpdateEvent = nullptr;
    g_stats.addCreature();
}

Creature::~Creature()
{
    g_stats.removeCreature();
}

void Creature::draw(const Point& dest, bool animate, LightView* lightView)
{   
    if (!canBeSeen())
        return;

    const int sprSize = g_sprites.spriteSize();
    Point jumpOffset = Point(m_jumpOffset.x, m_jumpOffset.y);
    Point creatureCenter = dest - jumpOffset + m_walkOffset - getDisplacement() + Point(sprSize / 2, sprSize / 2);
    drawBottomWidgets(creatureCenter, m_walking ? m_walkDirection : m_direction);

    Point animationOffset = animate ? m_walkOffset : Point(0, 0);

    if (m_showTimedSquare && animate) {
        g_drawQueue->addBoundingRect(Rect(dest - jumpOffset + (animationOffset - getDisplacement() + 2 * g_sprites.getOffsetFactor()), Size(sprSize - 4 * g_sprites.getOffsetFactor(), sprSize - 4 * g_sprites.getOffsetFactor())), 2 * g_sprites.getOffsetFactor(), m_timedSquareColor);
    }

    if (m_showStaticSquare && animate) {
        g_drawQueue->addBoundingRect(Rect(dest - jumpOffset + (animationOffset - getDisplacement()), Size(sprSize, sprSize)), 2 * g_sprites.getOffsetFactor(), m_staticSquareColor);
    }

    if (m_outfit.getCategory() != ThingCategoryCreature)
        animationOffset -= getDisplacement();

    size_t drawQueueSize = g_drawQueue->size();
    m_outfit.draw(dest - jumpOffset + animationOffset, m_walking ? m_walkDirection : m_direction, m_walkAnimationPhase, true, lightView);
    if (m_marked) {
        g_drawQueue->setMark(drawQueueSize, updatedMarkedColor());
    }

    drawTopWidgets(creatureCenter, m_walking ? m_walkDirection : m_direction);

    Light light = rawGetThingType()->getLight();
    if (m_light.intensity != light.intensity || m_light.color != light.color)
        light = m_light;

    // local player always have a minimum light in complete darkness
    if (isLocalPlayer()) {
        light.intensity = std::max<uint8>(light.intensity, 2);
        if (light.color == 0 || light.color > 215)
            light.color = 215;
    }
    
    if(lightView)
        lightView->addLight(creatureCenter, light);
}

void Creature::drawOutfit(const Rect& destRect, Otc::Direction direction, const Color& color, bool animate, bool ui, bool oldScaling)
{
    if (direction == Otc::InvalidDirection)
        direction = m_direction;

    m_outfit.draw(destRect, direction, 0, animate, ui, oldScaling);
}

void Creature::drawInformation(const Point& point, bool useGray, const Rect& parentRect, int drawFlags)
{
    if (!g_game.getFeature(Otc::GameOldInformationBar) && g_game.getClientVersion() >= 760) {
        if (m_healthPercent < 1)  // creature is dead, we get rid of its information bar
            return;
    }

    Color fillColor = Color(96, 96, 96);

    if (!useGray)
        fillColor = m_informationColor;

    // calculate main rects - hp/mana
    Rect backgroundRect = Rect(point.x + m_informationOffset.x - (13.5), point.y + m_informationOffset.y, 27, 4);
    backgroundRect.bind(parentRect);

    //debug            
    if (g_extras.debugWalking) {
        int footDelay = (getStepDuration(true)) / 3;
        int footAnimPhases = getWalkAnimationPhases() - 1;
        m_nameCache.setText(stdext::format("%i %i %i %i %i\n %i %i\n%i %i %i\n%i %i %i %i %i",
            (int)m_stepDuration, (int)getStepDuration(true), getStepDuration(false), (int)m_walkedPixels, (int)m_walkTimer.ticksElapsed(),
                                           (int)m_walkOffset.x, (int)m_walkOffset.y,
                                           (int)m_speed, (int)getTile()->getGroundSpeed(), (int)g_game.getWalkId(),
                                           (int)(g_clock.millis() - m_footLastStep), (int)footDelay, (int)footAnimPhases, (int)m_walkAnimationPhase, (int)stdext::millis()));
    }

    Size nameSize = m_nameCache.getTextSize();
    Rect textRect = Rect(point.x + m_informationOffset.x - nameSize.width() / 2.0, point.y + m_informationOffset.y - 12, nameSize);
    textRect.bind(parentRect);

    // distance them
    uint32 offset = 12;
    if (isLocalPlayer()) {
        offset *= 2;
    }

    if (textRect.top() == parentRect.top())
        backgroundRect.moveTop(textRect.top() + offset);
    if (backgroundRect.bottom() == parentRect.bottom())
        textRect.moveTop(backgroundRect.top() - offset);

    HealthBarPtr healthBar = nullptr;
    HealthBarPtr manaBar = nullptr;
    if (g_game.getFeature(Otc::GameHealthInfoBackground)) {
        if (m_outfit.getHealthBar() > 0) {
            healthBar = g_healthBars.getHealthBar(m_outfit.getHealthBar());
        }
        if (m_outfit.getManaBar() > 0) {
            manaBar = g_healthBars.getManaBar(m_outfit.getManaBar());
        }
    }

    if (healthBar) {
        backgroundRect.setHeight(healthBar->getHeight());
        backgroundRect.moveTop(backgroundRect.top() + healthBar->getBarOffset().y);
        backgroundRect.moveLeft(backgroundRect.left() + healthBar->getBarOffset().x);
    }

    // health rect is based on background rect, so no worries
    Rect healthRect = backgroundRect.expanded(-1);
    healthRect.setWidth((m_healthPercent / 100.0) * 25);

    // draw
    if (g_game.getFeature(Otc::GameBlueNpcNameColor) && isNpc() && m_healthPercent == 100 && !useGray)
        fillColor = Color(0x66, 0xcc, 0xff);

    if (drawFlags & Otc::DrawBars && (!isNpc() || !g_game.getFeature(Otc::GameHideNpcNames))) {
        if (healthBar) {
            TexturePtr barTexture = healthBar->getTexture();
            Rect barRect = Rect(backgroundRect.x() + healthBar->getOffset().x, backgroundRect.y() + healthBar->getOffset().y, barTexture->getSize());
            g_drawQueue->addTexturedRect(barRect, barTexture, Rect(0, 0, barTexture->getSize()));
        }
        g_drawQueue->addFilledRect(backgroundRect, Color::black);
        g_drawQueue->addFilledRect(healthRect, fillColor);

        if (drawFlags & Otc::DrawManaBar) {
            int8 manaPercent = m_manaPercent;
            if (isLocalPlayer()) {
                LocalPlayerPtr player = g_game.getLocalPlayer();
                if (player) {
                    double maxMana = player->getMaxMana();
                    if (maxMana == 0) {
                        manaPercent = 100;
                    } else {
                        manaPercent = (player->getMana() * 100) / maxMana;
                    }
                }
            }
            if (manaPercent >= 0) {
                backgroundRect.moveTop(backgroundRect.bottom());
                if (healthBar) {
                    backgroundRect.moveTop(backgroundRect.top() + healthBar->getBarOffset().y + 1);
                }
                if (manaBar) {
                    if (!healthBar) {
                        backgroundRect.moveTop(backgroundRect.top() + 1);
                    }
                    backgroundRect.setHeight(manaBar->getHeight());
                    backgroundRect.moveTop(backgroundRect.top() + manaBar->getBarOffset().y);
                    backgroundRect.moveLeft(backgroundRect.left() + manaBar->getBarOffset().x);

                    TexturePtr barTexture = manaBar->getTexture();
                    Rect barRect = Rect(backgroundRect.x() + manaBar->getOffset().x, backgroundRect.y() + manaBar->getOffset().y, barTexture->getSize());
                    g_drawQueue->addTexturedRect(barRect, barTexture, Rect(0, 0, barTexture->getSize()));
                }
                g_drawQueue->addFilledRect(backgroundRect, Color::black);

                Rect manaRect = backgroundRect.expanded(-1);
                manaRect.setWidth(((float)manaPercent / 100.f) * 25);
                g_drawQueue->addFilledRect(manaRect, Color::blue);
            }
        }

        if (getProgressBarPercent()) {
            backgroundRect.moveTop(backgroundRect.bottom());

            g_drawQueue->addFilledRect(backgroundRect, Color::black);

            Rect progressBarRect = backgroundRect.expanded(-1);
            double maxBar = 100;
            progressBarRect.setWidth(getProgressBarPercent() / (maxBar * 1.0) * 25);

            g_drawQueue->addFilledRect(progressBarRect, Color::white);
        }
    }

    if (drawFlags & Otc::DrawNames) {
        m_nameCache.draw(textRect, fillColor);

        if (m_titleCache.hasText()) {
            Size titleSize = m_titleCache.getTextSize();
            Point textCenter = textRect.topCenter();
            textRect.setSize(titleSize);
            textRect.moveBottomCenter(textCenter);
            m_titleCache.draw(textRect, m_titleColor);
        }

        if (m_text) {
            auto extraTextSize = m_text->getCachedText().getTextSize();
            Rect extraTextRect = Rect(point.x + m_informationOffset.x - extraTextSize.width() / 2.0, point.y + m_informationOffset.y + 15, extraTextSize);
            m_text->drawText(extraTextRect.center(), extraTextRect);
        }
    }

    if (!(drawFlags & Otc::DrawIcons))
        return;

    if (m_skull != Otc::SkullNone && m_skullTexture) {
        Rect skullRect = Rect(backgroundRect.x() + 13.5 + 12, backgroundRect.y() + 5, m_skullTexture->getSize());
        g_drawQueue->addTexturedRect(skullRect, m_skullTexture, Rect(0, 0, m_skullTexture->getSize()));
    }
    if (m_shield != Otc::ShieldNone && m_shieldTexture && m_showShieldTexture) {
        Rect shieldRect = Rect(backgroundRect.x() + 13.5, backgroundRect.y() + 5, m_shieldTexture->getSize());
        g_drawQueue->addTexturedRect(shieldRect, m_shieldTexture, Rect(0, 0, m_shieldTexture->getSize()));
    }
    if (m_emblem != Otc::EmblemNone && m_emblemTexture) {
        Rect emblemRect = Rect(backgroundRect.x() + 13.5 + 12, backgroundRect.y() + 16, m_emblemTexture->getSize());
        g_drawQueue->addTexturedRect(emblemRect, m_emblemTexture, Rect(0, 0, m_emblemTexture->getSize()));
    }
    if (m_type != Proto::CreatureTypeUnknown && m_typeTexture) {
        Rect typeRect = Rect(backgroundRect.x() + 13.5 + 12 + 12, backgroundRect.y() + 16, m_typeTexture->getSize());
        g_drawQueue->addTexturedRect(typeRect, m_typeTexture, Rect(0, 0, m_typeTexture->getSize()));
    }
    if (m_icon != Otc::NpcIconNone && m_iconTexture) {
        Rect iconRect = Rect(backgroundRect.x() + 13.5 + 12, backgroundRect.y() + 5, m_iconTexture->getSize());
        g_drawQueue->addTexturedRect(iconRect, m_iconTexture, Rect(0, 0, m_iconTexture->getSize()));
    }
}

bool Creature::isInsideOffset(Point offset)
{
    // for worse precision:
    // Rect rect(getDrawOffset() - (m_walking ? m_walkOffset : Point(0,0)), Size(Otc::TILE_PIXELS - getDisplacementY(), Otc::TILE_PIXELS - getDisplacementX()));
    Rect rect(getDrawOffset() - getDisplacement(), Size(g_sprites.spriteSize(), g_sprites.spriteSize()));
    return rect.contains(offset);
}

bool Creature::canShoot(int distance)
{
    return getTile() ? getTile()->canShoot(distance) : false;
}

void Creature::turn(Otc::Direction direction)
{
    setDirection(direction);
    callLuaField("onTurn", direction);
}

void Creature::walk(const Position& oldPos, const Position& newPos)
{
    if (oldPos == newPos)
        return;

    // get walk direction
    m_lastStepDirection = oldPos.getDirectionFromPosition(newPos);
    m_lastStepFromPosition = oldPos;
    m_lastStepToPosition = newPos;

    // set current walking direction
    setDirection(m_lastStepDirection);
    m_walkDirection = m_direction;

    // starts counting walk
    m_walking = true;
    m_walkTimer.restart();
    m_walkedPixels = 0;

    if (m_walkFinishAnimEvent) {
        m_walkFinishAnimEvent->cancel();
        m_walkFinishAnimEvent = nullptr;
    }

    // starts updating walk
    nextWalkUpdate();
}

void Creature::stopWalk()
{
    if (!m_walking)
        return;

    // stops the walk right away
    terminateWalk();
}

void Creature::jump(int height, int duration)
{
    if (!m_jumpOffset.isNull())
        return;

    m_jumpTimer.restart();
    m_jumpHeight = height;
    m_jumpDuration = duration;

    updateJump();
}

void Creature::updateJump()
{
    int t = m_jumpTimer.ticksElapsed();
    double a = -4 * m_jumpHeight / (m_jumpDuration * m_jumpDuration);
    double b = +4 * m_jumpHeight / (m_jumpDuration);

    double height = a * t * t + b * t;
    int roundHeight = stdext::round(height);
    int halfJumpDuration = m_jumpDuration / 2;

    // schedules next update
    if (m_jumpTimer.ticksElapsed() < m_jumpDuration) {
        m_jumpOffset = PointF(height, height);

        int diff = 0;
        if (m_jumpTimer.ticksElapsed() < halfJumpDuration)
            diff = 1;
        else if (m_jumpTimer.ticksElapsed() > halfJumpDuration)
            diff = -1;

        int nextT, i = 1;
        do {
            nextT = stdext::round((-b + std::sqrt(std::max<double>(b * b + 4 * a * (roundHeight + diff * i), 0.0)) * diff) / (2 * a));
            ++i;

            if (nextT < halfJumpDuration)
                diff = 1;
            else if (nextT > halfJumpDuration)
                diff = -1;
        } while (nextT - m_jumpTimer.ticksElapsed() == 0 && i < 3);

        auto self = static_self_cast<Creature>();
        g_dispatcher.scheduleEvent([self] {
            self->updateJump();
        }, nextT - m_jumpTimer.ticksElapsed());
    } else
        m_jumpOffset = PointF(0, 0);
}

void Creature::onPositionChange(const Position& newPos, const Position& oldPos)
{
    callLuaField("onPositionChange", newPos, oldPos);
}

void Creature::onAppear()
{
    // cancel any disappear event
    if (m_disappearEvent) {
        m_disappearEvent->cancel();
        m_disappearEvent = nullptr;
    }

    // creature appeared the first time or wasn't seen for a long time
    if (m_removed) {
        stopWalk();
        m_removed = false;
        callLuaField("onAppear");
        // walk
    } else if (m_oldPosition != m_position && m_oldPosition.isInRange(m_position, 1, 1) && m_allowAppearWalk) {
        m_allowAppearWalk = false;
        walk(m_oldPosition, m_position);
        callLuaField("onWalk", m_oldPosition, m_position);
        // teleport
    } else if (m_oldPosition != m_position) {
        stopWalk();
        callLuaField("onDisappear");
        callLuaField("onAppear");
    } // else turn
}

void Creature::onDisappear()
{
    if (m_disappearEvent)
        m_disappearEvent->cancel();

    m_oldPosition = m_position;

    // a pair onDisappear and onAppear events are fired even when creatures walks or turns,
    // so we must filter
    auto self = static_self_cast<Creature>();
    m_disappearEvent = g_dispatcher.addEvent([self] {
        self->m_removed = true;
        self->stopWalk();

        self->callLuaField("onDisappear");

        // invalidate this creature position
        if (!self->isLocalPlayer())
            self->setPosition(Position());
        self->m_oldPosition = Position();
        self->m_disappearEvent = nullptr;
        self->clearWidgets();
    });
}

void Creature::onDeath()
{
    callLuaField("onDeath");
}

int Creature::getWalkAnimationPhases()
{
    if (!getAnimator())
        return getAnimationPhases();
    return getAnimator()->getAnimationPhases() + (g_game.getFeature(Otc::GameIdleAnimations) ? 1 : 0);
}

void Creature::updateWalkAnimation(uint8 totalPixelsWalked)
{
    // update outfit animation
    if (m_outfit.getCategory() != ThingCategoryCreature)
        return;

    int footAnimPhases = getWalkAnimationPhases() - 1;
    // TODO, should be /2 for <= 810
    uint16 footDelay = getStepDuration(true);
    if (footAnimPhases > 0) {
        footDelay = ((getStepDuration(true) + 20) / (g_game.getFeature(Otc::GameFasterAnimations) ? footAnimPhases * 2 : footAnimPhases));
    }
    if (!g_game.getFeature(Otc::GameFasterAnimations))
        footDelay += 10;
    if (footDelay < 20)
        footDelay = 20;

    // Since mount is a different outfit we need to get the mount animation phases
    if (m_outfit.getMount() != 0) {
        ThingType* type = g_things.rawGetThingType(m_outfit.getMount(), m_outfit.getCategory());
        footAnimPhases = std::min<int>(footAnimPhases, type->getAnimationPhases() - 1);
    }

    if (footAnimPhases == 0) {
        m_walkAnimationPhase = 0;
    } else if (g_clock.millis() >= m_footLastStep + footDelay && totalPixelsWalked < g_sprites.spriteSize()) {
        m_footStep++;
        m_walkAnimationPhase = 1 + (m_footStep % footAnimPhases);
        m_footLastStep = (g_clock.millis() - m_footLastStep) > footDelay * 1.5 ? g_clock.millis() : m_footLastStep + footDelay;
    } else if (m_walkAnimationPhase == 0 && totalPixelsWalked < g_sprites.spriteSize()) {
        m_walkAnimationPhase = 1 + (m_footStep % footAnimPhases);
    }

    if (totalPixelsWalked == g_sprites.spriteSize() && !m_walkFinishAnimEvent) {
        auto self = static_self_cast<Creature>();
        m_walkFinishAnimEvent = g_dispatcher.scheduleEvent([self] {
            self->m_footStep = 0;
            self->m_walkAnimationPhase = 0;
            self->m_walkFinishAnimEvent = nullptr;
        }, 50);
    }

}

void Creature::updateWalkOffset(uint8 totalPixelsWalked, bool inNextFrame)
{
    Point& walkOffset = inNextFrame ? m_walkOffsetInNextFrame : m_walkOffset;
    walkOffset = Point(0, 0);
    if (m_walkDirection == Otc::North || m_walkDirection == Otc::NorthEast || m_walkDirection == Otc::NorthWest)
        walkOffset.y = g_sprites.spriteSize() - totalPixelsWalked;
    else if (m_walkDirection == Otc::South || m_walkDirection == Otc::SouthEast || m_walkDirection == Otc::SouthWest)
        walkOffset.y = totalPixelsWalked - g_sprites.spriteSize();

    if (m_walkDirection == Otc::East || m_walkDirection == Otc::NorthEast || m_walkDirection == Otc::SouthEast)
        walkOffset.x = totalPixelsWalked - g_sprites.spriteSize();
    else if (m_walkDirection == Otc::West || m_walkDirection == Otc::NorthWest || m_walkDirection == Otc::SouthWest)
        walkOffset.x = g_sprites.spriteSize() - totalPixelsWalked;
}

void Creature::updateWalkingTile()
{
    // determine new walking tile
    TilePtr newWalkingTile;
    Rect virtualCreatureRect(g_sprites.spriteSize() + (m_walkOffset.x - getDisplacementX()),
        g_sprites.spriteSize() + (m_walkOffset.y - getDisplacementY()),
        g_sprites.spriteSize(), g_sprites.spriteSize());
    for (int xi = -1; xi <= 1 && !newWalkingTile; ++xi) {
        for (int yi = -1; yi <= 1 && !newWalkingTile; ++yi) {
            Rect virtualTileRect((xi + 1) * g_sprites.spriteSize(), (yi + 1) * g_sprites.spriteSize(), g_sprites.spriteSize(), g_sprites.spriteSize());

            // only render creatures where bottom right is inside tile rect
            if (virtualTileRect.contains(virtualCreatureRect.bottomRight())) {
                newWalkingTile = g_map.getOrCreateTile(getPrewalkingPosition().translated(xi, yi, 0));
            }
        }
    }

    if (newWalkingTile != m_walkingTile) {
        if (m_walkingTile)
            m_walkingTile->removeWalkingCreature(static_self_cast<Creature>());
        if (newWalkingTile) {
            newWalkingTile->addWalkingCreature(static_self_cast<Creature>());

            // recache visible tiles in map views
            if (newWalkingTile->isEmpty())
                g_map.notificateTileUpdate(newWalkingTile->getPosition());
        }
        m_walkingTile = newWalkingTile;
    }
}

void Creature::nextWalkUpdate()
{
    // remove any previous scheduled walk updates
    if (m_walkUpdateEvent)
        m_walkUpdateEvent->cancel();

    // do the update
    updateWalk();

    // schedules next update
    if (!m_walking) {
        return;
    }
	
	auto self = static_self_cast<Creature>();
    m_walkUpdateEvent = g_dispatcher.scheduleEvent([self]{
        self->m_walkUpdateEvent = nullptr;
        self->nextWalkUpdate();
    }, g_game.getFeature(Otc::GameNewUpdateWalk) ? 
        std::max(getStepDuration(true) / std::max(g_app.getFps(), 1), 1) : (float)getStepDuration() / g_sprites.spriteSize()
    );
}

void Creature::updateWalk()
{
    float walkTicksPerPixel = ((float)(getStepDuration(true) + (g_game.getFeature(Otc::GameNewUpdateWalk) ? 0 : 10))) / (float)g_sprites.spriteSize();
    uint8 totalPixelsWalked = std::min<uint8>(m_walkTimer.ticksElapsed() / walkTicksPerPixel, g_sprites.spriteSize());
    uint8 totalPixelsWalkedInNextFrame = std::min<uint8>((m_walkTimer.ticksElapsed() + (g_game.getFeature(Otc::GameNewUpdateWalk) ? std::max(1000.f / g_app.getFps(), 1.0f) : 15)) / walkTicksPerPixel, g_sprites.spriteSize());

    // needed for paralyze effect
    m_walkedPixels = std::max<uint8>(m_walkedPixels, totalPixelsWalked);
    uint8 walkedPixelsInNextFrame = std::max<uint8>(m_walkedPixels, totalPixelsWalkedInNextFrame);

    // update walk animation and offsets
    updateWalkAnimation(totalPixelsWalked);
    updateWalkOffset(m_walkedPixels);
    updateWalkOffset(walkedPixelsInNextFrame, true);
    updateWalkingTile();

    // terminate walk
    if (!isLocalPlayer() && m_walking && m_walkTimer.ticksElapsed() >= getStepDuration())
        terminateWalk();
}

void Creature::terminateWalk()
{
    // remove any scheduled walk update
    if (m_walkUpdateEvent) {
        m_walkUpdateEvent->cancel();
        m_walkUpdateEvent = nullptr;
    }

    if (m_walkingTile) {
        m_walkingTile->removeWalkingCreature(static_self_cast<Creature>());
        m_walkingTile = nullptr;
    }

    m_walking = false;
    m_walkedPixels = 0;
    m_walkOffset = Point(0, 0);
    m_walkOffsetInNextFrame = Point(0, 0);

    // reset walk animation states
    if (!m_walkFinishAnimEvent) {
        auto self = static_self_cast<Creature>();
        m_walkFinishAnimEvent = g_dispatcher.scheduleEvent([self] {
            self->m_footStep = 0;
            self->m_walkAnimationPhase = 0;
            self->m_walkFinishAnimEvent = nullptr;
        }, 50);
    }
}

void Creature::setName(const std::string& name)
{
    m_nameCache.setText(name);
    m_name = name;
}

void Creature::setHealthPercent(uint8 healthPercent)
{
    if (healthPercent > 100)
        healthPercent = 100;

    if (!m_useCustomInformationColor) {
        if (healthPercent > 92)
            m_informationColor = Color(0x00, 0xBC, 0x00);
        else if (healthPercent > 60)
            m_informationColor = Color(0x50, 0xA1, 0x50);
        else if (healthPercent > 30)
            m_informationColor = Color(0xA1, 0xA1, 0x00);
        else if (healthPercent > 8)
            m_informationColor = Color(0xBF, 0x0A, 0x0A);
        else if (healthPercent > 3)
            m_informationColor = Color(0x91, 0x0F, 0x0F);
        else
            m_informationColor = Color(0x2C, 0x0F, 0x0F);
    }

    bool changed = m_healthPercent != healthPercent;
    m_healthPercent = healthPercent;
    if (changed) {
        callLuaField("onHealthPercentChange", healthPercent);
    }

    if (healthPercent <= 0)
        onDeath();
}

void Creature::setDirection(Otc::Direction direction)
{
    VALIDATE(direction != Otc::InvalidDirection);
    m_direction = direction;
}

void Creature::setOutfit(const Outfit& outfit)
{
    Outfit oldOutfit = m_outfit;
    if (outfit.getCategory() != ThingCategoryCreature) {
        if (!g_things.isValidDatId(outfit.getAuxId(), outfit.getCategory()))
            return;
        m_outfit.setAuxId(outfit.getAuxId());
        m_outfit.setCategory(outfit.getCategory());
        m_outfit.setWings(0);
        m_outfit.setAura(0);
    } else {
        if (outfit.getId() > 0 && !g_things.isValidDatId(outfit.getId(), ThingCategoryCreature))
            return;
        m_outfit = outfit;
    }
    m_walkAnimationPhase = 0; // might happen when player is walking and outfit is changed.

    callLuaField("onOutfitChange", m_outfit, oldOutfit);
}

void Creature::setOutfitColor(const Color& color, int duration)
{
    if (m_outfitColorUpdateEvent) {
        m_outfitColorUpdateEvent->cancel();
        m_outfitColorUpdateEvent = nullptr;
    }

    if (duration > 0) {
        Color delta = (color - m_outfitColor) / (float)duration;
        m_outfitColorTimer.restart();
        updateOutfitColor(m_outfitColor, color, delta, duration);
    } else
        m_outfitColor = color;
}

void Creature::updateOutfitColor(Color color, Color finalColor, Color delta, int duration)
{
    if (m_outfitColorTimer.ticksElapsed() < duration) {
        m_outfitColor = color + delta * m_outfitColorTimer.ticksElapsed();

        auto self = static_self_cast<Creature>();
        m_outfitColorUpdateEvent = g_dispatcher.scheduleEvent([=] {
            self->updateOutfitColor(color, finalColor, delta, duration);
        }, 100);
    } else {
        m_outfitColor = finalColor;
    }
}

void Creature::setSpeed(uint16 speed)
{
    uint16 oldSpeed = m_speed;
    m_speed = speed;

    // speed can change while walking (utani hur, paralyze, etc..)
    if (m_walking)
        nextWalkUpdate();

    callLuaField("onSpeedChange", m_speed, oldSpeed);
}

void Creature::setBaseSpeed(double baseSpeed)
{
    if (m_baseSpeed != baseSpeed) {
        double oldBaseSpeed = m_baseSpeed;
        m_baseSpeed = baseSpeed;

        callLuaField("onBaseSpeedChange", baseSpeed, oldBaseSpeed);
    }
}

void Creature::setSkull(uint8 skull)
{
    m_skull = skull;
    callLuaField("onSkullChange", m_skull);
}

void Creature::setShield(uint8 shield)
{
    m_shield = shield;
    callLuaField("onShieldChange", m_shield);
}

void Creature::setEmblem(uint8 emblem)
{
    m_emblem = emblem;
    callLuaField("onEmblemChange", m_emblem);
}

void Creature::setType(uint8 type)
{
    m_type = type;
    callLuaField("onTypeChange", m_type);
}

void Creature::setIcon(uint8 icon)
{
    m_icon = icon;
    callLuaField("onIconChange", m_icon);
}

void Creature::setSkullTexture(const std::string& filename)
{
    m_skullTexture = g_textures.getTexture(filename);
}

void Creature::setShieldTexture(const std::string& filename, bool blink)
{
    m_shieldTexture = g_textures.getTexture(filename);
    m_showShieldTexture = true;

    if (blink && !m_shieldBlink) {
        auto self = static_self_cast<Creature>();
        g_dispatcher.scheduleEvent([self]() {
            self->updateShield();
        }, SHIELD_BLINK_TICKS);
    }

    m_shieldBlink = blink;
}

void Creature::setEmblemTexture(const std::string& filename)
{
    m_emblemTexture = g_textures.getTexture(filename);
}

void Creature::setTypeTexture(const std::string& filename)
{
    m_typeTexture = g_textures.getTexture(filename);
}

void Creature::setIconTexture(const std::string& filename)
{
    m_iconTexture = g_textures.getTexture(filename);
}

void Creature::setSpeedFormula(double speedA, double speedB, double speedC)
{
    m_speedFormula[Otc::SpeedFormulaA] = speedA;
    m_speedFormula[Otc::SpeedFormulaB] = speedB;
    m_speedFormula[Otc::SpeedFormulaC] = speedC;
}

bool Creature::hasSpeedFormula()
{
    return m_speedFormula[Otc::SpeedFormulaA] != -1 && m_speedFormula[Otc::SpeedFormulaB] != -1
        && m_speedFormula[Otc::SpeedFormulaC] != -1;
}

void Creature::addTimedSquare(uint8 color)
{
    m_showTimedSquare = true;
    m_timedSquareColor = Color::from8bit(color);

    // schedule removal
    auto self = static_self_cast<Creature>();
    g_dispatcher.scheduleEvent([self]() {
        self->removeTimedSquare();
    }, VOLATILE_SQUARE_DURATION);
}


void Creature::updateShield()
{
    m_showShieldTexture = !m_showShieldTexture;

    if (m_shield != Otc::ShieldNone && m_shieldBlink) {
        auto self = static_self_cast<Creature>();
        g_dispatcher.scheduleEvent([self]() {
            self->updateShield();
        }, SHIELD_BLINK_TICKS);
    } else if (!m_shieldBlink)
        m_showShieldTexture = true;
}

Point Creature::getDrawOffset()
{
    Point drawOffset;
    if (m_walking) {
        if (m_walkingTile)
            drawOffset -= Point(1, 1) * m_walkingTile->getDrawElevation() * g_sprites.getOffsetFactor();
        drawOffset += m_walkOffset;
    } else {
        const TilePtr& tile = getTile();
        if (tile)
            drawOffset -= Point(1, 1) * tile->getDrawElevation() * g_sprites.getOffsetFactor();
    }
    return drawOffset;
}

uint16 Creature::getStepDuration(bool ignoreDiagonal, Otc::Direction dir)
{
    uint16 speed = m_speed;
    if (speed < 1)
        return 0;

    if (g_game.getFeature(Otc::GameNewSpeedLaw))
        speed *= 2;

    uint16 groundSpeed = 0;
    Position tilePos;

    if (dir == Otc::InvalidDirection)
        tilePos = m_lastStepToPosition;
    else
        tilePos = getPrewalkingPosition(true).translatedToDirection(dir);

    if (!tilePos.isValid())
        tilePos = getPrewalkingPosition(true);

    const TilePtr& tile = g_map.getTile(tilePos);
    if (tile) {
        groundSpeed = tile->getGroundSpeed();
        if (groundSpeed == 0)
            groundSpeed = 150;
    }

    int interval = 1000;
    if (groundSpeed > 0 && speed > 0)
        interval = 1000 * groundSpeed;

    if (g_game.getFeature(Otc::GameNewSpeedLaw) && hasSpeedFormula()) {
        int formulatedSpeed = 1;
        if (speed > -m_speedFormula[Otc::SpeedFormulaB]) {
            formulatedSpeed = std::max<int>(1, (int)floor((m_speedFormula[Otc::SpeedFormulaA] * log((speed / 2)
                                                                                                    + m_speedFormula[Otc::SpeedFormulaB]) + m_speedFormula[Otc::SpeedFormulaC]) + 0.5));
        }
        interval = std::floor(interval / (double)formulatedSpeed);
    } else
        interval /= speed;

    if (g_game.getClientVersion() >= 900 && !g_game.getFeature(Otc::GameNewWalking))
        interval = std::ceil((float)interval / (float)g_game.getServerBeat()) * g_game.getServerBeat();

    float factor = 3;
    if (g_game.getClientVersion() <= 810)
        factor = 2;

    interval = std::max<int>(interval, g_game.getServerBeat());

    if (!ignoreDiagonal && (m_lastStepDirection == Otc::NorthWest || m_lastStepDirection == Otc::NorthEast ||
                            m_lastStepDirection == Otc::SouthWest || m_lastStepDirection == Otc::SouthEast))
        interval *= factor;

    if (!isServerWalking() && g_game.getFeature(Otc::GameSlowerManualWalking)) {
        interval += 25;
    }
    if (isServerWalking() && g_game.getFeature(Otc::GameNewWalking) && m_stepDuration > 0) // just use server value
    {
        interval = m_stepDuration;
    }

    return interval;
}

Point Creature::getDisplacement()
{
    if (m_outfit.getCategory() == ThingCategoryEffect)
        return Point(8, 8) * g_sprites.getOffsetFactor();
    else if (m_outfit.getCategory() == ThingCategoryItem)
        return Point(0, 0);

    if (m_outfit.getMount() != 0) {
        auto datType = g_things.rawGetThingType(m_outfit.getMount(), ThingCategoryCreature);
        return datType->getDisplacement() * g_sprites.getOffsetFactor();
    }

    return Thing::getDisplacement() * g_sprites.getOffsetFactor();
}

int Creature::getDisplacementX()
{
    if (m_outfit.getCategory() == ThingCategoryEffect)
        return 8 * g_sprites.getOffsetFactor();
    else if (m_outfit.getCategory() == ThingCategoryItem)
        return 0;

    if (m_outfit.getMount() != 0) {
        auto datType = g_things.rawGetThingType(m_outfit.getMount(), ThingCategoryCreature);
        return datType->getDisplacementX() * g_sprites.getOffsetFactor();
    }

    return Thing::getDisplacementX() * g_sprites.getOffsetFactor();
}

int Creature::getDisplacementY()
{
    if (m_outfit.getCategory() == ThingCategoryEffect)
        return 8 * g_sprites.getOffsetFactor();
    else if (m_outfit.getCategory() == ThingCategoryItem)
        return 0;

    if (m_outfit.getMount() != 0) {
        auto datType = g_things.rawGetThingType(m_outfit.getMount(), ThingCategoryCreature);
        if (datType) {
            return datType->getDisplacementY() * g_sprites.getOffsetFactor();
        }
    }

    return Thing::getDisplacementY() * g_sprites.getOffsetFactor();
}

int Creature::getExactSize(int layer, int xPattern, int yPattern, int zPattern, int animationPhase)
{
    int exactSize = 0;

    animationPhase = 0;
    xPattern = Otc::South;

    zPattern = 0;
    if (m_outfit.getMount() != 0)
        zPattern = 1;

    for (yPattern = 0; yPattern < getNumPatternY(); yPattern++) {
        if (yPattern > 0 && !(m_outfit.getAddons() & (1 << (yPattern - 1))))
            continue;

        for (layer = 0; layer < getLayers(); ++layer)
            exactSize = std::max<int>(exactSize, Thing::getExactSize(layer, xPattern, yPattern, zPattern, animationPhase));
    }

    return exactSize;
}

const ThingTypePtr& Creature::getThingType()
{
    return g_things.getThingType(m_outfit.getId(), ThingCategoryCreature);
}

ThingType* Creature::rawGetThingType()
{
    return g_things.rawGetThingType(m_outfit.getId(), ThingCategoryCreature);
}

void Creature::setText(const std::string& text, const Color& color)
{
    if (!m_text) {
        m_text = StaticTextPtr(new StaticText());
    }
    m_text->setText(text);
    m_text->setColor(color);
}

std::string Creature::getText()
{
    if (!m_text) {
        return "";
    }
    return m_text->getText();
}


// widgets
void Creature::addTopWidget(const UIWidgetPtr& widget)
{
    if (!widget) return;
    if (std::find(m_topWidgets.begin(), m_topWidgets.end(), widget) == m_topWidgets.end()) {
        m_topWidgets.push_back(widget);
    }
}

void Creature::addBottomWidget(const UIWidgetPtr& widget)
{
    if (!widget) return;
    if (std::find(m_bottomWidgets.begin(), m_bottomWidgets.end(), widget) == m_bottomWidgets.end()) {
        m_bottomWidgets.push_back(widget);
    }
}

void Creature::addDirectionalWidget(const UIWidgetPtr& widget)
{
    if (!widget) return;
    if (std::find(m_directionalWidgets.begin(), m_directionalWidgets.end(), widget) == m_directionalWidgets.end()) {
        m_directionalWidgets.push_back(widget);
    }
}

void Creature::removeTopWidget(const UIWidgetPtr& widget)
{
    auto it = std::remove(m_topWidgets.begin(), m_topWidgets.end(), widget);
    while(it != m_topWidgets.end()) {
        (*it)->destroy();
        it = m_topWidgets.erase(it);
    }
}

void Creature::removeBottomWidget(const UIWidgetPtr& widget)
{
    auto it = std::remove(m_bottomWidgets.begin(), m_bottomWidgets.end(), widget);
    while (it != m_topWidgets.end()) {
        (*it)->destroy();
        it = m_bottomWidgets.erase(it);
    }
}

void Creature::removeDirectionalWidget(const UIWidgetPtr& widget)
{    
    auto it = m_directionalWidgets.erase(std::remove(m_directionalWidgets.begin(), m_directionalWidgets.end(), widget));
    while (it != m_topWidgets.end()) {
        (*it)->destroy();
        it = m_directionalWidgets.erase(it);
    }

}

std::list<UIWidgetPtr> Creature::getTopWidgets()
{
    return m_topWidgets;
}

std::list<UIWidgetPtr> Creature::getBottomWidgets()
{
    return m_bottomWidgets;
}

std::list<UIWidgetPtr> Creature::getDirectionalWdigets()
{
    return m_directionalWidgets;
}

void Creature::clearWidgets()
{
    clearTopWidgets();
    clearBottomWidgets();
    clearDirectionalWidgets();
}

void Creature::clearTopWidgets()
{
    for (auto& widget : m_topWidgets) {
        widget->destroy();
    }
    m_topWidgets.clear();
}

void Creature::clearBottomWidgets()
{
    for (auto& widget : m_bottomWidgets) {
        widget->destroy();
    }
    m_bottomWidgets.clear();
}

void Creature::clearDirectionalWidgets()
{
    for (auto& widget : m_directionalWidgets) {
        widget->destroy();
    }
    m_directionalWidgets.clear();
}

void Creature::drawTopWidgets(const Point& dest, const Otc::Direction direction)
{
    if (direction == Otc::North || direction == Otc::West) {
        for (auto& widget : m_directionalWidgets) {
            Rect dest_rect = widget->getRect();
            dest_rect = Rect(dest - Point(dest_rect.width() / 2, dest_rect.height() / 2), dest_rect.width(), dest_rect.height());
            widget->setRect(dest_rect);
            widget->draw(dest_rect, Fw::ForegroundPane);
        }
    }
    for (auto& widget : m_topWidgets) {
        Rect dest_rect = widget->getRect();
        dest_rect = Rect(dest - Point(dest_rect.width() / 2, dest_rect.height() / 2), dest_rect.width(), dest_rect.height());
        widget->setRect(dest_rect);
        widget->draw(dest_rect, Fw::ForegroundPane);
    }
}

void Creature::drawBottomWidgets(const Point& dest, const Otc::Direction direction)
{
    for (auto& widget : m_bottomWidgets) {
        Rect dest_rect = widget->getRect();
        dest_rect = Rect(dest - Point(dest_rect.width() / 2, dest_rect.height() / 2), dest_rect.width(), dest_rect.height());
        widget->setRect(dest_rect);
        widget->draw(dest_rect, Fw::ForegroundPane);
    }

    if (direction == Otc::South || direction == Otc::East) {
        for (auto& widget : m_directionalWidgets) {
            Rect dest_rect = widget->getRect();
            dest_rect = Rect(dest - Point(dest_rect.width() / 2, dest_rect.height() / 2), dest_rect.width(), dest_rect.height());
            widget->setRect(dest_rect);
            widget->draw(dest_rect, Fw::ForegroundPane);
        }
    }
}

void Creature::setProgressBar(uint32 duration, bool ltr)
{
    if (m_progressBarUpdateEvent) {
        m_progressBarUpdateEvent->cancel();
        m_progressBarUpdateEvent = nullptr;
    }

    if (duration > 0) {
        m_progressBarTimer.restart();
        updateProgressBar(duration, ltr);
    } else
        m_progressBarPercent = 0;

    callLuaField("onProgressBarStart", duration, ltr);
}

void Creature::updateProgressBar(uint32 duration, bool ltr)
{
    if (m_progressBarTimer.ticksElapsed() < duration) {
        if (ltr)
            m_progressBarPercent = abs(m_progressBarTimer.ticksElapsed() / static_cast<double>(duration) * 100);
        else
            m_progressBarPercent = abs((m_progressBarTimer.ticksElapsed() / static_cast<double>(duration) * 100) - 100);

        auto self = static_self_cast<Creature>();
        m_progressBarUpdateEvent = g_dispatcher.scheduleEvent([=] {
            self->updateProgressBar(duration, ltr);
        }, 50);
    } else {
        m_progressBarPercent = 0;
    }
    callLuaField("onProgressBarUpdate", m_progressBarPercent, duration, ltr);
}

void Creature::setTitle(const std::string& title, const std::string& font, const Color& color)
{
    m_titleCache.setText(title);
    if (!font.empty()) {
        m_titleCache.setFont(g_fonts.getFont(font));
    }
    m_titleColor = color;
}
