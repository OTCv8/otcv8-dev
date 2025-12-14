# Najnowsze Skrypty Sterowane Ikonami / Latest Icon-Controlled Scripts

## 🎮 Przegląd / Overview

Najnowsza kolekcja skryptów dla OTCv8 sterowanych głownie przez ikony. Wszystkie funkcje są łatwo dostępne przez klikalne, przesuwalne ikony na ekranie.

Latest collection of OTCv8 scripts controlled mainly by icons. All features are easily accessible through clickable, movable on-screen icons.

## 📦 Zawarte Skrypty / Included Scripts

### 1. **Icon Healer** (`icon_healer.lua`)
Zaawansowany system leczenia sterowany ikonami / Advanced healing system with icon controls

**Funkcje / Features:**
- ❤️ Auto Health Potions (Ultimate HP)
- 💙 Auto Mana Potions (Ultimate MP)
- 🌟 Auto Healing Spells (Exura Gran, Exura San)
- 💍 Emergency Ring System (Auto-equip at low HP)
- ⚙️ Konfigurowalne progi HP/MP / Configurable HP/MP thresholds

**Ikony / Icons:**
- Health Potion (movable)
- Mana Potion (movable)
- Exura Gran (movable)
- Exura San (movable)
- Emergency Ring (movable)

---

### 2. **Icon Combat** (`icon_combat.lua`)
Kompleksowy system walki z targetowaniem / Comprehensive combat system with targeting

**Funkcje / Features:**
- 🎯 Smart Targeting (najbliższy lub najniższe HP / closest or lowest HP)
- 🔒 Keep Target (utrzymuj cel / maintain target)
- 💥 Auto Area Spells (automatyczne zaklęcia obszarowe)
- ⚔️ Auto Single Target Spells
- 💀 Auto SD (Sudden Death rune)
- 🌀 Exori Combo System

**Ikony / Icons:**
- Smart Target
- Keep Target
- Area Spell
- Single Spell
- SD Attack
- Exori Combo

---

### 3. **Icon Utility** (`icon_utility.lua`)
Narzędzia użytkowe i buffy / Utility tools and buffs

**Funkcje / Features:**
- 🏃 Auto Haste (utani gran hur)
- 🍖 Auto Food
- 💊 Auto Cure Poison (exana pox)
- 💡 Auto Light (utevo lux)
- 🛡️ Training Mode (utamo vita)
- 👢 Auto Soft Boots
- 💍 Auto Ring Manager
- 📿 Auto Amulet Switcher

**Ikony / Icons:**
- Auto Haste
- Auto Food
- Auto Cure
- Auto Light
- Training Mode
- Soft Boots
- Auto Ring
- Amulet Switch

---

### 4. **Icon Loot** (`icon_loot.lua`)
Zaawansowany system lootowania / Advanced looting system

**Funkcje / Features:**
- 💰 Loot Gold Only
- 💎 Loot Rare Items (konfigurowalna lista)
- 📦 Loot All Items
- 🔓 Auto Open Corpses
- 📚 Container Stacking
- 🏦 Depot Depositing

**Ikony / Icons:**
- Loot All
- Loot Gold
- Loot Rares
- Open Corpses
- Stack Items
- Deposit Gold

---

### 5. **Icon Cavebot** (`icon_cavebot.lua`)
System automatycznego huntowania / Automated hunting system

**Funkcje / Features:**
- 📍 Waypoint Recording (nagrywanie trasy)
- 🚶 Auto Walk Path
- ⚔️ Auto Fight Mode
- 🎯 Priority Targeting
- 🔄 Auto Refiller (powrót na depot)
- 📊 Waypoint Management

**Ikony / Icons:**
- Cavebot (start/stop)
- Add Waypoint
- Clear Waypoints
- Fight Mode
- Refiller
- Target Priority

---

## 🚀 Instalacja i Użycie / Installation & Usage

### Szybki Start / Quick Start

1. **Załaduj główny loader:**
```lua
dofile("icon_scripts_loader.lua")
```

