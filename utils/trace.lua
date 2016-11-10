trace = {
  textl = { },
  stylel = { },
  styles = {
    white = { r = 255, g = 255, b = 255 },
    red = { r = 255, g = 127, b = 127 },
    green = { r = 191, g = 255, b = 127 },
    blue = { r = 127, g = 159, b = 255 },
    default = { r = 224, g = 224, b = 224 }
  },
  count = 0,
  limit = 22
}

function trace.print(text, style)
  if not conf.debug then
    return
  end

  if (style == nil) then
    -- No style given
    style = trace.styles.default
  end

  if (trace.count > trace.limit) then
    -- Scroll elements
    table.remove(trace.textl, 1)
    table.remove(trace.stylel, 1)
  else
    -- Add element
    trace.count = trace.count + 1
  end

  -- Write data
  trace.textl[trace.count] = text
  trace.stylel[trace.count] = style
end

function trace.draw(x, y)
  local i, s, z, prefix
  prefix = ''

  -- Default position parameters
  if (x == nil) then x = 8 end
  if (y == nil) then y = 8 end

  -- Draw lines:
  for i = 1, trace.count do
    s = trace.stylel[i]
    -- String to draw
    z = prefix .. trace.textl[i]

    -- Choose white/black outline
    -- if ((s.r < 160) and (s.g < 160) and (s.b < 160)) then
    --   love.graphics.setColor(255, 255, 255)
    -- else
    --   love.graphics.setColor(0, 0, 0)
    -- end

    -- Draw outline
    -- love.graphics.print(z, x + 1, y)
    -- love.graphics.print(z, x - 1, y)
    -- love.graphics.print(z, x, y + 1)
    -- love.graphics.print(z, x, y - 1)

    -- Draw color
    love.graphics.setColor(s.r, s.g, s.b)
    love.graphics.print(z, x, y)

    -- Concatenate prefix:
    prefix = prefix .. '\n'
  end
end
