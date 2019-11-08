function my-fish

  # required:
  #   fish: brew install fish
  #   fishermen: curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  #   starship: brew install starship
  if not command -sq starship and not command -sq fish and not type -q fisher and not command
    echo "Error: missing requirements, starship"
    return 1
  end

  echo "Make fish your default shell"
  which fish | sudo tee -a /etc/shells
  chsh -s (which fish)

  echo "Set Environment Variables"
  # remove fish greeting
  set fish_greeting
  if command -sq brew
    set -Ux HOMEBREW_NO_ANALYTICS 1
  end

  if command -sq nano
    set -Ux EDITOR nano
    set -Ux VISUAL $EDITOR
  end

  echo "Link Sublime-Text command (subl)"
  if test -f /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl
    ln -n /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin
  end
    if test -f /Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge
    ln -s /Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge /usr/local/bin
  end

  echo "Set shell colours"
  set -U fish_color_normal normal # the default color
  set -U fish_color_command green # the color for commands
  set -U fish_color_quote yellow # the color for quoted blocks of text
  set -U fish_color_redirection normal # the color for IO redirections (|><)
  set -U fish_color_end normal # the color for process separators like ';' and '&'
  set -U fish_color_error red --bold # the color used to highlight potential errors
  set -U fish_color_param normal # the color for regular command parameters
  set -U fish_color_comment 555 # the color used for code comments
  set -U fish_color_match purple --background=303030 # the color used to highlight matching parenthesis
  set -U fish_color_search_match --background=0A0682 # the color used to highlight history search matches
  set -U fish_color_operator normal # the color for parameter expansion operators like '*' and '~'
  set -U fish_color_escape cyan # the color used to highlight character escapes like '\n' and '\x70'
  set -U fish_color_cwd blue # the color used for the current working directory in the default prompt
  set -U fish_color_cwd_root red
  set -U fish_color_autosuggestion 555 # the color used for autosuggestions
  set -U fish_color_user brgreen # the color used to print the current username in some of fish default prompts
  set -U fish_color_host normal # the color used to print the current host system in some of fish default prompts
  set -U fish_color_valid_path --underline
  set -U fish_pager_color_prefix red # the color of the prefix string, i.e. the string that is to be completed
  set -U fish_pager_color_completion normal # the color of the completion itself
  set -U fish_pager_color_description 777 yellow # the color of the completion description
  set -U fish_pager_color_progress cyan  # the color of the progress bar at the bottom left corner
  set -U fish_pager_color_secondary cyan # the background color of the every second completion
  # colors for Man Pages
  set -Ux LESS_TERMCAP_mb \e'[01;31m' # begin blinking
  set -Ux LESS_TERMCAP_md \e'[01;31m' # begin bold
  set -Ux LESS_TERMCAP_me \e'[0m' # end mode
  set -Ux LESS_TERMCAP_se \e'[0m' # end standout-mode
  set -Ux LESS_TERMCAP_so \e'[01;44;33m' # begin standout-mode - info box
  set -Ux LESS_TERMCAP_ue \e'[0m' # end underline
  set -Ux LESS_TERMCAP_us \e'[01;32m' # begin underline


  if command -sq go
    echo "Add GOPATH: $GOPATH to \$PATH"
    set -Ux GOPATH $HOME/go
    set -U fish_user_paths $fish_user_paths $GOPATH/bin
  end

  if command -sq cargo
    echo "Add rust binaries (.cargo/bin) to \$PATH"
    set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
  end

  if command -sq composer
    if test -n "$COMPOSER_HOME"
      set -g COMPOSER_BIN_PATH $COMPOSER_HOME/vendor/bin
    else if test -n "$XDG_CONFIG_HOME"
      set -g COMPOSER_BIN_PATH $XDG_CONFIG_HOME/composer/vendor/bin
    else if test -d "$HOME/.config/composer"
      set -g COMPOSER_BIN_PATH $HOME/.config/composer/vendor/bin
    else
      set -g COMPOSER_BIN_PATH $HOME/.composer/vendor/bin
    end
    echo "Add composer binaries ($COMPOSER_BIN_PATH) to \$PATH"
    if not contains "$COMPOSER_BIN_PATH" $PATH
      set -U fish_user_paths $COMPOSER_BIN_PATH $fish_user_paths
    end
  end

  if command -sq brew;
    echo "Add Homebrew binaries to \$PATH"
    set -U fish_user_paths (brew --prefix)"/sbin" $fish_user_paths
    if which -a ruby | grep -q 'ruby/bin/ruby'
      echo "Add Homebrew ruby binaries to \$PATH"
      set -U fish_user_paths (brew --prefix)"/opt/ruby/bin" $fish_user_paths
    end
  end

  echo "Show paths"
  path
  set --show fish_user_paths

  echo "Update completions"
  fish_update_completions
end
