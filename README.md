# My fish 

[![Slack Room][slack-badge]][slack-link]

publicarray's fish aliases, functions and configuration for macOS

## Install

With [fisherman]

```
fisher publicarray/my-fish
```

Configure shell to my preferences

**These are my personal preferences and as such it is not recommended to run 'this command without knowing what it does. Please inspect [my-fish](https://github.com/publicarray/my-fish/blob/master/functions/my-fish.fish) beforehand**

```sh
my-fish
```

## Install Manualy

1. Install [homebrew](https://brew.sh/)

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

2. Install [Fish](http://fishshell.com)

```sh
brew install fish

# make fish your default shell
which fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

3. Install [Fisherman](https://github.com/fisherman/fisherman)

```sh
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
```

4. Install my-fish, prompt and other Fisherman plug-ins

```sh
fisher publicarray/my-fish
```

5. Install [micro - a modern text editor](https://github.com/zyedidia/micro)

```sh
brew install micro
set -Ux EDITOR micro
set -Ux VISUAL $EDITOR
```

6. Install extras so all commands work

```sh
# set -Ux HOMEBREW_NO_ANALYTICS 1
brew install z thefuck mas hub archey composer php71 yarn tree grep ack unar \
  iproute2mac grc gnutls git git-extras nano archey
brew install make --with-default-names
brew cask install gpgtools docker sublime-text-dev atom p4merge

gem install bundler
sudo easy_install -U Pygments
```

7. Set shell colours

```sh
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
```

8. Add GOPATH to $PATH

```sh
set -Ux GOPATH $HOME/go
set -U fish_user_paths $fish_user_paths $GOPATH/bin
```

8. Update completions

```sh
fish_update_completions
```

[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman
