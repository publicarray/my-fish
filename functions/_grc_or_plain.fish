function _grc_or_plain --description 'Run $argv through grc for colour if installed, plain otherwise'
    if command -sq grc
        grc --colour=auto $argv
    else
        command $argv
    end
end
