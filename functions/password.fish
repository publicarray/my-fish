function password -d "Generate random string"
    set -l len 50
    if test -n "$argv"
        set len "$argv"
    end

    if command -sq pwgen
        echo -n "pwgen strict:  "
        pwgen -s $len 1
        echo -n "pwgen secure:  "
        pwgen -sy $len 1
    end
    echo -n "alnum:         "
    head /dev/urandom | env LC_CTYPE=C LC_ALL=C tr -dc A-Za-z0-9 | head -c $len
    echo
    echo -n "alnum+symbols: "
    head /dev/urandom | env LC_CTYPE=C LC_ALL=C tr -dc "a-zA-Z0-9-_.!#%*@\$\?" | head -c $len
    echo
end
## alnum
# head /dev/urandom | env LC_CTYPE=C LC_ALL=C tr -dc A-Za-z0-9 | head -c 50; echo
# head /dev/urandom | env LC_CTYPE=C LC_ALL=C grep -a -o '[[:alnum:]]' -m "50" | tr -d '\n's; echo
# openssl rand -base64 50
# pwgen -s 50 1

## symbols
# head /dev/urandom | env LC_CTYPE=C LC_ALL=C tr -dc "a-zA-Z0-9-_.!#%*@\$\?" | head -c 50; echo
# head /dev/urandom | env LC_CTYPE=C LC_ALL=C grep -a -o '[[[:alnum:]\-_.!#%*@$?]' -m 50 | tr -d '\n'; echo
# pwgen -sy 50 1
