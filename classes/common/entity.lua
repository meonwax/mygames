Entity = Class {}

function Entity:init(image, x, y)
  self.image = love.graphics.newImage(image)
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.x = x
  self.y = y
  self:updateHitbox()
end

function Entity:updateHitbox()
  self.hitbox = {
    x = self.x + 3,
    y = self.y + 4,
    width = self.width - 6,
    height = self.height - 5
  }
end
