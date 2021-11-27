---------------------
--UNIVERSAL SUPPORT--
---------------------

function clear()
  if os.execute("cls") then
    os.execute("cls")
  end
end

function sleep(seconds)
end

--------
--MATH--
--------
function math.round(n) --Rounds to the nearest whole number
  local decimal = n - math.floor(n)
  if decimal >= 0.5 then
    return math.ceil(n)
  end
  return math.floor(n)
end

-----------------------
--STRING MANIPULATION--
-----------------------
function timestamp() --Returns a timestamp
  local date = os.date("*t")
  local time = {date.year,date.month,date.day,date.hour,date.min}
  local timestamp = ""

  --This loop combines the times with dashes as a divider
  for i=1,5 do
    timestamp = timestamp..tostring(time[i]).."-"
  end

  timestamp = timestamp..tostring(date.sec) --Justs adds the secs  after the dash
  return timestamp
end

---------------
--FILE SYSTEM--
---------------
function io.get_total_lines(file) --Returns the # of lines in a file
  local len = 0

  for line in io.lines(file) do
    len = len + 1
  end
  return len
end

function io.read_line(line,file) --Returns the value of the line specified
  local idx = 0 --idx stands for "index"

  for line_value in io.lines(file) do
    idx = idx + 1
    if idx == line then return line_value end
  end
  error(file.." has fewer lines than "..line.." lines.  "..file.." only has "..io.get_total_lines(file).." lines.")
end
