# Instrukcja Użycia AI Agentów (Polish Guide)

## Wprowadzenie

System AI Agentów dla OTCv8 to zestaw inteligentnych narzędzi zaprojektowanych do automatycznego wyszukiwania, analizowania i ulepszania skryptów Lua w projekcie.

## Szybki Start

### Podstawowe Użycie

```lua
-- Załaduj system agentów
dofile("ai_agents/launcher.lua")

-- Wyszukaj wszystkie skrypty
local scripts = AgentCoordinator.searchScripts("/")

-- Analizuj konkretny skrypt
local suggestions = AgentCoordinator.suggestImprovements("SuperDash.lua")

-- Generuj raport
AgentCoordinator.printReport()
```

## Możliwości Systemu

### 1. Agent Wyszukiwania Skryptów (Script Search Agent)

**Funkcje:**
- Rekurencyjne przeszukiwanie katalogów w poszukiwaniu skryptów Lua
- Analiza struktury i zawartości skryptów
- Identyfikacja typów skryptów (makra, UI, logika gry)
- Tworzenie indeksu możliwego do przeszukania
- Wykrywanie typowych wzorców i problemów

**Przykłady użycia:**

```lua
-- Znajdź wszystkie skrypty
local allScripts = AgentCoordinator.searchScripts("/")

-- Znajdź skrypty z makrami
local macroScripts = AgentCoordinator.searchScripts("/", {type = "macro"})

-- Znajdź duże skrypty (powyżej 1000 bajtów)
local largeScripts = AgentCoordinator.searchScripts("/", {minSize = 1000})

-- Znajdź skrypty według wzorca
local attackScripts = AgentCoordinator.findByPattern("attack")

-- Znajdź skrypty z problemami
local searchAgent = AgentCoordinator.state.agents.search
local problematicScripts = searchAgent.findWithIssues()
```

### 2. Agent Ulepszania Skryptów (Script Improvement Agent)

**Funkcje:**
- Analiza jakości kodu
- Sugestie optymalizacji wydajności
- Wykrywanie luk w zabezpieczeniach
- Sprawdzanie spójności stylu kodu
- Rekomendacje najlepszych praktyk
- Sugestie automatycznego refaktoringu

**Kategorie Analiz:**

1. **Wydajność (Performance)**
   - Wykrywanie nieefektywnych pętli
   - Optymalizacja dostępu do zmiennych globalnych
   - Sugestie cachowania

2. **Bezpieczeństwo (Security)**
   - Wykrywanie dynamicznego wykonywania kodu
   - Potencjalne luki SQL injection
   - Wykrywanie zahardkodowanych haseł
   - Niebezpieczne operacje na plikach

3. **Styl Kodu (Style)**
   - Spójność wcięć
   - Długość linii
   - Odstępy wokół operatorów
   - Magiczne liczby

4. **Dokumentacja (Documentation)**
   - Pokrycie dokumentacją funkcji
   - Komentarze nagłówkowe
   - Śledzenie TODO/FIXME

5. **Refaktoryzacja (Refactoring)**
   - Zbyt długie funkcje
   - Duplikacja kodu
   - Złożone warunki

**Przykłady użycia:**

```lua
-- Analizuj pojedynczy skrypt
local suggestions = AgentCoordinator.suggestImprovements("SuperDash.lua")

-- Wyświetl raport
local improvementAgent = AgentCoordinator.state.agents.improvement
improvementAgent.printReport(suggestions, "SuperDash.lua")

-- Znajdź problemy bezpieczeństwa we wszystkich skryptach
local securityIssues = AgentCoordinator.findSecurityIssues()

-- Analiza wsadowa
local results = AgentCoordinator.batchImprove({
  scripts = {"SuperDash.lua", "magebomb.lua", "_Loader.lua"},
  autoApply = false,  -- tylko podgląd, bez stosowania zmian
  backupFirst = true
})
```

### 3. Koordynator Agentów (Agent Coordinator)

