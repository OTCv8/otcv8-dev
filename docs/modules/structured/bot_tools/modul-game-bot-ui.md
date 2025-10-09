# Moduł: | Moduł: `game_bot/ui`
```otui

BotButton < Button

  height: 17

  margin-top: 2

BotSwitch < Button

  margin-top: 2

  height: 17

  image-color: green

  $!on:

    image-color: red

SmallBotSwitch < Button

  margin-top: 2

  height: 15

  image-color: green

  $!on:

    image-color: red

BotLabel < Label

  margin-top: 2

  height: 15

  text-auto-resize: true

  text-align: center

  text-wrap: true

BotItem < Item

  virtual: true

  &selectable: true

  &editable: true

BotTextEdit < TextEdit

  @onClick: modules.client_textedit.show(self)

  text-align: center

  multiline: false

  focusable: false

  height: 20

BotSeparator < HorizontalSeparator

  margin-top: 5

  margin-bottom: 3

BotSmallScrollBar < SmallScrollBar

BotPanel < Panel

  margin-top: 1

  ScrollablePanel

    id: content

    anchors.fill: parent

    margin-right: 8

    margin-left: 1

    margin-bottom: 5

    vertical-scrollbar: botPanelScroll

    layout:

      type: verticalBox

    $mobile:

      margin-right: 16

  BotSmallScrollBar

    id: botPanelScroll

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    anchors.right: parent.right

CaveBotLabel < Label

  background-color: alpha

  text-offset: 2 0

  focusable: true

  $focus:

    background-color: #00000055

SlotComboBoxPopupMenu < ComboBoxPopupMenu

SlotComboBoxPopupMenuButton < ComboBoxPopupMenuButton

SlotComboBox < ComboBox

  @onSetup: |

    self:addOption("Head")

    self:addOption("Neck")

    self:addOption("Back")

    self:addOption("Body")

    self:addOption("Right")

    self:addOption("Left")

    self:addOption("Leg")

    self:addOption("Feet")

    self:addOption("Finger")

    self:addOption("Ammo")

    self:addOption("Purse")

```

---
# config.otui
```otui

BotConfig < Panel

  id: botConfig

  height: 45

  margin-left: 2

  margin-right: 2

  ComboBox

    id: list

    &menuScroll: true

    &menuHeight: 450

    &menuScrollStep: 100

    &parentWidth: true

    anchors.top: parent.top

    anchors.left: parent.left

    text-offset: 3 0

    width: 130

  Button

    id: switch

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 5

    $on:

      text: On

      color: #00AA00

    $!on:

      text: Off

      color: #FF0000

  Button

    margin-top: 2

    id: add

    anchors.top: prev.bottom

    anchors.left: parent.left

    text: Add

    width: 56

    height: 18

    text-offet: 0 2

  Button

    id: edit

    anchors.top: prev.top

    anchors.horizontalCenter: parent.horizontalCenter

    text: Edit

    width: 56

    height: 18

    text-offet: 0 2

  Button

    id: remove

    anchors.top: prev.top

    anchors.right: parent.right

    text: Remove

    width: 56

    height: 18

    text-offet: 0 2

```

---
# container.otui
```otui

BotContainer < Panel

  height: 68

  ScrollablePanel

    id: items

    anchors.fill: parent

    vertical-scrollbar: scroll

    layout:

      type: grid

      cell-size: 34 34

      flow: true

  BotSmallScrollBar

    id: scroll

    anchors.top: prev.top

    anchors.bottom: prev.bottom

    anchors.right: parent.right

    step: 10

    pixels-scroll: true

```

---
# icons.otui
```otui

BotIcon < UIWidget

  size: 50 50

  anchors.horizontalCenter: parent.horizontalCenter

  anchors.verticalCenter: parent.verticalCenter

  focusable: false

  phantom: false

  draggable: true

  UIItem

    id: item

    anchors.top: parent.top

    anchors.horizontalCenter: parent.horizontalCenter

    margin-top: 6

    virtual: true

    phantom: true

    size: 32 32

  UICreature

    id: creature

    anchors.top: parent.top

    anchors.horizontalCenter: parent.horizontalCenter

    margin-top: 0

    size: 48 48

    phantom: true

  UIWidget

    id: status

    anchors.top: parent.top

    anchors.left: parent.left

    size: 18 10

    color: black

    font: terminus-10px

    phantom: true

    $on:

      text: ON

      background: green

    $!on:

      text: OFF

      background: red

  UIWidget

    id: hotkey

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    size: 18 10

    color: white

    phantom: true

    text-align: right

  UIWidget

    id: text

    anchors.bottom: parent.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    text-wrap: true

    text-auto-resize: true

    phantom: true

```

