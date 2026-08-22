function my-fish --description 'Install opinionated fish defaults'

    # required:
    #   fish: brew install fish
    #   fishermen: curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    #   starship: brew install starship
    if not command -sq starship; or not command -sq fish; or not type -q fisher
        echo "Error: missing requirements, starship/fish/fisher"
        return 1
    end

    echo "Make fish your default shell"
    if not grep -q (type -p fish) /etc/shells
        type -p fish | sudo tee -a /etc/shells
    end
    if test "$SHELL" != (type -p fish)
        chsh -s (type -p fish)
    end

    echo "Set Environment Variables"
    # remove fish greeting
    set -U fish_greeting
    if command -sq brew
        set -Ux HOMEBREW_NO_ANALYTICS 1
    end

    if command -sq nano
        set -Ux EDITOR nano
        set -Ux VISUAL $EDITOR
    end

    echo "Link Sublime-Text command (subl)"
    if test -f /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl
        ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin
    end
    if test -f /Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge
        ln -sf /Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge /usr/local/bin
    end

    # colors for Man Pages
    set -Ux LESS_TERMCAP_mb \e'[01;31m' # begin blinking
    set -Ux LESS_TERMCAP_md \e'[01;31m' # begin bold
    set -Ux LESS_TERMCAP_me \e'[0m' # end mode
    set -Ux LESS_TERMCAP_se \e'[0m' # end standout-mode
    set -Ux LESS_TERMCAP_so \e'[01;44;33m' # begin standout-mode - info box
    set -Ux LESS_TERMCAP_ue \e'[0m' # end underline
    set -Ux LESS_TERMCAP_us \e'[01;32m' # begin underline

    if command -sq bat
        echo "Use bat for man page colouring"
        set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
        set -Ux MANROFFOPT "-c"
    end

    echo "Update PATH"
    if command -sq yarn
        set -l yarn_globals (yarn global bin 2>/dev/null)
        echo "Add yarn global packages $yarn_globals to \$PATH"
        fish_add_path -U $yarn_globals
    end

    if command -sq go
        set -Ux GOPATH $HOME/.go
        echo "Add GOPATH: $GOPATH to \$PATH"
        fish_add_path -U $GOPATH/bin
        mkdir -p $GOPATH
    end

    if command -sq cargo
        echo "Add rust binaries (.cargo/bin) to \$PATH"
        fish_add_path -U $HOME/.cargo/bin
    end

    if command -sq composer
        set -l COMPOSER_BIN_PATH
        if test -n "$COMPOSER_HOME"
            set COMPOSER_BIN_PATH $COMPOSER_HOME/vendor/bin
        else if test -n "$XDG_CONFIG_HOME"
            set COMPOSER_BIN_PATH $XDG_CONFIG_HOME/composer/vendor/bin
        else if test -d "$HOME/.config/composer"
            set COMPOSER_BIN_PATH $HOME/.config/composer/vendor/bin
        else
            set COMPOSER_BIN_PATH $HOME/.composer/vendor/bin
        end
        echo "Add composer binaries ($COMPOSER_BIN_PATH) to \$PATH"
        fish_add_path -U $COMPOSER_BIN_PATH
    end

    if command -sq brew
        echo "Add Homebrew binaries to \$PATH"
        fish_add_path -U (brew --prefix)/sbin
        if which -a ruby | grep -q 'ruby/bin/ruby'
            echo "Add Homebrew ruby binaries to \$PATH"
            fish_add_path -U (brew --prefix)/opt/ruby/bin
        end
    end

    echo "Configure installed tools"
    if command -sq delta
        git config --global core.pager delta
        git config --global interactive.diffFilter "delta --color-only"
    end

    if command -sq tldr
        tldr --update
    end

    echo "Show paths"
    echo $PATH
    set --show fish_user_paths

    echo "Update completions"
    fish_update_completions
end
