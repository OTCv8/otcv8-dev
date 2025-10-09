# Source: luafunctions_client.cpp
This guide covers global objects and functions available in the OTClient Lua environment. It’s intended to help scripters understand and use the client-side Lua API effectively.

---
# [Knowledge Base] OTClient Core Lua Functions (luafunctions_client.cpp)
This document provides a detailed overview of the core Lua functions, classes, and global managers registered in `luafunctions_client.cpp`. These functions are fundamental for controlling the client's behavior, managing the user interface, and handling events.

---
# **1. Core Globals & Managers**
These singleton objects provide access to the main components of the client application.
# **Client (`g_client`)**
The central object for managing the client's state.
```lua
-- Versioning and Info
g_client:getEngine()           -- Returns the engine name (e.g., "OTClientV8")
g_client:getVersion()          -- Returns the client version string
g_client:getBuildCompiler()    -- Returns the compiler used for the build
g_client:getBuildDate()        -- Returns the build date
g_client:getBuildType()        -- Returns the build type (e.g., "Release")
g_client:getArch()             -- Returns the architecture (e.g., "x86_64")

-- Functionality
g_client:exit()                -- Exits the client application
g_client:forceExit()           -- Forces the client to exit immediately
g_client:setGraphicsEngine(engine) -- Sets the graphics engine ("opengl", "directx")
g_client:getGraphicsEngine()   -- Gets the current graphics engine
g_client:getMousePosition()    -- Returns the current mouse position as a Point
g_client:getDisplaySize()      -- Returns the display size as a Size
g_client:getFps()              -- Returns the current frames per second
g_client:getUps()              -- Returns the current updates per second
g_client:getMemoryUsage()      -- Returns memory usage in kilobytes
g_client:setFramerateLimit(limit) -- Sets the FPS limit
```
# **Window (`g_window`)**
Manages the application window.
```lua
g_window:setTitle(title)       -- Sets the window title
g_window:setSize(size)         -- Sets the window size
g_window:hide()                -- Hides the window
g_window:show()                -- Shows the window
g_window:maximize()            -- Maximizes the window
g_window:poll()                -- Polls for window events
g_window:setIcon(path)         -- Sets the window icon
g_window:setMinimumSize(size)  -- Sets the minimum window size
g_window:getDisplaySize()      -- Returns the size of the display/monitor
g_window:getPlatform()         -- Returns the OS platform (e.g., "windows", "linux")
g_window:isMaximized()         -- Checks if the window is maximized
g_window:isVisible()           -- Checks if the window is visible
```
# **Application (`g_app`)**
Handles application-level properties and data storage.
```lua
g_app:setName(name)            -- Sets the application name
g_app:setCompactName(name)     -- Sets a compact name for the app
g_app:setVersion(version)      -- Sets the app version string
g_app:getCompactName()         -- Gets the compact app name
g_app:getName()                -- Gets the app name
g_app:getVersion()             -- Gets the app version
g_app:getBuildVersion()        -- Gets the build version
g_app:getOs()                  -- Returns the operating system
g_app:setDataDirectory(dir)    -- Sets the data directory
g_app:getSettings()            -- Returns a table with application settings
g_app:loadSettings()           -- Loads settings from the config file
g_app:saveSettings()           -- Saves settings to the config file
```
# **Resource Manager (`g_resources`)**
Manages loading and accessing game assets.
```lua
g_resources:addSearchPath(path, prepend) -- Adds a directory to the asset search path
g_resources:removeSearchPath(path)   -- Removes a directory from the search path
g_resources:getBaseDir()         -- Gets the base application directory
g_resources:getWorkDir()         -- Gets the working directory
g_resources:fileExists(path)     -- Checks if a file exists in the search paths
g_resources:readFile(path)       -- Reads the content of a file
g_resources:writeFile(path, content) -- Writes content to a file
g_resources:makeDir(path)        -- Creates a directory
```
# **Sound Manager (`g_sounds`)**
Controls audio playback.
```lua
g_sounds:play(filename, volume)   -- Plays a sound file
g_sounds:playMusic(filename, volume) -- Plays a music file (streams it)
g_sounds:stopMusic()              -- Stops the currently playing music
g_sounds:setVolume(volume)        -- Sets the master audio volume (0.0 - 1.0)
```
# **Input (`g_keyboard`, `g_mouse`)**
Handles keyboard and mouse input.
```lua
-- Keyboard
g_keyboard:getModifiers()          -- Returns a string with active modifiers ("shift", "ctrl", "alt")
g_keyboard:setRepeatDelay(delay)   -- Sets the key repeat delay
g_keyboard:setRepeatInterval(interval) -- Sets the key repeat interval
```
---

