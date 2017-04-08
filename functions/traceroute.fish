function traceroute
  if command -v grc > /dev/null
    grc --colour=auto traceroute $argv
  else
    command traceroute $argv
  end
end
