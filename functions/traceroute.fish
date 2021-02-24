function traceroute
    if command -sq grc
        grc --colour=auto traceroute $argv
    else
        command traceroute $argv
    end
end
