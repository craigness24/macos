HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

PAGER=less
CLICLOLOR=1
VISUAL=nvim
EDITOR=nvim

alias ls='lsd'
alias l='ls -a'
alias la='ls -la'
alias ll='ls -lhtr'
alias lt='ls --tree'
alias cat='bat --paging=never'
alias vi='nvim'

# kuernetes
alias k='kubectl'
alias kgp='k get pods'
alias kc='kubectx'
alias kn='kubens'
alias kw='echo "$(kc -c) ($(kn -c))"'

# git
alias gp='git pull'
alias gs='git status'
alias lg='lazygit'

# not working - trying to bind ~ to Delete key
# bindkey "^[[3~" delete-char

# Allow test container support using colima
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE="/var/run/docker.sock"
# This DOCKER_HOST must match the url in `docker context ls`
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"


if type brew &>/dev/null; then
  # some brew packages install completions into this directory
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  # required to source completions
  autoload -Uz compinit
  compinit
fi
# custom zsh sources from brew packages
source $(brew --prefix)/opt/fzf/shell/completion.zsh
source $(brew --prefix)/opt/fzf/shell/key-bindings.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# evals at the end of file.. order matters!
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"  # this also replaces the cd command with z
