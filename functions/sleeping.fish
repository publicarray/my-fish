function sleeping
    if command -sq pmset
        pmset sleepnow
    else if command -sq xset
        xset dpms force off
    else
        echo "Not yet implmented for your OS"
    end
end
