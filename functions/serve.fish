function serve -d 'Start a quick local static file server -b<bind/host> -p<port>'
  # https://gist.github.com/willurd/5720255
  # https://github.com/topics/static-server?o=desc&s=stars
  set HOST "127.0.0.1"
  set PORT "5000"
  set WEBROOT "."

  argparse -x 'bind,host' -i 'h/help' 'b/bind=' 'Z-host=' 'p/port=' -- $argv
  or return

  if set -q _flag_help
    printf "serve [-h/--help][-b/--bind/--host 127.0.0.1] [-p/--port 8001] <webroot>\n"
    return 0
  end

  if set -q _flag_bind
    set HOST "$_flag_bind"
  else if set -q _flag_host
    set HOST "$_flag_host"
  end

  if set -q _flag_port
    set PORT "$_flag_port"
  end

  if set -q argv[1]
    set WEBROOT "$argv[1]"
  end
  echo "🌐 Starting webserver at http://$HOST:$PORT"

  if command -sq serve
    # https://github.com/syntaqx/serve
    serve --host $HOST --port $PORT
  else if command -sq sfz
    # https://github.com/weihanglo/sfz
    sfz -b $HOST -p $PORT
  else if command -sq http
    # https://github.com/thecoshman/http
    # cargo install https
    httplz -s
  else if command -sq darkhttpd
    # https://github.com/rif/spark
    darkhttpd $WEBROOT --addr $HOST -port $PORT
  else if command -sq http-server
    # https://github.com/http-party/http-server
    # https://www.npmjs.com/package/http-server
    http-server -a $HOST -p $PORT
  else if command -sq statikk
    # https://github.com/paulirish/statikk
    statikk --port $PORT
  else if command -sq www
    # https://github.com/nbari/www
    www -p $PORT
  else if command -sq php
    php -S $HOST:$PORT
  else if command -sq python
    python -m http.server  $PORT --bind 127.0.0.1
  else if command -sq busybox
    busybox httpd -f -p $PORT
  end
end

## Others
# https://github.com/mufeedvh/binserve
# https://github.com/hqjs/hq
# https://github.com/wyhaya/see
# https://harpjs.com/
# caddy -port $PORT
