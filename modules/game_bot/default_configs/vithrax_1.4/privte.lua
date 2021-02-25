local height = 13
local widget = setupUI([[
Panel
  id: msgPanel
  height: 210
  width: 800
  border: 1 black
]], g_ui.getRootWidget())

widget:setPosition({x=200,y=470})

onTalk(function(name, level, mode, text, channelId, pos)
    local msgLabel = g_ui.loadUIFromString([[
Label
  color: #5ff7f7
  background-color: black
  opacity: 0.87
]], widget)
    msgLabel:setText(name .." ["..level.. "]: " .. text)
    msgLabel:setPosition({y = widget:getPosition().y+(#widget:getChildren()*13), x = widget:getPosition().x})
    local posy = widget:getPosition().y
    if #widget:getChildren() > 10 then
        for msgIndex, message in ipairs(widget:getChildren()) do
            posy = posy + 13
            message:setPosition({y = message:getPosition().y - 13, x = widget:getPosition().x})
            if (msgIndex == 1) then message:destroy() end
        end
    end
end)