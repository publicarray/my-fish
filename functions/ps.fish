function ps
  if command -v grc > /dev/null
    grc --colour=auto ps $argv
  else
    command ps $argv
  end
end
