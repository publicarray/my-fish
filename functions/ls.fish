if command -sq exa
    function ls --description 'alias ls exa'
        exa $argv;
    end
else if command -sq lsd
    function ls --description 'alias ls lsd'
        lsd $argv;
    end
end
