function curl-time -d "curl with timing statistics"
# https://curl.se/docs/manpage.html
    curl -so /dev/null -w "\
    http_code: %{http_code}\n\
   namelookup: %{time_namelookup}s\n\
      connect: %{time_connect}s\n\
   appconnect: %{time_appconnect}s\n\
  pretransfer: %{time_pretransfer}s\n\
     redirect: %{time_redirect}s\n\
starttransfer: %{time_starttransfer}s\n\
-------------------------\n\
        total: %{time_total}s\n\
-------------------------\n\
    download: %{size_download} bytes\n\
      header: %{size_header} bytes\n\
     request: %{size_request} bytes\n\
avg download: %{speed_download} Bytes per second\n" $argv
end
