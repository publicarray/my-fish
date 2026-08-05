if command -sq eza
    function ls --description 'alias ls eza'
        # https://github.com/eza-community/eza
        # icons=auto so they are dropped when output is piped
        eza --icons=auto $argv
    end
else if command -sq lsd
    function ls --description 'alias ls lsd'
        # https://github.com/lsd-rs/lsd
        lsd --icon=auto $argv
    end
else if command -sq exa
    function ls --description 'alias ls exa'
        # https://github.com/ogham/exa (unmaintained, superseded by eza)
        exa --icons $argv
    end
end
