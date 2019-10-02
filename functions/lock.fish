function lock
    test -z "$OSTYPE"; and set OSTYPE (uname)
    if test $OSTYPE = "Darwin"
        /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
    else if test $OSTYPE = "Linux"
        echo "Not yet implemented"
    else
        echo "Unknown OS"
    end
end
