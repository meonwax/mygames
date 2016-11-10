Ship = Class {__includes = Entity}

function Ship:init(image, x, y, speed)
  Entity.init(self, image, x, y)
  self.speed = speed
  self.shots = {}
end

function Ship:update(dt)
  if love.keyboard.isDown("left") then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown("right") then
    self.x = self.x + self.speed * dt
  end
  self:updateHitbox()
end

function Ship:draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(self.image, round(self.x), round(self.y))

  if conf.debug.showHitbox then
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.rectangle("line", self.hitbox.x, self.hitbox.y, self.hitbox.width, self.hitbox.height)
  end

  for i, shot in ipairs(self.shots) do
    shot:draw()
  end
end

function Ship:shoot()
  table.insert(self.shots, Shot(self.x + self.width / 2 - 1, self.y - 2))
  shotSound:play()
end
