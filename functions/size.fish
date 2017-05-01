# by paulmillr  <https://github.com/paulmillr/dotfiles/blob/master/home/.zshrc.sh>
# Show directory size
function size
  du -shck $argv | sort -rn | awk '
      function human(x) {
          s="kMGTEPYZ";
          while (x>=1000 && length(s)>1)
              {x/=1024; s=substr(s,2)}
          return int(x+0.5) substr(s,1,1)
      }
      {gsub(/^[0-9]+/, human($1)); print}'
end
