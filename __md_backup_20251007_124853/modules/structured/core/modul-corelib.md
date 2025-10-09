# ¦ Modul: `corelib`

```lua

--[[

 base64 -- v1.5.1 public domain Lua base64 encoder/decoder

 no warranty implied; use at your own risk

 Needs bit32.extract function. If not present it's implemented using BitOp

 or Lua 5.3 native bit operators. For Lua 5.1 fallbacks to pure Lua

 implementation inspired by Rici Lake's post:

   http://ricilake.blogspot.co.uk/2007/10/iterating-bits-in-lua.html

 author: Ilya Kolbin (iskolbin@gmail.com)

 url: github.com/iskolbin/lbase64

 COMPATIBILITY

 Lua 5.1, 5.2, 5.3, LuaJIT

 LICENSE

 See end of file for license information.

--]]

base64 = {}

local extract = _G.bit32 and _G.bit32.extract

if not extract then

	if _G.bit then

		local shl, shr, band = _G.bit.lshift, _G.bit.rshift, _G.bit.band

		extract = function( v, from, width )

			return band( shr( v, from ), shl( 1, width ) - 1 )

		end

	elseif _G._VERSION >= "Lua 5.3" then

		extract = load[[return function( v, from, width )

			return ( v >> from ) & ((1 << width) - 1)

		end]]()

	else

		extract = function( v, from, width )

			local w = 0

			local flag = 2^from

			for i = 0, width-1 do

				local flag2 = flag + flag

				if v % flag2 >= flag then

					w = w + 2^i

				end

				flag = flag2

			end

			return w

		end

	end

end

function base64.makeencoder( s62, s63, spad )

	local encoder = {}

	for b64code, char in pairs{[0]='A','B','C','D','E','F','G','H','I','J',

		'K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y',

		'Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n',

		'o','p','q','r','s','t','u','v','w','x','y','z','0','1','2',

		'3','4','5','6','7','8','9',s62 or '+',s63 or'/',spad or'='} do

		encoder[b64code] = char:byte()

	end

	return encoder

end

function base64.makedecoder( s62, s63, spad )

	local decoder = {}

	for b64code, charcode in pairs( base64.makeencoder( s62, s63, spad )) do

		decoder[charcode] = b64code

	end

	return decoder

end

local DEFAULT_ENCODER = base64.makeencoder()

local DEFAULT_DECODER = base64.makedecoder()

local char, concat = string.char, table.concat

function base64.encode( str, encoder, usecaching )

	encoder = encoder or DEFAULT_ENCODER

	local t, k, n = {}, 1, #str

	local lastn = n % 3

	local cache = {}

	for i = 1, n-lastn, 3 do

		local a, b, c = str:byte( i, i+2 )

		local v = a*0x10000 + b*0x100 + c

		local s

		if usecaching then

			s = cache[v]

			if not s then

				s = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[extract(v,0,6)])

				cache[v] = s

			end

		else

			s = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[extract(v,0,6)])

		end

		t[k] = s

		k = k + 1

	end

	if lastn == 2 then

		local a, b = str:byte( n-1, n )

		local v = a*0x10000 + b*0x100

		t[k] = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[64])

	elseif lastn == 1 then

		local v = str:byte( n )*0x10000

		t[k] = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[64], encoder[64])

	end

	return concat( t )

end

function base64.decode( b64, decoder, usecaching )

	decoder = decoder or DEFAULT_DECODER

	local pattern = '[^%w%+%/%=]'

	if decoder then

		local s62, s63

		for charcode, b64code in pairs( decoder ) do

			if b64code == 62 then s62 = charcode

			elseif b64code == 63 then s63 = charcode

			end

		end

		pattern = ('[^%%w%%%s%%%s%%=]'):format( char(s62), char(s63) )

	end

	b64 = b64:gsub( pattern, '' )

	local cache = usecaching and {}

	local t, k = {}, 1

	local n = #b64

	local padding = b64:sub(-2) == '==' and 2 or b64:sub(-1) == '=' and 1 or 0

	for i = 1, padding > 0 and n-4 or n, 4 do

		local a, b, c, d = b64:byte( i, i+3 )

		local s

		if usecaching then

			local v0 = a*0x1000000 + b*0x10000 + c*0x100 + d

			s = cache[v0]

			if not s then

				local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40 + decoder[d]

				s = char( extract(v,16,8), extract(v,8,8), extract(v,0,8))

				cache[v0] = s

			end

		else

			local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40 + decoder[d]

			s = char( extract(v,16,8), extract(v,8,8), extract(v,0,8))

		end

		t[k] = s

		k = k + 1

	end

	if padding == 1 then

		local a, b, c = b64:byte( n-3, n-1 )

		local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40

		t[k] = char( extract(v,16,8), extract(v,8,8))

	elseif padding == 2 then

		local a, b = b64:byte( n-3, n-2 )

		local v = decoder[a]*0x40000 + decoder[b]*0x1000

		t[k] = char( extract(v,16,8))

	end

	return concat( t )

end

--[[

Copyright (c) 2018 Ilya Kolbin

Permission is hereby granted, free of charge, to any person obtaining a copy of

this software and associated documentation files (the "Software"), to deal in

the Software without restriction, including without limitation the rights to

use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies

of the Software, and to permit persons to whom the Software is furnished to do

so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all

copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR

IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,

FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE

AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER

LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,

OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE

SOFTWARE.

--]]

```

---
# bitwise.lua

```lua

Bit = {}

function Bit.bit(p)

  return 2 ^ p

end

function Bit.hasBit(x, p)

  return x % (p + p) >= p

end

function Bit.setbit(x, p)

  return Bit.hasBit(x, p) and x or x + p

end

function Bit.clearbit(x, p)

  return Bit.hasBit(x, p) and x - p or x

end

```

---
# config.lua

```lua

-- @docclass

local function convertSettingValue(value)

  if type(value) == 'table' then

    if value.x and value.width then

      return recttostring(value)

    elseif value.x then

      return pointtostring(value)

    elseif value.width then

      return sizetostring(value)

    elseif value.r then

      return colortostring(value)

    else

      return value

    end

  elseif value == nil then

    return ''

  else

    return tostring(value)

  end

end

function Config:set(key, value)

  self:setValue(key, convertSettingValue(value))

end

function Config:setDefault(key, value)

  if self:exists(key) then return false end

  self:set(key, value)

  return true

end

function Config:get(key, default)

  if not self:exists(key) and default ~= nil then

    self:set(key, default)

  end

  return self:getValue(key)

end

function Config:getString(key, default)

  return self:get(key, default)

end

function Config:getInteger(key, default)

  local v = tonumber(self:get(key, default)) or 0

  return v

end

function Config:getNumber(key, default)

  local v = tonumber(self:get(key, default)) or 0

  return v

end

function Config:getBoolean(key, default)

  return toboolean(self:get(key, default))

end

function Config:getPoint(key, default)

  return topoint(self:get(key, default))

end

function Config:getRect(key, default)

  return torect(self:get(key, default))

end

function Config:getSize(key, default)

  return tosize(self:get(key, default))

end

function Config:getColor(key, default)

  return tocolor(self:get(key, default))

end

```

---
# const.lua

```lua

-- @docconsts @{

AnchorNone = 0

AnchorTop = 1

AnchorBottom = 2

AnchorLeft = 3

AnchorRight = 4

AnchorVerticalCenter = 5

AnchorHorizontalCenter = 6

LogDebug = 0

LogInfo = 1

LogWarning = 2

LogError = 3

LogFatal = 4

MouseFocusReason = 0

KeyboardFocusReason = 1

ActiveFocusReason = 2

OtherFocusReason = 3

AutoFocusNone = 0

AutoFocusFirst = 1

AutoFocusLast = 2

KeyboardNoModifier = 0

KeyboardCtrlModifier = 1

KeyboardAltModifier = 2

KeyboardCtrlAltModifier = 3

KeyboardShiftModifier = 4

KeyboardCtrlShiftModifier = 5

KeyboardAltShiftModifier = 6

KeyboardCtrlAltShiftModifier = 7

MouseNoButton = 0

MouseLeftButton = 1

MouseRightButton = 2

MouseMidButton = 3

MouseTouch = 4

MouseTouch2 = 5 -- multitouch, 2nd finger

MouseTouch3 = 6 -- multitouch, 3th finger

MouseButton4 = 7 -- side mouse button 1

MouseButton5 = 8 -- side mouse button 2

MouseNoWheel = 0

MouseWheelUp = 1

MouseWheelDown = 2

AlignNone = 0

AlignLeft = 1

AlignRight = 2

AlignTop = 4

AlignBottom = 8

AlignHorizontalCenter = 16

AlignVerticalCenter = 32

AlignTopLeft = 5

AlignTopRight = 6

AlignBottomLeft = 9

AlignBottomRight = 10

AlignLeftCenter = 33

AlignRightCenter = 34

AlignTopCenter = 20

AlignBottomCenter = 24

AlignCenter = 48

KeyUnknown = 0

KeyEscape = 1

KeyTab = 2

KeyBackspace = 3

KeyEnter = 5

KeyInsert = 6

KeyDelete = 7

KeyPause = 8

KeyPrintScreen = 9

KeyHome = 10

KeyEnd = 11

KeyPageUp = 12

KeyPageDown = 13

KeyUp = 14

KeyDown = 15

KeyLeft = 16

KeyRight = 17

KeyNumLock = 18

KeyScrollLock = 19

KeyCapsLock = 20

KeyCtrl = 21

KeyShift = 22

KeyAlt = 23

KeyMeta = 25

KeyMenu = 26

KeySpace = 32        -- ' '

KeyExclamation = 33  -- !

KeyQuote = 34        -- "

KeyNumberSign = 35   -- #

KeyDollar = 36       -- $

KeyPercent = 37      -- %

KeyAmpersand = 38    -- &

KeyApostrophe = 39   -- '

KeyLeftParen = 40    -- (

KeyRightParen = 41   -- )

KeyAsterisk = 42     -- *

KeyPlus = 43         -- +

KeyComma = 44        -- ,

KeyMinus = 45        -- -

KeyPeriod = 46       -- .

KeySlash = 47        -- /

Key0 = 48            -- 0

Key1 = 49            -- 1

Key2 = 50            -- 2

Key3 = 51            -- 3

Key4 = 52            -- 4

Key5 = 53            -- 5

Key6 = 54            -- 6

Key7 = 55            -- 7

Key8 = 56            -- 8

Key9 = 57            -- 9

KeyColon = 58        -- :

KeySemicolon = 59    -- ;

KeyLess = 60         -- <

KeyEqual = 61        -- =

KeyGreater = 62      -- >

KeyQuestion = 63     -- ?

KeyAtSign = 64       -- @

KeyA = 65            -- a

KeyB = 66            -- b

KeyC = 67            -- c

KeyD = 68            -- d

KeyE = 69            -- e

KeyF = 70            -- f

KeyG = 71            -- g

KeyH = 72            -- h

KeyI = 73            -- i

KeyJ = 74            -- j

KeyK = 75            -- k

KeyL = 76            -- l

KeyM = 77            -- m

KeyN = 78            -- n

KeyO = 79            -- o

KeyP = 80            -- p

KeyQ = 81            -- q

KeyR = 82            -- r

KeyS = 83            -- s

KeyT = 84            -- t

KeyU = 85            -- u

KeyV = 86            -- v

KeyW = 87            -- w

KeyX = 88            -- x

KeyY = 89            -- y

KeyZ = 90            -- z

KeyLeftBracket = 91  -- [

KeyBackslash = 92    -- '\'

KeyRightBracket = 93 -- ]

KeyCaret = 94        -- ^

KeyUnderscore = 95   -- _

KeyGrave = 96        -- `

