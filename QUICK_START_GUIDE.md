# QUICK START GUIDE
# Szybki Start

## 🚀 Jak Zacząć / How to Start

### Krok 1: Załaduj Skrypt / Step 1: Load the Script

```lua
dofile("ULTIMATE_ALL_IN_ONE.lua")
```

**To wszystko!** / **That's it!**

Jeden plik, wszystkie funkcje, 24 ikony gotowe!  
One file, all features, 24 icons ready!

---

## 📋 Co Dostajesz / What You Get

### ✓ 10 Skryptów w Jednym Pliku
### ✓ 10 Scripts in One File

**Dla Twojej Profesji:**
1. Knight Healer - HP potions + Exura Ico
2. Paladin Healer - HP/MP potions + Exura San  
3. Mage Healer - MP potions + Exura Gran/Vita
4. Sorcerer Spells - Area + Single attack spells
5. Druid Spells - Heal friend + Cure

**Uniwersalne Narzędzia:**
6. Smart Combat - Smart targeting
7. Auto Loot - Gold collection
8. Emergency - Ring/SSA protection
9. Auto Buffs - Haste/Food/Light
10. Equipment - Auto soft boots/amulets

---

## 🎮 Pierwsze Kroki / First Steps

### 1. Załaduj Plik
```lua
dofile("ULTIMATE_ALL_IN_ONE.lua")
```

### 2. Zobaczysz 24 Ikony
- Wszystkie przesuwalne
- Wszystkie klikalne
- Kliknij aby włączyć/wyłączyć

### 3. Skonfiguruj (Opcjonalnie)
Przejdź do zakładek i ustaw swoje preferencje:
- Knight → Ustaw % HP
- Paladin → Ustaw % HP/MP
- Combat → Włącz/wyłącz funkcje
- Etc.

---

## ⚙️ Podstawowa Konfiguracja / Basic Configuration

### Dla Knight:
```lua
storage.knightHealer.hpPercent = 70  -- Użyj HP pot gdy HP < 70%
```

### Dla Paladin:
```lua
storage.paladinHealer.hpPercent = 65  -- HP potion at 65%
storage.paladinHealer.mpPercent = 50  -- MP potion at 50%
```

### Dla Mage:
```lua
storage.mageHealer.mpPercent = 45  -- MP potion at 45%
```

### Dla Emergency:
- Automatyczny ring przy HP < 30%
- Automatyczny SSA przy HP < 25%
- Nie wymaga konfiguracji!

---

## 💡 Wskazówki / Tips

### ✓ Organizuj Ikony
Przeciągnij ikony w dogodne miejsce na ekranie.
Pozycja zostanie zapamiętana!

### ✓ Włączaj Co Potrzebujesz
Nie musisz używać wszystkich 24 ikon.
Kliknij aby wyłączyć niepotrzebne.

### ✓ Testuj Bezpiecznie
Zacznij w bezpiecznej strefie (PZ).
Sprawdź czy wszystko działa.

---

## 🎯 Przykładowe Setupy / Example Setups

### Knight Hunt:
- Knight HP ✓
- Exura Ico ✓
- Smart Target ✓
- Loot Gold ✓
- Emergency Ring ✓

### Paladin Hunt:
- Paladin HP ✓
- Paladin MP ✓
- Smart Target ✓
- Auto Loot ✓
- Auto Haste ✓

### Mage Hunt:
- Mage MP ✓
- Sorcerer/Druid Spells ✓
- Auto Loot ✓
- Emergency ✓
- Equipment Manager ✓

---

## ❓ FAQ

**Q: Jak wyłączyć skrypt?**  
A: Kliknij na ikonę aby ją wyłączyć, lub zrestartuj klienta.

**Q: Czy mogę edytować plik?**  
A: Tak! Otwórz ULTIMATE_ALL_IN_ONE.lua i edytuj co chcesz.

**Q: Jak zmienić item ID?**  
A: Edytuj storage w pliku lub w konsoli Lua.

**Q: Czy działa dla wszystkich profesji?**  
A: Tak! Zawiera skrypty dla wszystkich 5 profesji.

---

## 🔧 Rozwiązywanie Problemów / Troubleshooting

**Problem: Skrypt się nie ładuje**
```lua
-- Sprawdź ścieżkę:
dofile("ULTIMATE_ALL_IN_ONE.lua")  -- Musi być w głównym folderze
```

**Problem: Ikony nie działają**
- Kliknij na ikonę aby ją włączyć
- Sprawdź czy masz potiony/many
- Sprawdź konsole dla błędów

**Problem: Chcę zresetować ustawienia**
```lua
storage.knightHealer = nil
storage.paladinHealer = nil
-- Itd., potem przeładuj skrypt
```

---

## 📞 Wsparcie / Support

- Przeczytaj pełną dokumentację: `FULL_DOCUMENTATION.md`
- Sprawdź konfigurację: `CONFIGURATION_GUIDE.md`
- Zobacz FAQ: `FAQ_AND_TIPS.md`

---

**Gotowe! Teraz po prostu kliknij ikony i graj! 🎮**

**Ready! Now just click icons and play! 🎮**
