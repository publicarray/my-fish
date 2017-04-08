function docker-machine
  if command -v grc > /dev/null
    grc --colour=auto docker-machine $argv
  else
    command docker-machine $argv
  end
end
