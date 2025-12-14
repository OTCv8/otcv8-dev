# FULL DOCUMENTATION
# Pełna Dokumentacja

## 📚 Complete Description of All 10 Scripts

---

## SCRIPT #1: KNIGHT HEALER

**Purpose:** Auto-healing for Knights (Elite Knight)

**Icons:**
- Knight HP (item 266 - Ultimate Health Potion)
- Exura Ico (item 3160 - Healing rune icon)

**Configuration:**
```lua
storage.knightHealer = {
  hpPotionId = 266,     -- Ultimate Health Potion
  hpPercent = 70,       -- Use potion when HP < 70%
  exuraIcoHP = 50       -- Cast Exura Ico when HP < 50%
}
```

**How it works:**
- Monitors HP percentage continuously
- Automatically uses health potions when HP drops below threshold
- Casts Exura Ico healing spell when HP is critically low
- Only works outside Protection Zone (PZ)
- 1 second delay between actions to prevent spam

**Best for:** Knights who need strong HP recovery during combat

---

## SCRIPT #2: PALADIN HEALER

**Purpose:** Balanced HP and MP management for Paladins

**Icons:**
- Paladin HP (item 266 - Health Potion)
- Paladin MP (item 268 - Mana Potion)
- Exura San (item 3161 - Light healing rune)

**Configuration:**
```lua
storage.paladinHealer = {
  hpPotionId = 266,     -- Health Potion ID
  mpPotionId = 268,     -- Mana Potion ID
  hpPercent = 65,       -- HP threshold
  mpPercent = 50,       -- MP threshold
  exuraSanHP = 55       -- Exura San threshold
}
```

**How it works:**
- Dual monitoring: HP and MP
- Uses health potions at 65% HP
- Uses mana potions at 50% MP
- Casts Exura San for mid-level healing
- Optimized for ranged combat style

**Best for:** Paladins who need both HP and MP management

---

## SCRIPT #3: MAGE HEALER

**Purpose:** Mana-focused healing for Mages (Sorcerers/Druids)

**Icons:**
- Mage MP (item 268 - Mana Potion)
- Exura Gran (item 3160 - Strong healing)
- Exura Vita (item 3161 - Medium healing)

**Configuration:**
```lua
storage.mageHealer = {
  mpPotionId = 268,     -- Mana Potion
  mpPercent = 45,       -- MP threshold (lower for mages)
  exuraGranHP = 40,     -- Emergency healing
  exuraVitaHP = 60      -- Regular healing
}
```

**How it works:**
- Priority on mana management
- Uses mana potions at 45% MP
- Exura Gran for emergency (HP < 40%)
- Exura Vita for regular healing (HP < 60%)
- Smart healing spell selection

**Best for:** Mages who rely heavily on mana for spells

---

## SCRIPT #4: SMART COMBAT

**Purpose:** Intelligent target selection and maintenance

**Icons:**
- Smart Target (item 3155 - SD rune)
- Keep Attack (item 12306 - Target icon)

**Configuration:**
```lua
storage.smartCombat = {
  attackLowest = true,  -- Target lowest HP monster
  keepTarget = true     -- Maintain current target
}
```

**How it works:**
- Scans all monsters within 8 squares
- Automatically targets monster with lowest HP
- Keep Target feature maintains attack on current enemy
- Prevents target switching during combat
- Optimizes for efficient killing

**Best for:** All vocations - improves combat efficiency

---

## SCRIPT #5: AUTO LOOT GOLD

**Purpose:** Automatic gold collection and corpse management

**Icons:**
- Loot Gold (item 3043 - Crystal coin)
- Open Corpses (item 3058 - Corpse)

**Configuration:**
```lua
storage.autoLootGold = {
  enabled = true,
  maxDist = 3           -- Max distance to loot
}
```

**How it works:**
- Automatically collects gold, platinum, and crystal coins
- Opens all corpses within range
- 3 square default range
- Delays to prevent server flood
- Essential for profit tracking

**Best for:** Everyone - automated money collection

---

## SCRIPT #6: EMERGENCY SYSTEM

**Purpose:** Critical HP protection with automatic equipment

**Icons:**
- Emergency Ring (item 3051 - Energy Ring)
- SSA Protection (item 3081 - Stone Skin Amulet)

**How it works:**
- Emergency Ring: Auto-equips at HP < 30%
- Removes ring when HP > 50% (to save charges)
- SSA: Auto-equips at HP < 25% (critical)
- No configuration needed - works automatically
- Life-saving feature for dangerous situations

