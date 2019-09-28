function df
  if command -sq grc
    grc --colour=auto df -h $argv
  else
    command df -h $argv
  end
end
