function password -d "Generate random string"
  if test -z "$argv"
    if command -sq pwgen
      pwgen -s 50 1
      pwgen -sy 50 1
    end
    head /dev/urandom | env LC_CTYPE=C LC_ALL=C tr -dc A-Za-z0-9 | head -c 50; echo
    head /dev/urandom | env LC_CTYPE=C LC_ALL=C tr -dc "a-zA-Z0-9-_.!#%*@\$\?" | head -c 50; echo
  else
    if command -sq pwgen
      pwgen -s "$argv" 1
      pwgen -sy "$argv" 1
    end
    head /dev/urandom | env LC_CTYPE=C LC_ALL=C tr -dc A-Za-z0-9 | head -c "$argv"; echo
    head /dev/urandom | env LC_CTYPE=C LC_ALL=C tr -dc "a-zA-Z0-9-_.!#%*@\$\?" | head -c "$argv"; echo
  end
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
