function ps
    if command -sq procs
        # https://github.com/dalance/procs
        command procs $argv
    else
        _grc_or_plain ps -x $argv
    end
end
