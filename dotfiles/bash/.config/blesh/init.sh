# ~/.config/blesh/init.sh – ble.sh config, loaded by ble.sh from ~/.bashrc.
# Autosuggestions from history (complete_auto_history) and syntax highlighting
# are ble.sh defaults. Accept suggestion: → / End / C-f (whole), C-→ (word).

# No bell (zsh: NO_BEEP)
bleopt edit_bell=

# Up/Down: prefix history search (substring search is fzf's C-r)
ble-bind -f up   'history-search-backward hide-status'
ble-bind -f down 'history-search-forward hide-status'

# TAB: ble.sh's own completion menu (~/.inputrc maps TAB for plain readline)
ble-bind -f 'C-i' 'complete'
ble-bind -f 'S-TAB' 'menu-complete backward'

# fzf: C-r, C-t, M-c and **<TAB>. bash-completion is already loaded by /etc/bash.bashrc.
_ble_contrib_fzf_base=/usr/share/fzf
ble-import -d integration/fzf-completion
ble-import -d integration/fzf-key-bindings
