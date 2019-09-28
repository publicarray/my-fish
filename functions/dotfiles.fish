function dotfiles -d "Configure your dotfiles in your editor"
  set -l editor
  if command -sq subl
    set editor subl
  else if command -sq atom
    set editor atom
  end

  if test -z "$argv"
    eval $editor -n ~/.dotfiles
  else if test "$argv" = 'remove'
    ~/.dotfiles/setup/remove.sh
  else if test "$argv" = 'setup'
    ~/.dotfiles/setup/install.sh
  else if test "$argv" = 'user'
    eval $editor ~/.usershell
  else if test "$argv" = 'git'
    eval $editor -n ~/.gitconfig
    eval $editor ~/.gitignore_global
  else if test "$argv" = 'bash'
    eval $editor -n ~/.bashrc
    eval $editor ~/.bash_profile
  else if test "$argv" = 'fish'
    eval $editor -n ~/.config/fish
  else if test "$argv" = 'starship'
    eval $editor -n ~/.config/starship.toml
  else if test "$argv" = 'zsh'
    eval $editor -n ~/.zshrc
    eval $editor ~/.zprofile
    eval $editor ~/.zlogin
    eval $editor ~/.zlogout
  else if test "$argv" = 'prezto'
    eval $editor -n ~/.zpreztorc
    eval $editor ~/.zshenv
    eval $editor ~/.zprofile
    eval $editor ~/.zshrc
    eval $editor ~/.zshenv
    eval $editor ~/.zlogin
    eval $editor ~/.zlogout
  else
    echo "Unknown command $argv"
  end
end
