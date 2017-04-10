# Util from paulirish <https://github.com/paulirish/dotfiles/blob/master/fish/aliases.fish>
# `cat` with beautiful colors. requires Pygments installed.
#                              sudo easy_install -U Pygments
# Alternatively: https://github.com/paulirish/c-cli
#        yarn global add https://github.com/paulirish/c-cli
function c
    if command -sq pygmentize
        pygmentize -O style=monokai -f console256 -g $argv
    else
        echo c requires Pygments. Installing now with: `sudo easy_install -U Pygments`
        sudo easy_install -U Pygments
    end
end