2. **Lub załaduj pojedyncze skrypty:**
```lua
dofile("icon_healer.lua")
dofile("icon_combat.lua")
dofile("icon_utility.lua")
dofile("icon_loot.lua")
dofile("icon_cavebot.lua")
```

### Podstawowe Użycie / Basic Usage

1. **Kliknij na ikonę** aby włączyć/wyłączyć funkcję
2. **Przeciągnij ikony** w dowolne miejsce na ekranie
3. **Skonfiguruj ustawienia** w zakładce każdego skryptu
4. **Monitoruj konsolę** dla statusu i informacji

---

## ⚙️ Konfiguracja / Configuration

Wszystkie skrypty zapisują ustawienia w `storage`. Przykłady:

### Icon Healer
```lua
storage.iconHealer.healthPercent = 60  -- Użyj HP pot gdy HP < 60%
storage.iconHealer.manaPercent = 40    -- Użyj MP pot gdy MP < 40%
storage.iconHealer.exuraGranHP = 40    -- Użyj Exura Gran gdy HP < 40%
```

### Icon Combat
```lua
storage.iconCombat.attackLowestHP = true    -- Atakuj najniższe HP
storage.iconCombat.areaSpell = "exevo gran mas vis"
storage.iconCombat.minMonstersForArea = 3   -- Min mobów dla area
```

### Icon Utility
```lua
storage.iconUtility.hasteSpell = "utani gran hur"
storage.iconUtility.hasteInterval = 10000   -- Co 10 sekund
storage.iconUtility.foodId = 3725           -- Brown mushroom
```

### Icon Loot
```lua
-- Dodaj rare itemy
table.insert(storage.iconLoot.rareItems, 3392) -- Royal helmet
storage.iconLoot.maxDistance = 3               -- Max odległość
```

### Icon Cavebot
```lua
storage.iconCavebot.precision = 1      -- Dokładność waypoint
storage.iconCavebot.maxDistance = 20   -- Max dystans chodzenia
```

---

## 💡 Przykłady Setupów / Setup Examples

### Hunt Setup (Hunting)
```lua
-- Załaduj:
dofile("icon_scripts_loader.lua")

-- Włącz ikony:
• Icon Combat - Smart Target ✓
• Icon Healer - All healing icons ✓
• Icon Loot - Loot Gold + Rares ✓
• Icon Utility - Auto Haste ✓

-- Ustaw progi:
• HP Potion: 60%
• MP Potion: 40%
• Exura Gran: 35%
```

### Training Setup
```lua
-- Załaduj:
dofile("icon_utility.lua")
dofile("icon_healer.lua")

-- Włącz:
• Training Mode (utamo vita) ✓
• Auto Mana Potion ✓

-- Ustaw:
• MP Potion: 80%
• Disable combat features
```

### PvP Setup
```lua
-- Załaduj wszystkie:
dofile("icon_scripts_loader.lua")

-- Włącz:
• Icon Combat - All features ✓
• Icon Healer - Low thresholds ✓
• Icon Utility - Buffs ✓

-- Ustaw:
• HP Potion: 80%
• Emergency Ring: 30%
• Keep Target: ON
```

### Cavebot Hunt
```lua
-- Setup:
1. dofile("icon_cavebot.lua")
2. Przejdź swoją trasę
3. Klikaj "Add WP" icon na każdym punkcie
4. Włącz "Cavebot" icon
5. Włącz "Fight Mode" icon
6. Profit!
```

---

## 🎨 Funkcje Ikon / Icon Features

### Wszystkie Ikony Mają / All Icons Have:
- ✅ **Movable** - Przeciągaj w dowolne miejsce
- ✅ **Toggle** - Kliknij aby włączyć/wyłączyć
- ✅ **Visual Feedback** - Zobacz status na pierwszy rzut oka
- ✅ **Tooltip** - Najechać kursorem dla info
- ✅ **Auto-save** - Pozycja i status zapisywane automatycznie

