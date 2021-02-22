function aur --description 'alias to a AUR helper/pacman wrapper'
  if command -sq aur
    # fallback if command already exists
    aur $argv;
  else
    # see pacm.fish
    pacm $argv;
  end
end
