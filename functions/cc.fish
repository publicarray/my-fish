function cc
  if command -v grc > /dev/null
    grc --colour=auto cc $argv
  else
    command cc $argv
  end
end