KeyLeftCurly = 123   -- {

KeyBar = 124         -- |

KeyRightCurly = 125  -- }

KeyTilde = 126       -- ~

KeyF1 = 128

KeyF2 = 129

KeyF3 = 130

KeyF4 = 131

KeyF5 = 132

KeyF6 = 134

KeyF7 = 135

KeyF8 = 136

KeyF9 = 137

KeyF10 = 138

KeyF11 = 139

KeyF12 = 140

KeyNumpad0 = 141

KeyNumpad1 = 142

KeyNumpad2 = 143

KeyNumpad3 = 144

KeyNumpad4 = 145

KeyNumpad5 = 146

KeyNumpad6 = 147

KeyNumpad7 = 148

KeyNumpad8 = 149

KeyNumpad9 = 150

FirstKey = KeyUnknown

LastKey = KeyNumpad9

ExtendedActivate = 0

ExtendedLocales = 1

ExtendedParticles = 2

-- @}

KeyCodeDescs = {

  [KeyUnknown] = 'Unknown',

  [KeyEscape] = 'Escape',

  [KeyTab] = 'Tab',

  [KeyBackspace] = 'Backspace',

  [KeyEnter] = 'Enter',

  [KeyInsert] = 'Insert',

  [KeyDelete] = 'Delete',

  [KeyPause] = 'Pause',

  [KeyPrintScreen] = 'PrintScreen',

  [KeyHome] = 'Home',

  [KeyEnd] = 'End',

  [KeyPageUp] = 'PageUp',

  [KeyPageDown] = 'PageDown',

  [KeyUp] = 'Up',

  [KeyDown] = 'Down',

  [KeyLeft] = 'Left',

  [KeyRight] = 'Right',

  [KeyNumLock] = 'NumLock',

  [KeyScrollLock] = 'ScrollLock',

  [KeyCapsLock] = 'CapsLock',

  [KeyCtrl] = 'Ctrl',

  [KeyShift] = 'Shift',

  [KeyAlt] = 'Alt',

  [KeyMeta] = 'Meta',

  [KeyMenu] = 'Menu',

  [KeySpace] = 'Space',

  [KeyExclamation] = '!',

  [KeyQuote] = '\"',

  [KeyNumberSign] = '#',

  [KeyDollar] = '$',

  [KeyPercent] = '%',

  [KeyAmpersand] = '&',

  [KeyApostrophe] = '\'',

  [KeyLeftParen] = '(',

  [KeyRightParen] = ')',

  [KeyAsterisk] = '*',

  [KeyPlus] = 'Plus',

  [KeyComma] = ',',

  [KeyMinus] = '-',

  [KeyPeriod] = '.',

  [KeySlash] = '/',

  [Key0] = '0',

  [Key1] = '1',

  [Key2] = '2',

  [Key3] = '3',

  [Key4] = '4',

  [Key5] = '5',

  [Key6] = '6',

  [Key7] = '7',

  [Key8] = '8',

  [Key9] = '9',

  [KeyColon] = ':',

  [KeySemicolon] = ';',

  [KeyLess] = '<',

  [KeyEqual] = '=',

  [KeyGreater] = '>',

  [KeyQuestion] = '?',

  [KeyAtSign] = '@',

  [KeyA] = 'A',

  [KeyB] = 'B',

  [KeyC] = 'C',

  [KeyD] = 'D',

  [KeyE] = 'E',

  [KeyF] = 'F',

  [KeyG] = 'G',

  [KeyH] = 'H',

  [KeyI] = 'I',

  [KeyJ] = 'J',

  [KeyK] = 'K',

  [KeyL] = 'L',

  [KeyM] = 'M',

  [KeyN] = 'N',

  [KeyO] = 'O',

  [KeyP] = 'P',

  [KeyQ] = 'Q',

  [KeyR] = 'R',

  [KeyS] = 'S',

  [KeyT] = 'T',

  [KeyU] = 'U',

  [KeyV] = 'V',

  [KeyW] = 'W',

  [KeyX] = 'X',

  [KeyY] = 'Y',

  [KeyZ] = 'Z',

  [KeyLeftBracket] = '[',

  [KeyBackslash] = '\\',

  [KeyRightBracket] = ']',

  [KeyCaret] = '^',

  [KeyUnderscore] = '_',

  [KeyGrave] = '`',

  [KeyLeftCurly] = '{',

  [KeyBar] = '|',

  [KeyRightCurly] = '}',

  [KeyTilde] = '~',

  [KeyF1] = 'F1',

  [KeyF2] = 'F2',

  [KeyF3] = 'F3',

  [KeyF4] = 'F4',

  [KeyF5] = 'F5',

  [KeyF6] = 'F6',

  [KeyF7] = 'F7',

  [KeyF8] = 'F8',

  [KeyF9] = 'F9',

  [KeyF10] = 'F10',

  [KeyF11] = 'F11',

  [KeyF12] = 'F12',

  [KeyNumpad0] = 'Numpad0',

  [KeyNumpad1] = 'Numpad1',

  [KeyNumpad2] = 'Numpad2',

  [KeyNumpad3] = 'Numpad3',

  [KeyNumpad4] = 'Numpad4',

  [KeyNumpad5] = 'Numpad5',

  [KeyNumpad6] = 'Numpad6',

  [KeyNumpad7] = 'Numpad7',

  [KeyNumpad8] = 'Numpad8',

  [KeyNumpad9] = 'Numpad9',

}

NetworkMessageTypes = {

  Boolean = 1,

  U8 = 2,

  U16 = 3,

  U32 = 4,

  U64 = 5,

  NumberString = 6,

  String = 7,

  Table = 8,

}

SoundChannels = {

  Music = 1,

  Ambient = 2,

  Effect = 3,

  Bot = 4

}

```

---
# corelib.otmod

```text

Module

  name: corelib

  description: Contains core lua classes, functions and constants used by other modules

  author: OTClient team

  website: https://github.com/edubart/otclient

  reloadable: false

  @onLoad: |

    dofile 'math'

    dofile 'string'

    dofile 'table'

    dofile 'bitwise'

    dofile 'struct'

    dofile 'const'

    dofile 'util'

    dofile 'globals'

    dofile 'config'

    dofile 'settings'

    dofile 'keyboard'

    dofile 'mouse'

    dofile 'net'

    dofiles 'classes'

    dofiles 'ui'

    dofile 'inputmessage'

    dofile 'outputmessage'

    dofile 'orderedtable'

    dofile 'base64'

    dofile 'json'

    dofile 'http'

    dofile 'test'

```

---
# globals.lua

```lua

-- @docvars @{

-- root widget

rootWidget = g_ui.getRootWidget()

modules = package.loaded

-- G is used as a global table to save variables in memory between reloads

G = G or {}

-- @}

-- @docfuncs @{

function scheduleEvent(callback, delay)

  local desc = "lua"

  local info = debug.getinfo(2, "Sl")

  if info then

    desc = info.short_src .. ":" .. info.currentline

  end

  local event = g_dispatcher.scheduleEvent(desc, callback, delay)

  -- must hold a reference to the callback, otherwise it would be collected

  event._callback = callback

  return event

end

function addEvent(callback, front)

  local desc = "lua"

  local info = debug.getinfo(2, "Sl")

  if info then

    desc = info.short_src .. ":" .. info.currentline

  end

  local event = g_dispatcher.addEvent(desc, callback, front)

  -- must hold a reference to the callback, otherwise it would be collected

  event._callback = callback

  return event

end

function cycleEvent(callback, interval)

  local desc = "lua"

  local info = debug.getinfo(2, "Sl")

  if info then

    desc = info.short_src .. ":" .. info.currentline

  end

  local event = g_dispatcher.cycleEvent(desc, callback, interval)

  -- must hold a reference to the callback, otherwise it would be collected

  event._callback = callback

  return event

end

function periodicalEvent(eventFunc, conditionFunc, delay, autoRepeatDelay)

  delay = delay or 30

  autoRepeatDelay = autoRepeatDelay or delay

  local func

  func = function()

    if conditionFunc and not conditionFunc() then

      func = nil

      return

    end

    eventFunc()

    scheduleEvent(func, delay)

  end

  scheduleEvent(function()

    func()

  end, autoRepeatDelay)

end

function removeEvent(event)

  if event then

    event:cancel()

    event._callback = nil

  end

end

-- @}

