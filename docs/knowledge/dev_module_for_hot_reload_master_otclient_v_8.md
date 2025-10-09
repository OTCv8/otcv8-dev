# Dev Module for Hot‑Reload (MASTER) – **OTClient v8**
> Cel: dostarczyć **produkcyjny moduł Lua** wspierający hot‑reload skryptów OTClient oraz **NDJSON logowanie** do integracji ze Studio. Dokument zawiera: pełną strukturę plików, kompletny kod, konfigurację, protokoły, scenariusze testowe, checklisty i wskazówki operacyjne. **Transfer 1:1** – gotowe do wklejenia.

---
# 0) Założenia i zakres
- **Hot‑reload:** wyzwalane skrótem klawiszowym w kliencie **lub** przez „flag file” (`modules/.dev/reload.flag`).
- **Logi NDJSON:** zapisywane do `modules/.dev/log.jsonl` (rotacja rozmiaru).
- **Bezpieczeństwo:** brak step‑debuggera; debug przez logi i komunikaty.
- **Zależności:** standardowe API OTClient v8 (m.in. `g_modules.reloadModules`, `g_resources.readFile/writeFile`, `addEvent/scheduleEvent`).

---
# 1) Struktura plików modułu
```
modules/
└─ dev/
   ├─ dev.otmod
   ├─ dev.lua
   └─ ui/
      └─ dev.otui   # (opcjonalne mini‑UI)
# Katalog roboczy dla flag/logów (musi istnieć):
modules/.dev/
   ├─ reload.flag   # plik‑flaga (pusty lub z treścią)
   └─ log.jsonl     # NDJSON (tworzony automatycznie)
```
> Uwaga: Utwórz katalog `modules/.dev/` ręcznie, jeśli nie istnieje.

---
# 2) `dev.otmod` (pełny plik)
```otml
name: dev
description: Development tools (hot-reload + NDJSON log)
# Moduł ładuje dev.lua przy starcie klienta
# (dodatkowe pola otmod według konwencji projektu)
```

---
# 3) `ui/dev.otui` (opcjonalny szkielet UI)
```otui
DevWindow < UIWidget {
  id: devWindow
  width: 260
  height: 120
  text: tr("Dev Tools")
}
```
> OTUI: wcięcia 2 spacje; kolejność pól: GEOMETRIA → STYL → ZACHOWANIE.

