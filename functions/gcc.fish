function gcc
  if command -v grc > /dev/null
    grc --colour=auto gcc $argv
  else
    command gcc $argv
  end
end
