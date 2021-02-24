function du
    if command -sq grc
        grc --colour=auto du -h $argv
    else
        command du -h $argv
    end
end
