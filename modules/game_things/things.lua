filename =  nil
loaded = false

function setFileName(name)
  filename = name
end

function isLoaded()
  return loaded
end

function load()
  local version = g_game.getClientVersion()
  local things = g_settings.getNode('things')
  g_game.enableFeature(Game64Textures)
  
  local datPath, sprPath, hdPath
  local isHdMod = false
  if things and things["data"] ~= nil and things["sprites"] ~= nil then
    datPath = '/things/' .. things["data"]
    sprPath = '/things/' .. things["sprites"]
  else  
    if filename then
      datPath = resolvepath('/things/' .. filename)
      sprPath = resolvepath('/things/' .. filename)
    else
      datPath = resolvepath('/things/' .. version .. '/Tibia')
      sprPath = resolvepath('/things/' .. version .. '/Tibia')
    end
  end
  
  if g_game.getFeature(Game64Textures) then
	hdPath = resolvepath('/things/' .. version .. '/TibiaHD')
	isHdMod = true
  end

  local errorMessage = ''
  if not g_things.loadDat(datPath) then
    if not g_game.getFeature(GameSpritesU32) then
      g_game.enableFeature(GameSpritesU32)
      if not g_things.loadDat(datPath) then
        errorMessage = errorMessage .. tr("Unable to load dat file, please place a valid dat in '%s'", datPath) .. '\n'
      end
    else
      errorMessage = errorMessage .. tr("Unable to load dat file, please place a valid dat in '%s'", datPath) .. '\n'
    end
  end
  
  if not g_sprites.loadSpr(sprPath, isHdMod) then
	errorMessage = errorMessage .. tr("Unable to load spr file, please place a valid spr in '%s'", sprPath)
  end
  loaded = (errorMessage:len() == 0)

  if errorMessage:len() > 0 then
    local messageBox = displayErrorBox(tr('Error'), errorMessage)
    addEvent(function() messageBox:raise() messageBox:focus() end)

    g_game.setClientVersion(0)
    g_game.setProtocolVersion(0)
  end
end
