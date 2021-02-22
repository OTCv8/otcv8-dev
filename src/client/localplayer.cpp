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

#include "localplayer.h"
#include "map.h"
#include "game.h"
#include "tile.h"
#include <framework/core/eventdispatcher.h>
#include <framework/graphics/graphics.h>
#include <framework/util/extras.h>

LocalPlayer::LocalPlayer()
{
    m_states = 0;
    m_vocation = 0;
    m_blessings = Otc::BlessingNone;
    m_walkLockExpiration = 0;

    m_skillsLevel.resize(Otc::LastSkill + 1, 0);
    m_skillsBaseLevel.resize(Otc::LastSkill + 1, 0);
    m_skillsLevelPercent.resize(Otc::LastSkill + 1, 0);

    m_health = -1;
    m_maxHealth = -1;
    m_freeCapacity = -1;
    m_experience = -1;
    m_level = -1;
    m_levelPercent = -1;
    m_mana = -1;
    m_maxMana = -1;
    m_magicLevel = -1;
    m_magicLevelPercent = -1;
    m_baseMagicLevel = -1;
    m_soul = -1;
    m_stamina = -1;
    m_baseSpeed = -1;
    m_regenerationTime = -1;
    m_offlineTrainingTime = -1;
    m_totalCapacity = -1;
}

void LocalPlayer::draw(const Point& dest, bool animate, LightView* lightView)
{
    Creature::draw(dest, animate, lightView);
}


void LocalPlayer::lockWalk(int millis)
{
    m_walkLockExpiration = std::max<int>(m_walkLockExpiration, (ticks_t) g_clock.millis() + millis);
}

void LocalPlayer::cancelWalk(Otc::Direction direction)
{
    if (g_game.getFeature(Otc::GameNewWalking)) {
        return;
    }

    return cancelNewWalk(direction);
}

void LocalPlayer::stopAutoWalk()
{
    m_autoWalkDestination = Position();
    m_lastAutoWalkPosition = Position();

    if (m_autoWalkContinueEvent) {
        m_autoWalkContinueEvent->cancel();
        m_autoWalkContinueEvent = nullptr;
    }
}

void LocalPlayer::stopWalk() {
    if (g_extras.debugWalking) {
        g_logger.info(stdext::format("[%i] stopWalk", (int)g_clock.millis()));
    }

    Creature::stopWalk(); // will call terminateWalk

    m_preWalking.clear();
}

void LocalPlayer::updateWalkOffset(int totalPixelsWalked, bool inNextFrame)
{
    // pre walks offsets are calculated in the oposite direction
    if(isPreWalking()) {
        Point& walkOffset = inNextFrame ? m_walkOffsetInNextFrame : m_walkOffset;
        walkOffset = Point(0,0);
        if(m_walkDirection == Otc::North || m_walkDirection == Otc::NorthEast || m_walkDirection == Otc::NorthWest)
            walkOffset.y = -totalPixelsWalked;
        else if(m_walkDirection == Otc::South || m_walkDirection == Otc::SouthEast || m_walkDirection == Otc::SouthWest)
            walkOffset.y = totalPixelsWalked;

        if(m_walkDirection == Otc::East || m_walkDirection == Otc::NorthEast || m_walkDirection == Otc::SouthEast)
            walkOffset.x = totalPixelsWalked;
        else if(m_walkDirection == Otc::West || m_walkDirection == Otc::NorthWest || m_walkDirection == Otc::SouthWest)
            walkOffset.x = -totalPixelsWalked;
    } else
        Creature::updateWalkOffset(totalPixelsWalked, inNextFrame);
}

void LocalPlayer::updateWalk()
{
    if (!m_walking)
        return;

    float walkTicksPerPixel = ((float)(getStepDuration(true) + 10)) / 32.0f;
    int totalPixelsWalked = std::min<int>(m_walkTimer.ticksElapsed() / walkTicksPerPixel, 32.0f);
    int totalPixelsWalkedInNextFrame = std::min<int>((m_walkTimer.ticksElapsed() + 15) / walkTicksPerPixel, 32.0f);

    // needed for paralyze effect
    m_walkedPixels = std::max<int>(m_walkedPixels, totalPixelsWalked);
    int walkedPixelsInNextFrame = std::max<int>(m_walkedPixels, totalPixelsWalkedInNextFrame);

    // update walk animation and offsets
    updateWalkAnimation(totalPixelsWalked);
    updateWalkOffset(m_walkedPixels);
    updateWalkOffset(walkedPixelsInNextFrame, true);
    updateWalkingTile();

    int stepDuration = getStepDuration();

    // terminate walk only when client and server side walk are completed
    if (m_walking && m_walkTimer.ticksElapsed() >= stepDuration)
        m_lastPrewalkDone = true;
    if(m_walking && m_walkTimer.ticksElapsed() >= stepDuration && !isPreWalking())
        terminateWalk();
}

