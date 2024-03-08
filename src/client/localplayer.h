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

#ifndef LOCALPLAYER_H
#define LOCALPLAYER_H

#include "player.h"
#include "walkmatrix.h"

// @bindclass
class LocalPlayer : public Player
{
    enum {
        PREWALK_TIMEOUT = 1000
    };

public:
    LocalPlayer();

    void draw(const Point& dest, bool animate = true, LightView* lightView = nullptr) override;

    void unlockWalk() { m_walkLockExpiration = 0; }
    void lockWalk(int millis = 200);
    void stopAutoWalk();
    bool autoWalk(Position destination, bool retry = false);
    bool canWalk(Otc::Direction direction, bool ignoreLock = false);
    bool isWalkLocked() {
        return (m_walkLockExpiration != 0 && g_clock.millis() < m_walkLockExpiration);
    }
    void turn(Otc::Direction) override;

    void setStates(int states);
    void setSkill(uint8_t skill, int level, int levelPercent);
    void setBaseSkill(uint8_t skill, int baseLevel);
    void setHealth(double health, double maxHealth);
    void setFreeCapacity(double freeCapacity);
    void setTotalCapacity(double totalCapacity);
    void setExperience(double experience);
    void setLevel(double level, double levelPercent);
    void setMana(double mana, double maxMana);
    void setMagicLevel(double magicLevel, double magicLevelPercent);
    void setBaseMagicLevel(double baseMagicLevel);
    void setSoul(double soul);
    void setStamina(double stamina);
    void setKnown(bool known) { m_known = known; }
    void setPendingGame(bool pending) { m_pending = pending; }
    void setInventoryItem(Otc::InventorySlot inventory, const ItemPtr& item);
    void setVocation(int vocation);
    void setPremium(bool premium);
    void setRegenerationTime(double regenerationTime);
    void setOfflineTrainingTime(double offlineTrainingTime);
    void setSpells(const std::vector<int>& spells);
    void setBlessings(int blessings);

    int getStates() { return m_states; }
    int getSkillLevel(uint8_t skill) { return skill < m_skillsLevel.size() ? m_skillsLevel[skill] : 0; }
    int getSkillBaseLevel(uint8_t skill) { return skill < m_skillsBaseLevel.size() ? m_skillsBaseLevel[skill] : 0; }
    int getSkillLevelPercent(uint8_t skill) { return skill < m_skillsLevelPercent.size() ? m_skillsLevelPercent[skill] : 0; }
    int getVocation() { return m_vocation; }
    double getHealth() { return m_health; }
    double getMaxHealth() { return m_maxHealth; }
    double getFreeCapacity() { return m_freeCapacity; }
    double getTotalCapacity() { return m_totalCapacity; }
    double getExperience() { return m_experience; }
    double getLevel() { return m_level; }
    double getLevelPercent() { return m_levelPercent; }
    double getMana() { return m_mana; }
    double getMaxMana() { return std::max<double>(m_mana, m_maxMana); }
    double getMagicLevel() { return m_magicLevel; }
    double getMagicLevelPercent() { return m_magicLevelPercent; }
    double getBaseMagicLevel() { return m_baseMagicLevel; }
    double getSoul() { return m_soul; }
    double getStamina() { return m_stamina; }
    double getRegenerationTime() { return m_regenerationTime; }
    double getOfflineTrainingTime() { return m_offlineTrainingTime; }
    std::vector<int> getSpells() { return m_spells; }
    ItemPtr getInventoryItem(Otc::InventorySlot inventory) { return m_inventoryItems[inventory]; }
    int getBlessings() { return m_blessings; }

    bool hasSight(const Position& pos);
    bool isKnown() { return m_known; }
    bool isAutoWalking() { return m_autoWalkDestination.isValid(); }
    bool isServerWalking() override { return m_serverWalking; }
    bool isPremium() { return m_premium; }
    bool isPendingGame() { return m_pending; }

    LocalPlayerPtr asLocalPlayer() { return static_self_cast<LocalPlayer>(); }
    bool isLocalPlayer() override { return true; }

    void onAppear() override;
    void onPositionChange(const Position& newPos, const Position& oldPos) override;

    // pre walking
    void preWalk(Otc::Direction direction);
    bool isPreWalking() override { return !m_preWalking.empty(); }
    Position getPrewalkingPosition(bool beforePrewalk = false) override {
        if(m_preWalking.empty())
            return m_position;
        else if (!beforePrewalk && m_preWalking.size() == 1)
            return m_position;
        auto ret = m_preWalking.rbegin();
        if(!beforePrewalk)
            ret++;
        return *ret; 
    }

    uint32_t getWalkPrediction(const Position& pos)
    {
        return m_walkMatrix.get(pos);
    };

    std::string dumpWalkMatrix()
    {
        return m_walkMatrix.dump();
    }

    void startServerWalking() { m_serverWalking = true; }
    void finishServerWalking() { m_serverWalking = false; }

protected:
    void walk(const Position& oldPos, const Position& newPos) override;
    void cancelWalk(Otc::Direction direction = Otc::InvalidDirection);
    
    void cancelNewWalk(Otc::Direction dir);
    bool predictiveCancelWalk(const Position& pos, uint32_t predictionId, Otc::Direction dir);
    
    bool retryAutoWalk();
    void stopWalk() override;

    friend class Game;

protected:
    void updateWalkOffset(uint8 totalPixelsWalked, bool inNextFrame = false) override;
    void updateWalk() override;
    void terminateWalk() override;

private:
    // walk related
    Position m_autoWalkDestination;
    Position m_lastAutoWalkPosition;
    int m_lastAutoWalkRetries = 0;
    ScheduledEventPtr m_serverWalkEndEvent;
    ScheduledEventPtr m_autoWalkContinueEvent;
    ticks_t m_walkLockExpiration;

    // walking and pre walking
    std::list<Position> m_preWalking;
    bool m_serverWalking = false;
    bool m_lastPrewalkDone = false;
    WalkMatrix m_walkMatrix;

    bool m_premium = false;
    bool m_known = false;
    bool m_pending = false;

    ItemPtr m_inventoryItems[Otc::LastInventorySlot];
    Timer m_idleTimer;

    std::vector<int> m_skillsLevel;
    std::vector<int> m_skillsBaseLevel;
    std::vector<int> m_skillsLevelPercent;
    std::vector<int> m_spells;

    int m_states;
    int m_vocation;
    int m_blessings;

    double m_health;
    double m_maxHealth;
    double m_freeCapacity;
    double m_totalCapacity;
    double m_experience;
    double m_level;
    double m_levelPercent;
    double m_mana;
    double m_maxMana;
    double m_magicLevel;
    double m_magicLevelPercent;
    double m_baseMagicLevel;
    double m_soul;
    double m_stamina;
    double m_regenerationTime;
    double m_offlineTrainingTime;

    double m_normalCoin = 0;
    double m_transferCoin = 0;
    double m_auctionCoin = 0;
};

#endif
