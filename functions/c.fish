# Util from paulirish <https://github.com/paulirish/dotfiles/blob/master/fish/aliases.fish>
# `cat` with beautiful colors. requires Pygments installed.
#                              sudo easy_install -U Pygments
function c
    if command -v pygmentize > /dev/null
        pygmentize -O style=monokai -f console256 -g $argv
    else
        echo c requires Pygments. Installing now with: `sudo easy_install -U Pygments`
        sudo easy_install -U Pygments
    end
end
