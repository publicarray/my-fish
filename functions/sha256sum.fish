if ! command -sq sha256sum
    # for macOS compatability
    function sha256sum --description 'alias sha256sum shasum --algorithm 256'
        shasum --algorithm 256 $argv
    end
end