---
# panels.otui
```otui

DualScrollPanel < Panel

  height: 51

  margin-top: 3

  SmallBotSwitch

    id: title

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    text-align: center

  HorizontalScrollBar

    id: scroll1

    anchors.left: title.left

    anchors.right: title.horizontalCenter

    anchors.top: title.bottom

    margin-right: 2

    margin-top: 2

    minimum: 0

    maximum: 100

    step: 1

    &disableScroll: true

  HorizontalScrollBar

    id: scroll2

    anchors.left: title.horizontalCenter

    anchors.right: title.right

    anchors.top: prev.top

    margin-left: 2

    minimum: 0

    maximum: 100

    step: 1

    &disableScroll: true

  BotTextEdit

    id: text

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: scroll1.bottom

    margin-top: 3

    margin-left: 2

    margin-right: 1

SingleScrollItemPanel < Panel

  height: 45

  margin-top: 2

  BotItem

    id: item

    anchors.left: parent.left

    anchors.top: prev.bottom

    margin-top: 3

  SmallBotSwitch

    id: title

    anchors.left: prev.right

    anchors.right: parent.right

    anchors.top: prev.top

    margin-left: 2

    text-align: center

  HorizontalScrollBar

    id: scroll

    anchors.left: title.left

    anchors.right: title.right

    anchors.top: title.bottom

    margin-top: 2

    minimum: 0

    maximum: 100

    step: 1

    &disableScroll: true

DualScrollItemPanel < Panel

  height: 33

  margin-top: 3

  BotItem

    id: item

    anchors.left: parent.left

    anchors.top: prev.bottom

    margin-top: 3

  SmallBotSwitch

    id: title

    anchors.left: prev.right

    anchors.right: parent.right

    anchors.top: prev.top

    margin-left: 2

    text-align: center

  HorizontalScrollBar

    id: scroll1

    anchors.left: title.left

    anchors.right: title.horizontalCenter

    anchors.top: title.bottom

    margin-top: 2

    margin-right: 2

    minimum: 0

    maximum: 100

    step: 1

    &disableScroll: true

  HorizontalScrollBar

    id: scroll2

    anchors.left: title.horizontalCenter

    anchors.right: title.right

    anchors.top: prev.top

    margin-left: 2

    minimum: 0

    maximum: 100

    step: 1

    &disableScroll: true

ItemsRow < Panel

  height: 33

  margin-top: 2

  BotItem

    id: item1

    anchors.top: parent.top

    anchors.left: parent.left

  BotItem

    id: item2

    anchors.top: prev.top

    anchors.left: prev.right

    margin-left: 2

  BotItem

    id: item3

    anchors.top: prev.top

    anchors.left: prev.right

    margin-left: 2

  BotItem

    id: item4

    anchors.top: prev.top

    anchors.left: prev.right

    margin-left: 2

  BotItem

    id: item5

    anchors.top: prev.top

    anchors.left: prev.right

    margin-left: 2

ItemsPanel < Panel

  height: 55

  SmallBotSwitch

    id: title

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    text-align: center

  ItemsRow

    id: items

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

ItemAndButtonPanel < Panel

  height: 40

  BotItem

    id: item

    anchors.left: parent.left

    anchors.top: parent.top

  BotSwitch

    id: title

    anchors.left: prev.right

    anchors.right: parent.right

    anchors.verticalCenter: prev.verticalCenter

    text-align: center

    margin-left: 2

    margin-top: 0

ItemAndSlotPanel < Panel

  height: 40

  BotItem

    id: item

    anchors.left: parent.left

    anchors.top: parent.top

  SmallBotSwitch

    id: title

    anchors.left: prev.right

    anchors.right: parent.right

    anchors.top: prev.top

    text-align: center

    margin-left: 2

    margin-top: 0

  SlotComboBox

    id: slot

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

    margin-top: 2

    height: 20

    &disableScroll: true

TwoItemsAndSlotPanel < Panel

  height: 35

  margin-top: 4

  BotItem

    id: item1

    anchors.left: parent.left

    anchors.top: parent.top

    margin-top: 1

  BotItem

    id: item2

    anchors.left: prev.right

    anchors.top: prev.top

    margin-left: 1

  SmallBotSwitch

    id: title

    anchors.left: prev.right

    anchors.right: parent.right

    anchors.top: parent.top

    text-align: center

    margin-left: 2

    margin-top: 0

  SlotComboBox

    id: slot

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

    margin-top: 2

    height: 20

    &disableScroll: true

DualLabelPanel < Panel

  height: 20

  padding: 1

  Label

    id: left

    anchors.left: parent.left

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    text-align: left

    text-wrap: true

    text-auto-resize: true

    margin-left: 3

    font: verdana-11px-rounded

  Label

    id: right

    anchors.right: parent.right

    anchors.left: prev.right

    margin-left: 2

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    text-align: right

    text-auto-resize: true

    margin-right: 3

    font: verdana-11px-rounded

LabelAndTextEditPanel < Panel

  height: 20

  padding: 1

  Label

    id: left

    anchors.left: parent.left

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    anchors.right: parent.horizontalCenter

    text-align: center

    text-wrap: true

    margin-right: 2

  BotTextEdit

    id: right

    anchors.left: prev.right

    margin-left: 3

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    anchors.right: parent.right

SwitchAndButtonPanel < Panel

  height: 20

  padding: 1

  Button

    id: right

    anchors.top: parent.top

    margin-top: 2

    anchors.bottom: parent.bottom

    anchors.right: parent.right

    text-auto-resize: true

    text-align: center

  BotSwitch

    id: left

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    anchors.left: parent.left

    anchors.right: prev.left

    margin-right: 3

    text-align: center

```

---

