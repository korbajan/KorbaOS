alias run-ling3_0-tiny="llama-server \
  --hf-repo inclusionAI/Ling-3.0-tiny-GGUF \
  --hf-file Ling-3.0-tiny-Q4_K_M.gguf \
  -dev Vulkan1 -ngl 24 -ncmoe 99 \
  --port 8080"

# Bump every dep in ~/.local/package.json to its newest version.
# Needs @latest per package: npm update won't cross a 0.x minor (^0.85.1 stops at 0.85.x).
alias npm-update-local='npm --prefix ~/.local install $(node -p "Object.keys(require(process.env.HOME + \"/.local/package.json\").dependencies).map(d => d + \"@latest\").join(\" \")")'

# Salvaged from the old ArcoLinux .zshrc
## pacman / system
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias cleanup='sudo pacman -Rns $(command pacman -Qtdq)'
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
alias mirrorx="sudo reflector --age 6 --latest 20 --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias hw="hwinfo --short"
alias sysfailed="systemctl list-units --failed"

## yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

# ex = EXtractor for all kinds of archives; usage: ex <file>
ex() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.tar.xz)  tar xf "$1" ;;
      *.tar.zst) tar xf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.rar)     unrar x "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.tbz2)    tar xjf "$1" ;;
      *.tgz)     tar xzf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7z x "$1" ;;
      *.deb)     ar x "$1" ;;
      *)         echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# restish: REST API CLI; noglob (zsh-only) keeps ? and [] in URLs from being globbed
[ -n "$ZSH_VERSION" ] && alias restish="noglob restish"
#restish completion zsh > "${fpath[1]}/_restish"
