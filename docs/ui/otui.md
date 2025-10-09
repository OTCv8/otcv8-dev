# OTUI - podstawy
!!! info

    OTUI to deklaratywne layouty interfejsu użytkownika.
# Przykład layoutu
```otui
Panel
  id: main
  anchor: top left
  size: 400 300

Label
  text: "Status: OK"
  anchors.centerIn: parent

```
# Zdarzenia / wiązania
- Właściwości elementów można powiązać z danymi (np. przez Lua).
- Aktualizacje push przez eventy modułów.
# Wskazówki
- Trzymaj layouty w `layouts/*`.
- Styluj wspólnymi klasami, nie inline.

