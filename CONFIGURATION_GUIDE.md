# CONFIGURATION GUIDE
# Przewodnik Konfiguracji

## ⚙️ Complete Configuration Reference

---

## 🎮 BASIC CONFIGURATION

### Jak Edytować Ustawienia / How to Edit Settings

**Option 1: In-Game (Easiest)**
1. Load the script
2. Go to the tab for your vocation
3. Edit values in text boxes
4. Settings save automatically

**Option 2: In Console**
```lua
storage.knightHealer.hpPercent = 75  -- Change HP threshold
```

**Option 3: Edit File**
Open `ULTIMATE_ALL_IN_ONE.lua` and find the storage section

---

## 👑 KNIGHT CONFIGURATION

### Default Settings:
```lua
storage.knightHealer = {
  hpPotionId = 266,    -- Ultimate Health Potion
  hpPercent = 70,      -- Use potion at HP < 70%
  exuraIcoHP = 50      -- Cast Exura Ico at HP < 50%
}
```

### Recommended Settings:

**For Low Level Knight (8-50):**
```lua
hpPercent = 80          -- More careful
exuraIcoHP = 60         -- Heal earlier
```

**For High Level Knight (100+):**
```lua
hpPercent = 65          -- More aggressive
exuraIcoHP = 40         -- Emergency only
```

**For Dangerous Hunts:**
```lua
hpPercent = 85          -- Very safe
exuraIcoHP = 70         -- Frequent healing
```

### Item IDs:
- 266 = Ultimate Health Potion
- 239 = Great Health Potion (cheaper)
- 238 = Strong Health Potion (budget)

---

## 🏹 PALADIN CONFIGURATION

### Default Settings:
```lua
storage.paladinHealer = {
  hpPotionId = 266,
  mpPotionId = 268,
  hpPercent = 65,
  mpPercent = 50,
  exuraSanHP = 55
}
```

### Recommended Settings:

**For Distance Paladin:**
```lua
hpPercent = 70          -- Stay safe
mpPercent = 60          -- Keep mana high for distance
exuraSanHP = 60         -- Heal often
```

**For Melee Paladin:**
```lua
hpPercent = 75          -- Higher HP needed
mpPercent = 40          -- Less mana needed
exuraSanHP = 50         -- Emergency healing
```

**For Low Mana Pool:**
```lua
mpPercent = 70          -- Use potions earlier
```

### Item IDs:
- HP: 266 (Ultimate), 239 (Great), 238 (Strong)
- MP: 268 (Ultimate), 237 (Great), 236 (Strong)

---

## 🔮 MAGE CONFIGURATION

### Default Settings:
```lua
storage.mageHealer = {
  mpPotionId = 268,
  mpPercent = 45,
  exuraGranHP = 40,
  exuraVitaHP = 60
}
```

### Recommended Settings:

**For Sorcerer (Attack Focused):**
```lua
mpPercent = 50          -- Keep mana for spells
exuraGranHP = 35        -- Emergency heal
exuraVitaHP = 65        -- Regular heal
```

**For Druid (Support Focused):**
```lua
mpPercent = 60          -- More mana for sio
exuraGranHP = 40        -- Safe healing
exuraVitaHP = 70        -- Frequent healing
```

**For Training:**
```lua
mpPercent = 80          -- Constant mana
exuraGranHP = 30        -- Rarely needed
```

---

## ⚔️ SMART COMBAT CONFIGURATION

### Default Settings:
```lua
storage.smartCombat = {
  attackLowest = true,
  keepTarget = true
}
```

### Options:

**Attack Lowest HP:**
- `true` = Target weakest monster (faster kills)
- `false` = Disabled

**Keep Target:**
- `true` = Maintain attack on current target
- `false` = Allow target switching

**Recommended:**
```lua
-- For AoE hunting:
attackLowest = true
keepTarget = false      -- Switch freely

-- For boss hunts:
attackLowest = false
keepTarget = true       -- Focus on boss

-- For balanced hunting:
attackLowest = true
keepTarget = true       -- Default
```

---

## 💰 AUTO LOOT CONFIGURATION

### Default Settings:
```lua
storage.autoLootGold = {
  enabled = true,
  maxDist = 3
}
```

### Distance Settings:

```lua
maxDist = 1   -- Very close (safe areas)
maxDist = 3   -- Default (balanced)
maxDist = 5   -- Wider range (fast hunting)
maxDist = 7   -- Maximum practical range
```

**Note:** Larger distances = more CPU usage

### Enable/Disable:
```lua
storage.autoLootGold.enabled = false  -- Disable looting
storage.autoLootGold.enabled = true   -- Enable looting
```

---

## 🆘 EMERGENCY SYSTEM

**No Configuration Needed!**

Works automatically:
- Ring at HP < 30%
- SSA at HP < 25%

**To Customize (Advanced):**
Edit the macro directly in `ULTIMATE_ALL_IN_ONE.lua`:
```lua
if hp <= 30 then  -- Change to 35 or 25
```

---

## 💨 AUTO BUFFS CONFIGURATION

