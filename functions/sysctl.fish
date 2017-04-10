if command -sq sysctl
  function sysctl
    if command -sq grc
      grc --colour=auto sysctl $argv
    else
      command sysctl $argv
    end
  end
end
