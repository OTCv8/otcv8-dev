filename =  nil
loaded = false

function setFileName(name)
  filename = name
end

function isLoaded()
  return loaded
end

function load(version)
  local errorMessage = ''

  if version >= 1281 then
    if not g_things.loadAppearances(resolvepath(string.format("/things/%d/catalog-content", version))) then
      errorMessage = errorMessage .. "Couldn't load assets"
    end
  else
    local datPath, sprPath
    if filename then
      datPath = resolvepath('/data/things/' .. filename)
      sprPath = resolvepath('/data/things/' .. filename)
    else
      datPath = resolvepath('/data/things/' .. version .. '/Tibia')
      sprPath = resolvepath('/data/things/' .. version .. '/Tibia')
    end

    if not g_things.loadDat(datPath) then
      errorMessage = errorMessage .. tr("Unable to load dat file, please place a valid dat in '%s.dat'", datPath) .. '\n'
    end
    if not g_sprites.loadSpr(sprPath) then
      errorMessage = errorMessage .. tr("Unable to load spr file, please place a valid spr in '%s.spr'", sprPath)
    end
  end
end