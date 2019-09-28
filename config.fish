if command -sq starship
    source (starship init fish --print-full-init | psub)
end

# brew tap homebrew/command-not-found
if command -sq brew and brew which-formula
    function __fish_command_not_found_handler --on-event fish_command_not_found
        set -l cmd $argv[1]
        set -l txt (brew which-formula --explain $cmd ^ /dev/null)

        if test -z "$txt"
            __fish_default_command_not_found_handler $cmd
        else
            # https://github.com/fish-shell/fish-shell/issues/159
            for var in $txt
                echo $var
            end
        end
    end
end
