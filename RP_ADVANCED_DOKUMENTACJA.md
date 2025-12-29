# ROYAL PALADIN 900 SKILL - DOKUMENTACJA

## Jak Użyć

```lua
dofile("RP_ADVANCED_900_SKILL.lua")
```

**UWAGA:** Auto-potion HP/MP jest wbudowane w klienta OTCv8 - nie ma potrzeby dublować tej funkcji w skrypcie!

## 11 Zaawansowanych Ikon (bez auto-potion)

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

### 3. 🔮 Exura Gran (Healing Spell)

**Opis:** Automatyczny Exura Gran gdy HP < 50%

**Dlaczego to ważne:** Najsilniejszy self-healing spell RP. 
**UWAGA:** Potions są w kliencie - ten skrypt używa tylko spelli!

**Konfiguracja:**
- Exura Gran HP %: Próg dla Exura Gran (domyślnie 50%)

---

### 4. 🔮 Exura San (Healing Spell)

**Opis:** Automatyczny Exura San gdy HP < 60%

**Dlaczego to ważne:** Średni healing spell - używaj gdy Gran na cooldown.

**Konfiguracja:**
- Exura San HP %: Próg dla Exura San (domyślnie 60%)

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

### 11. 👢 Auto Soft Boots

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

### Healing Spells (NIE POTIONS - KLIENT MA TO!)
- **Exura Gran HP %:** Próg HP dla Exura Gran (domyślnie 50%)
- **Exura San HP %:** Próg HP dla Exura San (domyślnie 60%)

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
Exura Gran HP: 55%
Exura San HP: 65%
Divine Missile MP: 35%
Auto Utamo: ON
```

### Dla Solo Hunt
```
E-Ring HP: 35%
E-Ring Monsters: 2
Exura Gran HP: 45%
Exura San HP: 60%
Divine Missile MP: 25%
Auto Utamo: ON
```

### Dla High-Risk Spawns (Issavi, Catacombs, etc.)
```
E-Ring HP: 50%
E-Ring Monsters: 3
Exura Gran HP: 60%
Exura San HP: 70%
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
- **Potions - ustaw w kliencie OTCv8!** (klient ma wbudowane auto-potion)
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
2. Exura Gran/San (healing spells)
3. Priority Target (targeting)
4. Divine Missile (damage)

**Q: Czy to działa na level 300+?**
A: Tak, optymalizowane dla high-level (300-1000+).

**Q: Jak wyłączyć konkretną funkcję?**
A: Kliknij ikonę aby ją disable (czerwony = wyłączone, zielony = włączone).

**Q: Czy Energy Ring będzie się zużywać?**
A: Tak, dlatego miej minimum 5 sztuk. Skrypt automatycznie zakłada nowy gdy poprzedni się zużyje.

**Q: Dlaczego brak auto-potion HP/MP?**
A: Klient OTCv8 ma wbudowane auto-potion - nie ma potrzeby dublować tej funkcji! Ustaw potions w kliencie.

---

## Wsparcie

Stworzone dla Royal Paladin 900 skill.
Optymalizowane dla maksymalnego survivalu i damage output.

**Wersja:** 1.0
**Data:** 2025-12-15
