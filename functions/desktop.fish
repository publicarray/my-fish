function desktop -d "hide/show your desktop icons"

  if test -z "$argv"
    echo "Command input must be 'show' or 'hide'"
    return 1
  end

  if test $argv = 'show'
    defaults write com.apple.finder CreateDesktop -bool true; killall Finder
  else if test $argv = 'hide'
    defaults write com.apple.finder CreateDesktop -bool false; killall Finder
  end

end
