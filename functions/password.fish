function password -d "Generate random string"
  if test -z "$argv"
      strings /dev/urandom | grep -o '[[:alnum:]]' -m 50 | tr -d '\n'; echo
  else
      strings /dev/urandom | grep -o '[[:alnum:]]' -m "$argv" | tr -d '\n'; echo
  end
end
