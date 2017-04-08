function sysctl
  if command -v grc > /dev/null
    grc --colour=auto sysctl $argv
  else
    command sysctl $argv
  end
end
