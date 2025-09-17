
# korba aliases
alias e="nvim"
alias dusort="du -d 1 -h | sort -h --reverse"
alias dmenu="dmenu -h 30 -nb '#3b4252' -sb '#88c0d0' -nf '#b48ead' -sf '#3b4252' -fn 'SauceCodeProNerdFont:regular:pixelsize=14'"
alias fcd='cd $(ls -d */ | fzf)'

alias start_docker="sudo systemctl start docker"
alias start_libvirt="sudo systemctl start libvirtd"
alias docker_container_prune="docker ps -a | grep -v CONTAINER | awk '{print \$1}' | xargs -I {} docker rm -f {}"
alias downloadtest="speedtest --simple --no-upload --single --bytes"
alias TODO="nvim $HOME/Projects/TODO.txt"
alias cd_win="cd $HOME/VmSharedFolders/windows_guests"
#alias start-windows="vboxmanage startvm vmware_win11"
# alias save-windows="vboxmanage controlvm vmware_win11 savestate"
# alias stop-windows="vboxmanage controlvm vmware_win11 poweroff"
# alias start-ubuntu-kube="vboxmanage startvm ubuntu_server --type=headless"
# alias save-ubuntu-kube="vboxmanage controlvm ubuntu_server savestate"
# alias stop-ubuntu-kube="vboxmanage controlvm ubuntu_server poweroff"
# alias start-ubuntu-bpf="vboxmanage startvm ubuntu_bpf --type=headless"
# alias save-ubuntu-bpf="vboxmanage controlvm ubuntu_bpf savestate"
# alias stop-ubuntu-bpf="vboxmanage controlvm ubuntu_bpf poweroff"
# alias start-fedora-bpf="vboxmanage startvm fedora_server --type=headless"
# alias save-fedora-bpf="vboxmanage controlvm fedora_server savestate"
# alias stop-feadora-bpf="vboxmanage controlvm fedora_server poweroff"

alias tmux="TERM=xterm-256color tmux"
alias l="eza"
alias le="eza -l --no-permissions --no-filesize --no-user --no-time --only-files | fzf-tmux -p --reverse | xargs nvim"
alias show='exa --long --all --group-directories-first --across --extended --git'

alias hx="helix"
alias kcontext="kubectl config get-contexts | awk '{print \$1}' | fzf"

if [ -d "${HOME}/.garden/bin" ] ;
  then alias garden=~/.garden/bin/garden
fi

alias restish="noglob restish"
#restish completion zsh > "${fpath[1]}/_restish"


### K8S:

function kind-node-images() {
  #cluster=$1
  cluster=$(kind get clusters | head -1)
  docker exec -it ${cluster}-control-plane crictl images
}

autoload -U compinit; compinit
#eval "$(ssh-agent -s)"
#eval "$(ssh-agent -s)"
#eval "$(ssh-agent -s)"
# eval "$(ssh-agent -s)" > /dev/null

### SOURCES:

#source ~/SystemSetup/sources/cdmkdir
#source ~/.chatgpt/token
[ -f /home/jakub/SystemSetup/sources/tilt_autocompletion.source ] && source /home/jakub/SystemSetup/sources/tilt_autocompletion.source

eval "$(zoxide init --cmd j zsh)"
#eval $(thefuck --alias wtf)
eval "$(starship init zsh)"
