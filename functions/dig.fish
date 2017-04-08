function dig
  if command -v grc > /dev/null
    grc --colour=auto dig +multiline $argv
  else
    command dig +multiline $argv
  end
end
