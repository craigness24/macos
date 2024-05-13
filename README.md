## Initial Setup
On a fresh macos installation: 
* install [homebew](https://brew.sh)
* `brew install ansible`
* create a `vars/hostname.yml`

## Run playbook
```shell
ansible-playbook play_macos.yml

# Alternatively individual task files
ansible-playbook play_macos.yml -t brew
ansible-playbook play_macos.yml -t dotfile
```

## References
* Inspiration from 
  * [mischavandenburg](https://github.com/mischavandenburg/dotfiles)
  * [geerlingguy](https://github.com/geerlingguy/mac-dev-playbook)
* [k9s](https://github.com/derailed/k9s)
* [lazyvim](https://www.lazyvim.org/installation)


## TODO 
[x] Always maintain brew installed packages the same as the brew vars list - even when removed. compare `brew leaves` and `brew ls --casks -1` against brew vars

[] Auto remove taps when removed from config

[] Cleanup dotfile symlinks when removed from vars


## brew
Original dump created with `brew bundle dump`. Initial sync will have to be run manually using brew bundle with the brew file - afterwards use the `just sync` command from the `Justfile`.
```shell
HOMEBREW_NO_AUTO_UPDATE=1 /opt/homebrew/bin/brew bundle dump
HOMEBREW_NO_AUTO_UPDATE=1 /opt/homebrew/bin/brew bundle --file="$HOME/Brewfile" --cleanup --no-upgrade
```