### Zalety Systemu Ikon / Icon System Benefits:
- 🎯 Szybki dostęp do funkcji
- 🎨 Wizualna organizacja
- 💾 Wszystko zapisane w storage
- 🔄 Łatwa konfiguracja
- 📱 Przyjazny interfejs

---

## 🛠️ Zaawansowane Funkcje / Advanced Features

### Custom Item IDs
Zmień item IDs w ustawieniach:
```lua
storage.iconHealer.healthPotionId = 266  -- Ultimate HP
storage.iconUtility.foodId = 3725        -- Wybierz swoje jedzenie
```

### Custom Spells
Dostosuj zaklęcia:
```lua
storage.iconCombat.areaSpell = "exevo gran mas vis"
storage.iconCombat.singleSpell = "exori gran"
storage.iconUtility.hasteSpell = "utani gran hur"
```

### Priority Targeting (Cavebot)
Dodaj priorytetowe moby:
```lua
-- W icon_cavebot.lua, edytuj:
local priorityMonsters = {
  "dragon lord",
  "demon",
  "hydra"
}
```

### Rare Items List (Loot)
Zarządzaj rare items:
```lua
-- Dodaj nowy:
table.insert(storage.iconLoot.rareItems, ITEM_ID)

-- Zobacz listę:
for i, id in ipairs(storage.iconLoot.rareItems) do
  print(i, id)
end
```

---

## 📊 Monitoring i Debug / Monitoring & Debug

### Console Messages
Wszystkie skrypty logują do konsoli:
```
[Icon Healer] Loaded successfully!
[Icon Combat] Smart targeting enabled
[Cavebot] Added waypoint #5: 1000,1000,7
```

### Storage Inspection
Sprawdź current settings:
```lua
-- Zobacz wszystkie ustawienia healera:
for k, v in pairs(storage.iconHealer) do
  print(k, v)
end
```

---

## 🔒 Bezpieczeństwo / Safety

### Zabezpieczenia Built-in:
- ✅ Sprawdzanie PZ przed użyciem potów
- ✅ Sprawdzanie many przed castowaniem
- ✅ Delay między akcjami
- ✅ Walidacja pozycji i dystansu
- ✅ Sprawdzanie inventory przed ekwipowaniem

### Best Practices:
- ⚠️ Testuj na bezpiecznych obszarach
- ⚠️ Ustaw odpowiednie progi HP/MP
- ⚠️ Monitoruj pierwsze użycie
- ⚠️ Zapisz waypoints przed używaniem cavebota

---

## 🆘 Rozwiązywanie Problemów / Troubleshooting

### Ikony się nie pokazują
```lua
-- Sprawdź czy skrypt załadowany:
dofile("icon_healer.lua")  -- Załaduj ponownie
```

### Funkcja nie działa
```lua
-- Sprawdź czy ikona włączona (kliknij na nią)
-- Sprawdź ustawienia w storage
-- Sprawdź console dla błędów
```

### Reset Settings
```lua
-- Reset wszystkich ustawień:
storage.iconHealer = nil
storage.iconCombat = nil
storage.iconUtility = nil
storage.iconLoot = nil
storage.iconCavebot = nil

-- Następnie przeładuj skrypty
```

---

## 📝 Changelog

### Version 2024 (Latest)
- ✨ Nowy Icon Healer z Emergency Ring
- ✨ Icon Combat z Smart Targeting
- ✨ Icon Utility z Equipment Manager
- ✨ Icon Loot z Rare Items system
- ✨ Icon Cavebot z Priority Targeting
- ✨ Master Loader dla wszystkich skryptów
- ✨ Pełna dokumentacja PL/EN

---

## 👨‍💻 Credits

Created by: **AI Agents System**  
Version: **2024 Latest**  
For: **OTCv8 Development**

---

## 📄 License

Part of OTCv8 project. See main repository LICENSE.

---

## 🔗 Related

- Main Project: OTCv8
- AI Agents: `/ai_agents/`
- More Scripts: Root directory

---

**Miłego Botowania! / Happy Botting!** 🤖✨
