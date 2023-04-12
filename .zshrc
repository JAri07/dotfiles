setopt NOBEEP

### Set variables
#################
PATH="/usr/local/bin:/usr/local/sbin/:$PATH"
HISTFILE=$HOME/.zsh_history
HISTSIZE=500
SAVEHIST=500
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';

# Zap
[[ -e "$HOME/.local/share/zap/zap.zsh" ]] && source "$HOME/.local/share/zap/zap.zsh"

# Example install plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting" "122dc46"
plug "zap-zsh/vim"
plug "MAHcodes/distro-prompt"
autoload -U compinit
compinit

export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$HOME/.config/rofi/scripts:$PATH"
export PATH="~/.npm-global/bin:$PATH"
# export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="wezterm"

#editor
alias vi="nvims"
alias lg="lazygit"
#list
alias lsn="/usr/bin/ls --color=auto"
alias ls="exa --icons"

#cat
alias catn="/usr/bin/cat"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'

# add new fonts
alias update-fc='sudo fc-cache -fv'
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"

# switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

update ()
{
  if [[ -f /var/lib/pacman/db.lck ]] && sudo rm /var/lib/pacman/db.lck
  STATE=$(upower -d | grep state | sed -n "1p" | sed -e 's/^.* //')
	PERCENT=$(upower -d | grep percentage | sed -n "1p" | sed -e 's/^.* //' | tr -cd '0-9\n')
  if [[ "$STATE" == "discharging" && $((PERCENT)) -le 25 ]]; then
    notify-send -u critical "Battery is too low to update the system" "Plug-in the charger to update"
  else
    paru && cargo-install-update install-update --all && paccache-clear.sh
  fi
}

# ex = EXtractor for all kinds of archives
# usase: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.7z)        7z x $1      ;;
      *.Z)         uncompress $1;;
      *.bz2)       bunzip2 $1   ;;
      *.gz)        gunzip $1    ;;
      *.rar)       unrar x $1   ;;
      *.tar)       tar xf $1    ;;
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.vsix)      unzip $1     ;;
      *.zip)       unzip $1     ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

cat ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.md)   mdcat $1   ;;
      *)      bat --paging=never $1    ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Nvim config swicher
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-norm="NVIM_APPNAME=NormalNvim nvim"

function nvims ()
{
  items=("default" "LazyVim" "NormalNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

alias installed_packages_size="pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -hr | less"
alias du_orden_file='find . -maxdepth 1 -exec du -sh {} \; | sort -h'
alias du_orden_dir='find . -maxdepth 1 -type d -exec du -sh {} \; | sort -h'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -e "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# FZF
[[ -e /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -e /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

[[ -e "/home/zero/.ghcup/env" ]] && source "/home/zero/.ghcup/env"