---
# 4) `dev.lua` (pełny, produkcyjny kod modułu)
```lua
-- modules/dev/dev.lua
-- Dev tools: hot-reload via flag file + NDJSON logging
-- Wymaga katalogu: modules/.dev/

local M = {}

-- === Konfiguracja ===
local CFG = {
  flagPath = 'modules/.dev/reload.flag',
  logPath  = 'modules/.dev/log.jsonl',
  pollMs   = 400,      -- interwał sprawdzania flagi
  minReloadIntervalMs = 800, -- anty-drd
  maxLogBytes = 512 * 1024,  -- 512 KB rotacji
  echoToConsole = true,
}

-- === Stan modułu ===
local state = {
  lastReloadAt = 0,
  reloading = false,
  loopStarted = false,
}

-- === Utils ===
local function nowMs()
  if g_clock and g_clock.millis then
    return g_clock.millis()
  end
  -- fallback (sekundy → ms)
  return (os.time() or 0) * 1000
end

local function jsonEscape(str)
  local s = tostring(str)
  s = s:gsub('\\', '\\\\')
       :gsub('\"', '\\"')
       :gsub('\n', '\\n')
       :gsub('\r', '\\r')
       :gsub('\t', '\\t')
  return s
end

local function isArrayTable(t)
  local i = 1
  for _ in pairs(t) do
    if t[i] == nil then return false end
    i = i + 1
  end
  return true
end

local function encodeJSON(v)
  local tv = type(v)
  if tv == 'nil' then return 'null' end
  if tv == 'boolean' then return v and 'true' or 'false' end
  if tv == 'number' then return tostring(v)
  elseif tv == 'string' then return '"' .. jsonEscape(v) .. '"' end
  if tv == 'table' then
    if isArrayTable(v) then
      local out = {}
      for i = 1, #v do out[#out+1] = encodeJSON(v[i]) end
      return '[' .. table.concat(out, ',') .. ']'
    else
      local out = {}
      for k, val in pairs(v) do
        out[#out+1] = '"' .. jsonEscape(k) .. '":' .. encodeJSON(val)
      end
      table.sort(out) -- stabilna kolejność kluczy
      return '{' .. table.concat(out, ',') .. '}'
    end
  end
  return 'null'
end

local function readFile(path)
  local ok, data = pcall(function() return g_resources.readFile(path) end)
  if not ok then return nil end
  return data
end

local function writeFile(path, data)
  local ok = pcall(function() return g_resources.writeFile(path, data or '') end)
  return ok == true
end

local function ensureLogSize(s)
  if #s <= CFG.maxLogBytes then return s end
  -- rotacja: obetnij do ostatnich maxLogBytes (od granicy \n jeśli możliwe)
  local cut = string.sub(s, -CFG.maxLogBytes)
  local p = cut:find('\n')
  if p then
    return cut:sub(p+1)
  end
  return cut
end

local function appendLine(path, line)
  local prev = readFile(path)
  local newContent
  if prev and #prev > 0 then
    if prev:sub(-1) ~= '\n' then prev = prev .. '\n' end
    newContent = prev .. line .. '\n'
  else
    newContent = line .. '\n'
  end
  newContent = ensureLogSize(newContent)
  writeFile(path, newContent)
end

local function isoTs()
  -- ISO8601 (sekundy + opcjonalne ms)
  local t = os.date('!*t')
  local base = string.format('%04d-%02d-%02dT%02d:%02d:%02d', t.year, t.month, t.day, t.hour, t.min, t.sec)
  local ms = 0
  if g_clock and g_clock.millis then ms = nowMs() % 1000 end
  return string.format('%s.%03dZ', base, ms)
end

local function log(level, tag, msg, meta)
  if CFG.echoToConsole then
    print(string.format('[dev][%s][%s] %s', level, tag or '-', msg or ''))
  end
  local obj = {
    ts = isoTs(),
    level = level or 'INFO',
    tag = tag or 'dev',
    file = 'modules/dev/dev.lua',
    line = 0,
    msg = tostring(msg or ''),
    meta = meta or {}
}
  appendLine(CFG.logPath, encodeJSON(obj))
end

-- === Log helpers ===
local function info(tag, msg, meta)  log('INFO', tag, msg, meta)  end
local function warn(tag, msg, meta)  log('WARN', tag, msg, meta)  end
local function errorLog(tag, msg, meta) log('ERROR', tag, msg, meta) end

-- === Hot-reload core ===
local function flagExists()
  local data = readFile(CFG.flagPath)
  return data ~= nil  -- istnienie pliku (nawet pustego)
end

local function clearFlag()
  writeFile(CFG.flagPath, '')
end

local function canReload()
  local t = nowMs()
  if state.reloading then return false end
  if (t - state.lastReloadAt) < CFG.minReloadIntervalMs then return false end
  return true
end

local function doReload(reason)
  if not canReload() then return false end
  state.reloading = true
  info('reload', 'requested', { reason = reason or 'flag' })
  local ok, err = pcall(function()
    g_modules.reloadModules()
  end)
  if ok then
    state.lastReloadAt = nowMs()
    info('reload', 'done', { ts = state.lastReloadAt })
  else
    errorLog('reload', 'failed', { error = tostring(err) })
  end
  state.reloading = false
  return ok
end

-- public API do ręcznego wywołania z konsoli
function M.requestReload(reason)
  return doReload(reason or 'manual')
end

local function loop()
  if flagExists() then
    clearFlag()
    doReload('flag')
  end
  scheduleEvent(loop, CFG.pollMs)
end

local function start()
  if state.loopStarted then return end
  state.loopStarted = true
  addEvent(function()
    info('startup', 'dev module ready', { pollMs = CFG.pollMs })
    loop()
  end)
end

-- start modułu
start()

return M
```

