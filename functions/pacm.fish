function pacm --description 'alias to a AUR helper/pacman wrapper'
    # If `pacm` command exists, run it instead
    if command -sq pacm
        command pacm $argv
        return
    end

    # Auto-select first available AUR helper, fallback to pacman.
    # Order: paru (modern), yay (popular), then others.
    for helper in paru yay pacaur pikaur trizen rua aur pamac
        if command -sq $helper
            $helper $argv
            return
        end
    end
    sudo pacman $argv
end
