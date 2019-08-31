if command -sq exa
    function ls --description 'alias ls exa'
        exa $argv;
    end
end