void LocalPlayer::terminateWalk()
{
    if (g_extras.debugWalking) {
        g_logger.info(stdext::format("[%i] terminateWalk", (int)g_clock.millis()));
    }

    Creature::terminateWalk();
    m_idleTimer.restart();
    m_preWalking.clear();
    m_walking = false;

    auto self = asLocalPlayer();

    if(m_serverWalking) {
        if(m_serverWalkEndEvent)
            m_serverWalkEndEvent->cancel();
        m_serverWalkEndEvent = g_dispatcher.scheduleEvent([self] {
            self->m_serverWalking = false;
        }, 100);
    }

    callLuaField("onWalkFinish");
}

void LocalPlayer::onAppear()
{
    Creature::onAppear();

    /* Does not seem to be needed anymore
    // on teleports lock the walk
    if(!m_oldPosition.isInRange(m_position,1,1))
        lockWalk();
    */
}

void LocalPlayer::onPositionChange(const Position& newPos, const Position& oldPos)
{
    Creature::onPositionChange(newPos, oldPos);

    if(newPos == m_autoWalkDestination)
        stopAutoWalk();
    else if(m_autoWalkDestination.isValid() && newPos == m_lastAutoWalkPosition)
        autoWalk(m_autoWalkDestination);

    m_walkMatrix.updatePosition(newPos);
}

void LocalPlayer::turn(Otc::Direction direction)
{
    Creature::setDirection(direction);
    callLuaField("onTurn", direction);
}

void LocalPlayer::setStates(int states)
{
    if(m_states != states) {
        int oldStates = m_states;
        m_states = states;

        callLuaField("onStatesChange", states, oldStates);
    }
}

void LocalPlayer::setSkill(uint8_t skill, int level, int levelPercent)
{
    if(skill >= m_skillsLevel.size()) {
        m_skillsLevel.resize(skill + 1, 0);
        m_skillsBaseLevel.resize(skill + 1, 0);
        m_skillsLevelPercent.resize(skill + 1, 0);
    }

    int oldLevel = m_skillsLevel[skill];
    int oldLevelPercent = m_skillsLevelPercent[skill];

    if(level != oldLevel || levelPercent != oldLevelPercent) {
        m_skillsLevel[skill] = level;
        m_skillsLevelPercent[skill] = levelPercent;

        callLuaField("onSkillChange", skill, level, levelPercent, oldLevel, oldLevelPercent);
    }
}

void LocalPlayer::setBaseSkill(uint8_t skill, int baseLevel)
{
    if (skill >= m_skillsLevel.size()) {
        m_skillsLevel.resize(skill + 1, 0);
        m_skillsBaseLevel.resize(skill + 1, 0);
        m_skillsLevelPercent.resize(skill + 1, 0);
    }

    int oldBaseLevel = m_skillsBaseLevel[skill];
    if(baseLevel != oldBaseLevel) {
        m_skillsBaseLevel[skill] = baseLevel;

        callLuaField("onBaseSkillChange", skill, baseLevel, oldBaseLevel);
    }
}

void LocalPlayer::setHealth(double health, double maxHealth)
{
    if(m_health != health || m_maxHealth != maxHealth) {
        double oldHealth = m_health;
        double oldMaxHealth = m_maxHealth;
        m_health = health;
        m_maxHealth = maxHealth;

        callLuaField("onHealthChange", health, maxHealth, oldHealth, oldMaxHealth);

        // cannot walk while dying
        if(health == 0) {
            if(isPreWalking())
                stopWalk();
            lockWalk();
        }
    }
}

void LocalPlayer::setFreeCapacity(double freeCapacity)
{
    if(m_freeCapacity != freeCapacity) {
        double oldFreeCapacity = m_freeCapacity;
        m_freeCapacity = freeCapacity;

        callLuaField("onFreeCapacityChange", freeCapacity, oldFreeCapacity);
    }
}

void LocalPlayer::setTotalCapacity(double totalCapacity)
{
    if(m_totalCapacity != totalCapacity) {
        double oldTotalCapacity = m_totalCapacity;
        m_totalCapacity = totalCapacity;

        callLuaField("onTotalCapacityChange", totalCapacity, oldTotalCapacity);
    }
}

