# Przewodnik po stylu kodowania Lua

Poniższe zasady mają na celu zapewnienie spójności i wysokiej czytelności kodu Lua w całym projekcie OTCv8.

### 1. Nazewnictwo

- **Zmienne i funkcje**: Używaj `snake_case`. Nazwy powinny być opisowe i w języku angielskim.
  ```lua
  local player_name = "Gandalf"
  function get_player_items(player)
    -- ...
  end
  ```
- **Stałe**: Używaj `UPPER_SNAKE_CASE` dla wartości, które nie powinny się zmieniać.
  ```lua
  local MAX_CONNECTIONS = 10
  ```
- **Zmienne "prywatne"**: Poprzedzaj nazwę podkreślnikiem (`_`), jeśli zmienna lub funkcja nie powinna być używana poza modułem.
  ```lua
  local function _private_helper()
    -- ...
  end
  ```

### 2. Struktura Kodu

- **Struktura modułu**: Każdy plik powinien działać jak moduł. Zwracaj tabelę z publicznym API na końcu pliku.
  ```lua
  local M = {} -- 'M' od 'Module'

  function M.public_function()
    -- ...
  end

  return M
  ```
- **Czystość `require`**: Wywołanie `require` powinno być wolne od efektów ubocznych. Powinno jedynie załadować i zwrócić moduł, a nie modyfikować globalny stan.

- **Rozmiar**:
  - **Pliki**: Staraj się, aby pliki nie przekraczały 300 linii.
  - **Funkcje**: Dąż do tego, by funkcje miały maksymalnie 50 linii. Dłuższe funkcje należy dzielić na mniejsze, pomocnicze.

### 3. Obsługa Błędów i Logowanie

- **Krytyczne ścieżki**: Używaj `pcall()` lub `xpcall()` do obsługi operacji, które mogą zakończyć się błędem (np. odczyt plików, zapytania sieciowe).
  ```lua
  local status, result = pcall(function()
    return risky_operation()
  end)

  if not status then
    log_error("Operacja nie powiodła się: " .. tostring(result))
  end
  ```
- **Logowanie**: Implementuj logowanie warunkowe, kontrolowane przez globalną flagę `DEBUG`, aby uniknąć zaśmiecania konsoli w wersji produkcyjnej.
  ```lua
  if DEBUG then
    print("Wartość x:", x)
  end
  ```