function ping
  if command -v grc > /dev/null
    grc --colour=auto ping $argv
  else
    command ping $argv
  end
end
