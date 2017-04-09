if command -v ip > /dev/null
  function ip
    if command -v grc > /dev/null
      grc --colour=auto ip $argv
    else
      command ip $argv
    end
  end
end
