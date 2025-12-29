# 10 Najużyteczniejszych Skryptów Sterowanych Ikonami
# 10 Most Useful Icon-Controlled Scripts

## 📋 Organizacja / Organization

Skrypty podzielone według **profesji** i **użyteczności**  
Scripts divided by **profession** and **usefulness**

---

## 🎯 Według Profesji / By Profession

### 👑 Knight (Elite Knight)
**#1 icon_1_knight_healer.lua**
- ❤️ Ultimate Health Potions (HP > 70%)
- 🌟 Exura Ico (HP < 50%)
- 🎮 2 movable icons

### 🏹 Paladin (Royal Paladin)  
**#2 icon_2_paladin_healer.lua**
- ❤️ Health Potions (HP > 65%)
- 💙 Mana Potions (MP > 50%)
- 🌟 Exura San (HP < 55%)
- 🎮 3 movable icons

### 🔮 Mage (Sorcerer/Druid base)
**#3 icon_3_mage_healer.lua**
- 💙 Mana Potions (MP > 45%)
- 🌟 Exura Gran (HP < 40%)
- 🌟 Exura Vita (HP < 60%)
- 🎮 3 movable icons

### ⚡ Sorcerer (Master Sorcerer)
**#8 icon_8_sorcerer_spells.lua**
- 💥 Area Spell (exevo gran mas vis)
- ⚔️ Single Spell (exori gran vis)
- 🎯 Auto-cast when monsters nearby
- 🎮 2 movable icons

### 🌿 Druid (Elder Druid)
**#9 icon_9_druid_spells.lua**
- 💚 Heal Friend (exura sio)
- 🧪 Auto Cure (exana pox)
- 👥 Support party members
- 🎮 2 movable icons

---

## ⭐ Uniwersalne Narzędzia / Universal Utilities

### #4 Smart Combat (All Vocations)
**icon_4_smart_combat.lua**
- 🎯 Smart Targeting (lowest HP)
- 🔒 Keep Target
- 🎮 2 movable icons
- ⭐ **Most Useful**: Essential for efficient hunting

### #5 Auto Loot Gold (All Vocations)
**icon_5_auto_loot.lua**
- 💰 Auto Loot Gold/Platinum/Crystal
- 📦 Auto Open Corpses
- 🎮 2 movable icons
- ⭐ **Most Useful**: Money collection

### #6 Emergency System (All Vocations)
**icon_6_emergency.lua**
- 💍 Emergency Ring (HP < 30%)
- 📿 SSA Protection (HP < 25%)
- 🎮 2 movable icons
- ⭐ **Most Useful**: Survival protection

### #7 Auto Buffs (All Vocations)
**icon_7_auto_buffs.lua**
- 🏃 Auto Haste (utani gran hur)
- 🍖 Auto Food
- 💡 Auto Light
- 🎮 3 movable icons
- ⭐ **Most Useful**: Quality of life

### #10 Equipment Manager (All Vocations)
**icon_10_equipment.lua**
- 👢 Auto Soft Boots (MP < 90%)
- 📿 Amulet Switcher (SSA at low HP)
- 💍 Ring Switcher
- 🎮 3 movable icons
- ⭐ **Most Useful**: Optimization

---

## 🚀 Użycie / Usage

### Załaduj Wszystkie / Load All
```lua
dofile("icon_scripts_loader.lua")
```

### Załaduj Dla Swojej Profesji / Load For Your Vocation
```lua
-- Knight
dofile("icon_1_knight_healer.lua")

-- Paladin
dofile("icon_2_paladin_healer.lua")

-- Sorcerer
dofile("icon_3_mage_healer.lua")
dofile("icon_8_sorcerer_spells.lua")

-- Druid
dofile("icon_3_mage_healer.lua")
dofile("icon_9_druid_spells.lua")
```

### Załaduj Najważniejsze Narzędzia / Load Essential Tools
```lua
dofile("icon_4_smart_combat.lua")   -- Smart targeting
dofile("icon_5_auto_loot.lua")      -- Gold looting
dofile("icon_6_emergency.lua")      -- Emergency protection
dofile("icon_7_auto_buffs.lua")     -- Auto haste/food
```

---

## 📊 Podsumowanie / Summary

**Łącznie / Total**: 10 skryptów  
**Ikony / Icons**: 24 movable icons  
**Kategorie / Categories**:
- 5 Profession-specific (Knight, Paladin, Mage, Sorcerer, Druid)
- 5 Universal utilities (Combat, Loot, Emergency, Buffs, Equipment)

---

## 💡 Najlepsze Setupy / Best Setups

### Hunt Setup (Hunting)
```lua
dofile("icon_scripts_loader.lua")  -- Load all

Enable:
✓ Your vocation healer (#1, #2, or #3)
✓ Smart Combat (#4)
✓ Auto Loot (#5)
✓ Emergency (#6)
✓ Auto Buffs (#7)
```

### Solo Knight Hunt
```lua
dofile("icon_1_knight_healer.lua")
dofile("icon_4_smart_combat.lua")
dofile("icon_5_auto_loot.lua")
dofile("icon_6_emergency.lua")
```

### Paladin Distance
```lua
dofile("icon_2_paladin_healer.lua")
dofile("icon_4_smart_combat.lua")
dofile("icon_5_auto_loot.lua")
dofile("icon_7_auto_buffs.lua")
```

### Mage AoE Hunt
```lua
dofile("icon_3_mage_healer.lua")
dofile("icon_8_sorcerer_spells.lua")  -- or #9 for druid
dofile("icon_5_auto_loot.lua")
dofile("icon_10_equipment.lua")
```

---

## 📈 Ranking Użyteczności / Usefulness Ranking

### S-Tier (Essential)
- #5 Auto Loot Gold
- #6 Emergency System
- #4 Smart Combat

### A-Tier (Very Useful)
- #1 Knight Healer
- #2 Paladin Healer
- #3 Mage Healer
- #7 Auto Buffs

### B-Tier (Profession Specific)
- #8 Sorcerer Spells
- #9 Druid Spells
- #10 Equipment Manager

---

## 🎯 Dla Każdej Profesji / For Each Vocation

### Knight Must-Have
1. #1 Knight Healer ⭐
2. #4 Smart Combat ⭐
3. #5 Auto Loot ⭐
4. #6 Emergency ⭐

### Paladin Must-Have
1. #2 Paladin Healer ⭐
2. #4 Smart Combat ⭐
3. #5 Auto Loot ⭐
4. #7 Auto Buffs ⭐

### Sorcerer Must-Have
1. #3 Mage Healer ⭐
2. #8 Sorcerer Spells ⭐
3. #5 Auto Loot ⭐
4. #6 Emergency ⭐

### Druid Must-Have
1. #3 Mage Healer ⭐
2. #9 Druid Spells ⭐
3. #5 Auto Loot ⭐
4. #6 Emergency ⭐

---

**Created by**: AI Agents System  
**Version**: 2024 Latest (10 Scripts Edition)  
**Organization**: By Profession & Usefulness

**Miłego Botowania! / Happy Botting!** 🤖⭐
