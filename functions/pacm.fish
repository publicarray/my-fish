function pacm --description 'alias to a AUR helper/pacman wrapper'
  # I just can't remeber them when I need them
  # pacm (pacman just shorter)

  # Pacman wrappers:
  if command -sq pacm
    # fallback if command already exists
    pacm $argv;
  else if command -sq paru
    # AUR  helper  pacman  rust  wrapper  yay
    paru $argv;
  else if command -sq yay
    # Yet another yogurt. Pacman wrapper and AUR helper written in go.
    yay $argv;
  else if command -sq pacaur
    # An AUR helper that minimizes user interaction (fork)
    pacaur $argv;
  else if command -sq pikaur
    # AUR helper which asks all questions before installing/building. Inspired by pacaur, yaourt and yay.
    pikaur $argv;
  else if command -sq trizen
    # Trizen AUR Package Manager: lightweight pacman wrapper and AUR helper.
    trizen $argv;

  # Search and build:
  else if command -sq rua
    # AUR helper in Rust providing control, review, patch application and safe build options.
    rua $argv;
  else if command -sq pamac
    # A Gtk3 frontend, Package Manager based on libalpm with AUR and Appstream support
    pamac $argv;
  end
end
