function desktop -d "hide/show your desktop icons"

    if test -z "$argv"
        echo "Command input must be 'show' or 'hide'"
        return 1
    end

    set showdesktop = false
    if test $argv = 'show' or test $argv = 'true' or test $argv = 'yes'
        set showdesktop = true
    end

    test -z "$OSTYPE"; and set OSTYPE (uname)
    if test $OSTYPE = "Darwin"
        defaults write com.apple.finder CreateDesktop -bool $showdesktop
        killall Finder
    else if test $OSTYPE = "Linux"
        echo "Not yet implemented"
        # gsettings set org.mate.background show-desktop-icons $showdesktop
        # gsettings set org.gnome.desktop.background $showdesktop
    else
        echo "Unknown OS"
    end
end

