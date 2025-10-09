# Lua — style guide
- snake_case dla zmiennych i funkcji.
- Moduły zwracają tabelę publicznego API.
- Brak efektów ubocznych w `require`.
- Pliki < 300 linii, funkcje < 50 linii.
- Obsługa błędów: `pcall/xpcall` dla krytycznych ścieżek.
- Logowanie warunkowe przez `DEBUG` flagę.
