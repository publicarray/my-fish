function ifconfig
  if command -v grc > /dev/null
    grc --colour=auto ifconfig $argv
  else
    command ifconfig $argv
  end
end
