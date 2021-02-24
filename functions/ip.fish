if command -sq ip
    function ip
        if command -sq grc
            grc --colour=auto ip $argv
        else
            command ip $argv
        end
    end
end
