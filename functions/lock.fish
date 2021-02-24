function lock
    test -z "$OSTYPE"; and set OSTYPE (uname)
    if test $OSTYPE = "Darwin"
        /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
    else if test $OSTYPE = "Linux"
        if command -sq xdg-screensaver
            xdg-screensaver lock
        else if command -sq loginctl
            loginctl lock-session
        else
            echo "Not yet implemented"
        end
    else
        echo "Unknown OS"
    end
end
