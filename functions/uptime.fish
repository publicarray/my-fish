function uptime
  if command -v grc > /dev/null
    grc --colour=auto uptime $argv
  else
    command uptime $argv
  end
end