void LocalPlayer::setExperience(double experience)
{
    if(m_experience != experience) {
        double oldExperience = m_experience;
        m_experience = experience;

        callLuaField("onExperienceChange", experience, oldExperience);
    }
}

void LocalPlayer::setLevel(double level, double levelPercent)
{
    if(m_level != level || m_levelPercent != levelPercent) {
        double oldLevel = m_level;
        double oldLevelPercent = m_levelPercent;
        m_level = level;
        m_levelPercent = levelPercent;

        callLuaField("onLevelChange", level, levelPercent, oldLevel, oldLevelPercent);
    }
}

void LocalPlayer::setMana(double mana, double maxMana)
{
    if(m_mana != mana || m_maxMana != maxMana) {
        double oldMana = m_mana;
        double oldMaxMana;
        m_mana = mana;
        m_maxMana = maxMana;

        callLuaField("onManaChange", mana, maxMana, oldMana, oldMaxMana);
    }
}

void LocalPlayer::setMagicLevel(double magicLevel, double magicLevelPercent)
{
    if(m_magicLevel != magicLevel || m_magicLevelPercent != magicLevelPercent) {
        double oldMagicLevel = m_magicLevel;
        double oldMagicLevelPercent = m_magicLevelPercent;
        m_magicLevel = magicLevel;
        m_magicLevelPercent = magicLevelPercent;

        callLuaField("onMagicLevelChange", magicLevel, magicLevelPercent, oldMagicLevel, oldMagicLevelPercent);
    }
}

void LocalPlayer::setBaseMagicLevel(double baseMagicLevel)
{
    if(m_baseMagicLevel != baseMagicLevel) {
        double oldBaseMagicLevel = m_baseMagicLevel;
        m_baseMagicLevel = baseMagicLevel;

        callLuaField("onBaseMagicLevelChange", baseMagicLevel, oldBaseMagicLevel);
    }
}

void LocalPlayer::setSoul(double soul)
{
    if(m_soul != soul) {
        double oldSoul = m_soul;
        m_soul = soul;

        callLuaField("onSoulChange", soul, oldSoul);
    }
}

void LocalPlayer::setStamina(double stamina)
{
    if(m_stamina != stamina) {
        double oldStamina = m_stamina;
        m_stamina = stamina;

        callLuaField("onStaminaChange", stamina, oldStamina);
    }
}

void LocalPlayer::setInventoryItem(Otc::InventorySlot inventory, const ItemPtr& item)
{
    if(inventory >= Otc::LastInventorySlot) {
        g_logger.traceError("invalid slot");
        return;
    }

    if(m_inventoryItems[inventory] != item) {
        ItemPtr oldItem = m_inventoryItems[inventory];
        m_inventoryItems[inventory] = item;

        callLuaField("onInventoryChange", inventory, item, oldItem);
    }
}

void LocalPlayer::setVocation(int vocation)
{
    if(m_vocation != vocation) {
        int oldVocation = m_vocation;
        m_vocation = vocation;

        callLuaField("onVocationChange", vocation, oldVocation);
    }
}

void LocalPlayer::setPremium(bool premium)
{
    if(m_premium != premium) {
        m_premium = premium;

        callLuaField("onPremiumChange", premium);
    }
}

void LocalPlayer::setRegenerationTime(double regenerationTime)
{
    if(m_regenerationTime != regenerationTime) {
        double oldRegenerationTime = m_regenerationTime;
        m_regenerationTime = regenerationTime;

        callLuaField("onRegenerationChange", regenerationTime, oldRegenerationTime);
    }
}

void LocalPlayer::setOfflineTrainingTime(double offlineTrainingTime)
{
    if(m_offlineTrainingTime != offlineTrainingTime) {
        double oldOfflineTrainingTime = m_offlineTrainingTime;
        m_offlineTrainingTime = offlineTrainingTime;

        callLuaField("onOfflineTrainingChange", offlineTrainingTime, oldOfflineTrainingTime);
    }
}

void LocalPlayer::setSpells(const std::vector<int>& spells)
{
    if(m_spells != spells) {
        std::vector<int> oldSpells = m_spells;
        m_spells = spells;

        callLuaField("onSpellsChange", spells, oldSpells);
    }
}

void LocalPlayer::setBlessings(int blessings)
{
    if(blessings != m_blessings) {
        int oldBlessings = m_blessings;
        m_blessings = blessings;

        callLuaField("onBlessingsChange", blessings, oldBlessings);
    }
}

bool LocalPlayer::hasSight(const Position& pos)
{
    return m_position.isInRange(pos, g_map.getAwareRange().left - 1, g_map.getAwareRange().top - 1);
}