**Funkcje:**
- Zarządzanie i koordynacja agentów
- Zbiorcze raporty
- Statystyki systemu
- Wsadowe operacje

**Przykłady użycia:**

```lua
-- Sprawdź status agentów
local status = AgentCoordinator.getStatus()
print("Zainicjalizowano: " .. tostring(status.initialized))
print("Przeskanowanych skryptów: " .. status.stats.scriptsScanned)

-- Kompleksowa analiza skryptu
local analysis = AgentCoordinator.analyzeScript("SuperDash.lua", {
  analyzeStructure = true,
  analyzeImprovements = true
})

-- Generuj zbiorczy raport
AgentCoordinator.printReport()
```

## Przykłady

### Przykład 1: Wyszukiwanie Skryptów Bot

```lua
dofile("ai_agents/agent_coordinator.lua")

-- Znajdź wszystkie skrypty związane z botem
local botScripts = AgentCoordinator.searchScripts("/", {type = "macro"})

print("Znaleziono " .. #botScripts .. " skryptów bot")

for _, script in ipairs(botScripts) do
  print(script.filename .. " - " .. script.lines .. " linii")
end
```

### Przykład 2: Audyt Bezpieczeństwa

```lua
dofile("ai_agents/agent_coordinator.lua")

-- Przeprowadź pełny audyt bezpieczeństwa
local securityIssues = AgentCoordinator.findSecurityIssues()

if #securityIssues > 0 then
  print("⚠ UWAGA! Znaleziono problemy bezpieczeństwa:")
  
  for _, item in ipairs(securityIssues) do
    print("\nSkrypt: " .. item.script)
    for _, issue in ipairs(item.issues) do
      print("  [" .. issue.severity:upper() .. "] " .. issue.message)
      print("  Sugestia: " .. issue.suggestion)
    end
  end
else
  print("✓ Nie znaleziono problemów bezpieczeństwa!")
end
```

### Przykład 3: Raport Jakości Kodu

```lua
dofile("ai_agents/agent_coordinator.lua")

-- Przeskanuj wszystkie skrypty
local scripts = AgentCoordinator.searchScripts("/")

-- Generuj raport jakości
local searchAgent = AgentCoordinator.state.agents.search
local report = searchAgent.generateReport()

print("=== Raport Jakości Kodu ===")
print("Łącznie skryptów: " .. report.totalScripts)
print("Łącznie linii: " .. report.totalLines)
print("Średnia jakość: " .. string.format("%.1f%%", report.qualityMetrics.average))

-- Znajdź skrypty wymagające uwagi
local scriptsWithIssues = searchAgent.findWithIssues()

print("\nSkrypty wymagające poprawy:")
for i, script in ipairs(scriptsWithIssues) do
  if i <= 10 then
    print(string.format("%d. %s (%d problemów)", 
      i, script.filename, script.issueCount))
  end
end
```

### Przykład 4: Automatyczna Optymalizacja

```lua
dofile("ai_agents/agent_coordinator.lua")

-- Lista skryptów do optymalizacji
local scriptsToOptimize = {
  "SuperDash.lua",
  "magebomb.lua",
  "_Loader.lua"
}

-- Analizuj każdy skrypt
for _, scriptName in ipairs(scriptsToOptimize) do
  print("\n=== Analiza: " .. scriptName .. " ===")
  
  local suggestions = AgentCoordinator.suggestImprovements(scriptName)
  
  if suggestions then
    -- Wyświetl tylko problemy wydajnościowe
    if suggestions.performance and #suggestions.performance > 0 then
      print("\nProblemy wydajności:")
      for _, issue in ipairs(suggestions.performance) do
        print("  • " .. issue.message)
        print("    → " .. issue.suggestion)
      end
    end
    
    -- Wyświetl problemy bezpieczeństwa
    if suggestions.security and #suggestions.security > 0 then
      print("\nProblemy bezpieczeństwa:")
      for _, issue in ipairs(suggestions.security) do
        print("  • [" .. issue.severity:upper() .. "] " .. issue.message)
        print("    → " .. issue.suggestion)
      end
    end
  end
end
```