### Default Settings:
```lua
storage.autoBuffs = {
  hasteSpell = "utani gran hur",
  hasteInterval = 10000,
  autoFood = true
}
```

### Spell Names by Vocation:

**Haste Spells:**
```lua
-- Sorcerer/Druid:
hasteSpell = "utani gran hur"    -- Strong Haste

-- Paladin:
hasteSpell = "utani hur"         -- Haste

-- Knight:
hasteSpell = "utani tempo hur"   -- Charge
```

### Intervals:
```lua
hasteInterval = 5000    -- Every 5 seconds (spam)
hasteInterval = 10000   -- Every 10 seconds (default)
hasteInterval = 20000   -- Every 20 seconds (conservative)
```

### Food:
```lua
autoFood = true   -- Auto eat
autoFood = false  -- Disable
```

---

## ⚡ SORCERER SPELLS CONFIGURATION

### Default Settings:
```lua
storage.sorcSpells = {
  areaSpell = "exevo gran mas vis",
  singleSpell = "exori gran vis",
  minManaArea = 500,
  minMonsters = 3
}
```

### Spell Customization:

**Area Spells:**
```lua
areaSpell = "exevo gran mas vis"   -- Energy Wave (Sorc)
areaSpell = "exevo gran mas frigo" -- Ice Wave (Druid)
areaSpell = "exevo gran mas flam"  -- Fire Wave
```

**Single Spells:**
```lua
singleSpell = "exori gran vis"     -- Great Energy Beam
singleSpell = "exori gran ico"     -- Strong Ice Strike
singleSpell = "exori gran flam"    -- Strong Flame Strike
```

### Thresholds:
```lua
minManaArea = 300    -- Low mana threshold (risky)
minManaArea = 500    -- Default (balanced)
minManaArea = 700    -- High mana threshold (safe)

minMonsters = 2      -- Aggressive (use area with 2+)
minMonsters = 3      -- Default (3+ monsters)
minMonsters = 4      -- Conservative (4+ monsters)
```

---

## 🌿 DRUID SPELLS CONFIGURATION

### Default Settings:
```lua
storage.druidSpells = {
  healSpell = "exura sio",
  healTarget = "Player Name",
  paralyzeSpell = "exana pox"
}
```

### Heal Target:
```lua
healTarget = "Knight Name"   -- Your tank
healTarget = "Friend Name"   -- Your hunting partner
```

**Important:** Must be exact character name!

### Cure Spells:
```lua
paralyzeSpell = "exana pox"    -- Cure Poison
paralyzeSpell = "exana mort"   -- Cure Curse (if available)
```

---

## 🎒 EQUIPMENT MANAGER

**Mostly Automatic!**

### Soft Boots Threshold:
Default: MP < 90%

To change, edit in file:
```lua
if manapercent() < 90 and not isInPz() then  -- Change 90 to other value
```

### Amulet IDs:
```lua
{id = 3081, ...}    -- SSA (low HP)
{id = 23526, ...}   -- Plasma Amulet (normal)
```

Change IDs to your preferred amulets.

### Ring IDs:
```lua
if not ring or ring:getId() ~= 3098 then  -- Ring of Healing
```

Change 3098 to your preferred ring ID.

---

## 📊 ADVANCED CONFIGURATION

### Delay Adjustments:

All delays in milliseconds (1000 = 1 second)

**Potion Delays:**
```lua
delay(1000)   -- 1 second (default)
delay(500)    -- 0.5 seconds (faster, risky)
delay(1500)   -- 1.5 seconds (safer)
```

**Spell Delays:**
```lua
delay(2000)   -- 2 seconds (area spells)
delay(1000)   -- 1 second (healing spells)
```

### Macro Intervals:

```lua
macro(100, ...)   -- Check every 0.1 seconds (fast)
macro(200, ...)   -- Check every 0.2 seconds (default for healing)
macro(500, ...)   -- Check every 0.5 seconds (slower)
```

---

## 💾 SAVE AND RESET

### Save Settings:
All settings save automatically to storage!

### Reset to Defaults:
```lua
storage.knightHealer = nil
storage.paladinHealer = nil
storage.mageHealer = nil
storage.smartCombat = nil
storage.autoLootGold = nil
storage.autoBuffs = nil
storage.sorcSpells = nil
storage.druidSpells = nil

-- Then reload:
dofile("ULTIMATE_ALL_IN_ONE.lua")
```

### Backup Configuration:
```lua
-- Save your settings:
local myConfig = {
  knight = storage.knightHealer,
  paladin = storage.paladinHealer,
  -- etc.
}

-- Restore later:
storage.knightHealer = myConfig.knight
```

---

## 🎯 QUICK REFERENCE

| Vocation | Main Setting | Recommended Value |
|----------|--------------|-------------------|
| Knight   | hpPercent    | 70-80%           |
| Paladin  | hpPercent    | 65-75%           |
| Paladin  | mpPercent    | 50-60%           |
| Mage     | mpPercent    | 45-60%           |
| All      | Emergency    | Auto (no config) |

---

**For more help, see:**
- QUICK_START_GUIDE.md
- FULL_DOCUMENTATION.md
- FAQ_AND_TIPS.md
