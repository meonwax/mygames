Player = Class {}

function Player:init(x, y, speed, image)
  -- self.width = width
  -- self.height = height
  self.x = x
  self.y = y
  self.speed = speed
  self.image = love.graphics.newImage(image)
end

function Player:update(dt)
  self:_checkMovement(dt)
end

function Player:draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(self.image, self.x, self.y)
end

-- Private functions
function Player:_checkCollision()
  -- TODO: Check collision with screen border first
end

function Player:_checkMovement(dt)
  if love.keyboard.isDown("left") then
    self:_checkCollision()
    self.x = self.x - self.speed * dt
  end
  if love.keyboard.isDown("right") then
    self:_checkCollision()
    self.x = self.x + self.speed * dt
  end
  if love.keyboard.isDown("up") then
    self:_checkCollision()
    self.y = self.y - self.speed * dt
  end
  if love.keyboard.isDown("down") then
    self:_checkCollision()
    self.y = self.y + self.speed * dt
  end
end
