# FAQ AND TIPS
# Najczęstsze Pytania i Wskazówki

## ❓ Frequently Asked Questions

---

### Q1: How do I load the script?
### P1: Jak załadować skrypt?

**A:** Simply type in Lua console:
```lua
dofile("ULTIMATE_ALL_IN_ONE.lua")
```

That's it! One command loads everything.

---

### Q2: Can I use only some scripts, not all?
### P2: Czy mogę użyć tylko niektórych skryptów?

**A:** Yes! Click icons to toggle them ON/OFF. Icons you don't click stay disabled.

You can also edit the file and comment out scripts you don't want:
```lua
-- print("[1/10] Loading Knight Healer...")
-- ... (comment out entire script section)
```

---

### Q3: How do I change HP threshold?
### P3: Jak zmienić próg HP?

**A:** Three ways:

1. **In-game:** Go to Knight/Paladin/Mage tab, edit the HP% field
2. **Console:** `storage.knightHealer.hpPercent = 75`
3. **File:** Edit `ULTIMATE_ALL_IN_ONE.lua`

---

### Q4: Icons aren't working!
### P4: Ikony nie działają!

**A:** Check:
- ✓ Did you click the icon to enable it?
- ✓ Do you have potions/mana?
- ✓ Are you in PZ? (most features disabled in PZ)
- ✓ Check console for error messages

---

### Q5: Can I use this for multiple characters?
### P5: Czy mogę używać dla wielu postaci?

**A:** Yes! Each character has its own storage. Settings won't mix.

---

### Q6: How do I reset everything?
### P6: Jak zresetować wszystko?

**A:** 
```lua
storage = {}  -- Clear all storage
dofile("ULTIMATE_ALL_IN_ONE.lua")  -- Reload
```

Or reset individual sections:
```lua
storage.knightHealer = nil
```

---

### Q7: Will this get me banned?
### P7: Czy to grozi banem?

**A:** This depends on your server's rules. OTCv8 allows scripting, but some servers may have restrictions. Check your server rules.

**Recommendation:** Use responsibly and follow server rules.

---

### Q8: Can I modify the scripts?
### P8: Czy mogę modyfikować skrypty?

**A:** Absolutely! The file is yours to edit. Add features, change logic, customize everything.

---

### Q9: Icons disappeared!
### P9: Ikony zniknęły!

**A:** They might be off-screen. Reload the script:
```lua
dofile("ULTIMATE_ALL_IN_ONE.lua")
```

Icons will reset to default positions.

---

### Q10: How much CPU does this use?
### P10: Ile CPU to zużywa?

**A:** Very minimal. All macros are optimized with appropriate delays. Should not impact game performance.

---

## 💡 TIPS AND TRICKS

### ✨ Tip #1: Organize Your Icons

**Best Practice:**
- Put healing icons near HP/MP bars
- Put combat icons near the game window center
- Put utility icons in corners

**Save Position:**
Icons remember where you drag them!

---

### ✨ Tip #2: Start Simple

**For New Users:**
1. Enable only your vocation healer first
2. Test in safe area (PZ)
3. Gradually enable more features

Don't enable everything at once!

---

### ✨ Tip #3: Use Color Coding

Icons have text labels. Remember:
- "HP" = Health Potion (red concept)
- "MP" = Mana Potion (blue concept)
- "Gold" = Looting
- "Ring"/"SSA" = Emergency

---

### ✨ Tip #4: Adjust for Your Style

**Aggressive Player:**
- Lower HP thresholds (60-65%)
- Lower MP thresholds (40-45%)
- More risky, faster hunting

**Safe Player:**
- Higher HP thresholds (75-85%)
- Higher MP thresholds (60-70%)
- Safer, slower hunting

**Find your balance!**

---

### ✨ Tip #5: Monitor Console

The console shows what's happening:
```
[1/10] Loading Knight Healer...
[2/10] Loading Paladin Healer...
...
✓ All 10 scripts loaded!
```

Watch for errors or issues here.

---

### ✨ Tip #6: Test Before Hunting

**Before going to dangerous spawn:**
1. Load script in city
2. Click all icons you'll use
3. Check they toggle on/off properly
4. Set your thresholds
5. Test in training area if possible

**Then** go hunting!

---

### ✨ Tip #7: Backup Your Settings

**Save your perfect configuration:**
```lua
-- In console:
print("HP:", storage.knightHealer.hpPercent)
print("MP:", storage.paladinHealer.mpPercent)
-- etc.

-- Write these down or screenshot!
```

---

### ✨ Tip #8: Combine Features Smartly

**Great Combinations:**

**For Knights:**
- Knight Healer + Smart Combat + Auto Loot + Emergency

**For Paladins:**
- Paladin Healer + Smart Combat + Auto Loot + Auto Buffs

**For Mages:**
- Mage Healer + Sorc/Druid Spells + Equipment + Emergency

