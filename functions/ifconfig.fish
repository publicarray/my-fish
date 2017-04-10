function ifconfig
  if command -sq grc
    grc --colour=auto ifconfig $argv
  else
    command ifconfig $argv
  end
end
