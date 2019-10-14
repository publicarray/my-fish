function afk -d "Open Screensaver"
	test -z "$OSTYPE"; and set OSTYPE (uname)
	if test $OSTYPE = "Darwin"
 		open -a ScreenSaverEngine.app
 	else if test $OSTYPE = "Linux"
 		echo "Not yet implemented"
    else
        echo "Unknown OS"
 	end
end
