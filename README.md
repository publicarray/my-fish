# My fish

[![Slack Room][slack-badge]][slack-link]

publicarray's fish aliases, functions and configuration for macOS

## Install

With [fisherman]

The following command installs this repo and everything in [fishfile](https://github.com/publicarray/my-fish/blob/master/fishfile)

```sh
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

```sh
fisher add publicarray/my-fish
```

Configure shell to my preferences

**These are my personal preferences and as such it is not recommended to run the 'my-fish' command without knowing what it does. Please inspect [my-fish](https://github.com/publicarray/my-fish/blob/master/functions/my-fish.fish) beforehand**

```sh
my-fish
```

## Install on your favourite Linux Distro

see [linux.md](linux.md)

### Arch

```sh
pacman -S fish
yay -S starship
```

## Install on a brand new macOS machine

1. Install [homebrew](https://brew.sh/)

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

2. Install [Fish](http://fishshell.com) and [starship](https://starship.rs/) `cargo install starship`

```sh
brew install fish starship
```

3. Install [Fisherman](https://github.com/fisherman/fisherman)

```sh
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
```

4. Install my-fish and other Fisherman plug-ins

```sh
# execute this in the fish shell
fish
fisher publicarray/my-fish
my-fish
```

5. (Optional) Install extras so all commands work

```sh
# set -Ux HOMEBREW_NO_ANALYTICS 1
brew install install wget coreutils z thefuck mas hub archey ruby composer php yarn tree grep ack unar \
  iproute2mac grc gnutls git hub git-extras nano archey nmap ngrep lunchy terminal-notifier \
  ripgrep exa bat topgrade \
  go rustup \
  php-cs-fixer shellcheck
brew install make --with-default-names
brew cask install gpgtools docker sublime-text-dev sublime-merge
gem install bundler
sudo easy_install -U Pygments
```

6. (Optional) try other editors [micro - a modern text editor](https://github.com/zyedidia/micro)

```sh
brew install micro
set -Ux EDITOR micro
set -Ux VISUAL $EDITOR
```

 or [The nice editor](http://ne.di.unimi.it)

```sh
brew install ne
set -Ux EDITOR ne
set -Ux VISUAL $EDITOR
```

[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman
