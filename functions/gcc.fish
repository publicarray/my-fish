function gcc
  if command -sq grc
    grc --colour=auto gcc $argv
  else
    command gcc $argv
  end
end
