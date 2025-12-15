# ROYAL PALADIN 900 SKILL - DOKUMENTACJA

## Jak Użyć

```lua
dofile("RP_ADVANCED_900_SKILL.lua")
```

## 12 Zaawansowanych Ikon

### 1. ⚡ Energy Ring Priority (PRIORYTET #1)

**Opis:** Najważniejsza funkcja - automatycznie zakłada Energy Ring gdy:
- HP spadnie poniżej progu (domyślnie 40%)
- Jest 3+ potworów w odległości 6 pól
- Zdejmuje ring gdy HP > 70% i < 2 potwory

**Dlaczego to ważne:** Energy Ring chroni przed 85% fizycznych obrażeń - niezbędne dla high-lvl RP.

**Konfiguracja:**
- E-Ring HP %: Próg HP do założenia (domyślnie 40%)
- E-Ring Monsters: Ilość potworów do auto-założenia (domyślnie 3)

---

### 2. 🛡️ Ultimate Emergency (3-poziomowy system)

**Opis:** Automatyczny system awaryjny z 3 poziomami ochrony:
- **Level 1 (HP < 30%):** Emergency Ring
- **Level 2 (HP < 20%):** Stone Skin Amulet (SSA)
- **Level 3 (HP < 15%):** Might Ring (backup)

**Dlaczego to ważne:** Wielopoziomowa ochrona zapobiega śmierci w sytuacjach krytycznych.

---

### 3. 💊 Advanced HP (Multi-level healing)

**Opis:** Inteligentny system leczenia z priorytetem:
1. **Exura Gran** - gdy HP < 50% (najsilniejszy spell)
2. **Exura San** - gdy HP < 60% (średni spell)
3. **HP Potion** - gdy HP < 70% (potions)

**Dlaczego to ważne:** Automatycznie wybiera najlepszą metodę leczenia w zależności od HP.

**Konfiguracja:**
- HP Potion %: Próg dla potions (domyślnie 70%)
- Exura Gran HP %: Próg dla Exura Gran (domyślnie 50%)

---

### 4. 💧 Advanced MP (Mana management)

**Opis:** Automatyczne uzupełnianie many gdy MP < 55%.

**Konfiguracja:**
- MP Potion %: Próg dla mana potions (domyślnie 55%)

---

### 5. 🌟 Mas Res (Area healing)

**Opis:** Automatyczne Exura Mas Res gdy:
- HP < 85%
- 3+ potworów w odległości 5 pól

**Dlaczego to ważne:** Leczy wszystkich graczy w okolicy - idealne do team hunt.

---

### 6. 🎯 Priority Target (Inteligentny targeting)

**Opis:** Automatyczny wybór celu:
- Priorytet: Potwór z najniższym HP%
- Zakres: Do 8 pól
- Auto-switch gdy cel umiera

**Dlaczego to ważne:** Szybsze zabijanie = mniej damage received.

---

### 7. ⚔️ Divine Missile (Auto-cast)

**Opis:** Automatyczny Divine Missile (exori gran con) gdy:
- MP > 30%
- Target w odległości 3-7 pól
- Cooldown: 2 sekundy

**Dlaczego to ważne:** Twój główny single-target spell - max damage.

**Konfiguracja:**
- Divine Missile MP %: Minimalny MP do castu (domyślnie 30%)

---

### 8. 💥 Divine Caldera (AOE)

**Opis:** Automatyczny Divine Caldera (exevo mas san) gdy:
- MP > 35%
- 3+ potworów w odległości 3 pól
- Cooldown: 2 sekundy

**Dlaczego to ważne:** Area spell - max exp w grupach potworów.

---

### 9. 🗡️ Ethereal Spear

**Opis:** Automatyczny Ethereal Spear (exori con) gdy:
- MP > 25%
- Target w odległości 4-7 pól
- Cooldown: 1.5 sekundy

**Dlaczego to ważne:** Dodatkowy damage spell na distant targets.

---

### 10. 🏃 Auto Haste

**Opis:** Automatyczny Haste (utani gran hur) gdy:
- Nie masz Haste
- Nie jesteś w PZ

**Dlaczego to ważne:** Prędkość = więcej exp i bezpieczeństwo.

---

### 11. 🛡️ Auto Utamo

