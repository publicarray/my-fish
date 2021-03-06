# My fish

publicarray's fish aliases, functions and configuration

* [Quick Start](#quick-start)
* [Prepare installation on a new machine](#prepare-installation-on-a-new-machine)
    + [1. Dependencies](#1-dependencies)
        + [macOS](#macos)
        + [Ubuntu](#ubuntu)
        + [Debian](#debian)
        + [Arch](#arch)
        + [RedHat (Fedora / CentOS)](#redhat--fedora---centos-)
            - [Fedora](#fedora)
            - [CentOS](#centos)
        + [Gentoo](#gentoo)
        + [Nix](#nix)
        + [FreeBSD](#freebsd)
    * [2. Install fisher](#2-install-fisher)
    * [3. Install my-fish and run my-fish](#3-install-my-fish-and-run-my-fish)

# Quick Start

With [fisher](https://github.com/jorgebucaran/fisher)

```
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

The following command installs this repo and [common fish packages that I use](https://github.com/publicarray/my-fish/blob/master/conf.d/my-fish.fish)

```sh
fisher install publicarray/my-fish
```

Configure shell to my preferences

**These are my personal preferences and as such it is not recommended to run the 'my-fish' command without knowing what it does. Please inspect [my-fish](https://github.com/publicarray/my-fish/blob/master/functions/my-fish.fish) beforehand**

```sh
my-fish
```

# Prepare installation on a new machine

## 1. Dependencies

* [Fish](http://fishshell.com)
* [Fisher](https://github.com/jorgebucaran/fisher)
* [Starship](https://starship.rs/) prompt `cargo install starship`
* A [Nerd Font](https://www.nerdfonts.com/) font installed and enabled in your terminal (for example, try the [Fira Code Nerd Font](https://www.nerdfonts.com/font-downloads))


### macOS

* Install [homebrew](https://brew.sh/)
* Install [fish](https://fishshell.com/#get_fish_osx)

```sh
# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install fish starship
brew tap homebrew/cask-fonts
brew cask install font-fira-code
# brew cask install font-firacode-nerd-font
```

* (Optional) Install extra commands

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

* (Optional) try other editors [micro - a modern text editor](https://github.com/zyedidia/micro)

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

### Ubuntu

* Install [fish](https://fishshell.com/#get_fish_linux)

```sh
sudo apt install software-properties-common
sudo apt-add-repository ppa:fish-shell/release-3
# nightly -> sudo add-apt-repository ppa:fish-shell/nightly-master
sudo apt update
sudo apt install fish

sudo add-apt-repository universe
sudo apt update
sudo apt install fonts-firacode
```

### Debian

* Install [fish](https://fishshell.com/#get_fish_linux)

[https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A2&package=fish](https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A2&package=fish)


```sh
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' > /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish
```

### Arch

```sh
sudo pacman -S fish
# one of the following fonts
# https://aur.archlinux.org/packages/?K=nerd-fonts&SB=p
yay -S starship nerd-fonts-fira-code
```

### RedHat (Fedora / CentOS)

* Install [fish](https://fishshell.com/#get_fish_linux)

[https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A2&package=fish](https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A2&package=fish)

#### Fedora

```sh
dnf install fish rust-starship
dnf copr enable evana/fira-code-fonts
dnf install fira-code-fonts
```

#### CentOS

```sh
cd /etc/yum.repos.d/
wget https://download.opensuse.org/repositories/shells:fish:release:3/CentOS_8/shells:fish:release:3.repo
yum install fish
```

### Gentoo

```sh
emerge fish app-shells/starship
emerge -av media-fonts/fira-code
```

### Nix

```sh
nix-env -i fish starship
```

### FreeBSD

* Install [fish](https://fishshell.com/#get_fish_bsd)

```sh
pkg install fish
portsnap fetch extract
portsnap fetch update
cd /usr/ports/shells/starship
make install clean
```

## 2. Install [fisher](https://github.com/jorgebucaran/fisher)

```sh
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

## 3. Install my-fish and run my-fish

```sh
# execute this in the fish shell
fish
fisher publicarray/my-fish
my-fish
```
