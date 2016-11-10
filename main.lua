Class = require "libs.hump.class"
local Gamestate = require "libs.hump.gamestate"
require "libs.slam"

require "utils.trace"
require "utils.window"
require "utils.math"
require "utils.collision"

require "states.forest"
require "states.invaders"

function love.load()
  -- Init graphics
  love.graphics.setDefaultFilter("nearest")
  font = love.graphics.newImageFont("/assets/fonts/myfont.png", " ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+-=.,;!?:()/ÄÖÜß#[]*\"'", 1)
  love.graphics.setFont(font)
  resetWindow()

  -- Register all available love callbacks except 'draw' because we want to define the drawing order by ourselves
  local callbacks = {'update', 'errhand'}
  for callback in pairs(love.handlers) do
    table.insert(callbacks, callback)
  end
  Gamestate.registerEvents(callbacks)

  -- Start with first state
  Gamestate.switch(forest)
  -- Gamestate.switch(invaders)
end

function love.draw()
  love.graphics.scale(window.scale, window.scale)
  love.graphics.translate(window.translateX, window.translateY)
  Gamestate.current().draw()
  trace.draw()
  if conf.debug.showFps then
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print(love.timer.getFPS(), 303 , 8)
  end
end

function love.keypressed(key, scanCode, isRepeat)
  if key == "escape" then
    love.event.quit()
  end
end

function love.keyreleased(key)
  if key == "f11" then
    toggleFullscreen();
  end
end
