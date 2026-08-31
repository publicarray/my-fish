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
        + [Windows 11](#windows-11)
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

Apply my gnome-terminal palette (stock Adwaita reworked for a dark background:
a much brighter bright-blue, and a yellow that isn't brown)

```sh
terminal-colours        # write the palette to the default profile
terminal-colours export # dump the current gnome-terminal dconf settings
terminal-colours-test   # colour test pattern: palette, attributes, 256 cube, truecolor
```

The full profile dump lives in [terminal/gnome-terminal.dconf](terminal/gnome-terminal.dconf)
and can be restored with `dconf load /org/gnome/terminal/ < terminal/gnome-terminal.dconf`
(that also restores the window size and profile name, and only matches a profile
with the same UUID).

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
sudo apt-add-repository ppa:fish-shell/release-4
# nightly -> sudo add-apt-repository ppa:fish-shell/nightly-master
sudo apt update
sudo apt install fish

sudo add-apt-repository universe
sudo apt update
sudo apt install fonts-firacode
```

### Debian

* Install [fish](https://fishshell.com/#get_fish_linux)

[https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A4&package=fish](https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A4&package=fish)

Debian 13 (trixie), swap `Debian_13` for your release.

```sh
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/4/Debian_13/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:4.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:4/Debian_13/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_4.gpg > /dev/null
sudo apt update
sudo apt install fish
```

### Arch

```sh
sudo pacman -S fish starship
# https://wiki.archlinux.org/title/Nerd_Fonts
sudo pacman -S ttf-firacode-nerd
```

* (Optional) Install extra commands

  `bat`, `eza`, `xh`, `procs` and `skim` are detected and used automatically by
  `my-fish` functions (man pages, `ls`/`ll`, `http`, `ps`, `sk`) when present.
  The rest are just recommended standalone tools, not wired into anything.
  `git-delta` (git pager) and `tealdeer`'s cache are configured automatically by
  `my-fish` when present, see [3. Install my-fish and run my-fish](#3-install-my-fish-and-run-my-fish).

```sh
sudo pacman -S fzf ripgrep fd bat tealdeer yt-dlp eza xh procs \
  btop bottom dust dua-cli jq hyperfine lazygit glow miniserve git-delta
# skim: in CachyOS repos, AUR on vanilla Arch
sudo pacman -S skim # or: paru -S skim
# pay-respects (used by fuck.fish)
paru -S pay-respects

# optional: rust rewrites of coreutils/sudo
sudo pacman -S uutils-coreutils sudo-rs
```

### RedHat (Fedora / CentOS)

* Install [fish](https://fishshell.com/#get_fish_linux)

[https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A4&package=fish](https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A4&package=fish)

#### Fedora

```sh
sudo dnf install fish fira-code-fonts
sudo dnf copr enable atim/starship
sudo dnf install starship
```

#### CentOS

```sh
cd /etc/yum.repos.d/
sudo wget https://download.opensuse.org/repositories/shells:fish:release:3/CentOS-9_Stream/shells:fish:release:3.repo
sudo yum install fish
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

### Windows 11

Native PowerShell setup with starship and modern CLI tools via
[winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/)

```powershell
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id Microsoft.PowerShell
winget install -e --id Git.Git
winget install -e --id Starship.Starship
winget install -e --id DEVCOM.JetBrainsMonoNerdFont
```

Add Starship to your profile:

```powershell
New-Item -Path $PROFILE -Type File -Force | Out-Null
$init = 'Invoke-Expression (&starship init powershell)'
if (-not (Select-String -Path $PROFILE -Pattern $init -SimpleMatch -Quiet)) { $init >> $PROFILE }
```

Hide the copyright/welcome banner (prints before `$PROFILE` loads, so `-NoLogo`
has to go on the launch command itself, not in the profile): Windows Terminal
→ Settings (`Ctrl+,`) → select the **Windows PowerShell** profile → Command
line → append ` -NoLogo`. Repeat for the **PowerShell** (7) profile.

* [micro](https://github.com/zyedidia/micro) — nano-like terminal editor, cross-platform

```powershell
winget install -e --id zyedidia.micro
[Environment]::SetEnvironmentVariable('EDITOR', 'micro', 'User')
```

* Install extra commands

```powershell
winget install -e --id FujiApple.Trippy
winget install -e --id orf.gping
winget install -e --id junegunn.fzf
winget install -e --id BurntSushi.ripgrep.MSVC
winget install -e --id sharkdp.fd
winget install -e --id sharkdp.bat
winget install -e --id dbrgn.tealdeer
winget install -e --id yt-dlp.yt-dlp
winget install -e --id eza-community.eza
winget install -e --id ducaale.xh
winget install -e --id dalance.procs
winget install -e --id Clement.bottom
winget install -e --id bootandy.dust
winget install -e --id jqlang.jq
winget install -e --id sharkdp.hyperfine
winget install -e --id JesseDuffield.lazygit
winget install -e --id charmbracelet.glow
winget install -e --id svenstaro.miniserve
winget install -e --id dandavison.delta
# rust rewrite of coreutils/findutils/grep, maintained by Microsoft
winget install -e --id Microsoft.Coreutils
```

`skim` and `pay-respects` installable via `cargo install skim` / `cargo install pay-respects` if you have Rust installed.

Edit your profile to add aliases: `notepad $PROFILE` or `micro $PROFILE`

```powershell
Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue
function ls { eza --icons=auto @args }
function ll { eza -l --group-directories-first --icons=auto @args }
Remove-Item Alias:cat -Force -ErrorAction SilentlyContinue
function cat { bat @args }
function c { bat @args }
Remove-Item Alias:ps -Force -ErrorAction SilentlyContinue
function ps { procs @args }
function http { xh @args }
function ff { fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' }

# no native `ip` on Windows; closest built-in equivalent to `ip a`/`ip r`/`ip link`
function ip {
    param([Parameter(ValueFromRemainingArguments)]$rest)
    $sub = if ($rest) { $rest[0] }
    if ($sub -in 'r', 'route') { Get-NetRoute }
    elseif ($sub -in 'l', 'link') { Get-NetAdapter }
    else { Get-NetIPConfiguration -Detailed }
}

# safer rm: moves to the Recycle Bin instead of deleting outright
Add-Type -AssemblyName Microsoft.VisualBasic
Remove-Item Alias:rm -Force -ErrorAction SilentlyContinue
function rm {
    param([Parameter(ValueFromRemainingArguments)]$Paths)
    foreach ($p in $Paths) {
        $full = Resolve-Path $p -ErrorAction SilentlyContinue
        if (-not $full) { Write-Error "rm: cannot remove '$p': No such file or directory"; continue }
        if (Test-Path $full -PathType Container) {
            [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory($full, 'OnlyErrorDialogs', 'SendToRecycleBin')
        } else {
            [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile($full, 'OnlyErrorDialogs', 'SendToRecycleBin')
        }
    }
}
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
