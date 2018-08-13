function publicip
  if not command dig +short myip.opendns.com @resolver1.opendns.com
    curl -qs https://checkip.amazonaws.com/
  end
end