# **1. Core Globals & Managers**
These singleton objects provide access to the main components of the client application.
# **Client (`g_client`)**
The central object for managing the client's state.
```lua
-- Versioning and Info
g_client:getEngine()           -- Returns the engine name (e.g., "OTClientV8")
g_client:getVersion()          -- Returns the client version string
g_client:getBuildCompiler()    -- Returns the compiler used for the build
g_client:getBuildDate()        -- Returns the build date
g_client:getBuildType()        -- Returns the build type (e.g., "Release")
g_client:getArch()             -- Returns the architecture (e.g., "x86_64")

-- Functionality
g_client:exit()                -- Exits the client application
g_client:forceExit()           -- Forces the client to exit immediately
g_client:setGraphicsEngine(engine) -- Sets the graphics engine ("opengl", "directx")
g_client:getGraphicsEngine()   -- Gets the current graphics engine
g_client:getMousePosition()    -- Returns the current mouse position as a Point
g_client:getDisplaySize()      -- Returns the display size as a Size
g_client:getFps()              -- Returns the current frames per second
g_client:getUps()              -- Returns the current updates per second
g_client:getMemoryUsage()      -- Returns memory usage in kilobytes
g_client:setFramerateLimit(limit) -- Sets the FPS limit
```
# **Window (`g_window`)**
Manages the application window.
```lua
g_window:setTitle(title)       -- Sets the window title
g_window:setSize(size)         -- Sets the window size
g_window:hide()                -- Hides the window
g_window:show()                -- Shows the window
g_window:maximize()            -- Maximizes the window
g_window:poll()                -- Polls for window events
g_window:setIcon(path)         -- Sets the window icon
g_window:setMinimumSize(size)  -- Sets the minimum window size
g_window:getDisplaySize()      -- Returns the size of the display/monitor
g_window:getPlatform()         -- Returns the OS platform (e.g., "windows", "linux")
g_window:isMaximized()         -- Checks if the window is maximized
g_window:isVisible()           -- Checks if the window is visible
```
# **Application (`g_app`)**
Handles application-level properties and data storage.
```lua
g_app:setName(name)            -- Sets the application name
g_app:setCompactName(name)     -- Sets a compact name for the app
g_app:setVersion(version)      -- Sets the app version string
g_app:getCompactName()         -- Gets the compact app name
g_app:getName()                -- Gets the app name
g_app:getVersion()             -- Gets the app version
g_app:getBuildVersion()        -- Gets the build version
g_app:getOs()                  -- Returns the operating system
g_app:setDataDirectory(dir)    -- Sets the data directory
g_app:getSettings()            -- Returns a table with application settings
g_app:loadSettings()           -- Loads settings from the config file
g_app:saveSettings()           -- Saves settings to the config file
```
# **Resource Manager (`g_resources`)**
Manages loading and accessing game assets.
```lua
g_resources:addSearchPath(path, prepend) -- Adds a directory to the asset search path
g_resources:removeSearchPath(path)   -- Removes a directory from the search path
g_resources:getBaseDir()         -- Gets the base application directory
g_resources:getWorkDir()         -- Gets the working directory
g_resources:fileExists(path)     -- Checks if a file exists in the search paths
g_resources:readFile(path)       -- Reads the content of a file
g_resources:writeFile(path, content) -- Writes content to a file
g_resources:makeDir(path)        -- Creates a directory
```
# **Sound Manager (`g_sounds`)**
Controls audio playback.
```lua
g_sounds:play(filename, volume)   -- Plays a sound file
g_sounds:playMusic(filename, volume) -- Plays a music file (streams it)
g_sounds:stopMusic()              -- Stops the currently playing music
g_sounds:setVolume(volume)        -- Sets the master audio volume (0.0 - 1.0)
```
# **Input (`g_keyboard`, `g_mouse`)**
Handles keyboard and mouse input.
```lua
-- Keyboard
g_keyboard:getModifiers()          -- Returns a string with active modifiers ("shift", "ctrl", "alt")
g_keyboard:setRepeatDelay(delay)   -- Sets the key repeat delay
g_keyboard:setRepeatInterval(interval) -- Sets the key repeat interval

-- Mouse
g_mouse:setCursor(cursorName)      -- Sets the mouse cursor from a predefined list
g_mouse:resetCursor()              -- Resets the mouse cursor to default
g_mouse:isPressed(button)          -- Checks if a mouse button is pressed
```
# **Other Managers**
- **`g_logger`**: For logging messages (`log`, `info`, `warning`, `error`, `fatal`).
- **`g_clock`**: Provides access to time (`millis`, `micros`, `seconds`).
- **`g_http`**: For making HTTP requests (`get`, `post`, `download`).
- **`g_crypt`**: For encryption and hashing (`sha1`, `sha256`, `sha512`, `rsaSetPublicKey`).
- **`g_translator`**: For localization (`tr`, `plural`).
- **`g_clipboard`**: To interact with the system clipboard (`setText`, `getText`).

