if command -sq eza
    function ls --description 'alias ls eza'
        # https://github.com/eza-community/eza
        eza $argv
    end
else if command -sq lsd
    function ls --description 'alias ls lsd'
        # https://github.com/lsd-rs/lsd
        lsd $argv
    end
else if command -sq exa
    function ls --description 'alias ls exa'
        # https://github.com/ogham/exa (unmaintained, superseded by eza)
        exa $argv
    end
end
