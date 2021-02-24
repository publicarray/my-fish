function ping
    if command -sq grc
        grc --colour=auto ping $argv
    else
        command ping $argv
    end
end
