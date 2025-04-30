setup: brew-sync dots-sync

brew-sync:
  HOMEBREW_NO_AUTO_UPDATE=1 /opt/homebrew/bin/brew bundle --file=./Brewfile --cleanup --no-upgrade

dots-sync:
  stow dots -t $HOME