---

### ✨ Tip #9: Use Emergency Features

**Emergency System is S-Tier!**

Even if you disable everything else, keep:
- Emergency Ring (HP < 30%)
- SSA Protection (HP < 25%)

These can save your life!

---

### ✨ Tip #10: Update Item IDs

**If you use different potions:**
```lua
storage.knightHealer.hpPotionId = 239  -- Great Health instead of Ultimate
```

Check item IDs with:
```lua
-- Hover over item in game
-- Check item properties
```

---

## 🎯 COMMON SCENARIOS

### Scenario 1: Solo Knight Hunt

**Enable:**
- Knight HP ✓
- Exura Ico ✓
- Smart Target ✓
- Loot Gold ✓
- Emergency Ring ✓
- Auto Haste ✓

**Settings:**
- HP: 70%
- Exura Ico: 50%

---

### Scenario 2: Party Druid

**Enable:**
- Mage MP ✓
- Heal Friend ✓
- Auto Cure ✓
- Emergency ✓

**Settings:**
- MP: 60% (need mana for sio)
- Heal Target: "Tank Name"

---

### Scenario 3: AoE Sorcerer

**Enable:**
- Mage MP ✓
- Area Spell ✓
- Auto Loot ✓
- Equipment Manager ✓

**Settings:**
- Area: "exevo gran mas vis"
- Min Monsters: 3
- Min Mana: 500

---

### Scenario 4: Distance Paladin

**Enable:**
- Paladin HP ✓
- Paladin MP ✓
- Smart Target ✓
- Auto Loot ✓
- Auto Buffs ✓

**Settings:**
- HP: 70%
- MP: 60%
- Haste: "utani hur"

---

### Scenario 5: Low Level (Any Vocation)

**Enable:**
- Your vocation healer ✓
- Auto Loot ✓
- Auto Food ✓

**Settings:**
- HP: 80-85% (very safe!)
- Use cheaper potions

---

## 🔧 TROUBLESHOOTING

### Problem: Script loads but nothing happens

**Solution:**
1. Click icons to enable them
2. Icons are OFF by default when first clicked
3. Click again to toggle ON (icon should light up)

---

### Problem: Potions not being used

**Check:**
- HP actually below threshold?
- Have potions in backpack?
- Not in PZ?
- Icon enabled?

**Debug:**
```lua
print(hppercent())  -- Check current HP
print(storage.knightHealer.hpPercent)  -- Check threshold
```

---

### Problem: Spells not casting

**Check:**
- Have enough mana?
- Spell name correct?
- Not exhausted?
- Icon enabled?

**Fix spell name:**
```lua
storage.sorcSpells.areaSpell = "exevo gran mas vis"  -- Exact name
```

---

### Problem: Too much lag

**Solution:**
1. Increase macro intervals:
```lua
macro(200, ...)  -- Change to macro(500, ...)
```

2. Disable some features you don't need

3. Increase delays:
```lua
delay(1000)  -- Change to delay(1500)
```

---

### Problem: Icons overlapping

**Solution:**
- Drag icons to spread them out
- Icons are movable!
- Position saves automatically

---

### Problem: Can't find the file

**Make sure:**
- File is named exactly: `ULTIMATE_ALL_IN_ONE.lua`
- File is in OTClient root directory
- Use absolute path if needed:
```lua
dofile("/path/to/ULTIMATE_ALL_IN_ONE.lua")
```

---

## 📞 GETTING HELP

**Still having issues?**

1. Read `FULL_DOCUMENTATION.md` for detailed info
2. Check `CONFIGURATION_GUIDE.md` for settings
3. Re-read this FAQ
4. Check console for error messages
5. Try resetting storage and reloading

**Most issues are:**
- Icons not clicked to enable
- Wrong settings/thresholds
- Missing items (potions, rings, etc.)

---

## 🎓 ADVANCED TIPS

### Master Tip #1: Create Profiles

**Save different configurations:**
```lua
-- Profile 1: Solo Hunt
local soloProfile = {
  hp = 70,
  emergency = true,
  loot = true
}

-- Profile 2: Party Hunt
local partyProfile = {
  hp = 65,
  emergency = false,
  loot = false
}

-- Switch between them!
```

---

### Master Tip #2: Hotkey the Script

**Create a hotkey:**
1. OTClient Settings → Hotkeys
2. New hotkey
3. Command: `dofile("ULTIMATE_ALL_IN_ONE.lua")`
4. Assign key (e.g., F9)

Now F9 reloads everything!

---

### Master Tip #3: Monitor Performance

**Track your improvement:**
- Kills per hour (with vs without script)
- Death rate
- Profit per hour

Scripts should **improve** all these metrics!

---

**Happy botting! 🎮🤖**

**For more info:**
- QUICK_START_GUIDE.md
- FULL_DOCUMENTATION.md
- CONFIGURATION_GUIDE.md