## Konfiguracja

### Konfiguracja Agenta Wyszukiwania

```lua
local searchConfig = {
  recursive = true,
  maxDepth = 10,
  extensions = {".lua"},
  excludeDirs = {".git", "node_modules", "build"},
  cacheEnabled = true
}

ScriptSearchAgent.init(searchConfig)
```

### Konfiguracja Agenta Ulepszania

```lua
local improvementConfig = {
  autoFix = false,        -- nie stosuj automatycznie poprawek
  createBackup = true,    -- twórz kopie zapasowe
  suggestions = {
    performance = true,
    security = true,
    style = true,
    documentation = true,
    refactoring = true
  },
  backupDir = "ai_agents/backups/"
}

ScriptImprovementAgent.init(improvementConfig)
```

## Funkcje Bezpieczeństwa

- **Automatyczne kopie zapasowe**: Tworzy kopie zapasowe przed zastosowaniem zmian
- **Tryb podglądu**: Podgląd zmian bez ich stosowania
- **Obsługa cofania**: Możliwość cofnięcia zmian w razie problemów
- **Dziennik zmian**: Śledzenie wszystkich modyfikacji dokonanych przez agenty

## Wzorce Wykrywane

System wykrywa następujące wzorce w skryptach:

- `macro` - Makra botów
- `ui` - Elementy interfejsu użytkownika
- `botswitch` - Przełączniki botów
- `event` - Handlery zdarzeń
- `storage` - Użycie zmiennych storage
- `attack` - Funkcje ataku
- `spell` - Rzucanie zaklęć
- `heal` - Funkcje leczenia
- `follow` - Funkcje podążania
- `party` - Funkcje grupy

## Najlepsze Praktyki

1. **Regularnie skanuj skrypty** w poszukiwaniu problemów
2. **Priorytetyzuj problemy bezpieczeństwa** przed innymi
3. **Twórz kopie zapasowe** przed wprowadzaniem zmian
4. **Testuj zmiany** przed zastosowaniem w środowisku produkcyjnym
5. **Dokumentuj swój kod** aby uzyskać lepsze wyniki analizy

## Rozwiązywanie Problemów

### Problem: Agenci się nie ładują

```lua
-- Sprawdź ścieżki do plików
print(package.path)

-- Upewnij się, że pliki istnieją
local file = io.open("ai_agents/agent_coordinator.lua", "r")
if file then
  print("✓ Plik koordynatora znaleziony")
  file:close()
else
  print("✗ Nie można znaleźć pliku koordynatora")
end
```

### Problem: Brak wyników wyszukiwania

```lua
-- Sprawdź konfigurację
print("Rekurencyjne: " .. tostring(ScriptSearchAgent.config.recursive))
print("Max głębokość: " .. ScriptSearchAgent.config.maxDepth)

-- Wypróbuj bezpośrednie wyszukiwanie
local results = ScriptSearchAgent.searchDirectory("/", 0)
print("Znaleziono plików: " .. #results)
```

## Wsparcie

Dla dodatkowych informacji i wsparcia:
- Zobacz dokumentację głównego projektu OTCv8
- Sprawdź pliki przykładowe w `ai_agents/examples/`
- Przeczytaj `ai_agents/README.md` dla szczegółowej dokumentacji w języku angielskim

## Przyszłe Funkcje

- Automatyczne stosowanie poprawek (obecnie w trybie podglądu)
- Zaawansowane wykrywanie duplikacji kodu
- Integracja z systemem kontroli wersji
- Statystyki wydajności skryptów
- Niestandardowe reguły i wzorce

---

**Wersja:** 1.0  
**Data:** 2024  
**Licencja:** Zgodna z licencją projektu OTCv8