```

---
# http.lua

```lua

HTTP = {

  timeout=5,

  websocketTimeout=15,

  agent="Mozilla/5.0",

  imageId=1000,

  images={},

  operations={},

}

function HTTP.get(url, callback)

  if not g_http or not g_http.get then

    return error("HTTP.get is not supported")

  end

  local operation = g_http.get(url, HTTP.timeout)

  HTTP.operations[operation] = {type="get", url=url, callback=callback}  

  return operation

end

function HTTP.getJSON(url, callback)

  if not g_http or not g_http.get then

    return error("HTTP.getJSON is not supported")

  end

  local operation = g_http.get(url, HTTP.timeout)

  HTTP.operations[operation] = {type="get", json=true, url=url, callback=callback}  

  return operation

end

function HTTP.post(url, data, callback)

  if not g_http or not g_http.post then

    return error("HTTP.post is not supported")

  end

  if type(data) == "table" then

    data = json.encode(data)

  end

  local operation = g_http.post(url, data, HTTP.timeout)

  HTTP.operations[operation] = {type="post", url=url, callback=callback}

  return operation

end

function HTTP.postJSON(url, data, callback)

  if not g_http or not g_http.post then

    return error("HTTP.postJSON is not supported")

  end

  if type(data) == "table" then

    data = json.encode(data)

  end

  local operation = g_http.post(url, data, HTTP.timeout, true)

  HTTP.operations[operation] = {type="post", json=true, url=url, callback=callback}

  return operation

end

function HTTP.download(url, file, callback, progressCallback)

  if not g_http or not g_http.download then

    return error("HTTP.download is not supported")

  end

  local operation = g_http.download(url, file, HTTP.timeout)

  HTTP.operations[operation] = {type="download", url=url, file=file, callback=callback, progressCallback=progressCallback}  

  return operation

end

function HTTP.downloadImage(url, callback)

  if not g_http or not g_http.download then

    return error("HTTP.downloadImage is not supported")

  end

  if HTTP.images[url] ~= nil then

    if callback then

      callback('/downloads/' .. HTTP.images[url], nil)

    end

    return

  end

  local file = "autoimage_" .. HTTP.imageId .. ".png"

  HTTP.imageId = HTTP.imageId + 1

  local operation = g_http.download(url, file, HTTP.timeout)

  HTTP.operations[operation] = {type="image", url=url, file=file, callback=callback}  

  return operation

end

function HTTP.webSocket(url, callbacks, timeout, jsonWebsocket)

  if not g_http or not g_http.ws then

    return error("WebSocket is not supported")

  end

  if not timeout or timeout < 1 then

    timeout = HTTP.websocketTimeout

  end

  local operation = g_http.ws(url, timeout)

  HTTP.operations[operation] = {type="ws", json=jsonWebsocket, url=url, callbacks=callbacks}  

  return {

    id = operation,

    url = url,

    close = function() 

      g_http.wsClose(operation)

    end,

    send = function(message)

      if type(message) == "table" then

        message = json.encode(message)

      end

      g_http.wsSend(operation, message)

    end

}

end

HTTP.WebSocket = HTTP.webSocket

function HTTP.webSocketJSON(url, callbacks, timeout)

  return HTTP.webSocket(url, callbacks, timeout, true)

end

HTTP.WebSocketJSON = HTTP.webSocketJSON

function HTTP.cancel(operationId)

  if not g_http or not g_http.cancel then

    return

  end

  HTTP.operations[operationId] = nil

  return g_http.cancel(operationId)

end

function HTTP.onGet(operationId, url, err, data)

  local operation = HTTP.operations[operationId]

  if operation == nil then

    return

  end

  if err and err:len() == 0 then

    err = nil

  end

  if not err and operation.json then

    if data:len() == 0 then

      data = "null"

    end

    local status, result = pcall(function() return json.decode(data) end)

    if not status then

      err = "JSON ERROR: " .. result

      if data and data:len() > 0 then

        err = err .. " (" .. data:sub(1, 100) .. ")"

      end

    end  

    data = result

  end

  if operation.callback then

    operation.callback(data, err)

  end

end

function HTTP.onGetProgress(operationId, url, progress)

  local operation = HTTP.operations[operationId]

  if operation == nil then

    return

  end

end

function HTTP.onPost(operationId, url, err, data)

  local operation = HTTP.operations[operationId]

  if operation == nil then

    return

  end

  if err and err:len() == 0 then

    err = nil

  end

  if not err and operation.json then

    if data:len() == 0 then

      data = "null"

    end

    local status, result = pcall(function() return json.decode(data) end)

    if not status then

      err = "JSON ERROR: " .. result

      if data and data:len() > 0 then

        err = err .. " (" .. data:sub(1, 100) .. ")"

      end

    end  

    data = result

  end

  if operation.callback then

    operation.callback(data, err)

  end

end

function HTTP.onPostProgress(operationId, url, progress)

  local operation = HTTP.operations[operationId]

  if operation == nil then

    return

  end

end

function HTTP.onDownload(operationId, url, err, path, checksum)

  local operation = HTTP.operations[operationId]

  if operation == nil then

    return

  end

  if err and err:len() == 0 then

    err = nil

  end

  if operation.callback then

    if operation["type"] == "image" then

      if not err then

        HTTP.images[url] = path

      end

      operation.callback('/downloads/' .. path, err)    

    else

      operation.callback(path, checksum, err)

    end

  end

end

function HTTP.onDownloadProgress(operationId, url, progress, speed)

  local operation = HTTP.operations[operationId]

  if operation == nil then

    return

  end

  if operation.progressCallback then

    operation.progressCallback(progress, speed)

  end

end

function HTTP.onWsOpen(operationId, message)

  local operation = HTTP.operations[operationId]

  if operation == nil then

    return

  end

  if operation.callbacks.onOpen then

    operation.callbacks.onOpen(message, operationId)

  end

end

function HTTP.onWsMessage(operationId, message)

  local operation = HTTP.operations[operationId]

  if operation == nil then

    return

  end

  if operation.callbacks.onMessage then

    if operation.json then

      if message:len() == 0 then

        message = "null"

      end

      local status, result = pcall(function() return json.decode(message) end)

      local err = nil

      if not status then

        err = "JSON ERROR: " .. result

        if message and message:len() > 0 then

          err = err .. " (" .. message:sub(1, 100) .. ")"

        end

      end

      if err then

        if operation.callbacks.onError then

          operation.callbacks.onError(err, operationId)

        end        

      else

        operation.callbacks.onMessage(result, operationId)    

      end

    else

      operation.callbacks.onMessage(message, operationId)

    end

  end

end

function HTTP.onWsClose(operationId, message)

  local operation = HTTP.operations[operationId]

  if operation == nil then

    return

  end

  if operation.callbacks.onClose then

    operation.callbacks.onClose(message, operationId)

  end

end

function HTTP.onWsError(operationId, message)

  local operation = HTTP.operations[operationId]

  if operation == nil then

    return

  end

  if operation.callbacks.onError then

    operation.callbacks.onError(message, operationId)

  end

end

connect(g_http, 

{

    onGet = HTTP.onGet,

    onGetProgress = HTTP.onGetProgress,

    onPost = HTTP.onPost,

    onPostProgress = HTTP.onPostProgress,

    onDownload = HTTP.onDownload,

    onDownloadProgress = HTTP.onDownloadProgress,

    onWsOpen = HTTP.onWsOpen,

    onWsMessage = HTTP.onWsMessage,

    onWsClose = HTTP.onWsClose,

    onWsError = HTTP.onWsError,

})

g_http.setUserAgent(HTTP.agent)

```

---
# inputmessage.lua

```lua

function InputMessage:getData()

  local dataType = self:getU8()

  if dataType == NetworkMessageTypes.Boolean then

    return numbertoboolean(self:getU8())

  elseif dataType == NetworkMessageTypes.U8 then

    return self:getU8()

  elseif dataType == NetworkMessageTypes.U16 then

    return self:getU16()

  elseif dataType == NetworkMessageTypes.U32 then

    return self:getU32()

  elseif dataType == NetworkMessageTypes.U64 then

    return self:getU64()

  elseif dataType == NetworkMessageTypes.NumberString then

    return tonumber(self:getString())

  elseif dataType == NetworkMessageTypes.String then

    return self:getString()

  elseif dataType == NetworkMessageTypes.Table then

    return self:getTable()

  else

    perror('Unknown data type ' .. dataType)

  end

  return nil

end

function InputMessage:getTable()

  local ret = {}

  local size = self:getU16()

  for i=1,size do

    local index = self:getData()

    local value = self:getData()

    ret[index] = value

  end

  return ret

end

function InputMessage:getColor()

  local color = {}

  color.r = self:getU8()

  color.g = self:getU8()

  color.b = self:getU8()

  color.a = self:getU8()

  return color

end

function InputMessage:getPosition()

  local position = {}

  position.x = self:getU16()

  position.y = self:getU16()

  position.z = self:getU8()

  return position

end

```

---
# json.lua

```lua

--

-- json.lua

--

-- Copyright (c) 2019 rxi

--

-- Permission is hereby granted, free of charge, to any person obtaining a copy of

-- this software and associated documentation files (the "Software"), to deal in

-- the Software without restriction, including without limitation the rights to

