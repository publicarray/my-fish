set myfish_pkg oh-my-fish/plugin-hash oh-my-fish/plugin-osx oh-my-fish/plugin-php jorgebucaran/nvm.fish Shadowigor/plugin-errno-grep barnybug/docker-fish-completion franciscolourenco/done publicarray/free@patch-1 orefalo/g2 sijad/gitignore jethrokuan/z publicarray/update

function my-fish_install -e my-fish_install
  echo "Installing packages ..."
  set -S myfish_pkg
  for pkg in $myfish_pkg
    fisher install "$pkg"
  end
end

function my-fish_uninstall -e my-fish_uninstall
  echo "Removing packages ..."
  for pkg in $myfish_pkg
    fisher remove "$pkg"
  end
end
