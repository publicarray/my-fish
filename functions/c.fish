function c  --description 'colourful cat'
  if command -sq bat
    bat $argv;
  else if command -sq pygmentize
    # Util from paulirish <https://github.com/paulirish/dotfiles/blob/master/fish/aliases.fish>
    # `cat` with beautiful colors. requires Pygments installed.
    #                              sudo easy_install -U Pygments
    # Alternatively: https://github.com/paulirish/c-cli
    #        yarn global add https://github.com/paulirish/c-cli
    pygmentize -O style=monokai -f console256 -g $argv
  else
    echo "'c' requires Pygments or bat (https://github.com/sharkdp/bat)"
    # sudo easy_install -U Pygments
  end
end
