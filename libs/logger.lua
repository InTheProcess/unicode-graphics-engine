--[[This file is responsible for logging all of
    the info into a log file--]]
require("libs.utils")--Note this may need to change depending on the file running it

local l_log_path = "logs/latest.log"

--[[This function first renames latest.log file to renamed to
    the date it was last modified.  After that, the log starts
    with "Engine has started..."--]]
function new_log()
  os.rename(l_log_path,"logs/"..timestamp()..".log") --renames latest.log

  local latest_log = io.open(l_log_path,"w")
  latest_log:write("["..timestamp().."] Engine has started...")
  latest_log:close()
end

--[[This function simply adds a msg to the log.
    It does other messures to filter what is important
    to reduce headaches and human readability--]]
function log(msg)
  local latest_line = ""

  if config.log.compress == true then
    local latest_line_raw = io.read_line(io.get_total_lines(l_log_path),l_log_path)
    local target = " "

    --[[Now this is where we filter the string into a more
        usable format--]]
    for idx=1,#latest_line_raw do
      if latest_line_raw:sub(idx,idx) == target then
        --This gets every character after the the target and recompiles then into latest_line
        for i=idx+1,#latest_line_raw do
          latest_line = latest_line..latest_line_raw:sub(i,i)
        end
        break --Breaks loop because we don't need it anymore
      end
    end
  end

  local latest_log = io.open(l_log_path,"a")--Appends to previous text

  if latest_line ~= msg or config.log.compress == false then
    latest_log:write("\n["..timestamp().."] "..tostring(msg))
  end
  latest_log:close()
end
