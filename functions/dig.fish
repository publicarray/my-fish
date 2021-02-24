function dig
    if command -sq grc
        grc --colour=auto dig +multiline $argv
    else
        command dig +multiline $argv
    end
end
