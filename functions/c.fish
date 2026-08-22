function c --description 'colourful cat'
    if command -sq bat
        bat $argv
    else
        echo "'c' requires bat (https://github.com/sharkdp/bat)"
    end
end
