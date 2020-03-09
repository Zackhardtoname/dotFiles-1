#
# ~/.bashrc
#
alias gitnotes='git --git-dir=.gitnotes'
alias githw='git --git-dir=.githw'
set -o vi

#move follow command
cpf() { cp "$@" && goto "$_"; }
mvf() { mv "$@" && goto "$_"; }
goto() { [ -d "$1" ] && cd "$1" || cd "$(dirname "$1")"; }

export GOOGLE_APPLICATION_CREDENTIALS="/home/gautierk/Keys/artifai-firebase-adminsdk.json"

force_color_prompt=yes

# prevent freezing on C-s
#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

pretty_csv() {
	cat "$@" | sed 's/,/ ,/g' | column -t -s, | less -S
}
# export -f cpf
# export -f mvf
# export -f pretty_csv
export QT_QPA_PLATFORMTHEME=flameshot
export HISTSIZE=10000
export HISEFILESIZE=10000

export FZF_CTRL_R_OPTS="-e" 

[[ $- != *i* ]] && return

#Git Auto-Completion
test -f ~/.git-completion.bash && . $_

export PATH=$PATH:/home/gautierk/.vim/bundle/vim-live-latex-preview/bin:/home/gautierk/.local/bin
export PATH="$HOME/.dynamic-colors/bin:$PATH"
PATH="home/gautierk/.local/bin/scripts:${PATH}"
PATH="/root/.local/bin:${PATH}"
export PATH

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


source $HOME/.dynamic-colors/completions/dynamic-colors.bash


colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""

# PS1='\e[32;1mcole\e[31m@\e[36mpc: \e[33m\W\e[0m\$ '
PS1='\[$(tput bold)$(tput setaf 2)\]cole\[$(tput setaf 1)\]@\[$(tput setaf 6)\]pc: \[$(tput setaf 3)\]\W\[$(tput sgr0)\]\$ '



 [[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
 [[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
 [[ -z ${match_lhs}    ]] \
 	&& type -P dircolors >/dev/null \
 	&& match_lhs=$(dircolors --print-database)
 [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true
 
 if ${use_color} ; then
 	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
 	if type -P dircolors >/dev/null ; then
 		if [[ -f ~/.dir_colors ]] ; then
 			eval $(dircolors -b ~/.dir_colors)
 		elif [[ -f /etc/DIR_COLORS ]] ; then
 			eval $(dircolors -b /etc/DIR_COLORS)
 		fi
 	fi
 
 	if [[ ${EUID} == 0 ]] ; then
 		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
 	else
    PS1='\[$(tput bold)$(tput setaf 2)\]cole\[$(tput setaf 1)\]@\[$(tput setaf 6)\]pc: \[$(tput setaf 3)\]\W\[$(tput sgr0)\]\$ '
 	fi
 
 	alias ls='ls --color=auto'
  alias rm='rm -I'
 	alias grep='grep --colour=auto'
 	alias egrep='egrep --colour=auto'
 	alias fgrep='fgrep --colour=auto'

	export TODOTXT_DEFAULT_ACTION=ls
	alias t='$HOME/.local/bin/scripts/todo/todo.sh -d $HOME/.local/bin/scripts/todo/todo.cfg'

    #xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", $5, $8 }'

 else
 	if [[ ${EUID} == 0 ]] ; then
 		# show root@ when we don't have colors
 		PS1='\u@\h \W \$ '
 	else
 		PS1='\u@\h \w \$ '
 	fi
 fi

unset use_color safe_term match_lhs sh

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"


export EDITOR="/usr/bin/nvim"
export VISUAL=nvim
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
