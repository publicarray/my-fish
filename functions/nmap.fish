if command -sq nmap
  function nmap
    if command -sq grc
      grc --colour=auto nmap $argv
    else
      command nmap $argv
    end
  end
end
