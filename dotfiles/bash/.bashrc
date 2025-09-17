#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# HISTORY:
# don't put duplicate lines or lines starting with space 
# in the history. See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups # append to the history file, don't overwrite it
shopt -s histappend # Write a multi line command in a single line
shopt -s cmdhist
HISTIGNORE=”ls*:ll*:exit:shutdown*:clear:cd:top:htop*:history*”
# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
# export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# PROMPT_COMMAND='history -a'

PS1='[\u@\h \W]\$ '

# AUTOCOMPLETIONS AND KEYBINDINGS
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash


##### SOURCE COMMON #####
. ${HOME}/.config/shell/common_source.sh

# EVALS:
eval -- "$(/usr/bin/starship init bash --print-full-init)"
eval "$(zoxide init --cmd j bash)"
