# vBot Playbook – **modules/game_bot (MASTER)**
> Cel: pełny, operacyjny przewodnik dla implementacji i utrzymania skryptów **vBot** (moduł `modules/game_bot`) w ramach **OTClient Studio**. Dokument zawiera: standardy kodowania, wzorce (makra/trigger’y), snippety, heurystyki skanera, wymagania jakościowe, checklisty, test‑wektory i integrację z narzędziem. **Transfer 1:1** – gotowe do wdrożenia.

---
# 0) Executive Summary
- **Co obejmuje:** makra okresowe, trigger’y eventowe, interakcje z UI/światem gry, wzorce bezpieczeństwa, logowanie, diagnostykę i performance.
- **Jak używać:** jako *źródło prawdy* dla generatorów w Studio (szablony vBot), lint vBot (reguły domenowe) oraz heurystyk skanera (detekcja symboli vBot w kodzie).

---
# 1) Słownik i konwencje
- **Makro** – blok wykonywany cyklicznie (interwał ms) lub sterowany warunkiem.
- **Trigger** – blok reagujący na zdarzenie (np. wiadomość, zmiana HP, wejście na tile).
- **Guard** – warunek bezpieczeństwa (np. `isConnected()`, `not isBusy()`), który musi być spełniony przed akcją.
- **Cooldown** – minimalny czas między kolejnymi akcjami (zapobiega spamowi).
- **State** – lokalny stan makra (zapamiętanie poprzedniej decyzji/targetu).

Konwencje nazewnictwa (zalecane):
- Pliki: `vb_<obszar>_<cel>.lua` np. `vb_combat_uh.lua`.
- Funkcje lokalne: `vb_<obszar>_<akcja>()` np. `vb_heal_cast()`.
- Zmienne stanu: `state_<nazwa>`.
- Logi: prefiks `"[vBot]"` i tagi (`[heal]`, `[loot]`).

---
# 2) Architektura vBot (w ujęciu skryptowym)
- **Warstwa zdarzeń gry** → callbacki (np. text message, damage, map change).
- **Warstwa makr** → pętle interwałowe i warunki.
- **Warstwa akcji** → użycia czarów/przedmiotów, ruch, interakcja z UI.
- **Warstwa narzędzi** → helpers (cooldown, debouncing, retry), logowanie NDJSON (opcjonalnie).

Każdy komponent powinien być **izolowany** (funkcje `local`, brak globali), testowalny oraz posiadać jasne **guards**.

---
# 3) Wzorce (makra i trigger’y)
> Poniższe wzorce to gotowe schematy do generatora w Studio. Każdy zawiera: cel, pre‑warunki, interfejs konfiguracyjny, guards, cooldown, logowanie oraz sekcję bezpieczeństwa.
# 3.1 Makro: Auto‑Heal na progu HP
**Cel:** rzucenie czaru/ użycie pota, gdy HP < progu.

**Konfiguracja (OTML/JSON dla Studio):**
```json
{"name":"vb_auto_heal","threshold":60,"spell":"exura","cooldownMs":1200}
```

**Szkielet (Lua):**
```lua
-- vb_auto_heal.lua
local THRESHOLD = 60      -- procent
local SPELL = 'exura'
local COOLDOWN = 1200     -- ms

local last = 0
local function can()
  return g_game.isOnline() and not g_game.isAttacking() and not g_game.isWalking()
end

local function now() return g_clock.millis() end

local function tick()
  if not can() then return end
  local hp = g_game.getLocalPlayer() and g_game.getLocalPlayer():getHealthPercent() or 100
  if hp < THRESHOLD and (now() - last) > COOLDOWN then
    say(SPELL)
    last = now()
    print('[vBot][heal] cast', SPELL, 'hp', hp)
  end
end

-- rejestracja makra w schedulerze (implementacja zależna od środowiska vBot)
-- macro(200, tick) -- jeśli środowisko udostępnia
-- w OTC Studio: dodaj do pętli narzędzia lub harmonogramu modułu
```

**Bezpieczeństwo:** sprawdź `g_game.isOnline()`, wstrzymaj w czasie `isWalking()`; cooldown ≥ GCD klienta, sprawdź manę przed `say()`.
# 3.2 Trigger: Reakcja na wiadomość tekstową
**Cel:** wykrycie frazy i akcja (np. odpowiedź, log, zapis zdarzenia).

**Konfiguracja:**
```json
{"name":"vb_msg_react","match":"^hi$","reply":"hello"}
```

