window = {}

local oldMode = {}

function toggleFullscreen()
  if love.window.getFullscreen() then
    love.window.setFullscreen(false)
    resetWindow()
  else
    oldMode.width, oldMode.height, oldMode.flags = love.window.getMode()
    love.window.setFullscreen(true)
    local windowWidth, windowHeight, s = love.graphics.getWidth(), love.graphics.getHeight(), window.scale
    -- Determine best scale to fit
    while true do
      if (s + 1) * conf.width > windowWidth then
        window.scale = s
        -- Calculate translation dimensions to be sure the game is in the center of the screen
        window.translateX = (windowWidth - conf.width * s) / 2 / s
        window.translateY = (windowHeight - conf.height * s) / 2 / s
        return
      end
      s = s + 1
    end
  end
end

function resetWindow()
  if oldMode.width then
    love.window.setMode(oldMode.width, oldMode.height, oldMode.flags)
  end
  window.scale = conf.scale
  window.translateX = 0
  window.translateY = 0
end
