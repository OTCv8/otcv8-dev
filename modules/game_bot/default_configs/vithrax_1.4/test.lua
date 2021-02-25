onTextMessage(function(mode, text)
    if text:lower():find("you are dead") then
        modules.client_entergame.CharacterList.doLogin()
    end
  end)