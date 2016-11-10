Background = Class {}

function Background:init(image)
  self.image = love.graphics.newImage(image)
end

function Background:draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(self.image)
end