**Best for:** All vocations - survival protection

---

## SCRIPT #7: AUTO BUFFS

**Purpose:** Automatic buff spell management

**Icons:**
- Auto Haste (item 2195 - Boots of Haste)
- Auto Food (item 3725 - Food)
- Auto Light (item 2050 - Torch)

**Configuration:**
```lua
storage.autoBuffs = {
  hasteSpell = "utani gran hur",  -- Haste spell name
  hasteInterval = 10000,           -- Cast every 10 seconds
  autoFood = true
}
```

**How it works:**
- Casts haste spell automatically every 10 seconds
- Eats food every minute
- Casts light spell every 30 seconds
- Fully customizable spell names
- Quality of life improvement

**Best for:** Everyone - reduces micromanagement

---

## SCRIPT #8: SORCERER SPELLS

**Purpose:** Offensive spell automation for Sorcerers

**Icons:**
- Area Spell (item 3191 - GFB rune)
- Single Spell (item 3200 - Strike rune)

**Configuration:**
```lua
storage.sorcSpells = {
  areaSpell = "exevo gran mas vis",    -- Area spell
  singleSpell = "exori gran vis",      -- Single target
  minManaArea = 500,                   -- Min mana for area
  minMonsters = 3                      -- Min monsters for area
}
```

**How it works:**
- Counts nearby monsters (within 4 squares)
- Uses area spell when 3+ monsters present
- Uses single spell when attacking
- Checks mana before casting
- Optimizes damage output

**Best for:** Sorcerers in AoE hunting

---

## SCRIPT #9: DRUID SPELLS

**Purpose:** Support and healing spells for Druids

**Icons:**
- Heal Friend (item 3160 - Healing icon)
- Auto Cure (item 3153 - Antidote)

**Configuration:**
```lua
storage.druidSpells = {
  healSpell = "exura sio",
  healTarget = "Player Name",     -- Friend to heal
  paralyzeSpell = "exana pox"
}
```

**How it works:**
- Heals target player when HP < 70%
- Automatically cures poison/paralyze
- Party support functionality
- Customizable heal target name
- Essential for teamplay

**Best for:** Druids in party hunting

---

## SCRIPT #10: EQUIPMENT MANAGER

**Purpose:** Automatic equipment optimization

**Icons:**
- Soft Boots (item 6132 - Soft Boots)
- Amulet Switch (item 23526 - Plasma Amulet)
- Ring Switch (item 3098 - Ring of Healing)

**How it works:**
- Auto-equips Soft Boots when MP < 90%
- Switches amulet: SSA at low HP, Plasma otherwise
- Equips Ring of Healing when HP < 70%
- Smart equipment management
- Saves item charges

**Best for:** Everyone - optimizes equipment usage

---

## 🎯 TIER RANKINGS

### S-Tier (Essential for Everyone)
- #5 Auto Loot Gold
- #6 Emergency System
- #4 Smart Combat

### A-Tier (Very Useful)
- #1 Knight Healer
- #2 Paladin Healer
- #3 Mage Healer
- #7 Auto Buffs

### B-Tier (Profession-Specific)
- #8 Sorcerer Spells
- #9 Druid Spells
- #10 Equipment Manager

---

## 📊 ICON SUMMARY

**Total Icons:** 24 movable icons

**By Category:**
- Healing: 8 icons (Knight 2, Paladin 3, Mage 3)
- Combat: 4 icons (Smart 2, Sorc 2)
- Utility: 8 icons (Loot 2, Emergency 2, Buffs 3, Druid 2)
- Equipment: 3 icons

**All icons are:**
- ✓ Movable (drag anywhere)
- ✓ Toggleable (click on/off)
- ✓ Auto-saved (positions remembered)
- ✓ Configurable (via storage)

---

## 🔧 TECHNICAL DETAILS

**File Size:** ~15 KB  
**Load Time:** <1 second  
**Memory:** Minimal  
**Dependencies:** None  
**Compatibility:** All OTCv8 versions  

**Storage Structure:**
- knightHealer
- paladinHealer
- mageHealer
- smartCombat
- autoLootGold
- autoBuffs
- sorcSpells
- druidSpells

All settings persist across sessions!

---

**For more info, see:**
- QUICK_START_GUIDE.md
- CONFIGURATION_GUIDE.md
- FAQ_AND_TIPS.md
