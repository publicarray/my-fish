function terminal-colours -d "apply or export my gnome-terminal colour palette"

    # Stock Adwaita palette, adjusted for a dark background: the bright row does
    # the heavy lifting (bright blue #4695f6 instead of GNOME's dim #2a7bde), and
    # yellow is a real yellow rather than Adwaita's brown.
    set -l palette \
        '#171421' '#c01c28' '#199a3d' '#d58f27' '#2356c4' '#a347ba' '#2894a5' '#d0cfcc' \
        '#5e5c64' '#f25b4b' '#33d17a' '#eeb211' '#4695f6' '#c061cb' '#43d6ec' '#ffffff'

    set -l base /org/gnome/terminal/legacy/profiles:

    if not command -sq dconf
        echo "Error: dconf not found, gnome-terminal only"
        return 1
    end

    # default profile key is often unset, fall back to the first profile listed
    set -l uuid (dconf read $base/default | string trim -c "'")
    if test -z "$uuid"
        set uuid (dconf list $base/ | string match ':*' | head -n1 | string trim -c ':/')
    end
    if test -z "$uuid"
        echo "Error: no gnome-terminal profile found"
        return 1
    end

    switch "$argv[1]"
        case '' apply
            # only the palette, use-theme-colors stays on so fg/bg follow the GTK theme
            dconf write $base/:$uuid/palette "['"(string join "', '" $palette)"']"
            echo "Applied palette to profile $uuid"
        case export
            dconf dump /org/gnome/terminal/
        case '*'
            echo "Usage: terminal-colours [apply|export]"
            return 1
    end
end