**Szkielet (Lua):**
```lua
-- vb_msg_react.lua
local PATTERN = '^hi$'
local REPLY = 'hello'

local function onTextMessage(mode, text)
  if not g_game.isOnline() then return end
  if text:lower():match(PATTERN) then
    print('[vBot][msg] match:', text)
    say(REPLY)
  end
end

-- rejestracja: attach do zdarzenia tekstowego w środowisku vBot/OTClient
-- modules.game_textmessage.onTextMessage:connect(onTextMessage) -- przykład; dostosuj do dostępnych hooków
```

**Bezpieczeństwo:** sanitacja regex (escape), limit odpowiedzi (cooldown per nadawca), nie odpowiadaj na własne linie.
# 3.3 Makro: Auto‑Haste (buff w ruchu)
**Cel:** utrzymywanie buffa szybkości przy poruszaniu się.

**Konfiguracja:**
```json
{"name":"vb_auto_haste","spell":"utani hur","cooldownMs":6000}
```

**Szkielet:**
```lua
local SPELL = 'utani hur'
local COOLDOWN = 6000
local last = 0

local function hasHaste()
  -- sprawdź ikony buffów na UI lub stan gracza (jeśli dostępny)
  return false
end

local function tick()
  if not g_game.isOnline() then return end
  if g_game.isWalking() and not hasHaste() and (g_clock.millis() - last) > COOLDOWN then
    say(SPELL)
    last = g_clock.millis()
    print('[vBot][buff] haste cast')
  end
end

-- macro(300, tick)
```

**Bezpieczeństwo:** nie spamuj – sprawdź buff i cooldown; upewnij się, że gracz ma manę.
# 3.4 Trigger: Loot po ubiciu potwora
**Cel:** podniesienie łupu po wykryciu ciała.

**Szkielet (zarys):**
```lua
local function onTileAddThing(tile, thing)
  if not g_game.isOnline() then return end
  if thing:isContainer() and thing:isCorpse() then
    -- logika lootu; otwarcie kontenera, iteracja zawartości, use()
  end
end

-- rejestracja na event mapy/tili (zależna od dostępnych hooków środowiska)
```

**Bezpieczeństwo:** limit równoległych otwarć; przerwij, gdy inventory pełne; nie blokuj głównej pętli.
# 3.5 Makro: Anti‑Idle
**Cel:** zapobiec disconnectowi przez delikatną interakcję.

**Szkielet:**
```lua
local last = 0
local function tick()
  if not g_game.isOnline() then return end
  if g_clock.millis() - last > 60*1000 then
    turn(math.random(0,3))
    last = g_clock.millis()
    print('[vBot][antiidle] turn')
  end
end
-- macro(1000, tick)
```

**Bezpieczeństwo:** nie wykonuj w trakcie walki; nie przeszkadzaj w ręcznych akcjach.

---
# 4) Heurystyki skanera (detekcja vBot)
> Celem jest wiarygodne wykrycie „kodu vBot” i jego relacji, bez uruchamiania Lua.

- **Sygnały makr:** obecność wywołań `macro(`, wzorce „scheduler/macro loop” (identyfikatory `macro`, `scheduleEvent`, `addEvent` z typową semantyką okresową).
- **Sygnały trigger’ów:** funkcje o nazwach `onX...` (np. `onTextMessage`) podpinane do znanych sygnałów modułów (np. *text message module*, *map events*).
- **Słowa kluczowe domeny:** `say(`, `use(`, `useWith(`, `walkTo(`, `turn(`, `attack(`, identyfikatory zasobów (`ui/…otui`).
- **Relacje:** `g_ui.loadUI('…')` ↔ `lua_to_otui` (do mapowania UI z logiką vBot).
- **Klasyfikacja plików:** prefiks `vb_`, lokalizacja w `modules/game_bot/…` podnosi wagę dopasowania.

**Emisja do `project-index.json`:** węzeł `symbols.botSymbols`:
```json
{"heal":["modules/game_bot/vb_combat_uh.lua:12"],"antiidle":["modules/game_bot/vb_anti_idle.lua:5"]}
```

---
# 5) Reguły jakości (lint vBot)
> Rozszerzenie lintu Lua/OTUI o reguły domenowe vBot (bez auto‑fixu, chyba że bezpieczny).

