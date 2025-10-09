# ¦ Modul: `client_terminal`

```lua

local function pcolored(text, color)

  color = color or 'white'

  modules.client_terminal.addLine(tostring(text), color)

end

function draw_debug_boxes()

  g_ui.setDebugBoxesDrawing(not g_ui.isDrawingDebugBoxes())

end

function hide_map()

  modules.game_interface.getMapPanel():hide()

end

function show_map()

  modules.game_interface.getMapPanel():show()

end

local pinging = false

local function pingBack(ping)

  if ping < 300 then color = 'green'

  elseif ping < 600 then color = 'yellow'

  else color = 'red' end

  pcolored(g_game.getWorldName() .. ' => ' .. ping .. ' ms', color)

end

function ping()

  if pinging then

    pcolored('Ping stopped.')

    g_game.setPingDelay(1000)

    disconnect(g_game, 'onPingBack', pingBack)

  else

    if not (g_game.getFeature(GameClientPing) or g_game.getFeature(GameExtendedClientPing)) then

      pcolored('this server does not support ping', 'red')

      return

    elseif not g_game.isOnline() then

      pcolored('ping command is only allowed when online', 'red')

      return

    end

    pcolored('Starting ping...')

    g_game.setPingDelay(0)

    connect(g_game, 'onPingBack', pingBack)

  end

  pinging = not pinging

end

function clear()

  modules.client_terminal.clear()

end

function ls(path)

  path = path or '/'

  local files = g_resources.listDirectoryFiles(path)

  for k,v in pairs(files) do

    if g_resources.directoryExists(path .. v) then

      pcolored(path .. v, 'blue')

    else

      pcolored(path .. v)

    end

  end

end

function about_version()

  pcolored(g_app.getName() .. ' ' .. g_app.getVersion() .. '\n' .. g_app.getAuthor())

end

function about_graphics()

  pcolored('Vendor ' .. g_graphics.getVendor() )

  pcolored('Renderer' .. g_graphics.getRenderer())

  pcolored('Version' .. g_graphics.getVersion())

end

function about_modules()

  for k,m in pairs(g_modules.getModules()) do

    local loadedtext

    if m:isLoaded() then

      pcolored(m:getName() .. ' => loaded', 'green')

    else

      pcolored(m:getName() .. ' => not loaded', 'red')

    end

  end

end

```

---
# terminal.lua

