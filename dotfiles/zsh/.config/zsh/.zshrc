# OPTIONS:
## ZSH-HOME:
export ZSH=$HOME/.local/share/zsh
## HISTORY:
### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history
### How many commands zsh will load to memory.
export HISTSIZE=100000
### How many commands history will save on file.
export SAVEHIST=1000000
### History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS
### History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS
### share commands between terminal instances or not
unsetopt SHARE_HISTORY
setopt EXTENDED_HISTORY
export HISTCONTROL=ignoreboth:erasedups
hgrep () { fc -Dlim "*$@*" 1 }
alias history="history 1"
# bindkey -v
## OTHER:
setopt GLOB_DOTS
setopt NO_BEEP

COMPLETION_WAITING_DOTS="true" # TODO: does it work?


# Bind keys:
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char


# PLUGINS:
## global:
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
  source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# AUTOCOMPLETIONS AND KEYBINDINGS
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

autoload -U compinit
compinit
# zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:*' menu select

##### SOURCE COMMON #####
. ${HOME}/.config/shell/common_source.sh

# EVALS:
eval "$(zoxide init --cmd j zsh)"
eval "$(mise activate zsh)"
# Need this to be the last one cmd:
eval "$(starship init zsh)"