-- use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies

-- of the Software, and to permit persons to whom the Software is furnished to do

-- so, subject to the following conditions:

--

-- The above copyright notice and this permission notice shall be included in all

-- copies or substantial portions of the Software.

--

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR

-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,

-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE

-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER

-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,

-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE

-- SOFTWARE.

--

json = { _version = "0.1.1" }

-------------------------------------------------------------------------------

-- Encode

-------------------------------------------------------------------------------

local encode

local escape_char_map = {

  [ "\\" ] = "\\\\",

  [ "\"" ] = "\\\"",

  [ "\b" ] = "\\b",

  [ "\f" ] = "\\f",

  [ "\n" ] = "\\n",

  [ "\r" ] = "\\r",

  [ "\t" ] = "\\t",

}

local escape_char_map_inv = { [ "\\/" ] = "/" }

for k, v in pairs(escape_char_map) do

  escape_char_map_inv[v] = k

end

local function make_indent(state)

  return string.rep(" ", state.currentIndentLevel * state.indent)

end

local function escape_char(c)

  return escape_char_map[c] or string.format("\\u%04x", c:byte())

end

local function encode_nil()

  return "null"

end

local function encode_table(val, state)

  local res = {}

  local stack = state.stack

  local pretty = state.indent > 0

  local close_indent = make_indent(state)

  local comma = pretty and ",\n" or ","

  local colon = pretty and ": " or ":"

  local open_brace = pretty and "{\n" or "{"

  local close_brace = pretty and ("\n" .. close_indent .. "}") or "}"

  local open_bracket = pretty and "[\n" or "["

  local close_bracket = pretty and ("\n" .. close_indent .. "]") or "]"

  -- Circular reference?

  if stack[val] then error("circular reference") end

  stack[val] = true

  if rawget(val, 1) ~= nil or next(val) == nil then

    -- Treat as array -- check keys are valid and it is not sparse

    local n = 0

    for k in pairs(val) do

      if type(k) ~= "number" then

        error("invalid table: mixed or invalid key types")

      end

      n = n + 1

    end

    if n ~= #val then

      error("invalid table: sparse array")

    end

    -- Encode

    for _, v in ipairs(val) do

      state.currentIndentLevel = state.currentIndentLevel + 1

      table.insert(res, make_indent(state) .. encode(v, state))

      state.currentIndentLevel = state.currentIndentLevel - 1

    end

    stack[val] = nil

    return open_bracket .. table.concat(res, comma) .. close_bracket

  else

    -- Treat as an object

    for k, v in pairs(val) do

      if type(k) ~= "string" then

        error("invalid table: mixed or invalid key types")

      end

      state.currentIndentLevel = state.currentIndentLevel + 1

      table.insert(res, make_indent(state) .. encode(k, state) .. colon .. encode(v, state))

      state.currentIndentLevel = state.currentIndentLevel - 1

    end

    stack[val] = nil

    return open_brace .. table.concat(res, comma) .. close_brace

  end

end

local function encode_string(val)

  return '"' .. val:gsub('[%z\1-\31\\"]', escape_char) .. '"'

end

local function encode_number(val)

  -- Check for NaN, -inf and inf

  if val ~= val or val <= -math.huge or val >= math.huge then

    error("unexpected number value '" .. tostring(val) .. "'")

  end

  return string.format("%.14g", val)

end

local type_func_map = {

  [ "nil"     ] = encode_nil,

  [ "table"   ] = encode_table,

  [ "string"  ] = encode_string,

  [ "number"  ] = encode_number,

  [ "boolean" ] = tostring,

}

encode = function(val, state)

  local t = type(val)

  local f = type_func_map[t]

  if f then

    return f(val, state)

  end

  error("unexpected type '" .. t .. "'")

end

function json.encode(val, indent)

  local state = {

    indent = indent or 0,

    currentIndentLevel = 0,

    stack = {}

}

  return encode(val, state)

end

-------------------------------------------------------------------------------

-- Decode

-------------------------------------------------------------------------------

local parse

local function create_set(...)

  local res = {}

  for i = 1, select("#", ...) do

    res[ select(i, ...) ] = true

  end

  return res

end

local space_chars   = create_set(" ", "\t", "\r", "\n")

local delim_chars   = create_set(" ", "\t", "\r", "\n", "]", "}", ",")

local escape_chars  = create_set("\\", "/", '"', "b", "f", "n", "r", "t", "u")

local literals      = create_set("true", "false", "null")

local literal_map = {

  [ "true"  ] = true,

  [ "false" ] = false,

  [ "null"  ] = nil,

}

local function next_char(str, idx, set, negate)

  for i = idx, #str do

    if set[str:sub(i, i)] ~= negate then

      return i

    end

  end

  return #str + 1

end

local function decode_error(str, idx, msg)

  local line_count = 1

  local col_count = 1

  for i = 1, idx - 1 do

    col_count = col_count + 1

    if str:sub(i, i) == "\n" then

      line_count = line_count + 1

      col_count = 1

    end

  end

  error( string.format("%s at line %d col %d", msg, line_count, col_count) )

end

local function codepoint_to_utf8(n)

  -- http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=iws-appendixa

  local f = math.floor

  if n <= 0x7f then

    return string.char(n)

  elseif n <= 0x7ff then

    return string.char(f(n / 64) + 192, n % 64 + 128)

  elseif n <= 0xffff then

    return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)

  elseif n <= 0x10ffff then

    return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128,

                       f(n % 4096 / 64) + 128, n % 64 + 128)

  end

  error( string.format("invalid unicode codepoint '%x'", n) )

end

local function parse_unicode_escape(s)

  local n1 = tonumber( s:sub(3, 6),  16 )

  local n2 = tonumber( s:sub(9, 12), 16 )

  -- Surrogate pair?

  if n2 then

    return codepoint_to_utf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)

  else

    return codepoint_to_utf8(n1)

  end

end

local function parse_string(str, i)

  local has_unicode_escape = false

  local has_surrogate_escape = false

  local has_escape = false

  local last

  for j = i + 1, #str do

    local x = str:byte(j)

    if x < 32 then

      decode_error(str, j, "control character in string")

    end

    if last == 92 then -- "\\" (escape char)

      if x == 117 then -- "u" (unicode escape sequence)

        local hex = str:sub(j + 1, j + 5)

        if not hex:find("%x%x%x%x") then

          decode_error(str, j, "invalid unicode escape in string")

        end

        if hex:find("^[dD][89aAbB]") then

          has_surrogate_escape = true

        else

          has_unicode_escape = true

        end

      else

        local c = string.char(x)

        if not escape_chars[c] then

          decode_error(str, j, "invalid escape char '" .. c .. "' in string")

        end

        has_escape = true

      end

      last = nil

    elseif x == 34 then -- '"' (end of string)

      local s = str:sub(i + 1, j - 1)

      if has_surrogate_escape then

        s = s:gsub("\\u[dD][89aAbB]..\\u....", parse_unicode_escape)

      end

      if has_unicode_escape then

        s = s:gsub("\\u....", parse_unicode_escape)

      end

      if has_escape then

        s = s:gsub("\\.", escape_char_map_inv)

      end

      return s, j + 1

    else

      last = x

    end

  end

  decode_error(str, i, "expected closing quote for string")

end

local function parse_number(str, i)

  local x = next_char(str, i, delim_chars)

  local s = str:sub(i, x - 1)

  local n = tonumber(s)

  if not n then

    decode_error(str, i, "invalid number '" .. s .. "'")

  end

  return n, x

end

local function parse_literal(str, i)

  local x = next_char(str, i, delim_chars)

  local word = str:sub(i, x - 1)

  if not literals[word] then

    decode_error(str, i, "invalid literal '" .. word .. "'")

  end

  return literal_map[word], x

end

local function parse_array(str, i)

  local res = {}

  local n = 1

  i = i + 1

  while 1 do

    local x

    i = next_char(str, i, space_chars, true)

    -- Empty / end of array?

    if str:sub(i, i) == "]" then

      i = i + 1

      break

    end

    -- Read token

    x, i = parse(str, i)

    res[n] = x

    n = n + 1

    -- Next token

    i = next_char(str, i, space_chars, true)

    local chr = str:sub(i, i)

    i = i + 1

    if chr == "]" then break end

    if chr ~= "," then decode_error(str, i, "expected ']' or ','") end

  end

  return res, i

end

local function parse_object(str, i)

  local res = {}

  i = i + 1

  while 1 do

    local key, val

    i = next_char(str, i, space_chars, true)

    -- Empty / end of object?

    if str:sub(i, i) == "}" then

      i = i + 1

      break

    end

    -- Read key

    if str:sub(i, i) ~= '"' then

      decode_error(str, i, "expected string for key")

    end

    key, i = parse(str, i)

    -- Read ':' delimiter

    i = next_char(str, i, space_chars, true)

    if str:sub(i, i) ~= ":" then

      decode_error(str, i, "expected ':' after key")

    end

    i = next_char(str, i + 1, space_chars, true)

    -- Read value

    val, i = parse(str, i)

    -- Set

    res[key] = val

    -- Next token

    i = next_char(str, i, space_chars, true)

    local chr = str:sub(i, i)

    i = i + 1

    if chr == "}" then break end

    if chr ~= "," then decode_error(str, i, "expected '}' or ','") end

  end

  return res, i

end

local char_func_map = {

  [ '"' ] = parse_string,

  [ "0" ] = parse_number,

  [ "1" ] = parse_number,

  [ "2" ] = parse_number,

  [ "3" ] = parse_number,

  [ "4" ] = parse_number,

  [ "5" ] = parse_number,

  [ "6" ] = parse_number,

  [ "7" ] = parse_number,

  [ "8" ] = parse_number,

  [ "9" ] = parse_number,

  [ "-" ] = parse_number,

  [ "t" ] = parse_literal,

  [ "f" ] = parse_literal,

  [ "n" ] = parse_literal,

  [ "[" ] = parse_array,

  [ "{" ] = parse_object,

}

