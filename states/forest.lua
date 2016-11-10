require "classes.forest.map"
require "classes.forest.player"

forest = {}

local map, player1, player2, player3, player4

function forest:init()
  map = Map("/assets/maps/forest.lua")
  player1 = Player(20, 20, 50, "/assets/images/faces/c10.png")
end

function forest:update(dt)
  map:update(dt)
  player1:update(dt)
end

function forest:draw()
  map:draw()
  player1:draw()
end

function forest:keypressed(key, scanCode, isRepeat)
  -- Gamestate.switch(invaders)
end
