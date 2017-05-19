# 1. Install [fish](https://fishshell.com/) > 2.3

## Ubuntu

```sh
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:fish-shell/release-2
# nightly -> sudo add-apt-repository ppa:fish-shell/nightly-master
sudo apt-get update
sudo apt-get install fish
```

## Debian

https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A2&package=fish

```sh
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' > /etc/apt/sources.list.d/fish.list 
apt-get update
apt-get install fish
```

## RedHat (Fedora / CentOS)

https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A2&package=fish

### RHEL
```sh
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/RedHat_RHEL-6/shells:fish:release:2.repo
yum install fish
```

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
```

## Gentoo

```sh
emerge fish
```

# 2. Make fish default

```sh
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/bin/fish
```

# 3. Install [Fisherman](https://github.com/fisherman/fisherman)

```sh
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
```

# 4. Install my-fish, prompt and other Fisherman plug-ins

```sh
fisher publicarray/my-fish
#my-fish
```
