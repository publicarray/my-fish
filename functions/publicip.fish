function publicip
  if command -sq dig
    set ip (dig +short myip.opendns.com @resolver1.opendns.com)
  end
  if set -q ip and test -n "$ip"
    echo ip
  else
    curl -qs https://checkip.amazonaws.com/
    # curl -qs https://icanhazip.com
    #  curl -qs https://ipv4.icanhazip.com
    #  curl -qs https://ipv6.icanhazip.com
    # curl -qs https://ipinfo.io/ip
    # curl -qs checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
  end
end
