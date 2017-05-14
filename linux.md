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

```sh
```

## RedHat (Fedora / CentOS)

```sh
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