parse = function(str, idx)

  local chr = str:sub(idx, idx)

  local f = char_func_map[chr]

  if f then

    return f(str, idx)

  end

  decode_error(str, idx, "unexpected character '" .. chr .. "'")

end

function json.decode(str)

  if type(str) ~= "string" then

    error("expected argument of type string, got " .. type(str))

  end

  local res, idx = parse(str, next_char(str, 1, space_chars, true))

  idx = next_char(str, idx, space_chars, true)

  if idx <= #str then

    decode_error(str, idx, "trailing garbage")

  end

  return res

end

```

---
# keyboard.lua

```lua

-- @docclass

g_keyboard = {}

-- private functions

function translateKeyCombo(keyCombo)

  if not keyCombo or #keyCombo == 0 then return nil end

  local keyComboDesc = ''

  for k,v in pairs(keyCombo) do

    local keyDesc = KeyCodeDescs[v]

    if keyDesc == nil then return nil end

    keyComboDesc = keyComboDesc .. '+' .. keyDesc

  end

  keyComboDesc = keyComboDesc:sub(2)

  return keyComboDesc

end

local function getKeyCode(key)

  for keyCode, keyDesc in pairs(KeyCodeDescs) do

    if keyDesc:lower() == key:trim():lower() then

      return keyCode

    end

  end

end

function retranslateKeyComboDesc(keyComboDesc)

  if keyComboDesc == nil then

    error('Unable to translate key combo \'' .. keyComboDesc .. '\'')

  end

  if type(keyComboDesc) == 'number' then

    keyComboDesc = tostring(keyComboDesc)

  end

  local keyCombo = {}

  for i,currentKeyDesc in ipairs(keyComboDesc:split('+')) do

    for keyCode, keyDesc in pairs(KeyCodeDescs) do

      if keyDesc:lower() == currentKeyDesc:trim():lower() then

        table.insert(keyCombo, keyCode)

      end

    end

  end

  return translateKeyCombo(keyCombo)

end

function determineKeyComboDesc(keyCode, keyboardModifiers)

  local keyCombo = {}

  if keyCode == KeyCtrl or keyCode == KeyShift or keyCode == KeyAlt then

    table.insert(keyCombo, keyCode)

  elseif KeyCodeDescs[keyCode] ~= nil then

    if keyboardModifiers == KeyboardCtrlModifier then

      table.insert(keyCombo, KeyCtrl)

    elseif keyboardModifiers == KeyboardAltModifier then

      table.insert(keyCombo, KeyAlt)

    elseif keyboardModifiers == KeyboardCtrlAltModifier then

      table.insert(keyCombo, KeyCtrl)

      table.insert(keyCombo, KeyAlt)

    elseif keyboardModifiers == KeyboardShiftModifier then

      table.insert(keyCombo, KeyShift)

    elseif keyboardModifiers == KeyboardCtrlShiftModifier then

      table.insert(keyCombo, KeyCtrl)

      table.insert(keyCombo, KeyShift)

    elseif keyboardModifiers == KeyboardAltShiftModifier then

      table.insert(keyCombo, KeyAlt)

      table.insert(keyCombo, KeyShift)

    elseif keyboardModifiers == KeyboardCtrlAltShiftModifier then

      table.insert(keyCombo, KeyCtrl)

      table.insert(keyCombo, KeyAlt)

      table.insert(keyCombo, KeyShift)

    end

    table.insert(keyCombo, keyCode)

  end

  return translateKeyCombo(keyCombo)

end

local function onWidgetKeyDown(widget, keyCode, keyboardModifiers)

  if keyCode == KeyUnknown then return false end

  local callback = widget.boundAloneKeyDownCombos[determineKeyComboDesc(keyCode, KeyboardNoModifier)]

  signalcall(callback, widget, keyCode)

  callback = widget.boundKeyDownCombos[determineKeyComboDesc(keyCode, keyboardModifiers)]

  return signalcall(callback, widget, keyCode)

end

local function onWidgetKeyUp(widget, keyCode, keyboardModifiers)

  if keyCode == KeyUnknown then return false end

  local callback = widget.boundAloneKeyUpCombos[determineKeyComboDesc(keyCode, KeyboardNoModifier)]

  signalcall(callback, widget, keyCode)

  callback = widget.boundKeyUpCombos[determineKeyComboDesc(keyCode, keyboardModifiers)]

  return signalcall(callback, widget, keyCode)

end

local function onWidgetKeyPress(widget, keyCode, keyboardModifiers, autoRepeatTicks)

  if keyCode == KeyUnknown then return false end

  local callback = widget.boundKeyPressCombos[determineKeyComboDesc(keyCode, keyboardModifiers)]

  return signalcall(callback, widget, keyCode, autoRepeatTicks)

end

local function connectKeyDownEvent(widget)

  if widget.boundKeyDownCombos then return end

  connect(widget, { onKeyDown = onWidgetKeyDown })

  widget.boundKeyDownCombos = {}

  widget.boundAloneKeyDownCombos = {}

end

local function connectKeyUpEvent(widget)

  if widget.boundKeyUpCombos then return end

  connect(widget, { onKeyUp = onWidgetKeyUp })

  widget.boundKeyUpCombos = {}

  widget.boundAloneKeyUpCombos = {}

end

local function connectKeyPressEvent(widget)

  if widget.boundKeyPressCombos then return end

  connect(widget, { onKeyPress = onWidgetKeyPress })

  widget.boundKeyPressCombos = {}

end

-- public functions

function g_keyboard.bindKeyDown(keyComboDesc, callback, widget, alone)

  widget = widget or rootWidget

  connectKeyDownEvent(widget)

  local keyComboDesc = retranslateKeyComboDesc(keyComboDesc)

  if alone then

    connect(widget.boundAloneKeyDownCombos, keyComboDesc, callback)

  else

    connect(widget.boundKeyDownCombos, keyComboDesc, callback)

  end

end

function g_keyboard.bindKeyUp(keyComboDesc, callback, widget, alone)

  widget = widget or rootWidget

  connectKeyUpEvent(widget)

  local keyComboDesc = retranslateKeyComboDesc(keyComboDesc)

  if alone then

    connect(widget.boundAloneKeyUpCombos, keyComboDesc, callback)

  else

    connect(widget.boundKeyUpCombos, keyComboDesc, callback)

  end

end

function g_keyboard.bindKeyPress(keyComboDesc, callback, widget)

  widget = widget or rootWidget

  connectKeyPressEvent(widget)

  local keyComboDesc = retranslateKeyComboDesc(keyComboDesc)

  connect(widget.boundKeyPressCombos, keyComboDesc, callback)

end

local function getUnbindArgs(arg1, arg2)

  local callback

  local widget

  if type(arg1) == 'function' then callback = arg1

  elseif type(arg2) == 'function' then callback = arg2 end

  if type(arg1) == 'userdata' then widget = arg1

  elseif type(arg2) == 'userdata' then widget = arg2 end

  widget = widget or rootWidget

  return callback, widget

end

function g_keyboard.unbindKeyDown(keyComboDesc, arg1, arg2)

  local callback, widget = getUnbindArgs(arg1, arg2)

  if widget.boundKeyDownCombos == nil then return end

  local keyComboDesc = retranslateKeyComboDesc(keyComboDesc)

  disconnect(widget.boundKeyDownCombos, keyComboDesc, callback)

end

function g_keyboard.unbindKeyUp(keyComboDesc, arg1, arg2)

  local callback, widget = getUnbindArgs(arg1, arg2)

  if widget.boundKeyUpCombos == nil then return end

  local keyComboDesc = retranslateKeyComboDesc(keyComboDesc)

  disconnect(widget.boundKeyUpCombos, keyComboDesc, callback)

end

function g_keyboard.unbindKeyPress(keyComboDesc, arg1, arg2)

  local callback, widget = getUnbindArgs(arg1, arg2)

  if widget.boundKeyPressCombos == nil then return end

  local keyComboDesc = retranslateKeyComboDesc(keyComboDesc)

  disconnect(widget.boundKeyPressCombos, keyComboDesc, callback)

end

function g_keyboard.getModifiers()

  return g_window.getKeyboardModifiers()

end

function g_keyboard.isKeyPressed(key)

  if type(key) == 'string' then

    key = getKeyCode(key)

  end

  return g_window.isKeyPressed(key)

end

function g_keyboard.areKeysPressed(keyComboDesc)

  for i,currentKeyDesc in ipairs(keyComboDesc:split('+')) do

    for keyCode, keyDesc in pairs(KeyCodeDescs) do

      if keyDesc:lower() == currentKeyDesc:trim():lower() then

        if keyDesc:lower() == "ctrl" then 

          if not g_keyboard.isCtrlPressed() then

            return false

          end

        elseif keyDesc:lower() == "shift" then 

          if not g_keyboard.isShiftPressed() then

            return false

          end              

        elseif keyDesc:lower() == "alt" then 

          if not g_keyboard.isAltPressed() then

            return false

          end              

        elseif not g_window.isKeyPressed(keyCode) then

          return false

        end

      end

    end

  end

  return true

end

function g_keyboard.isKeySetPressed(keys, all)

  all = all or false

  local result = {}

  for k,v in pairs(keys) do

    if type(v) == 'string' then

      v = getKeyCode(v)

    end

    if g_window.isKeyPressed(v) then

      if not all then

        return true

      end

      table.insert(result, true)

    end

  end

  return #result == #keys

end

function g_keyboard.isInUse()

  for i = FirstKey, LastKey do

    if g_window.isKeyPressed(key) then

      return true

    end

  end

  return false