- **VBOT‑001** – Brak `guard` przed akcją (wymagane `g_game.isOnline()` i brak kolizji z ruchem/walką, jeśli ma znaczenie).
- **VBOT‑002** – Cooldown < zalecanego minimum dla danej akcji (np. < 1000 ms dla czaru) → WARN.
- **VBOT‑003** – Blokujące pętle/sleep w makrze (zamiast tego `scheduleEvent`).
- **VBOT‑004** – Spam `say()`/`use()` bez limitu – brak licznika/okna czasowego.
- **VBOT‑005** – Globalne symbole w pliku vBot (wymagane `local`).
- **VBOT‑006** – Brak logowania kontekstowego przy krytycznych akcjach.
- **VBOT‑007** – Brak anulowania makra po `isDisconnected()`.
- **VBOT‑008** – Zależność od UI bez sprawdzenia istnienia `widget`.

**Konfiguracja (JSON):**
```json
{"VBOT-001":{"enabled":true,"severity":"ERROR"},"VBOT-002":{"enabled":true,"severity":"WARN","minCooldownMs":1000}}
```

---
# 6) Logowanie i telemetria (opcjonalnie NDJSON)
- Format linii (zalecany): `{ts, level, tag, file, line, msg, meta}`.
- Tagi: `[heal]`, `[msg]`, `[buff]`, `[loot]`, `[antiidle]`.
- Logi krytyczne: akcje `say/use` z parametrami i wynikiem.
- Integracja ze Studio: panel Log Viewer filtruje po `tag/level/file:line`.

**Przykład:**
```json
{"ts":"2025-10-02T12:00:00.000Z","level":"INFO","tag":"heal","file":"modules/game_bot/vb_auto_heal.lua","line":18,"msg":"cast","meta":{"spell":"exura","hp":43}}
```

---
# 7) Bezpieczeństwo i zgodność
- **Idempotencja:** makra nie powinny powodować skutków ubocznych przy powtarzaniu (guard+cooldown).
- **Ostrożność UI:** sprawdzaj istnienie widgetów przed modyfikacją (`if widget then ...`).
- **Zasoby:** nie używaj nieistniejących ścieżek; weryfikuj z `assets-map.json`.
- **Granice:** makra nie powinny ingerować w pliki poza katalogiem projektu.

---
# 8) Wydajność
- Interwały: nie schodź poniżej 150–250 ms dla ogólnych makr; kosztowne operacje (skany mapy/UI) ≥ 1000 ms.
- Unikaj pełnych skanów co tick – cache wyników, porównuj zmiany.
- Używaj `scheduleEvent` zamiast pętli blokujących; debounce wejścia.

---
# 9) Generator vBot (szablony do Studio)
**Wejście:** parametry (JSON/OTML) – np. `threshold`, `spell`, `cooldownMs`.
**Wyjście:** plik `vb_<nazwa>.lua` + wpis w module (opcjonalny UI konfiguracyjny).
**Checklista generacji:**
- [ ] Plik w `modules/game_bot/…`.
- [ ] Nazwy `local`, brak globali.
- [ ] Guards i cooldown zaimplementowane.
- [ ] Logi z prefiksem `[vBot]` i tagiem.
- [ ] Komentarz nagłówkowy (opis, parametry, interwał).

---
# 10) Test‑wektory (QA vBot)
- **HEAL‑01:** HP 55% → oczekiwany 1× `say('exura')`, brak spam w 1200 ms.
- **MSG‑01:** Tekst `hi` → odpowiedź `hello` tylko 1× / 3 s na nadawcę.
- **HASTE‑01:** Ruch z brakiem buffa → `say('utani hur')` nie częściej niż co 6 s.
- **LOOT‑01:** Pojawia się `corpse` na tile → wywołanie `use()` na kontenerze (jeśli dostępne API); brak błędów przy braku miejsca.
- **IDLE‑01:** Brak aktywności 60 s → `turn()`; brak gdy `isAttacking()`.

---
# 11) Integracja ze Studio
- **Skaner:** heurystyki z §4 zasilają `symbols.botSymbols`.
- **Lint:** reguły z §5 uzupełniają lint Lua (domena vBot).
- **Generator:** szablony z §9 dostępne w panelu „Nowy → vBot”.
- **Dokumentacja:** panel „vBot Playbook” linkuje do wzorców i przykładów.

---
# 12) Checklisty wdrożeniowe
- [ ] Każde makro/trigger ma guards i cooldown.
- [ ] Brak globali; `local` wszędzie.
- [ ] Logi akcji krytycznych.
- [ ] Parametry wyniesione do konfiguracji.
- [ ] Test‑wektory przechodzą; brak regresji.

---
# 13) Noty końcowe
- Wzorce są rozszerzalne; dodając nowe, zachowaj nazewnictwo i sekcje: *cel → konfiguracja → guards → cooldown → logi → testy*.
- Wszelkie modyfikacje wymagają aktualizacji generatora i reguł QA.

