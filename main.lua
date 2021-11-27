require("engine")

local t = Canvas.new(1,1,30,20)
t.load()
local x,y = 10,0

while true do
  t.point(5,x,"*")
  t.draw()
  os.execute("timeout 1 >nul") --update speed
  x = x + 1
end