end

function g_keyboard.isCtrlPressed()

  return bit32.band(g_window.getKeyboardModifiers(), KeyboardCtrlModifier) ~= 0

end

function g_keyboard.isAltPressed()

  return bit32.band(g_window.getKeyboardModifiers(), KeyboardAltModifier) ~= 0

end

function g_keyboard.isShiftPressed()

  return bit32.band(g_window.getKeyboardModifiers(), KeyboardShiftModifier) ~= 0

end

```

---
# math.lua

```lua

-- @docclass math

local U8  = 2^8

local U16 = 2^16

local U32 = 2^32

local U64 = 2^64

function math.round(num, idp)

  local mult = 10^(idp or 0)

  if num >= 0 then

    return math.floor(num * mult + 0.5) / mult

  else

    return math.ceil(num * mult - 0.5) / mult

  end

end

function math.isu8(num)

  return math.isinteger(num) and num >= 0 and num < U8

end

function math.isu16(num)

  return math.isinteger(num) and num >= U8 and num < U16

end

function math.isu32(num)

  return math.isinteger(num) and num >= U16 and num < U32

end

function math.isu64(num)

  return math.isinteger(num) and num >= U32 and num < U64

end

function math.isinteger(num)

  return ((type(num) == 'number') and (num == math.floor(num)))

end

```

---
# mouse.lua

```lua

-- @docclass

function g_mouse.bindAutoPress(widget, callback, delay, button)

  local button = button or MouseLeftButton

  connect(widget, { onMousePress = function(widget, mousePos, mouseButton)

    if mouseButton ~= button then

      return false

    end

    local startTime = g_clock.millis()

    callback(widget, mousePos, mouseButton, 0)

    periodicalEvent(function()

      callback(widget, g_window.getMousePosition(), mouseButton, g_clock.millis() - startTime)

    end, function()

      return g_mouse.isPressed(mouseButton)

    end, 30, delay)

    return true

  end })

end

function g_mouse.bindPressMove(widget, callback)

  connect(widget, { onMouseMove = function(widget, mousePos, mouseMoved)

    if widget:isPressed() then

      callback(mousePos, mouseMoved)

      return true

    end

  end })

end

function g_mouse.bindPress(widget, callback, button)

  connect(widget, { onMousePress = function(widget, mousePos, mouseButton)

    if not button or button == mouseButton then

      callback(mousePos, mouseButton)

      return true

    end

    return false

  end })

end

```

---
# net.lua

```lua

function translateNetworkError(errcode, connecting, errdesc)

  local text

  if errcode == 111 then

    text = tr('Connection refused, the server might be offline or restarting.\nPlease try again later.')

  elseif errcode == 110 then

    text = tr('Connection timed out. Either your network is failing or the server is offline.')

  elseif errcode == 1 then

    text = tr('Connection failed, the server address does not exist.')

  elseif connecting then

    text = tr('Connection failed.')

  else

    text = tr('Your connection has been lost.\nEither your network or the server went down.')

  end

  text = text .. ' ' .. tr('(ERROR %d)', errcode)

  return text

end

```

---
# orderedtable.lua

```lua

function __genOrderedIndex( t )

    local orderedIndex = {}

    for key in pairs(t) do

        table.insert( orderedIndex, key )

    end

    table.sort( orderedIndex )

    return orderedIndex

end

function orderedNext(t, state)

    -- Equivalent of the next function, but returns the keys in the alphabetic

    -- order. We use a temporary ordered key table that is stored in the

    -- table being iterated.

    local key = nil

    --print("orderedNext: state = "..tostring(state) )

    if state == nil then

        -- the first time, generate the index

        t.__orderedIndex = __genOrderedIndex( t )

        key = t.__orderedIndex[1]

    else

        -- fetch the next value

        for i = 1,table.getn(t.__orderedIndex) do

            if t.__orderedIndex[i] == state then

                key = t.__orderedIndex[i+1]

            end

        end

    end

    if key then

        return key, t[key]

    end

    -- no more value to return, cleanup

    t.__orderedIndex = nil

    return

end

function orderedPairs(t)

    -- Equivalent of the pairs() function on tables. Allows to iterate

    -- in order

    return orderedNext, t, nil

end

```

---
# outputmessage.lua

```lua

function OutputMessage:addData(data)

  if type(data) == 'boolean' then

    self:addU8(NetworkMessageTypes.Boolean)

    self:addU8(booleantonumber(data))

  elseif type(data) == 'number' then

    if math.isu8(data) then

      self:addU8(NetworkMessageTypes.U8)

      self:addU8(data)

    elseif math.isu16(data) then

      self:addU8(NetworkMessageTypes.U16)

      self:addU16(data)

    elseif math.isu32(data) then

      self:addU8(NetworkMessageTypes.U32)

      self:addU32(data)

    elseif math.isu64(data) then

      self:addU8(NetworkMessageTypes.U64)

      self:addU64(data)

    else -- negative or non integer numbers

      self:addU8(NetworkMessageTypes.NumberString)

      self:addString(tostring(data))

    end

  elseif type(data) == 'string' then

    self:addU8(NetworkMessageTypes.String)

    self:addString(data)

  elseif type(data) == 'table' then

    self:addU8(NetworkMessageTypes.Table)

    self:addTable(data)

  else

    perror('Invalid data type '  .. type(data))

  end

end

function OutputMessage:addTable(data)

  local size = 0

  -- reserve for size (should be addData, find a way to use it further)

  local sizePos = self:getWritePos()

  self:addU16(size)

  local sizeSize = self:getWritePos() - sizePos

  -- add values

  for key,value in pairs(data) do

    self:addData(key)

    self:addData(value)

    size = size + 1

  end

  -- write size

  local currentPos = self:getWritePos()

  self:setWritePos(sizePos)

  self:addU16(size)

  -- fix msg size and go back to end

  self:setMessageSize(self:getMessageSize() - sizeSize)

  self:setWritePos(currentPos)

end

function OutputMessage:addColor(color)

  self:addU8(color.r)

  self:addU8(color.g)

  self:addU8(color.b)

  self:addU8(color.a)

end

function OutputMessage:addPosition(position)

  self:addU16(position.x)

  self:addU16(position.y)

  self:addU8(position.z)

end

```

---
# settings.lua

```lua

g_settings = makesingleton(g_configs.getSettings())

-- Reserved for future functionality

```

---
# string.lua

```lua

-- @docclass string

function string:split(delim)

  local start = 1

  local results = {}

  while true do

    local pos = string.find(self, delim, start, true)

    if not pos then

      break

    end

    table.insert(results, string.sub(self, start, pos-1))

    start = pos + string.len(delim)

  end

  table.insert(results, string.sub(self, start))

  table.removevalue(results, '')

  return results

end

