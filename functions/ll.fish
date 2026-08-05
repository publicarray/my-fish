function ll --description 'long listing, directories first'
    # --git and --smart-group are backend specific, so mirror the detection order in ls.fish
    if command -sq eza
        ls -l --group-directories-first --git --smart-group $argv
    else if command -sq lsd; or command -sq exa
        # lsd and exa know --git but not --smart-group
        ls -l --group-directories-first --git $argv
    else
        ls -l --group-directories-first $argv
    end
end
