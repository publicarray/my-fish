function make
  if command -sq grc
    grc --colour=auto make $argv
  else
    command make $argv
  end
end
