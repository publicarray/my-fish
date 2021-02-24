function docker-machine
    if command -sq grc
        grc --colour=auto docker-machine $argv
    else
        command docker-machine $argv
    end
end
