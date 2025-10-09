# ¦ Modul: `game_questlog`

```lua

questLogButton = nil

questTrackerButton = nil

window = nil

trackerWindow = nil

settings = {}

local callDelay = 1000 -- each call delay is also increased by random values (0-callDelay/2)

local dispatcher = {}

function init()

  g_ui.importStyle('questlogwindow')

  window = g_ui.createWidget('QuestLogWindow', rootWidget)

  window:hide()

  trackerWindow = g_ui.createWidget('QuestTracker', modules.game_interface.getRightPanel())

  trackerWindow:setup()

  trackerWindow:hide()

  if not g_app.isMobile() then

    questLogButton = modules.client_topmenu.addLeftGameButton('questLogButton', tr('Quest Log'), '/images/topbuttons/questlog', function() g_game.requestQuestLog() end, false, 8)

    questTrackerButton = modules.client_topmenu.addLeftGameButton('questTrackerButton', tr('Quest Tracker'), '/images/topbuttons/quest_tracker', toggle, false, 9)

  end

  connect(g_game, { onQuestLog = onGameQuestLog,

                    onQuestLine = onGameQuestLine,

                    onGameEnd = offline,

                    onGameStart = online})

  online()

end

function terminate()

  disconnect(g_game, { onQuestLog = onGameQuestLog,

                       onQuestLine = onGameQuestLine,

                       onGameEnd = offline,

                       onGameStart = online})

  offline()

  if questLogButton then

    questLogButton:destroy()

  end

  if questTrackerButton then

    questTrackerButton:destroy()

  end

end

function toggle()

  if trackerWindow:isVisible() then

    trackerWindow:hide()

  else

    trackerWindow:show()

  end

end

function offline()

  if window then

    window:hide()

  end

  if trackerWindow then

    trackerWindow:hide()

  end

  save()

  -- reset tracker

  trackerWindow.contentsPanel.list:destroyChildren()

  trackerWindow.contentsPanel.list:setHeight(0)

end

function online()

  local playerName = g_game.getCharacterName()

  if not playerName then return end -- just to be sure

  load()

  refreshQuests()

  refreshTrackerWidgets()

  local playerName = g_game.getCharacterName()

  settings[playerName] = settings[playerName] or {}

  local settings = settings[playerName]

  local missionList = window.missionlog.missionList

  local track = window.missionlog.track

  local missionDescription = window.missionlog.missionDescription

  connect(missionList, { 

    onChildFocusChange = function(self, focusedChild)

      if focusedChild == nil then return end

        missionDescription:setText(focusedChild.description)

        if focusedChild:isVisible() then

          track:setEnabled(true)

        end

        track:setChecked(settings[focusedChild.trackData])

      end 

}

)

end

function show(questlog)

  if questlog then

    window:raise()

    window:show()

    window:focus()

    window.missionlog.currentQuest = nil -- reset current quest

    window.questlog:setVisible(true)

    window.missionlog:setVisible(false)

    window.closeButton:setText('Close')

    window.showButton:setVisible(true)

    window.missionlog.track:setEnabled(false)

    window.missionlog.track:setChecked(false)

    window.missionlog.missionDescription:setText('')

  else

    window.questlog:setVisible(false)

    window.missionlog:setVisible(true)

    window.closeButton:setText('Back')

    window.showButton:setVisible(false)

  end

end

function back()

  if window:isVisible() then

    if window.questlog:isVisible() then

      window:hide()

    else

      show(true)

    end

  end

end

function showQuestLine()

  local questList = window.questlog.questList

  local child = questList:getFocusedChild()

  g_game.requestQuestLine(child.questId)

  window.missionlog.questName:setText(child.questName)

  window.missionlog.currentQuest = child.questId

end

function onGameQuestLog(quests)

  show(true)

  local questList = window.questlog.questList

  questList:destroyChildren()

  for i,questEntry in pairs(quests) do

    local id, name, completed = unpack(questEntry)

    local questLabel = g_ui.createWidget('QuestLabel', questList)

    questLabel:setChecked(i % 2 == 0)

    questLabel.questId = id -- for quest tracker

    questLabel.questName = name

    name = completed and name.." (completed)" or name

    questLabel:setText(name)

    questLabel.onDoubleClick = function()

      window.missionlog.currentQuest = id

      g_game.requestQuestLine(id)

      window.missionlog.questName:setText(questLabel.questName)

    end

  end

  questList:focusChild(questList:getFirstChild())

end

function onGameQuestLine(questId, questMissions)

  show(false)

  local missionList = window.missionlog.missionList

  if questId == window.missionlog.currentQuest then

    missionList:destroyChildren()

  end

  for i,questMission in pairs(questMissions) do

    local name, description = unpack(questMission)

    --questlog

    local missionLabel = g_ui.createWidget('QuestLabel', missionList)

    local widgetId = questId..'.'..i

    missionLabel:setChecked(i % 2 == 0)

    missionLabel:setId(widgetId)

    missionLabel.questId = questId

    missionLabel.trackData = widgetId

    missionLabel:setText(name)

    missionLabel.description = description

    missionLabel:setVisible(questId == window.missionlog.currentQuest)

    --tracker

    local trackerLabel = trackerWindow.contentsPanel.list[widgetId]

    trackerLabel = trackerLabel or g_ui.createWidget('QuestTrackerLabel', trackerWindow.contentsPanel.list)

    trackerLabel:setId(widgetId)

    trackerLabel.description:setText(description)

    local data = settings[g_game.getCharacterName()]

    trackerLabel:setVisible(description:len() > 0 and data[widgetId])

  end

  local focusTarget = missionList:getFirstChild()

  if focusTarget and focusTarget:isVisible() then

    missionList:focusChild(focusTarget)

  end

end

function onTrackOptionChange(checkbox)

  local newStatus = not checkbox:isChecked()

  checkbox:setChecked(newStatus)

  local missionList = window.missionlog.missionList

  local focused = missionList:getFocusedChild()

  if not focused then return end

  local settings = settings[g_game.getCharacterName()]

  local trackdata = focused.trackData

  -- settings

  settings[trackdata] = newStatus

  local trackerWidget = trackerWindow.contentsPanel.list[trackdata]

  if trackerWidget then

    trackerWidget:setVisible(newStatus)

  end

  refreshQuests()

  save()

end

function refreshQuests()

  if not g_game.isOnline() then return end

  local data = settings[g_game.getCharacterName()]

  data = data or {}

  -- do not execute when questlost is in use

  if not window:isVisible() then

    for questData, track in pairs(data) do

      local id = string.split(questData, ".")[1]

      if not track then

        dispatcher[questData] = nil -- remove from dispatcher if no longer tracked

      else

        dispatcher[questData] = dispatcher[questData] or g_clock.millis()

      end

      if dispatcher[questData] and g_clock.millis() > dispatcher[questData] + callDelay + math.random(callDelay/2) then

        dispatcher[questData] = g_clock.millis()

        scheduleEvent(function()

          g_game.requestQuestLine(id) -- request update

        end, math.random(callDelay/2) )

      end

    end

  end

  scheduleEvent(refreshQuests, callDelay)

end

function refreshTrackerWidgets()

  if not g_game.isOnline() then return end

  local data = settings[g_game.getCharacterName()]

  data = data or {}

  for questData, enabled in pairs(data) do

    local data = string.split(questData, ".")

    local id = tonumber(data[1])

    local widget = trackerWindow.contentsPanel.list[questData]

    if not widget then

      g_game.requestQuestLine(id)

    end

  end

end

-- json handlers

function load()

  local file = "/settings/questlog.json"

  if g_resources.fileExists(file) then

    local status, result = pcall(function()

        return json.decode(g_resources.readFileContents(file))

    end)

    if not status then

        return g_logger.error(

                   "Error while reading profiles file. To fix this problem you can delete storage.json. Details: " ..

                       result)

    end

    settings = result

  end

end

function save()

  local file = "/settings/questlog.json"

  local status, result = pcall(function() return json.encode(settings, 2) end)

  if not status then

      return g_logger.error(

                 "Error while saving profile settings. Data won't be saved. Details: " ..

                     result)

  end

  if result:len() > 100 * 1024 * 1024 then

      return g_logger.error(

                 "Something went wrong, file is above 100MB, won't be saved")

  end

  g_resources.writeFileContents(file, result)

end

```

