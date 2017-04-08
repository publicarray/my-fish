function make
  if command -v grc > /dev/null
    grc --colour=auto make $argv
  else
    command make $argv
  end
end