function string:starts(start)

  return string.sub(self, 1, #start) == start

end

function string:ends(test)

   return test =='' or string.sub(self,-string.len(test)) == test

end

function string:trim()

  return string.match(self, '^%s*(.*%S)') or ''

end

function string:explode(sep, limit)

  if type(sep) ~= 'string' or tostring(self):len() == 0 or sep:len() == 0 then

    return {}

  end

  local i, pos, tmp, t = 0, 1, "", {}

  for s, e in function() return string.find(self, sep, pos) end do

    tmp = self:sub(pos, s - 1):trim()

    table.insert(t, tmp)

    pos = e + 1

    i = i + 1

    if limit ~= nil and i == limit then

      break

    end

  end

  tmp = self:sub(pos):trim()

  table.insert(t, tmp)

  return t

end

function string:contains(str, checkCase, start, plain)

  if(not checkCase) then

    self = self:lower()

    str = str:lower()

  end

  return string.find(self, str, start and start or 1, plain == nil and true or false)

end

```

---
# struct.lua

```lua

Struct = {}

function Struct.pack(format, ...)

  local stream = {}

  local vars = {...}

  local endianness = true

  for i = 1, format:len() do

    local opt = format:sub(i, i)

    if opt == '>' then

      endianness = false

    elseif opt:find('[bBhHiIlL]') then

      local n = opt:find('[hH]') and 2 or opt:find('[iI]') and 4 or opt:find('[lL]') and 8 or 1

      local val = tonumber(table.remove(vars, 1))

      if val < 0 then

        val = val + 2 ^ (n * 8 - 1)

      end

      local bytes = {}

      for j = 1, n do

        table.insert(bytes, string.char(val % (2 ^ 8)))

        val = math.floor(val / (2 ^ 8))

      end

      if not endianness then

        table.insert(stream, string.reverse(table.concat(bytes)))

      else

        table.insert(stream, table.concat(bytes))

      end

    elseif opt:find('[fd]') then

      local val = tonumber(table.remove(vars, 1))

      local sign = 0

      if val < 0 then

        sign = 1 

        val = -val 

      end

      local mantissa, exponent = math.frexp(val)

      if val == 0 then

        mantissa = 0

        exponent = 0

      else

        mantissa = (mantissa * 2 - 1) * math.ldexp(0.5, (opt == 'd') and 53 or 24)

        exponent = exponent + ((opt == 'd') and 1022 or 126)

      end

      local bytes = {}

      if opt == 'd' then

        val = mantissa

        for i = 1, 6 do

          table.insert(bytes, string.char(math.floor(val) % (2 ^ 8)))

          val = math.floor(val / (2 ^ 8))

        end

      else

        table.insert(bytes, string.char(math.floor(mantissa) % (2 ^ 8)))

        val = math.floor(mantissa / (2 ^ 8))

        table.insert(bytes, string.char(math.floor(val) % (2 ^ 8)))

        val = math.floor(val / (2 ^ 8))

      end

      table.insert(bytes, string.char(math.floor(exponent * ((opt == 'd') and 16 or 128) + val) % (2 ^ 8)))

      val = math.floor((exponent * ((opt == 'd') and 16 or 128) + val) / (2 ^ 8))

      table.insert(bytes, string.char(math.floor(sign * 128 + val) % (2 ^ 8)))

      val = math.floor((sign * 128 + val) / (2 ^ 8))

      if not endianness then

        table.insert(stream, string.reverse(table.concat(bytes)))

      else

        table.insert(stream, table.concat(bytes))

      end

    elseif opt == 's' then

      table.insert(stream, tostring(table.remove(vars, 1)))

      table.insert(stream, string.char(0))

    elseif opt == 'c' then

      local n = format:sub(i + 1):match('%d+')

      local length = tonumber(n)

      if length > 0 then

        local str = tostring(table.remove(vars, 1))

        if length - str:len() > 0 then

          str = str .. string.rep(' ', length - str:len())

        end

        table.insert(stream, str:sub(1, length))

      end

      i = i + n:len()

    end

  end

  return table.concat(stream)

end

function Struct.unpack(format, stream)

  local vars = {}

  local iterator = 1

  local endianness = true

  for i = 1, format:len() do

    local opt = format:sub(i, i)

    if opt == '>' then

      endianness = false

    elseif opt:find('[bBhHiIlL]') then

      local n = opt:find('[hH]') and 2 or opt:find('[iI]') and 4 or opt:find('[lL]') and 8 or 1

      local signed = opt:lower() == opt

      local val = 0

      for j = 1, n do

        local byte = string.byte(stream:sub(iterator, iterator))

        if endianness then

          val = val + byte * (2 ^ ((j - 1) * 8))

        else

          val = val + byte * (2 ^ ((n - j) * 8))

        end

        iterator = iterator + 1

      end

      if signed then

        val = val - 2 ^ (n * 8 - 1)

      end

      table.insert(vars, val)

    elseif opt:find('[fd]') then

      local n = (opt == 'd') and 8 or 4

      local x = stream:sub(iterator, iterator + n - 1)

      iterator = iterator + n

      if not endianness then

        x = string.reverse(x)

      end

      local sign = 1

      local mantissa = string.byte(x, (opt == 'd') and 7 or 3) % ((opt == 'd') and 16 or 128)

      for i = n - 2, 1, -1 do

        mantissa = mantissa * (2 ^ 8) + string.byte(x, i)

      end

      if string.byte(x, n) > 127 then

        sign = -1

      end

      local exponent = (string.byte(x, n) % 128) * ((opt == 'd') and 16 or 2) + math.floor(string.byte(x, n - 1) / ((opt == 'd') and 16 or 128))

      if exponent == 0 then

        table.insert(vars, 0.0)

      else

        mantissa = (math.ldexp(mantissa, (opt == 'd') and -52 or -23) + 1) * sign

        table.insert(vars, math.ldexp(mantissa, exponent - ((opt == 'd') and 1023 or 127)))

      end

    elseif opt == 's' then

      local bytes = {}

      for j = iterator, stream:len() do

        if stream:sub(j, j) == string.char(0) then

          break

        end

        table.insert(bytes, stream:sub(j, j))

      end

      local str = table.concat(bytes)

      iterator = iterator + str:len() + 1

      table.insert(vars, str)

    elseif opt == 'c' then

      local n = format:sub(i + 1):match('%d+')

      table.insert(vars, stream:sub(iterator, iterator + tonumber(n)))

      iterator = iterator + tonumber(n)

      i = i + n:len()

    end

  end

  return unpack(vars)

end

```

---
# table.lua

```lua

-- @docclass table

function table.dump(t, depth)

  if not depth then depth = 0 end

  for k,v in pairs(t) do

    str = (' '):rep(depth * 2) .. k .. ': '

    if type(v) ~= "table" then

      print(str .. tostring(v))

    else

      print(str)

      table.dump(v, depth+1)

    end

  end

end

function table.clear(t)

  for k,v in pairs(t) do

    t[k] = nil

  end

end

function table.copy(t)

  local res = {}

  for k,v in pairs(t) do

    res[k] = v

  end

  return res

end

function table.recursivecopy(t)

  local res = {}

  for k,v in pairs(t) do

    if type(v) == "table" then

      res[k] = table.recursivecopy(v)

    else

      res[k] = v

    end

  end

  return res

end

function table.selectivecopy(t, keys)

  local res = { }

  for i,v in ipairs(keys) do

    res[v] = t[v]

  end

  return res

end

function table.merge(t, src)

  for k,v in pairs(src) do

    t[k] = v

  end

end

function table.find(t, value, lowercase)

  for k,v in pairs(t) do

    if lowercase and type(value) == 'string' and type(v) == 'string' then

      if v:lower() == value:lower() then return k end

    end

    if v == value then return k end

  end

end

function table.findbykey(t, key, lowercase)

  for k,v in pairs(t) do

    if lowercase and type(key) == 'string' and type(k) == 'string' then

      if k:lower() == key:lower() then return v end

    end

    if k == key then return v end

  end

end

function table.contains(t, value, lowercase)

  return table.find(t, value, lowercase) ~= nil

end

function table.findkey(t, key)

  if t and type(t) == 'table' then

    for k,v in pairs(t) do

      if k == key then return k end

    end

  end

end

function table.haskey(t, key)

  return table.findkey(t, key) ~= nil

end

function table.removevalue(t, value)

  for k,v in pairs(t) do

    if v == value then

      table.remove(t, k)

      return true

    end

  end

  return false

end

function table.popvalue(value)

  local index = nil

  for k,v in pairs(t) do

    if v == value or not value then

      index = k

    end

  end

  if index then

    table.remove(t, index)

    return true

  end

  return false

end

function table.compare(t, other)

  if #t ~= #other then return false end

  for k,v in pairs(t) do

    if v ~= other[k] then return false end

  end

  return true

end

function table.empty(t)

  if t and type(t) == 'table' then

    return next(t) == nil

  end

  return true

end

function table.permute(t, n, count)

  n = n or #t

  for i=1,count or n do

    local j = math.random(i, n)

    t[i], t[j] = t[j], t[i]

  end

  return t

end

function table.findbyfield(t, fieldname, fieldvalue)

  for _i,subt in pairs(t) do

    if subt[fieldname] == fieldvalue then

      return subt

    end

  end

  return nil

end

function table.size(t)

  local size = 0

  for i, n in pairs(t) do

    size = size + 1

  end

  return size

end

function table.tostring(t)

  local maxn = #t

  local str = ""

  for k,v in pairs(t) do

    v = tostring(v)

    if k == maxn and k ~= 1 then

      str = str .. " and " .. v

    elseif maxn > 1 and k ~= 1 then

      str = str .. ", " .. v

    else

      str = str .. " " .. v

    end

  end

  return str

end

function table.collect(t, func)

  local res = {}

  for k,v in pairs(t) do

    local a,b = func(k,v)

    if a and b then

      res[a] = b

    elseif a ~= nil then

      table.insert(res,a)

    end

  end

  return res

end

function table.equals(t, comp)

  if type(t) == "table" and type(comp) == "table" then

    for k,v in pairs(t) do

      if v ~= comp[k] then return false end

    end

  end

  return true

end

function table.equal(t1,t2,ignore_mt)

   local ty1 = type(t1)

   local ty2 = type(t2)

   if ty1 ~= ty2 then return false end

   -- non-table types can be directly compared

   if ty1 ~= 'table' and ty2 ~= 'table' then return t1 == t2 end

   -- as well as tables which have the metamethod __eq

   local mt = getmetatable(t1)

   if not ignore_mt and mt and mt.__eq then return t1 == t2 end

   for k1,v1 in pairs(t1) do

      local v2 = t2[k1]

      if v2 == nil or not table.equal(v1,v2) then return false end

   end

   for k2,v2 in pairs(t2) do

      local v1 = t1[k2]

      if v1 == nil or not table.equal(v1,v2) then return false end

   end

   return true

end

function table.isList(t)

  local size = #t

  return table.size(t) == size and size > 0

end

function table.isStringList(t)

  if not table.isList(t) then return false end

  for k,v in ipairs(t) do

    if type(v) ~= 'string' then

      return false

    end

  end

  return true

end

function table.isStringPairList(t)

  if not table.isList(t) then return false end

  for k,v in ipairs(t) do

    if type(v) ~= 'table' or #v ~= 2 or type(v[1]) ~= 'string' or type(v[2]) ~= 'string' then

      return false

    end

  end

  return true

end

function table.encodeStringPairList(t)

  local ret = ""

  for k,v in ipairs(t) do

    if v[2]:find("\n") then

      ret = ret .. v[1] .. ":[[\n" .. v[2] .. "\n]]\n"

    else

      ret = ret .. v[1] .. ":" .. v[2] .. "\n"

    end

  end

  return ret

end

function table.decodeStringPairList(l)

  local ret = {}

  local r = regexMatch(l, "(?:^|\\n)([^:^\n]{1,20}):?(.*)(?:$|\\n)")

  local multiline = ""

  local multilineKey = ""

  local multilineActive = false

  for k,v in ipairs(r) do

    if multilineActive then

      local endPos = v[1]:find("%]%]")

      if endPos then

        if endPos > 1 then

          table.insert(ret, {multilineKey, multiline .. "\n" .. v[1]:sub(1, endPos - 1)})       

        else

          table.insert(ret, {multilineKey, multiline})       

        end

        multilineActive = false

        multiline = ""

        multilineKey = ""

      else

        if multiline:len() == 0 then

          multiline = v[1]

        else

          multiline = multiline .. "\n" .. v[1]        

        end

      end

    else

      local bracketPos = v[3]:find("%[%[")

      if bracketPos == 1 then -- multiline begin

        multiline = v[3]:sub(bracketPos + 2)

        multilineActive = true

        multilineKey = v[2]

      elseif v[2]:len() > 0 and v[3]:len() > 0 then

        table.insert(ret, {v[2], v[3]})

      end

    end    

  end

  return ret

end

```

---
# test.lua

```lua

Test = {

    tests = {},

    activeTest = 0,

    screenShot = 1    

}

Test.Test = function(name, func)

    local testId = #Test.tests + 1

    Test.tests[testId] = {

        name = name,

        actions = {},

        delay = 0,

        start = 0

}

    local test = function(testFunc)

        table.insert(Test.tests[testId].actions, {type = "test", value = testFunc})

    end

    local wait = function(millis)

        Test.tests[testId].delay = Test.tests[testId].delay + millis

        table.insert(Test.tests[testId].actions, {type = "wait", value = Test.tests[testId].delay})

    end

    local ss = function()

        table.insert(Test.tests[testId].actions, {type = "screenshot"})

    end

    local fail = function(message)

        g_logger.fatal("Test " .. name .. " failed: " .. message)

    end

    func(test, wait, ss, fail)

end

Test.run = function()

    if Test.activeTest > #Test.tests then

        g_logger.info("[TEST] Finished tests. Exiting...")

        return g_app.exit()

    end

    local test = Test.tests[Test.activeTest]

    if not test or #test.actions == 0 then

        Test.activeTest = Test.activeTest + 1

        local nextTest = Test.tests[Test.activeTest]

        if nextTest then

            nextTest.start = g_clock.millis()

            g_logger.info("[TEST] Starting test: " .. nextTest.name)

        end

        return scheduleEvent(Test.run, 500)

    end

    local action = test.actions[1]

    if action.type == "test" then

        table.remove(test.actions, 1)        

        action.value()

    elseif action.type == "screenshot" then

        table.remove(test.actions, 1)        

        g_app.doScreenshot(Test.screenShot .. ".png")

        Test.screenShot = Test.screenShot + 1

    elseif action.type == "wait" then

        if action.value + test.start < g_clock.millis() then

            table.remove(test.actions, 1)        

        end

    end

    scheduleEvent(Test.run, 100)

end

```

---
# util.lua

```lua

-- @docfuncs @{

function print(...)

  local msg = ""

  local args = {...}

  local appendSpace = #args > 1

  for i,v in ipairs(args) do

    msg = msg .. tostring(v)

    if appendSpace and i < #args then

      msg = msg .. '    '

    end

  end

  g_logger.log(LogInfo, msg)

end

function pinfo(msg)

  g_logger.log(LogInfo, msg)

end

function perror(msg)

  g_logger.log(LogError, msg)

end

function pwarning(msg)

  g_logger.log(LogWarning, msg)

end

function pdebug(msg)

  g_logger.log(LogDebug, msg)

end

function fatal(msg)

  g_logger.log(LogFatal, msg)

end

function exit()

  g_app.exit()

end

function quit()

  g_app.exit()

end

function connect(object, arg1, arg2, arg3)

  local signalsAndSlots

  local pushFront

  if type(arg1) == 'string' then

    signalsAndSlots = { [arg1] = arg2 }

    pushFront = arg3

  else

    signalsAndSlots = arg1

    pushFront = arg2

  end

  for signal,slot in pairs(signalsAndSlots) do

    if not object[signal] then

      local mt = getmetatable(object)

      if mt and type(object) == 'userdata' then

        object[signal] = function(...)

          return signalcall(mt[signal], ...)

        end

      end

    end

    if not object[signal] then

      object[signal] = slot

    elseif type(object[signal]) == 'function' then

      object[signal] = { object[signal] }

    end

    if type(slot) ~= 'function' then

      perror(debug.traceback('unable to connect a non function value'))

    end

    if type(object[signal]) == 'table' then

      if pushFront then

        table.insert(object[signal], 1, slot)

      else

        table.insert(object[signal], #object[signal]+1, slot)

      end

    end

  end

end

function disconnect(object, arg1, arg2)

  local signalsAndSlots

  if type(arg1) == 'string' then

    if arg2 == nil then

      object[arg1] = nil

      return

    end

    signalsAndSlots = { [arg1] = arg2 }

  elseif type(arg1) == 'table' then

    signalsAndSlots = arg1

  else

    perror(debug.traceback('unable to disconnect'))

  end

  for signal,slot in pairs(signalsAndSlots) do

    if not object[signal] then

    elseif type(object[signal]) == 'function' then

      if object[signal] == slot then

        object[signal] = nil

      end

    elseif type(object[signal]) == 'table' then

      for k,func in pairs(object[signal]) do

        if func == slot then

          table.remove(object[signal], k)

          if #object[signal] == 1 then

            object[signal] = object[signal][1]

          end

          break

        end

      end

    end

  end

end

function newclass(name)

  if not name then

    perror(debug.traceback('new class has no name.'))

  end

  local class = {}

  function class.internalCreate()

    local instance = {}

    for k,v in pairs(class) do

      instance[k] = v

    end

    return instance

  end

  class.create = class.internalCreate

  class.__class = name

  class.getClassName = function() return name end

  return class

end

function extends(base, name)

  if not name then

    perror(debug.traceback('extended class has no name.'))

  end

  local derived = {}

  function derived.internalCreate()

    local instance = base.create()

    for k,v in pairs(derived) do

      instance[k] = v

    end

    return instance

  end

  derived.create = derived.internalCreate

  derived.__class = name

  derived.getClassName = function() return name end

  return derived

end

function runinsandbox(func, ...)

  if type(func) == 'string' then

    func, err = loadfile(resolvepath(func, 2))

    if not func then

      error(err)

    end

  end

  local env = { }

  local oldenv = getfenv(0)

  setmetatable(env, { __index = oldenv } )

  setfenv(0, env)

  func(...)

  setfenv(0, oldenv)

  return env

end

function loadasmodule(name, file)

  file = file or resolvepath(name, 2)

  if package.loaded[name] then

    return package.loaded[name]

  end

  local env = runinsandbox(file)

  package.loaded[name] = env

  return env

end

local function module_loader(modname)

  local module = g_modules.getModule(modname)

  if not module then

    return '\n\tno module \'' .. modname .. '\''

  end

  return function()

    if not module:load() then

      error('unable to load required module ' .. modname)

    end

    return module:getSandbox()

  end

end

table.insert(package.loaders, 1, module_loader)

function import(table)

  assert(type(table) == 'table')

  local env = getfenv(2)

  for k,v in pairs(table) do

    env[k] = v

  end

end

function export(what, key)

  if key ~= nil then

    _G[key] = what

  else

    for k,v in pairs(what) do

      _G[k] = v

    end

  end

end

function unexport(key)

  if type(key) == 'table' then

    for _k,v in pairs(key) do

      _G[v] = nil

    end

  else

    _G[key] = nil

  end

end

function getfsrcpath(depth)

  depth = depth or 2

  local info = debug.getinfo(1+depth, "Sn")

  local path

  if info.short_src then

    path = info.short_src:match("(.*)/.*")

  end

  if not path then

    path = '/'

  elseif path:sub(0, 1) ~= '/' then

    path = '/' .. path

  end

  return path

end

function resolvepath(filePath, depth)

  if not filePath then return nil end

  depth = depth or 1

  if filePath then

    if filePath:sub(0, 1) ~= '/' then

      local basepath = getfsrcpath(depth+1)

      if basepath:sub(#basepath) ~= '/' then basepath = basepath .. '/' end

      return  basepath .. filePath

    else

      return filePath

    end

  else

    local basepath = getfsrcpath(depth+1)

    if basepath:sub(#basepath) ~= '/' then basepath = basepath .. '/' end

    return basepath

  end

end

function toboolean(v)

  if type(v) == 'string' then

    v = v:trim():lower()

    if v == '1' or v == 'true' then

      return true

    end

  elseif type(v) == 'number' then

    if v == 1 then

      return true

    end

  elseif type(v) == 'boolean' then

    return v

  end

  return false

end

function fromboolean(boolean)

  if boolean then

    return 'true'

  else

    return 'false'

  end

end

function booleantonumber(boolean)

  if boolean then

    return 1

  else

    return 0

  end

end

function numbertoboolean(number)

  if number ~= 0 then

    return true

  else

    return false

  end

end

function protectedcall(func, ...)

  local status, ret = pcall(func, ...)

  if status then

    return ret

  end

  perror(ret)

  return false

end

function signalcall(param, ...)

  if type(param) == 'function' then

    local status, ret = pcall(param, ...)

    if status then

      return ret

    else

      perror(ret)

    end

  elseif type(param) == 'table' then

    for k,v in pairs(param) do

      local status, ret = pcall(v, ...)

      if status then

        if ret then return true end

      else

        perror(ret)

      end

    end

  elseif param ~= nil then

    error('attempt to call a non function value')

  end

  return false

end

function tr(s, ...)

  return string.format(s, ...)

end

function getOppositeAnchor(anchor)

  if anchor == AnchorLeft then

    return AnchorRight

  elseif anchor == AnchorRight then

    return AnchorLeft

  elseif anchor == AnchorTop then

    return AnchorBottom

  elseif anchor == AnchorBottom then

    return AnchorTop

  elseif anchor == AnchorVerticalCenter then

    return AnchorHorizontalCenter

  elseif anchor == AnchorHorizontalCenter then

    return AnchorVerticalCenter

  end

  return anchor

end

function makesingleton(obj)

  local singleton = {}

  if obj.getClassName then

    for key,value in pairs(_G[obj:getClassName()]) do

      if type(value) == 'function' then

        singleton[key] = function(...) return value(obj, ...) end

      end

    end

  end

  return singleton

end

function comma_value(amount)

  local formatted = amount

  while true do  

    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')

    if (k==0) then

      break

    end

  end

  return formatted

end

-- @}

```

---
