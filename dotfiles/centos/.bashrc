# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -lah'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# history
HISTSIZE=2000000
HISTFILESIZE=10000000
HISTTIMEFORMAT='%Y-%m-%d %T  '
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -u histappend

# prompt
source ~/.git-prompt.sh
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=
export PS1='$(__git_ps1 "\[\e[30;42m\] %s \[\e[32;47m\]")\[\e[30;47m\] \D{%Y/%m/%d %H:%M} \[\e[37;46m\] \[\e[30;46m\]\h \[\e[36;43m\] \[\e[30;43m\]\w \[\e[33;40m\]\[\e[0m\]\n> '

# direnv
alias dpipenv="echo 'layout_pipenv' > .envrc && direnv allow"
alias dpoetry="cat ~/.envrc_poetry > .envrc && direnv allow"

# ghq peco
_cd_ghq() {
    local _cmd=$(ghq list | peco --query "$READLINE_LINE")
    READLINE_LINE="cd $(ghq root)/${_cmd}"
    READLINE_POINT=${#READLINE_LINE}
}
bind -x '"\C-g": _cd_ghq'

# history peco
_peco_history() {
    local _cmd=$(HISTTIMEFORMAT= history | tac | sed -e 's/^\s*[0-9]\+\s\+//' | peco --query "$READLINE_LINE")
    READLINE_LINE="$_cmd"
    READLINE_POINT=${#_cmd}
}
bind -x '"\C-r": _peco_history'

# emacs
export ALTERNATE_EDITOR=""
alias emacs="TERM=xterm-24bit emacs"
alias emacsclient="TERM=xterm-24bit emacsclient"
alias es="emacs --daemon"
alias ek="emacsclient -e '(kill-emacs)'"
alias er="ek && es"
alias e="emacsclient -t -a ''"
alias E="emacsclient -c -a ''"
export EDITOR="emacsclient -t -a ''"
