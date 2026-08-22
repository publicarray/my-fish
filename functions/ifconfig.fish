function ifconfig
    if command -sq ifconfig
        _grc_or_plain ifconfig $argv
    else if command -sq ip
        echo "ifconfig not found, falling back to 'ip addr'" >&2
        command ip addr show $argv
    else
        echo "Neither ifconfig nor ip found" >&2
        return 1
    end
end
