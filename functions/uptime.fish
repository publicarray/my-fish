function uptime
  if command -sq grc
    grc --colour=auto uptime $argv
  else
    command uptime $argv
  end
end
