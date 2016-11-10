-- Check if to rectangles overlap
function checkCollision(box1x, box1y, box1width, box1height, box2x, box2y, box2width, box2height)
  return box1x < box2x + box2width and
  box2x < box1x + box1width and
  box1y < box2y + box2height and
  box2y < box1y + box1height
end
