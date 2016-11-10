Ground = Class {}

function Ground:init(height)
  self.height = height
  self.width = conf.width
end

function Ground:draw()
  love.graphics.setColor(120, 120, 0, 255)
  love.graphics.rectangle("fill", 0, conf.height - self.height, self.width, self.height)
end
