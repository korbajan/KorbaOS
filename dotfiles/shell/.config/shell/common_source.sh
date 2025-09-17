# ENV:
export EDITOR="helix"
export VISUAL="helix"
export GOPATH="${HOME}/.local/share/go"

# PATH:
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "${GOPATH}/bin" ] ;
  then PATH="${GOPATH}/bin:$PATH"
elif [ -d "$HOME/go/bin" ] ;
  then PATH="$HOME/go/bin:$PATH"
fi
if [ -d "${HOME}/.krew/bin" ] ;
  then PATH="${PATH}:${HOME}/.krew/bin"
fi
if [ -d "${HOME}/.nix-profile/bin" ] ;
  then PATH="${PATH}:${HOME}/.nix-profile/bin"
fi
if [ -d "${HOME}/.cargo/bin" ] ;
  then PATH="${PATH}:${HOME}/.cargo/bin"
fi

# ALIASES:
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -alFh'
alias l='ls'
alias l.="ls -A | egrep '^\.'"
alias grep='grep --color=auto'
alias free="free -mt"
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
#add new fonts
alias fc-update='sudo fc-cache -fv'
## pacman bits:
alias pacman="sudo pacman --color auto"
alias update="sudo pacman -Syu"
alias updateall='sudo paru -Syu'
alias pamac-unlock="sudo rm /var/lib/pacman/db.lck"
###Cleanup orphaned packages
alias pacman-cleanup-orphaned='sudo pacman -Rns $(pacman -Qtdq)'
if command -v reflector &> /dev/null; then
  ##get fastest mirrors in your neighborhood
  alias pacman-udpate-mirrorlist="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
  alias pacman-udpate-mirrorlist-by-delay="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
  alias pacman-udpate-mirrorlist-by-score="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
  alias pacman-udpate-mirrorlist-by-age="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
fi
if command -v expac &> /dev/null; then
  alias expac-hist="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | nl"
fi
##switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
##audio check pulseaudio or pipewire
alias which-audio="pactl info | grep 'Server Name'"
##which graphical card is working
alias which-vga="lspci -vnnn | perl -lne 'print if /^\d+\:.+(\[\S+\:\S+\])/' | grep VGA"
##check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'
##search content with ripgrep
alias rg="rg --sort path"
##get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

##gpg
###verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
###receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

##fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
if [ -d $HOME/.local/fixes-lib ]; then
  alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
  alias key-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
  alias keys-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
  alias fixkey="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
  alias fixkeys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
  alias fix-key="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
  alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
  alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
  alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"
fi
##systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sys-failed="systemctl list-units --failed"
alias sys-enabled="systemctl list-unit-files --state=enabled"

if command -v zoxide &> /dev/null; then
  alias j='zoxide'
fi
if command -v eza &> /dev/null; then
  alias ls='eza -1'
  alias le='hx $(eza -1 --group-directories-first --recurse --all --absolute --only-files | fzf --exact --multi --ghost="file name")'
fi
if command -v helix &> /dev/null; then
  alias hx="helix"
fi
if command -v nvim >/dev/null 2>&1; then
  alias e="nvim"
fi

alias fcd='cd $(ls -d */ | fzf)'

alias dusort="du -d 1 -h | sort -h --reverse"

if command -v dmenu >/dev/null 2>&1; then
  alias dmenu="dmenu -h 30 -nb '#3b4252' -sb '#88c0d0' -nf '#b48ead' -sf '#3b4252' -fn 'SauceCodeProNerdFont:regular:pixelsize=14'"
fi

if command -v docker >/dev/null 2>&1; then
  alias start_docker="sudo systemctl start docker"
  alias docker_container_prune="docker ps -a | grep -v CONTAINER | awk '{print \$1}' | xargs -I {} docker rm -f {}"
fi

if command -v virsh >/dev/null 2>&1; then
  alias start_libvirt="sudo systemctl start libvirtd"
fi

if command -v speedtest >/dev/null 2>&1; then
  alias downloadtest="speedtest --simple --no-upload --single --bytes"
fi

if command -v tmux >/dev/null 2>&1; then
  alias tmux="TERM=xterm-256color tmux"
fi
alias show='exa --long --all --group-directories-first --across --extended --git'

alias hx="helix"
alias kcontext="kubectl config get-contexts | awk '{print \$1}' | fzf"

if [ -d "${HOME}/.garden/bin" ] ;
  then alias garden=~/.garden/bin/garden
fi

# alias restish="noglob restish"
#restish completion zsh > "${fpath[1]}/_restish"

#Functions:
function unpack () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via unpack()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function pacman-list-installed-from() {
# params:
#   repo-name
  comm -1 -2 <(pacman -Q|awk '{print $1}'|sort) <(pacman -Sl $1 | awk '{print $2}'|sort)
}

if command -v kind >/dev/null 2>&1; then
  function kind-node-images() {
    #cluster=$1
    cluster=$(kind get clusters | head -1)
    docker exec -it ${cluster}-control-plane crictl images
  }
fi

# dev:
. ${HOME}/.config/zsh/python.zshrc
[[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"
