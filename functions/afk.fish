function afk -d "Open Screensaver"
    test -z "$OSTYPE"; and set OSTYPE (uname)
    if test $OSTYPE = "Darwin"
        open -a ScreenSaverEngine.app
    else if test $OSTYPE = "Linux"
        if command -sq xdg-screensaver
            xdg-screensaver activate
        else if command -sq loginctl
            loginctl lock-session
        else
            echo "Not yet implemented"
        end
    else
        echo "Unknown OS"
    end
end
