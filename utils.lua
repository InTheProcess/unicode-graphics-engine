function clear()
  if os.execute("cls") then
    os.execute("cls")
  end
end

function sleep(seconds)
end

function math.round(n)
  local decimal = n - math.floor(n)
  if decimal >= 0.5 then
    return math.ceil(n)
  end
  return math.floor(n)
end
