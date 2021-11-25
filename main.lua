require("engine")


local t = Canvas.new(1,1,30,20)
t.load()
local x,y = 29,0


while true do
--t.line(x,0,12,19)
t.rectangle(5, 5, 5, 5)
t.draw()
os.execute("timeout 1 >nul") --update speed
x = x - 1
end
