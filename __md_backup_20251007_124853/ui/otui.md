# OTU

I

—

p

o

d

s

t

a

w

y

!!! info

    OTUI to deklaratywne layouty interfejsu użytkownika.
# # Przykł

a

d

l

a

y

o

u

t

u

```otui
Panel
  id: main
  anchor: top left
  size: 400 300

Label
  text: "Status: OK"
  anchors.centerIn: parent

```
# # Zdarzenia

/

w

i

ą

z

a

n

i

a

- Właściwości elementów można powiązać z danymi (np. przez Lua).
- Aktualizacje push przez eventy modułów.
# # W

s

k

a

z

ó

w

k

i

- Trzymaj layouty w `layouts/*`.
- Styluj wspólnymi klasami, nie inline.
