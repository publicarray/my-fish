# 1. Install [fish](https://fishshell.com/) > 2.3 and [starship](https://starship.rs/) `cargo install starship`

## macOS

```sh
# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install fish starship
```

## Ubuntu

```sh
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:fish-shell/release-2
# nightly -> sudo add-apt-repository ppa:fish-shell/nightly-master
sudo apt-get update
sudo apt-get install fish
```

## Debian

[https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A2&package=fish](https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A2&package=fish)


```sh
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' > /etc/apt/sources.list.d/fish.list 
apt-get update
apt-get install fish
```

## RedHat (Fedora / CentOS)

[https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A2&package=fish](https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A2&package=fish)


### Fedora

```sh
dnf config-manager --add-repo http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_25/shells:fish:release:2.repo
dnf install fish
```

### CentOS

```sh
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
yum install fish
```

## Arch

```sh
pacman -S fish
yay -S starship
```

## Gentoo

```sh
emerge fish
```

## Nix

```sh
nix-env -i fish starship
```

# 2. Install [Fisherman](https://github.com/fisherman/fisherman)

```sh
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

# 3. Install my-fish and other Fisherman plug-ins

```sh
# execute this in the fish shell
fish
fisher publicarray/my-fish
my-fish
```
