if command -sq nmap
    function nmap
        _grc_or_plain nmap $argv
    end
end
