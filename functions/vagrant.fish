function vagrant
  if test "$argv" = 'ssh' # ssh to current box
    vagrant ssh (vagrant global-status | grep 'running' | awk '{print $1}')
  else
    command vagrant $argv
  end
end
