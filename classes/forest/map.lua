Map = Class {}

local sti = require "libs.sti"

function Map:init(map)
  self.map = sti(map)
end

function Map:update(dt)
  self.map:update(dt)
end

function Map:draw()
  self.map:draw()
end
