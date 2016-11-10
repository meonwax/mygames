Shot = Class {}

function Shot:init(x, y)
  self.x = x
  self.y = y
  self.speed = 200
end

function Shot:update(dt, enemies)

  -- Update position
  self.y = self.y - dt * self.speed

  -- Mark shots that are not visible for removal
  if self.y < 0 then
    self.remove = true
  end

  -- Check for collision with enemies
  for k, enemy in ipairs(enemies) do
    if checkCollision(self.x, self.y, 2, 5, enemy.hitbox.x, enemy.hitbox.y, enemy.hitbox.width, enemy.hitbox.height) then
      -- Mark that enemy for removal
      enemy.remove = true
      -- Mark the shot to be removed
      self.remove = true
      -- Play a sound
      explodeSound:play()
    end
  end
end

function Shot:draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle("fill", round(self.x), round(self.y), 2, 2)
end
