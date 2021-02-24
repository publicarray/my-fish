function env
    if command -sq grc
        grc --colour=auto env $argv
    else
        command env $argv
    end
end
