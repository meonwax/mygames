-- Global configuration
conf = {
  width = 320,
  height = 200,
  scale = 3,
  debug = {
    showFps = true,
    showHitbox = false,
    secondScreen = false
  }
}

function love.conf(t)
  t.title = "My Games"
  t.author = "Meonwax"
  t.version = "0.10.0"
  t.window.icon = "/assets/images/icon.png"

  -- Scale the game window
  t.window.width = conf.width * conf.scale
  t.window.height = conf.height * conf.scale

  if conf.debug.secondScreen then
    -- Display on second screen
    t.window.display = 2
    t.window.x = 100
    t.window.y = 100
  end

  -- Disable some modules
  t.modules.physics = false
  t.modules.touch = false
  t.modules.thread = false
end
