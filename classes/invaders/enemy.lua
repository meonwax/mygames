Enemy = Class {}

function Enemy:init(image, x, y, speed)
  self.image = love.graphics.newImage(image)
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.x = x
  self.y = y
  self.speed = speed
  self:_updateHitbox()
end

function Enemy:update(dt, ground)
  self.y = self.y + dt * self.speed
  self:_updateHitbox()
  -- Check for collision with ground
  if self.hitbox.y > self.hitbox.height - ground.height then
    -- you lose!!!
  end
end

function Enemy:draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(self.image, round(self.x), round(self.y))

  if conf.debug.showHitbox then
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.rectangle("line", self.hitbox.x, self.hitbox.y, self.hitbox.width, self.hitbox.height)
  end
end

-- Private functions
function Enemy:_updateHitbox()
  self.hitbox = {
    x = self.x + 3,
    y = self.y + 4,
    width = self.width - 6,
    height = self.height - 5
  }
end
