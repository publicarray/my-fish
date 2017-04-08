function git --description 'alias git=hub'
  if command -v hub > /dev/null
    hub $argv
  else
    command git $argv
  end
end
