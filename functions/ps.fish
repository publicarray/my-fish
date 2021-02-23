function ps
  if command -sq procs
    # https://github.com/dalance/procs
    command procs $argv
  else if command -sq grc
    grc --colour=auto ps -x $argv
  else
    command ps -x $argv
  end
end
