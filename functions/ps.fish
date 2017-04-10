function ps
  if command -sq grc
    grc --colour=auto ps $argv
  else
    command ps $argv
  end
end
