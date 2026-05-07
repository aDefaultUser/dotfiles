export GPG_TTY=$(tty)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

autoload -Uz compinit
compinit

PROMPT='%F{green}%n@%m%f %F{blue}%1~%f %# '

alias ll='ls -la --color=auto'
alias gs='git status'

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

export PATH="$HOME/bin:$PATH"

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

if [ -z "${WAYLAND_DISPLAY}" ] && [ -z "${BASHRC_NO_GUI}" ] &&
  [ "$(tty)" = "/dev/tty1" ] || [ "$(tty)" = "/dev/ttyv0" ] ||
  [ "$(tty)" = "/dev/ttyC0" ]; then
 dbus-run-session start-hyprland
  exec killall -u $(whoami) -9
  exit
fi

alias ls='ls --color=auto'

alias su='doas -u root -s'
alias yt="yt-dlp --cookies ~/.ytdlp/cookies.txt"

if command -v emacsclient >/dev/null; then
    EDITOR="emacsclient --alternate-editor= --create-frame -nw"
    alias em="emacsclient --alternate-editor= --create-frame -nw"
else
    EDITOR="emacs -nw"
    alias em="emacs -nw"
fi

unalias ls 2>/dev/null || true
unalias ll 2>/dev/null || true
