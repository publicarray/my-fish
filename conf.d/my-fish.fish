set -a -g _myfish_pkg oh-my-fish/plugin-hash
set -a -g _myfish_pkg oh-my-fish/plugin-osx
set -a -g _myfish_pkg oh-my-fish/plugin-php
set -a -g _myfish_pkg jorgebucaran/nvm.fish
set -a -g _myfish_pkg Shadowigor/plugin-errno-grep
set -a -g _myfish_pkg barnybug/docker-fish-completion
set -a -g _myfish_pkg franciscolourenco/done
set -a -g _myfish_pkg publicarray/free@patch-1
set -a -g _myfish_pkg orefalo/g2
set -a -g _myfish_pkg jethrokuan/z
set -a -g _myfish_pkg publicarray/update
set -a -g _myfish_pkg jorgebucaran/autopair.fish

function _my-fish_install --on-event my-fish_install
  echo "Installing dependent packages ..."
  for pkg in $_myfish_pkg
    fisher install "$pkg"
  end
end

function _my-fish_update --on-event my-fish_update
  # Migrate resources, print warnings, and other update logic.
end

function _my-fish_uninstall --on-event my-fish_uninstall
  echo "Removing dependent packages ..."
  for pkg in $_myfish_pkg
    fisher remove "$pkg"
  end
end
