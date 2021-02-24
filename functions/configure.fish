function configure
    if command -sq grc
        grc --colour=auto configure $argv
    else
        command configure $argv
    end
end
