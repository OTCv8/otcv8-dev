# Moduły (vBot) — przewodnik
!!! info "Cel"

    Jak tworzyć i ładować moduły Lua dla klienta OTCv8.
# Struktura modułu
```bash
modules/
my-module/
init.lua
config.lua
README.md

```
# Minimalny moduł(LUA)
```lua
-- modules/my-module/init.lua
local M = {}

function M.start()
  print("my-module start")
end

function M.stop()
  print("my-module stop")
end

return M

```
# Rejestrowanie zdarzeń (przykład)
```lua
onTalk(function(name, level, mode, text)
  if text:find("hello") then print("Hi " .. name) end
end)

```
# Konfiguracja
- `config.lua` – wartości domyślne (np. hotkeye, progi).
- Pliki konfiguracyjne użytkownika trzymaj oddzielnie.
# Ddebug / logi
- Pisz do konsoli lub pliku `logs/my-module.log`.
- Dodaj flagę `DEBUG=true` i warunkowe logowanie.
# Dobre praktyki
- Nazwy przestrzeni modułu (`my_module.*`).
- Brak efektów ubocznych przy `require`.
- Komendy eksportuj jawnie (np. `M.start`, `M.stop`).

