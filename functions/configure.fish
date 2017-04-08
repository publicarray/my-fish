function configure
  if command -v grc > /dev/null
    grc --colour=auto configure $argv
  else
    command configure $argv
  end
end

