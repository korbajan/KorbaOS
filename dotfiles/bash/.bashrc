#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# BLE.SH (zsh-like line editor: autosuggestions, syntax highlighting, menu completion).
# Must be sourced first; attached at the very end. Config: ~/.config/blesh/init.sh
# Without ble.sh, ~/.inputrc provides a readline-only fallback.
[ -f /usr/share/blesh/ble.sh ] && source -- /usr/share/blesh/ble.sh --attach=none

# HISTORY:
# don't put duplicate lines or lines starting with space
# in the history. See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups # append to the history file, don't overwrite it
shopt -s histappend # Write a multi line command in a single line
shopt -s cmdhist
HISTIGNORE="ls*:ll*:exit:shutdown*:clear:cd:top:htop*:history*"
# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTTIMEFORMAT="[%F %T] "
# Keep history in XDG data dir (like zsh's $ZSH/.zsh_history); migrate the old file once.
HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/bash/history"
mkdir -p "${HISTFILE%/*}"
if [ -f ~/.bash_history ] && [ ! -e "$HISTFILE" ]; then
  mv ~/.bash_history "$HISTFILE"
fi
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

## OTHER:
shopt -s dotglob

PS1='[\u@\h \W]\$ '

# AUTOCOMPLETIONS AND KEYBINDINGS
# With ble.sh, fzf is loaded through its integration in ~/.config/blesh/init.sh
if [[ ! ${BLE_VERSION-} ]]; then
  [ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
  [ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
fi


##### SOURCE COMMON #####
. ${HOME}/.config/shell/common_source.sh

# EVALS:
eval "$(zoxide init --cmd j bash)"
eval "$(mise activate bash)"
eval -- "$(/usr/bin/starship init bash --print-full-init)"

# Need this to be the last one cmd:
[[ ! ${BLE_VERSION-} ]] || ble-attach
