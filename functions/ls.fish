if command -sq exa
    function ls --description 'alias ls exa'
        # https://github.com/ogham/exa
        exa $argv
    end
else if command -sq lsd
    function ls --description 'alias ls lsd'
        # https://github.com/Peltoche/lsd
        lsd $argv
    end
end
