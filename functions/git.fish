function git --description 'alias git=hub'
  if command -sq hub
    hub $argv
  else
    command git $argv
  end
end
