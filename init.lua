-- CONFIG
APP_NAME = "otclientv8"  -- important, change it, it's name for config dir and files in appdata
APP_VERSION = 1341       -- client version for updater and login to identify outdated client
DEFAULT_LAYOUT = "retro" -- on android it's forced to "mobile", check code bellow

-- If you don't use updater or other service, set it to updater = ""
Services = {
  website = "http://otclient.ovh", -- currently not used
  updater = "http://otclient.ovh/api/updater.php",
  stats = "",
  crash = "http://otclient.ovh/api/crash.php",
  feedback = "http://otclient.ovh/api/feedback.php",
  status = "http://otclient.ovh/api/status.php"
}

-- Servers accept http login url, websocket login url or ip:port:version
Servers = {
--[[  OTClientV8 = "http://otclient.ovh/api/login.php",
  OTClientV8proxy = "http://otclient.ovh/api/login.php?proxy=1",
  OTClientV8c = "otclient.ovh:7171:1099:25:30:80:90",
  OTClientV8Test = "http://otclient.ovh/api/login2.php",
  Evoulinia = "evolunia.net:7171:1098",
  GarneraTest = "garnera-global.net:7171:1100",
  LocalTestServ = "127.0.0.1:7171:1098:110:30:93"  ]]
}

--Server = "ws://otclient.ovh:3000/"
--Server = "ws://127.0.0.1:88/"
--USE_NEW_ENERGAME = true -- uses entergamev2 based on websockets instead of entergame
ALLOW_CUSTOM_SERVERS = true -- if true it shows option ANOTHER on server list

g_app.setName("OTCv8")
-- CONFIG END

-- print first terminal message
g_logger.info(os.date("== application started at %b %d %Y %X"))
g_logger.info(g_app.getName() .. ' ' .. g_app.getVersion() .. ' rev ' .. g_app.getBuildRevision() .. ' (' .. g_app.getBuildCommit() .. ') made by ' .. g_app.getAuthor() .. ' built on ' .. g_app.getBuildDate() .. ' for arch ' .. g_app.getBuildArch())

if not g_resources.directoryExists("/data") then
  g_logger.fatal("Data dir doesn't exist.")
end

if not g_resources.directoryExists("/modules") then
  g_logger.fatal("Modules dir doesn't exist.")
end

-- settings
g_configs.loadSettings("/config.otml")

-- set layout
local settings = g_configs.getSettings()
local layout = DEFAULT_LAYOUT
if g_app.isMobile() then
  layout = "mobile"
elseif settings:exists('layout') then
  layout = settings:getValue('layout')
end
g_resources.setLayout(layout)

-- load mods
g_modules.discoverModules()
g_modules.ensureModuleLoaded("corelib")
  
local function loadModules()
  -- libraries modules 0-99
  g_modules.autoLoadModules(99)
  g_modules.ensureModuleLoaded("gamelib")

  -- client modules 100-499
  g_modules.autoLoadModules(499)
  g_modules.ensureModuleLoaded("client")

  -- game modules 500-999
  g_modules.autoLoadModules(999)
  g_modules.ensureModuleLoaded("game_interface")

  -- mods 1000-9999
  g_modules.autoLoadModules(9999)
end

-- report crash
if type(Services.crash) == 'string' and Services.crash:len() > 4 and g_modules.getModule("crash_reporter") then
  g_modules.ensureModuleLoaded("crash_reporter")
end

-- run updater, must use data.zip
if type(Services.updater) == 'string' and Services.updater:len() > 4 
  and g_resources.isLoadedFromArchive() and g_modules.getModule("updater") then
  g_modules.ensureModuleLoaded("updater")
  return Updater.init(loadModules)
end
loadModules()

--- Parses login configs file and returns login info when config name matches.
-- @param configName name of configuration in login configs file
-- @return boolean or table containing login information
local function getLoginInfo(configName)
  local loginConfigsPath = "/login/loginConfigs.json"

  if g_resources.fileExists(loginConfigsPath) then
    local fileContents = g_resources.readFileContents(loginConfigsPath)
    if string.len(fileContents) > 0 then
      -- maybe validate fileContents json structure
      local fileJsonContents = json.decode(fileContents)
      for characterConfigName, loginInfo in pairs(fileJsonContents) do
        if characterConfigName == configName then
          return loginInfo
        end
      end
    end
  else
    g_logger.error("Not found login configs file.")
  end

  return false
end

--- Handles OTClient .exe startup options.
-- Splits arguments by space and reads first as login configuration name saving it to Globals.
-- FIXME replace this implementation to one with argument name handling to extend possibilities and make it more flexible.
-- FIXME maybe due to not flexible way of handling argument cover it with enabled/disabled feature flag.
-- @return boolean whether handled any argument
local function handleStartupOptions()
  local loginInfo = string.split(g_app.getStartupOptions(), " ")
  if #loginInfo < 1 then
    g_logger.info("No startup arguments.")
    return false
  end
  G.initialLoginInfo = getLoginInfo(loginInfo[1])
  return G.initialLoginInfo
end

-- initial log in handling
if handleStartupOptions() then
  EnterGame.initialLogin(G.initialLoginInfo)
end