**Opis:** Automatyczny Utamo Vita gdy:
- HP < 60%
- 2+ potworów w odległości 4 pól

**Dlaczego to ważne:** Zmniejsza otrzymywane obrażenia w ciężkich walkach.

---

### 12. 👢 Auto Soft Boots

**Opis:** Automatyczne zakładanie Soft Boots gdy:
- MP < 85%
- Zdejmuje gdy MP > 95%
- Zakłada Boots of Haste gdy MP pełne

**Dlaczego to ważne:** Regeneracja many = więcej spelli = więcej exp.

**Konfiguracja:**
- Soft Boots MP %: Próg do założenia (domyślnie 85%)

---

## Panel Konfiguracji

Wszystkie ustawienia są edytowalne w panelu:

### Energy Ring
- **E-Ring HP %:** Kiedy założyć ring (domyślnie 40%)
- **E-Ring Monsters:** Ile potworów = auto ring (domyślnie 3)

### Healing
- **HP Potion %:** Próg HP dla potions (domyślnie 70%)
- **MP Potion %:** Próg MP dla potions (domyślnie 55%)
- **Exura Gran HP %:** Próg HP dla Exura Gran (domyślnie 50%)

### Spells
- **Divine Missile MP %:** Min MP do Divine Missile (domyślnie 30%)
- **Soft Boots MP %:** Próg MP dla Soft Boots (domyślnie 85%)

### Switches (On/Off)
- **Auto Haste:** Włącz/wyłącz auto haste
- **Auto Utamo:** Włącz/wyłącz auto utamo vita
- **Priority Targeting:** Włącz/wyłącz inteligentny targeting
- **Auto Soft Boots:** Włącz/wyłącz auto soft boots

---

## Rekomendowane Ustawienia

### Dla Team Hunt (3+ osób)
```
E-Ring HP: 45%
E-Ring Monsters: 4
HP Potion: 75%
Exura Gran HP: 55%
Divine Missile MP: 35%
Auto Utamo: ON
```

### Dla Solo Hunt
```
E-Ring HP: 35%
E-Ring Monsters: 2
HP Potion: 65%
Exura Gran HP: 45%
Divine Missile MP: 25%
Auto Utamo: ON
```

### Dla High-Risk Spawns (Issavi, Catacombs, etc.)
```
E-Ring HP: 50%
E-Ring Monsters: 3
HP Potion: 80%
Exura Gran HP: 60%
Divine Missile MP: 40%
Auto Utamo: ON
Priority Targeting: ON
```

---

## Wymagane Przedmioty

### Obowiązkowe:
- Energy Ring (3088) - minimum 5 sztuk
- Emergency Ring (3051) - minimum 3 sztuki
- Stone Skin Amulet (3081) - minimum 2 sztuki
- Ultimate Health Potion (266) - 100+
- Ultimate Mana Potion (268) - 100+
- Soft Boots (6132) - 1 para

### Opcjonalne:
- Might Ring (3097) - backup emergency
- Boots of Haste (3982) - gdy nie używasz soft boots

---

## Kompatybilność

✅ Działa z:
- OTCv8
- Wszystkie pozostałe skrypty (ULTIMATE_ALL_IN_ONE.lua, etc.)
- Wszystkie servery Tibia (OTS i Global)

---

## FAQ

**Q: Czy mogę używać tego razem z innymi skryptami?**
A: Tak! Ten skrypt został zaprojektowany aby współpracować z innymi.

**Q: Które ikony są najważniejsze?**
A: 
1. Energy Ring Priority (najpriorytet)
2. Advanced HP (healing)
3. Priority Target (targeting)
4. Divine Missile (damage)

**Q: Czy to działa na level 300+?**
A: Tak, optymalizowane dla high-level (300-1000+).

**Q: Jak wyłączyć konkretną funkcję?**
A: Kliknij ikonę aby ją disable (czerwony = wyłączone, zielony = włączone).

**Q: Czy Energy Ring będzie się zużywać?**
A: Tak, dlatego miej minimum 5 sztuk. Skrypt automatycznie zakłada nowy gdy poprzedni się zużyje.

---

## Wsparcie

Stworzone dla Royal Paladin 900 skill.
Optymalizowane dla maksymalnego survivalu i damage output.

**Wersja:** 1.0
**Data:** 2025-12-15
