function cc
  if command -sq grc
    grc --colour=auto cc $argv
  else
    command cc $argv
  end
end
