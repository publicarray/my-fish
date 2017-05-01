function du
  if command -sq grc
    grc --colour=auto du $argv
  else
    command du $argv
  end
end
