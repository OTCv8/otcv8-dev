# AI Agents dla OTCv8 - Nowa Funkcjonalność

## 🤖 Czym są AI Agenci?

System AI Agentów to nowe narzędzie dodane do repozytorium OTCv8, które automatycznie wyszukuje, analizuje i sugeruje ulepszenia dla skryptów Lua w projekcie.

## 🚀 Szybki Start

### Użycie Podstawowe

```lua
-- Załaduj system AI agentów
dofile("ai_agents/launcher.lua")

-- Przeszukaj wszystkie skrypty
local scripts = AgentCoordinator.searchScripts("/")

-- Analizuj konkretny skrypt
local suggestions = AgentCoordinator.suggestImprovements("SuperDash.lua")

-- Generuj raport
AgentCoordinator.printReport()
```

### Uruchomienie Przykładów

```bash
# W kliencie OTCv8, załaduj przykład:
dofile("ai_agents/examples/quick_start.lua")
```

## 📋 Funkcje

### 1. **Agent Wyszukiwania Skryptów**
- Przeszukuje katalogi w poszukiwaniu plików .lua
- Analizuje strukturę kodu
- Wykrywa wzorce (makra, UI, eventy)
- Identyfikuje potencjalne problemy
- Tworzy indeks skryptów

### 2. **Agent Ulepszania Skryptów**
- **Wydajność**: Wykrywa nieefektywne pętle, cache'owanie
- **Bezpieczeństwo**: Sprawdza luki bezpieczeństwa, SQL injection, hardcoded credentials
- **Styl**: Sprawdza spójność kodu, wcięcia, długość linii
- **Dokumentacja**: Ocenia pokrycie komentarzami
- **Refaktoryzacja**: Sugeruje uproszczenia i podział długiego kodu

### 3. **Koordynator Agentów**
- Zarządza wszystkimi agentami
- Generuje zbiorcze raporty
- Obsługuje operacje wsadowe
- Śledzi statystyki

## 📁 Struktura Katalogów

```
ai_agents/
├── agent_coordinator.lua        # Główny koordynator
├── script_search_agent.lua      # Agent wyszukiwania
├── script_improvement_agent.lua # Agent ulepszania
├── launcher.lua                 # Punkt wejścia
├── test_agents.lua              # Testy
├── validate.sh                  # Skrypt walidacji
├── README.md                    # Dokumentacja (EN)
├── INSTRUKCJA_PL.md            # Instrukcja (PL)
├── examples/
│   ├── quick_start.lua         # Szybki start
│   ├── example_search.lua      # Przykłady wyszukiwania
│   └── example_improve.lua     # Przykłady ulepszania
└── backups/                     # Kopie zapasowe
    └── .gitignore
```

## 💡 Przykłady Użycia

### Przykład 1: Znajdź Wszystkie Skrypty Bot

```lua
dofile("ai_agents/agent_coordinator.lua")

local botScripts = AgentCoordinator.searchScripts("/", {type = "macro"})
print("Znaleziono " .. #botScripts .. " skryptów bot")
```

### Przykład 2: Audyt Bezpieczeństwa

```lua
dofile("ai_agents/agent_coordinator.lua")

local securityIssues = AgentCoordinator.findSecurityIssues()
if #securityIssues > 0 then
  print("⚠ Znaleziono problemy bezpieczeństwa!")
  for _, item in ipairs(securityIssues) do
    print(item.script .. ": " .. #item.issues .. " problemów")
  end
end
```

### Przykład 3: Analiza Jakości Kodu

```lua
dofile("ai_agents/agent_coordinator.lua")

local analysis = AgentCoordinator.analyzeScript("SuperDash.lua")
print("Jakość kodu: " .. analysis.structure.metrics.codeQuality .. "%")
```

## 🎯 Wykrywane Wzorce

- `macro` - Makra botów
- `ui` - Interfejs użytkownika  
- `event` - Handlery zdarzeń
- `attack` - Funkcje ataku
- `spell` - Rzucanie zaklęć
- `heal` - Funkcje leczenia
- `follow` - Podążanie
- `party` - Funkcje grupy

## 🔒 Bezpieczeństwo

System wykrywa:
- Dynamiczne wykonywanie kodu (loadstring)
- Potencjalne SQL injection
- Hardcoded credentials
- Niebezpieczne operacje na plikach
- Wykonywanie poleceń systemowych

## 📊 Raporty

System generuje szczegółowe raporty zawierające:
- Statystyki skryptów (ilość, rozmiar, linie)
- Wykryte wzorce
- Znalezione problemy
- Metryki jakości kodu
- Sugestie ulepszeń

## 🛠️ Konfiguracja

```lua
-- Dostosuj konfigurację agenta wyszukiwania
ScriptSearchAgent.config.maxDepth = 15
ScriptSearchAgent.config.excludeDirs = {".git", "build"}

-- Dostosuj konfigurację agenta ulepszania
ScriptImprovementAgent.config.autoFix = false
ScriptImprovementAgent.config.createBackup = true
```

## 📖 Dokumentacja

- **English**: `ai_agents/README.md`
- **Polski**: `ai_agents/INSTRUKCJA_PL.md`

## 🧪 Testowanie

Uruchom skrypt walidacji:

```bash
cd /path/to/otcv8-dev
./ai_agents/validate.sh
```

## 🤝 Wkład do Projektu

AI Agenci są częścią projektu OTCv8. System został zaprojektowany aby:
- Pomóc w utrzymaniu jakości kodu
- Zidentyfikować potencjalne problemy
- Ułatwić refaktoryzację
- Poprawić bezpieczeństwo

## 📝 Licencja

Zgodna z licencją głównego projektu OTCv8.

## 🔗 Powiązane

- [OTCv8 Repository](https://github.com/OTCv8/otcv8-dev)
- [Discord](https://discord.gg/feySup6)
- [Forum](http://otclient.net)

---

**Wersja**: 1.0  
**Data utworzenia**: 2024  
**Status**: ✅ Gotowe do użycia
