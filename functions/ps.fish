function ps
  if command -sq grc
    grc --colour=auto ps -x $argv
  else
    command ps -x $argv
  end
end
