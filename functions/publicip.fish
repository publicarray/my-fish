function publicip
  if not command dig +short myip.opendns.com @resolver1.opendns.com
    curl -qs https://checkip.amazonaws.com/
    # curl -qs https://icanhazip.com
    #  curl -qs https://ipv4.icanhazip.com
    #  curl -qs https://ipv6.icanhazip.com
    # curl -qs https://ipinfo.io/ip
    # curl -qs checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
  end
end