---
# 5) Protokół integracji ze **Studio**
- **Wyzwalanie reloadu:** Studio zapisuje/"dotyka" `modules/.dev/reload.flag` → moduł wykrywa i woła `g_modules.reloadModules()`.
- **Logi NDJSON:** Studio tail‑uje `modules/.dev/log.jsonl` i filtruje po `level/tag/file:line`.
- **Akcje ręczne:** z konsoli: `modules.dev.dev.requestReload('manual')` (jeżeli środowisko wspiera wywołania).

---
# 6) Konfiguracja i warianty
- `CFG.pollMs` – interwał sprawdzania flagi (zalecane 300–600 ms).
- `CFG.minReloadIntervalMs` – anty‑drganie przy seryjnych zapisach.
- `CFG.maxLogBytes` – rotacja logu (zapobiega rozrostowi pliku).
- `CFG.echoToConsole` – mirror logów do konsoli klienta.

> Zmiany konfiguracji wprowadzaj w `dev.lua` i przeładuj moduły.

---
# 7) Scenariusze testowe (QA)
1. **Start modułu:** uruchom klienta → w `log.jsonl` linia `startup/dev module ready`.
2. **Reload przez flagę:** utwórz pusty `modules/.dev/reload.flag` → w logu `reload/requested` i `reload/done`.
3. **Anty‑drganie:** utwórz 3× flagę w < 800 ms → 1 realny reload.
4. **Błąd podczas reloadu (symulacja):** tymczasowo zasymuluj błąd w `g_modules.reloadModules` (jeśli możliwe) → `reload/failed` (ERROR) w logu.
5. **Rotacja logu:** wygeneruj > `maxLogBytes` → plik przycięty do dozwolonego rozmiaru, bez rozbicia JSON.

---
# 8) Checklisty wdrożeniowe
- [ ] Utwórz `modules/.dev/` (zapisywalny katalog).
- [ ] Skopiuj `dev.otmod`, `dev.lua`, opcjonalnie `ui/dev.otui` do `modules/dev/`.
- [ ] Uruchom klienta; sprawdź, czy `log.jsonl` powstał.
- [ ] Zapisz/"dotknij" `modules/.dev/reload.flag`; obserwuj `log.jsonl`.
- [ ] Skonfiguruj Studio, by tail‑owało `log.jsonl` i zapisywało flagę.

---
# 9) Noty operacyjne
- Jeśli `modules/.dev/` nie istnieje lub brak uprawnień zapisu, **logi trafią tylko na konsolę** (zależnie od `echoToConsole`).
- `writeFile` nadpisuje – dlatego **append** realizujemy przez odczyt→doklejenie→zapis + rotację.
- Wydziel logowanie ciężkie (duże `meta`) – może spowolnić zapis; zalecane krótkie pola.

---
# 10) Rozszerzenia (opcjonalne)
- **Keybind reloadu:** dodać skrót klawiszowy wiążący `M.requestReload()` (jeśli środowisko udostępnia mapowanie klawiszy).
- **UI DevWindow:** przyciski *Request Reload*, *Open Log*, licznik reloadów.
- **Heartbeat:** wpis NDJSON co X sekund potwierdzający żywotność modułu.

---
# 11) Definition of Done (DoD)
- [ ] Moduł ładuje się, loguje `startup` (NDJSON + konsola).
- [ ] Flaga wyzwala `reload` deterministycznie (z anty‑drganiem).
- [ ] Rotacja logu działa; plik nie rośnie nieograniczenie.
- [ ] Studio wykrywa logi i poprawnie je filtruje.
- [ ] Brak globali; `local` wszędzie; brak użycia `unpack` (tylko `table.unpack`).