```lua

-- configs

local LogColors = { [LogDebug] = 'pink',

                    [LogInfo] = 'white',

                    [LogWarning] = 'yellow',

                    [LogError] = 'red' }

local MaxLogLines = 128

local MaxHistory = 1000

local oldenv = getfenv(0)

setfenv(0, _G)

_G.commandEnv = runinsandbox('commands')

setfenv(0, oldenv)

-- private variables

local terminalWindow

local terminalButton

local logLocked = false

local commandTextEdit

local terminalBuffer

local commandHistory = { }

local currentHistoryIndex = 0

local poped = false

local oldPos

local oldSize

local firstShown = false

local flushEvent

local cachedLines = {}

local disabled = false

local allLines = {}

-- private functions

local function navigateCommand(step)

  if commandTextEdit:isMultiline() then

    return

  end

  local numCommands = #commandHistory

  if numCommands > 0 then

    currentHistoryIndex = math.min(math.max(currentHistoryIndex + step, 0), numCommands)

    if currentHistoryIndex > 0 then

      local command = commandHistory[numCommands - currentHistoryIndex + 1]

      commandTextEdit:setText(command)

      commandTextEdit:setCursorPos(-1)

    else

      commandTextEdit:clearText()

    end

  end

end

local function completeCommand()

  local cursorPos = commandTextEdit:getCursorPos()

  if cursorPos == 0 then return end

  local commandBegin = commandTextEdit:getText():sub(1, cursorPos)

  local possibleCommands = {}

  -- create a list containing all globals

  local allVars = table.copy(_G)

  table.merge(allVars, commandEnv)

  -- match commands

  for k,v in pairs(allVars) do

    if k:sub(1, cursorPos) == commandBegin then

      table.insert(possibleCommands, k)

    end

  end

  -- complete command with one match

  if #possibleCommands == 1 then

    commandTextEdit:setText(possibleCommands[1])

    commandTextEdit:setCursorPos(-1)

  -- show command matches

  elseif #possibleCommands > 0 then

    print('>> ' .. commandBegin)

    -- expand command

    local expandedComplete = commandBegin

    local done = false

    while not done do

      cursorPos = #commandBegin+1

      if #possibleCommands[1] < cursorPos then

        break

      end

      expandedComplete = commandBegin .. possibleCommands[1]:sub(cursorPos, cursorPos)

      for i,v in ipairs(possibleCommands) do

        if v:sub(1, #expandedComplete) ~= expandedComplete then

          done = true

        end

      end

      if not done then

        commandBegin = expandedComplete

      end

    end

    commandTextEdit:setText(commandBegin)

      commandTextEdit:setCursorPos(-1)

    for i,v in ipairs(possibleCommands) do

      print(v)

    end

  end

end

local function doCommand(textWidget)

  local currentCommand = textWidget:getText()

  executeCommand(currentCommand)

  textWidget:clearText()

  return true

end

local function addNewline(textWidget)

  if not textWidget:isOn() then

    textWidget:setOn(true)

  end

  textWidget:appendText('\n')

end

local function onCommandChange(textWidget, newText, oldText)

  local _, newLineCount = string.gsub(newText, '\n', '\n')

  textWidget:setHeight((newLineCount + 1) * textWidget.baseHeight)

  if newLineCount == 0 and textWidget:isOn() then

    textWidget:setOn(false)

  end

end

local function onLog(level, message, time)

  if disabled then return end

  -- avoid logging while reporting logs (would cause a infinite loop)

  if logLocked then return end

  logLocked = true

  addLine(message, LogColors[level])

  logLocked = false

end

-- public functions

function init()

  terminalWindow = g_ui.displayUI('terminal')

  terminalWindow:setVisible(false)

  terminalWindow.onDoubleClick = popWindow

  terminalButton = modules.client_topmenu.addLeftButton('terminalButton', tr('Terminal') .. ' (Ctrl + T)', '/images/topbuttons/terminal', toggle)

  terminalButton:setOn(false)

  g_keyboard.bindKeyDown('Ctrl+T', toggle)

  commandHistory = g_settings.getList('terminal-history')

  commandTextEdit = terminalWindow:getChildById('commandTextEdit')

  commandTextEdit:setHeight(commandTextEdit.baseHeight)

  connect(commandTextEdit, {onTextChange = onCommandChange})

  g_keyboard.bindKeyPress('Up', function() navigateCommand(1) end, commandTextEdit)

  g_keyboard.bindKeyPress('Down', function() navigateCommand(-1) end, commandTextEdit)

  g_keyboard.bindKeyPress('Ctrl+C',

    function()

      if commandTextEdit:hasSelection() or not terminalSelectText:hasSelection() then return false end

      g_window.setClipboardText(terminalSelectText:getSelection())

    return true

    end, commandTextEdit)

  g_keyboard.bindKeyDown('Tab', completeCommand, commandTextEdit)

  g_keyboard.bindKeyPress('Shift+Enter', addNewline, commandTextEdit)

  g_keyboard.bindKeyDown('Enter', doCommand, commandTextEdit)

  g_keyboard.bindKeyDown('Escape', hide, terminalWindow)

  terminalBuffer = terminalWindow:getChildById('terminalBuffer')

  terminalSelectText = terminalWindow:getChildById('terminalSelectText')

  terminalSelectText.onDoubleClick = popWindow

  terminalSelectText.onMouseWheel = function(a,b,c) terminalBuffer:onMouseWheel(b,c) end

  terminalBuffer.onScrollChange = function(self, value) terminalSelectText:setTextVirtualOffset(value) end

  g_logger.setOnLog(onLog)

  if not g_app.isRunning() then

    g_logger.fireOldMessages()

  elseif _G.terminalLines then

    for _,line in pairs(_G.terminalLines) do

      addLine(line.text, line.color)

    end

  end

end

function terminate()

  g_settings.setList('terminal-history', commandHistory)

  removeEvent(flushEvent)

  if poped then

    oldPos = terminalWindow:getPosition()

    oldSize = terminalWindow:getSize()

  end

  local settings = {

    size = oldSize,

    pos = oldPos,

    poped = poped

}

  g_settings.setNode('terminal-window', settings)

  g_keyboard.unbindKeyDown('Ctrl+T')

  g_logger.setOnLog(nil)

  terminalWindow:destroy()

  terminalButton:destroy()

  commandEnv = nil

  _G.terminalLines = allLines

end

function hideButton()

  --terminalButton:hide()

end

function popWindow()

  if poped then

    oldPos = terminalWindow:getPosition()

    oldSize = terminalWindow:getSize()

    terminalWindow:fill('parent')

    terminalWindow:setOn(false)

    terminalWindow:getChildById('bottomResizeBorder'):disable()

    terminalWindow:getChildById('rightResizeBorder'):disable()

    terminalWindow:getChildById('titleBar'):hide()

    terminalWindow:getChildById('terminalScroll'):setMarginTop(0)

    terminalWindow:getChildById('terminalScroll'):setMarginBottom(0)

    terminalWindow:getChildById('terminalScroll'):setMarginRight(0)

    poped = false

  else

    terminalWindow:breakAnchors()

    terminalWindow:setOn(true)

    local size = oldSize or { width = g_window.getWidth()/2.5, height = g_window.getHeight()/4 }

    terminalWindow:setSize(size)

    local pos = oldPos or { x = 0, y = g_window.getHeight() }

    terminalWindow:setPosition(pos)

    terminalWindow:getChildById('bottomResizeBorder'):enable()

    terminalWindow:getChildById('rightResizeBorder'):enable()

    terminalWindow:getChildById('titleBar'):show()

    terminalWindow:getChildById('terminalScroll'):setMarginTop(18)

    terminalWindow:getChildById('terminalScroll'):setMarginBottom(1)

    terminalWindow:getChildById('terminalScroll'):setMarginRight(1)

    terminalWindow:bindRectToParent()

    poped = true

  end

end

function toggle()

  if terminalWindow:isVisible() then

    hide()

  else

    if not firstShown then

      local settings = g_settings.getNode('terminal-window')

      if settings then

        if settings.size then oldSize = settings.size end

        if settings.pos then oldPos = settings.pos end

        if settings.poped then popWindow() end

      end

      firstShown = true

    end

    show()

  end

end

function show()

  terminalWindow:show()

  terminalWindow:raise()

  terminalWindow:focus()

end

function hide()

  terminalWindow:hide()

end

function disable()

  --terminalButton:hide()

  g_keyboard.unbindKeyDown('Ctrl+T')

  disabled = true

end

function flushLines()

  local numLines = terminalBuffer:getChildCount() + #cachedLines

  local fulltext = terminalSelectText:getText()

  for _,line in pairs(cachedLines) do

    -- delete old lines if needed

    if numLines > MaxLogLines then

      local firstChild = terminalBuffer:getChildByIndex(1)

      if firstChild then

        local len = #firstChild:getText()

        firstChild:destroy()

        table.remove(allLines, 1)

        fulltext = string.sub(fulltext, len)

      end

    end

    local label = g_ui.createWidget('TerminalLabel', terminalBuffer)

    label:setId('terminalLabel' .. numLines)

    label:setText(line.text)

    label:setColor(line.color)

    table.insert(allLines, {text=line.text,color=line.color})

    fulltext = fulltext .. '\n' .. line.text

  end

  terminalSelectText:setText(fulltext)

  cachedLines = {}

  removeEvent(flushEvent)

  flushEvent = nil

end

function addLine(text, color)

  if not flushEvent then

    flushEvent = scheduleEvent(flushLines, 10)

  end

  text = string.gsub(text, '\t', '    ')

  table.insert(cachedLines, {text=text, color=color})

end

function terminalPrint(value)

  if type(value) == "table" then

    return print(json.encode(value, 2))

  end

  print(tostring(value))

end

function executeCommand(command)

  if command == nil or #string.gsub(command, '\n', '') == 0 then return end

  -- add command line

  addLine("> " .. command, "#ffffff")

  if g_game.getFeature(GameNoDebug) then

    addLine("Terminal is disabled on this server", "#ff8888")

    return    

  end

  -- reset current history index

  currentHistoryIndex = 0

  -- add new command to history

  if #commandHistory == 0 or commandHistory[#commandHistory] ~= command then

    table.insert(commandHistory, command)

    while #commandHistory > MaxHistory do

      table.remove(commandHistory, 1)

    end

  end

  -- detect and convert commands with simple syntax

  local realCommand

  if string.sub(command, 1, 1) == '=' then

    realCommand = 'modules.client_terminal.terminalPrint(' .. string.sub(command,2) .. ')'

  else

    realCommand = command

  end

  local func, err = loadstring(realCommand, "@")

  -- detect terminal commands

  if not func then

    local command_name = command:match('^([%w_]+)[%s]*.*')

    if command_name then

      local args = string.split(command:match('^[%w_]+[%s]*(.*)'), ' ')

      if commandEnv[command_name] and type(commandEnv[command_name]) == 'function' then

        func = function() modules.client_terminal.commandEnv[command_name](unpack(args)) end

      elseif command_name == command then

        addLine('ERROR: command not found', 'red')

        return

      end

    end

  end

  -- check for syntax errors

  if not func then

    addLine('ERROR: incorrect lua syntax: ' .. err:sub(5), 'red')

    return

  end

  commandEnv['player'] = g_game.getLocalPlayer()

  -- setup func env to commandEnv

  setfenv(func, commandEnv)

  -- execute the command

  local ok, ret = pcall(func)

  if ok then

    -- if the command returned a value, print it

    if ret then addLine(ret, 'white') end

  else

    addLine('ERROR: command failed: ' .. ret, 'red')

  end

end

function clear()

  terminalBuffer:destroyChildren()

  terminalSelectText:setText('')

  cachedLines = {}

  allLines = {}

end

```

