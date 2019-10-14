function localip
  if command -sq ip
    test -z "$OSTYPE"; and set OSTYPE (uname)
    if test $OSTYPE = "Darwin"
        ip route get 1 | awk '{print $NF;exit}' # brew install iproute2mac
    else if test $OSTYPE = "Linux"
        ip route get 1 | awk '{print $(NF-2);exit}'
    else
        echo "Unknown OS"
    end
  else
    ipconfig getifaddr en0;ipconfig getifaddr en1
  end
end
