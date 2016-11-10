require "classes.common.entity"
require "classes.invaders.background"
require "classes.invaders.ground"
require "classes.invaders.ship"
require "classes.invaders.shot"
require "classes.invaders.enemy"

invaders = {}

local background, ship, ground
local enemies = {}

function invaders:init()
  background = Background("/assets/images/invaders/space.png")
  ground = Ground(20)
  ship = Ship("/assets/images/invaders/ship.png", ground.width / 2 - 10, conf.height - ground.height - 10, 100)
  for i = 0, 7 do
    local enemy = Enemy("/assets/images/invaders/alien.png", i * 30 + 50, 30, 3)
    table.insert(enemies, enemy)
  end

  explodeSound = love.audio.newSource("/assets/sounds/invaders/expode.ogg", "static")
  shotSound = love.audio.newSource("/assets/sounds/invaders/shot.ogg", "static")
end

function invaders:update(dt)

  ship:update(dt)

  for i, shot in ipairs(ship.shots) do
    shot:update(dt, enemies)
    -- Remove shots that hit
    if shot.remove then
      table.remove(ship.shots, i)
    end
  end

  for i, enemy in ipairs(enemies) do
    enemy:update(dt, ground)
    -- Remove the enemies that got destroyed
    if enemy.remove then
      table.remove(enemies, i)
    end
  end

end

function invaders:draw()
  background:draw()
  ground:draw()
  ship:draw()
  for i, enemy in ipairs(enemies) do
    enemy:draw()
  end
end

function invaders:keypressed(key, scanCode, isRepeat)
  if (key == "lctrl") then
    ship:shoot()
  end
end