---
# terminal.otmod

```text

Module

  name: client_terminal

  description: Terminal for executing lua functions

  author: edubart

  website: https://github.com/edubart/otclient

  scripts: [ terminal ]

  sandboxed: true

  reloadable: false

  @onLoad: init()

  @onUnload: terminate()

```

---
# terminal.otui

```otui

TerminalLabel < UILabel

  font: terminus-10px

  text-wrap: true

  text-auto-resize: true

  phantom: true

TerminalSelectText < UITextEdit

  font: terminus-10px

  text-wrap: true

  text-align: bottomLeft

  editable: false

  change-cursor-image: false

  cursor-visible: false

  selection-color: black

  selection-background-color: white

  color: alpha

  focusable: false

  auto-scroll: false

UIWindow

  id: terminalWindow

  background-color: #000000

  opacity: 0.85

  clipping: true

  anchors.fill: parent

  border: 0 white

  $on:

    border: 1 black

  Label

    id: titleBar

    !text: tr('Terminal')

    border: 1 black

    color: white

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    background-color: #ffffff11

    text-align: left

    text-offset: 4 0

    height: 18

    visible: false

  ScrollablePanel

    id: terminalBuffer

    focusable: false

    anchors.left: parent.left

    anchors.right: terminalScroll.left

    anchors.top: terminalScroll.top

    anchors.bottom: commandTextEdit.top

    layout:

      type: verticalBox

      align-bottom: true

    vertical-scrollbar: terminalScroll

    inverted-scroll: true

    margin-left: 2

  TerminalSelectText

    id: terminalSelectText

    anchors.fill: terminalBuffer

    focusable: false

  VerticalScrollBar

    id: terminalScroll

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    anchors.right: parent.right

    step: 48

    pixels-scroll: true

  UILabel

    id: commandSymbolLabel

    size: 12 12

    fixed-size: true

    anchors.bottom: parent.bottom

    anchors.left: parent.left

    margin-left: 2

    font: terminus-10px

    text: >

  UITextEdit

    id: commandTextEdit

    background: #aaaaaa11

    border-color: #aaaaaa88

    &baseHeight: 12

    anchors.bottom: parent.bottom

    anchors.left: commandSymbolLabel.right

    anchors.right: terminalScroll.left

    margin-left: 1

    padding-left: 2

    font: terminus-10px

    selection-color: black

    selection-background-color: white

    border-width-left: 0

    border-width-top: 0

    multiline: false

    text-auto-submit: true

    $on:

      border-width-left: 1

      border-width-top: 1

      multiline: true

  ResizeBorder

    id: bottomResizeBorder

    anchors.bottom: parent.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    enabled: false

  ResizeBorder

    id: rightResizeBorder

    anchors.right: parent.right

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    enabled: false

```

---
