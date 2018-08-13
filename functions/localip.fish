function localip
  if command -sq ip
    ip route get 1 | awk '{print $NF;exit}' # brew install iproute2mac
  else
    ipconfig getifaddr en0;ipconfig getifaddr en1
  end
end
