Canvas = {}

local data = {}
require("utils")

Canvas.new = function(x,y,w,h)

  --[[This function is responsible for resetting all of the
      characters on screen to there default values--]]
  Canvas.load = function(c)
    local c = c or "." --Sets the background characters
    --This sets the value of each index to be the desired character
    for i=1,w*h do
      data[i] = c
    end
  end

  --This function is responsible for drawing stuff in the console
  Canvas.draw = function()
    clear()
    --Writes all data to the screen in the form of characters
    for i,v in ipairs(data) do
      io.write(data[i].." ")
      --[['i' is the index, while 'w' is the width.  If the
          index ever divides into width with no remainder,
          then the draw function should start a new line.
          The reason for this is because the table doesn't
          reset its index when it is equal to the width.
          So when we say check to see if the index has no
          remainder, we are really checking if it has
          completed its rows--]]
      if i/w == math.floor(i/w) then print("") end --Simply checks if i/w is a whole number
     end
     Canvas.load()
  end

    --This function plots a point at the desired coords
    Canvas.point = function(x,y,c)
      local x,y = math.round(x+1),math.round(y)
      local c = c or "#"
      if x > w then return print() end
      if y > h then return print() end
      data[x+(w*y)] = c --simply converts xy coords to a index
    end

    Canvas.line = function(x1,y1,x2,y2,c)
      local x,y = x1,y1
      local slope_y,slope_x = y2-y1,x2-x1

      function change(v) --Tells which sign to use
        if (v=='x' and x1 > x2) or (v=='y' and y1 > y2) then
          return -1
        end
        return 1
      end
      --Calculates where to draw the line
      if slope_x == 0 then
        --[[If x == 0, then we can't calculate the slope because
            anything divided by 0 is invalid.  So we will have
            to change how we draw the line.--]]
        repeat
          Canvas.point(x,y,c)
          y = y + 1 * change('y') --slope_y
        until (y > y2 and slope_y > 0) or (y < y2 and slope_y < 0)
      else
        --If x ~= 0, then we can use the slope formula normally
        local slope = slope_y/slope_x

        repeat
          Canvas.point(x,y,c)
            y = y + slope * change('x') --changes y by the slope
            x = x + 1 * change('x') --x is constant, so we just need to change the sign
          until (x > x2 and slope_x > 0) or (x < x2 and slope_x < 0)
                and (y > y2 and slope_y > 0) or (y < y2 and slope_y < 0)
        end
    end

    --Draws a rectangle
    Canvas.rectangle = function(x,y,w,h,c) -- "w" == "width", "h" == "height"
      for v=1, h do
        for i = 1, w do
          --[[Changes the orgin to 0 instead of 1.  We can't do
              this in the for loop because that would affect the
              width of the rectangle, giving us an offset of the
              width by 1--]]
          local i = i-1
          Canvas.point(x+i,y,c) --Plots a point on the canvas
        end
        y = y + 1 --Changes y by one to draw the next row
      end
    end

  return Canvas
end
