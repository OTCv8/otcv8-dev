function init()
  -- add manually your shaders from /data/shaders

  g_shaders.createOutfitShader("rainbow", "/shaders/outfit_rainbow_vertex", "/shaders/outfit_rainbow_fragment")
  g_shaders.addTexture("rainbow", "/images/shaders/rainbow.png")  
end

function terminate()
end