---
# questlog.otmod

```text

Module

  name: game_questlog

  description: Quest status preview and tracking

  author: Vithrax

  website: https://github.com/Vithrax

  sandboxed: true

  scripts: [ questlog ]

  @onLoad: init()

  @onUnload: terminate()

```

---
# questlogwindow.otui

```otui

QuestTrackerLabel < Panel

  height: 20

  layout:

    type: verticalBox

    fit-children: true

  $!first:

    margin-top: 3

  Label

    id: description

    text-align: center

    text-wrap: true

    text-auto-resize: true

  HorizontalSeparator

    margin-top: 3

QuestLabel < Label

  font: verdana-11px-monochrome

  height: 18

  text-offset: 2 1

  focusable: true

  color: #aaaaaa

  background-color: #484848

  $checked:

    background-color: #414141

  $focus:

    background-color: #ffffff22

QuestLog < Panel

  TextList

    id: questList

    anchors.fill: parent

    margin-bottom: 20

    focusable: false

    background-color: #484848

    vertical-scrollbar: questListScrollBar

  VerticalScrollBar

    id: questListScrollBar

    anchors.top: questList.top

    anchors.bottom: questList.bottom

    anchors.right: questList.right

    step: 14

    pixels-scroll: true

MissionLog < Panel

  Label

    id: questName

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    text-align: left

    text: questline name

  TextList

    id: missionList

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 3

    height: 133

    padding: 1

    focusable: false

    vertical-scrollbar: missionListScrollBar

    background-color: #484848

  VerticalScrollBar

    id: missionListScrollBar

    anchors.top: missionList.top

    anchors.right: missionList.right

    anchors.bottom: missionList.bottom

    step: 14

    pixels-scroll: true

  CheckBox

    id: track

    anchors.bottom: parent.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-bottom: 25

    !text: tr('Show in quest tracker')

    @onClick: modules.game_questlog.onTrackOptionChange(self)

    enabled: false

  FlatLabel

    id: missionDescription

    anchors.top: missionList.bottom

    anchors.left: parent.left

    anchors.right: missionListScrollBar.right

    anchors.bottom: prev.top

    background-color: #363636

    margin-bottom: 10

    margin-top: 10

    text-wrap: true

QuestLogWindow < MainWindow

  id: questLogWindow

  !text: tr('Quest Log')

  size: 330 405

  @onEscape: modules.game_questlog.back()

  $mobile:

    size: 330 350

  QuestLog

    id: questlog

    anchors.top: parent.top

    anchors.bottom: bottomSep.top

    anchors.left: parent.left

    anchors.right: parent.right

    visible: false

  MissionLog

    id: missionlog

    anchors.fill: prev

  HorizontalSeparator

    id: bottomSep

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8    

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    color: #ffffff

    size: 45 21

    @onClick: modules.game_questlog.back()

  Button

    id: showButton

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: prev.left

    margin-right: 3

    color: #ffffff

    size: 45 21

    !text: tr('Show')

    font: cipsoftFont

    @onClick: modules.game_questlog.showQuestLine()

  Button

    id: trackerButton

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: parent.left

    margin-right: 3

    color: #ffffff

    size: 80 21

    text-align: center

    !text: tr('Quest Tracker')

    font: cipsoftFont

    @onClick: modules.game_questlog.toggle()

QuestTracker < MiniWindow

  id: questTracker

  !text: tr('Quest Tracker')

  height: 60

  icon: /images/topbuttons/quest_tracker

  MiniWindowContents

    padding-left: 5

    padding-right: 5

    padding-top: 5

    layout: verticalBox

    Panel

      id: list

      layout:

        type: verticalBox

        fit-children: true

    Panel

      height: 20

      margin-top: 5

      Button

        !text: tr('Add Tracked Quest')

        anchors.fill: parent

        margin-left: 30

        margin-right: 30 

        font: cipsoftFont

        color: #FFFFFF

        @onClick: g_game.requestQuestLog()

```

---