---
# **2. Global Functions & Event System**
These functions are available globally and are essential for scheduling, event handling, and utility tasks.
# **Event Scheduling**
```lua
schedule(event, delay)         -- Schedules a function to run after a delay (in milliseconds)
scheduleEvent(event, delay)    -- Same as schedule()
removeEvent(eventId)           -- Removes a scheduled event by its ID
removeEvents(func)             -- Removes all events associated with a specific function
delay(ms, func)                -- Creates a function that, when called, will execute 'func' after a delay
```
# **Event Connection (Signals & Slots)**
This system allows you to connect functions (slots) to signals emitted by UI widgets and other objects.
```lua
connect(object, signals, handler) -- Connects a handler function to a signal
disconnect(object, signals)     -- Disconnects all handlers from a signal
signalcall(signal, object, ...) -- Manually triggers a signal on an object
```
**Example:**
`connect(myButton, { onClick = myClickHandler } )`
# **Utility Functions**
```lua
log(level, ...)            -- Logs a message with a specific level
error(message, level)      -- Throws a Lua error
dofile(path, safe)         -- Executes a Lua file
loadfile(path, safe)       -- Loads a Lua file without executing it
tostring(...)              -- Converts arguments to a string
tonumber(value, base)      -- Converts a value to a number
ipairs(table)              -- Iterator for numeric table indices
pairs(table)               -- Iterator for all table key-value pairs
pcall(func, ...)           -- Calls a function in protected mode
```

---
# **3. UI Widget Classes**
This is the core of the OTClient UI framework. All UI elements are widgets.
# **Base Class: `UIWidget`**
The foundation for all other UI components. Contains properties for position, size, visibility, and more.
```lua
-- Common Properties (can be set/get)
widget:setId(id)
widget:setParent(parent)
widget:setPos(point or {x, y})
widget:setRect(rect or {x, y, width, height})
widget:setSize(size)
widget:setColor(color)
widget:setOpacity(opacity)
widget:setVisible(visible)
widget:setEnabled(enabled)
widget:setFocusable(focusable)
widget:setFont(fontName)
widget:setText(text) -- Many widgets have this
widget:setTooltip(tooltip)

-- Common Methods
widget:getParent()
widget:getChildren()
widget:getChildById(id)
widget:focus()
widget:hide()
widget:show()
widget:destroy()
widget:fill(parent) -- Makes the widget fill its parent
widget:centerIn(parent) -- Centers the widget in its parent
widget:getStyle() -- Gets the style table
widget:addStyle(style) -- Adds a style
widget:clearStyle() -- Clears the style
```
# **Layouts**
Layouts are containers that automatically arrange their child widgets.
- **`UILayout`**: Base layout class.
- **`UIAnchorLayout`**: Arranges children based on anchors (e.g., `top`, `bottom`, `left`, `right`, `horizontalCenter`, `verticalCenter`). This is the most flexible and commonly used layout.
- **`UIBoxLayout`**: Arranges children in a horizontal (`Horizontal`) or vertical (`Vertical`) line.
- **`UIGridLayout`**: Arranges children in a grid.
# **Basic Widgets**
- **`UILabel`**: Displays simple, single-line text.
- **`UIMultilineLabel`**: Displays multi-line text.
- **`UIButton`**: A clickable button, often with text or an icon. Emits `onClick`.
- **`UIImage`**: Displays an image from a source file.
- **`UITextEdit`**: An input field for the user to type text. Emits `onTextChange`.
- **`UICheckBox`**: A standard checkbox. Emits `onCheckChange`.
- **`UIProgressBar`**: A progress bar.
# **Complex Widgets**
- **`UIWindow`**: A draggable window with a title bar, content area, and optional buttons.
- **`UIComboBox`**: A dropdown menu for selecting one option from a list. Emits `onOptionChange`.
- **`UIMenu` / `UIMenuBar`**: For creating context menus or top application menus.
- **`UIMovie`**: Displays animated sprites (`.spr`) or GIFs.
- **`UIClipping`**: A widget that clips its children to its own rectangular area.
# **Graphics Primitives**
These are not widgets but are used extensively to define widget properties.
- **`Rect`**: Defines a rectangle (`x`, `y`, `width`, `height`).
- **`Size`**: Defines a size (`width`, `height`).
- **`Point`**: Defines a coordinate (`x`, `y`).
- **`Color`**: Defines a color (e.g., `Color.red`, `Color.white`, or `Color.fromHex('#FF0000')`).
- **`Font`**: Represents a font asset.
- **`Image`**: Represents an image asset.

---

```





