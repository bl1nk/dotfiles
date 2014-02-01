# $HOME/.zshrc
# bl1nk - http://kuchen.io

# ZSH options {{{

# Don't show input while loading
stty -echo

ZDOTDIR="$HOME/.zsh"

# History {{{
HISTFILE=~/.zsh/histfile
HISTSIZE=10000
SAVEHIST=500000
readonly HISTFILE
export HISTFILE HISTSIZE SAVEHIST
# }}}
# ZSH functions {{{

bindkey -e
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[3~' delete-char
bindkey '\e[2~' overwrite-mode
bindkey "^[[7~" beginning-of-line # Pos1
bindkey "^[[8~" end-of-line # End
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# When tab-completing, show dots. For fast tab completes, they will be
# overwritten instantly, for long tab-completions, you have feedback.
expand-or-complete-with-dots() {
	echo -n -e "${RED}...\e[0m\033[3D"
	zle expand-or-complete
	zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# Have a bell-character put out, everytime a command finishes. This will set the urgent-hint,
# if the terminal is configured accordingly
bellchar=$'\a'
setterm -blength 0 # Don't REALLY beep
zle-line-init () { echo -n "$bellchar" }
zle -N zle-line-init

# "cd......" ;)
_rationalise-dot() {
	if [[ $LBUFFER = "cd "* ]]; then
		if [[ $LBUFFER = *.. ]]; then
			LBUFFER+=/..
		else
			LBUFFER+=.
		fi
	else
		LBUFFER+=.
	fi
}
zle -N _rationalise-dot
bindkey . _rationalise-dot

# update terminal title
precmd() {
	if [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ $TERM == ansi ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
		printf "\33]2;$USER@$HOST: ${PWD/#$HOME/~}\007" $1
	fi
}
autoload -U colors
colors

autoload -U zmv

# .. -> cd ../
setopt autocd

# cd /etc/**/foo/blub searches ;)
setopt extendedglob

# push cds to directory stack
setopt auto_pushd

# don't push something twice
setopt pushd_ignore_dups

# don't kill jobs when exiting shell 
setopt no_hup
# and don't warn
setopt no_check_jobs

# show us when some command didn't exit with 0
setopt print_exit_value

setopt no_clobber
setopt inc_append_history
setopt no_bg_nice
setopt share_history
setopt bang_hist
setopt extended_history
setopt hist_ignore_space
setopt hist_find_no_dups
setopt nohistverify
setopt prompt_subst
setopt hist_fcntl_lock
setopt always_to_end

unsetopt auto_remove_slash

setopt COMPLETE_IN_WORD

setopt EXTENDED_GLOB
unsetopt mail_warning
unset MAILCHECK

setopt short_loops

# show the output of time if commands takes longer than n secs (only user+system)
REPORTTIME=5

# allow comments in interactive shells
setopt interactivecomments

# ignore lines starting with a space
setopt hist_ignore_space

# disable XON/XOFF flow control (^s/^q)
stty -ixon

# NO BEEPING!
setopt no_BEEP

# Don't display an error if there are no matches, I know what I am doing
setopt no_NOMATCH

# }}}
# Completion stuff {{{

autoload -Uz compinit
compinit

unsetopt correct_all

# correct 7etc/foo to /etc/foo
# if anyone has a working solution for /etc7foo please contact me
function _7slash {
if [[ $words[CURRENT] = 7(#b)(*)(#e) ]]
then
	compadd -U -X 'Correct leading 7 to /' -f /$match[1]
fi
}

zstyle :compinstall filename '$HOME/.zshrc'

# performance tweaks
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zsh/cache
zstyle ':completion:*' use-perl on

# completion colours
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' completer _complete _match _approximate _7slash 
zstyle ':completion:*:match:*' original only

# allow more mistypes if longer command
#zstyle -e ':completion:*:approximate:*' \
	#        max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# ignore completion for commands we don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

# get rid of .class and .o files for vim
zstyle ':completion:*:vim:*' ignored-patterns '*.(class|o)'

# show menu when tabbing
zstyle ':completion:*' menu yes select

# better completion for kill
zstyle ':completion:*:*:kill:*' command 'ps --forest -u$USER -o pid,%cpu,tty,cputime,cmd'

# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
compdef pkill=killall

# bugged with zsh 4.3.10 for whatever reason
zstyle ':completion:*' file-sort time
#zstyle ':completion:*' file-sort name

# Ignore same file on rm
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

zstyle ':completion:*:wine:*' file-patterns '*.(exe|EXE):exe'

# don't complete usernames (the come from localhost!)
zstyle ':completion:*:(ssh|scp):*' users

# complete ssh hostnames
[[ -r ~/.ssh/known_hosts ]] && _ssh_hosts=(${${${${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}%%:*}#\[}%\]}) || _ssh_hosts=()
[[ -r ~/.ssh/config ]] && _ssh_config_hosts=($(sed -rn 's/host\s+(.+)/\1/ip' "$HOME/.ssh/config" | grep -v "\*" )) || _ssh_config_hosts=()
hosts=(
$HOST
"$_ssh_hosts[@]"
$_ssh_config_hosts[@]
localhost
)
zstyle ':completion:*:hosts' hosts $hosts

# automagic url quoter
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# e.g. ls foo//bar -> ls foo/bar
zstyle ':completion:*' squeeze-slashes true

# if in foo/bar don't show bar when cd ../<TAB>
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Prevent lost+found directory from being completed
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found'

# ignore case when completing
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# make some stuff look better
# from: http://ft.bewatermyfriend.org/comp/zsh/zshrc.d/compsys.html
zstyle ':completion:*:descriptions' format "- %{${fg[yellow]}%}%d%{${reset_color}%} -"
zstyle ':completion:*:messages'     format "- %{${fg[cyan]}%}%d%{${reset_color}%} -"
zstyle ':completion:*:corrections'  format "- %{${fg[yellow]}%}%d%{${reset_color}%} - (%{${fg[cyan]}%}errors %e%{${reset_color}%})"
zstyle ':completion:*:default'      \
	select-prompt \
	"%{${fg[yellow]}%}Match %{${fg_bold[cyan]}%}%m%{${fg_no_bold[yellow]}%}  Line %{${fg_bold[cyan]}%}%l%{${fg_no_bold[red]}%}  %p%{${reset_color}%}"
zstyle ':completion:*:default'      \
	list-prompt   \
	"%{${fg[yellow]}%}Line %{${fg_bold[cyan]}%}%l%{${fg_no_bold[yellow]}%}  Continue?%{${reset_color}%}"
zstyle ':completion:*:warnings'     \
	format        \
	"- %{${fg_no_bold[red]}%}no match%{${reset_color}%} - %{${fg_no_bold[yellow]}%}%d%{${reset_color}%}"
zstyle ':completion:*' group-name ''

# manual pages are sorted into sections
# from: http://ft.bewatermyfriend.org/comp/zsh/zshrc.d/compsys.html
zstyle ':completion:*:manuals'       separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections   true

### highlight the original input.
    zstyle ':completion:*:original' \
        list-colors "=*=$color[red];$color[bold]"

### highlight words like 'esac' or 'end'
    zstyle ':completion:*:reserved-words' \
        list-colors "=*=$color[red]"

### colorize hostname completion
    zstyle ':completion:*:*:*:*:hosts' \
        list-colors "=*=$color[cyan];$color[bg-black]"

### colorize username completion
    zstyle ':completion:*:*:*:*:users' \
        list-colors "=*=$color[red];$color[bg-black]"

### colorize processlist for 'kill'
    zstyle ':completion:*:*:kill:*:processes' \
        list-colors "=(#b) #([0-9]#) #([^ ]#)*=$color[none]=$color[yellow]=$color[green]"

# }}}
# }}}
# colors {{{
#use these in functions/shell scripts
export NC='\e[0m'
export white='\e[0;30m'
export WHITE='\e[1;30m'
export red='\e[0;31m'
export RED='\e[1;31m'
export green='\e[0;32m'
export GREEN='\e[1;32m'
export yellow='\e[0;33m'
export YELLOW='\e[1;33m'
export blue='\e[0;34m'
export BLUE='\e[1;34m'
export magenta='\e[0;35m'
export MAGENTA='\e[1;35m'
export cyan='\e[0;36m'
export CYAN='\e[1;36m'
export black='\e[0;37m'
export BLACK='\e[1;37m'

# these are for use in PROMPT
p_nc=$'%{\e[0m%}'
p_white=$'%{\e[0;30m%}'
p_WHITE=$'%{\e[1;30m%}'
p_red=$'%{\e[0;31m%}'
p_RED=$'%{\e[1;31m%}'
p_green=$'%{\e[0;32m%}'
p_GREEN=$'%{\e[1;32m%}'
p_yellow=$'%{\e[0;33m%}'
p_YELLOW=$'%{\e[1;33m%}'
p_blue=$'%{\e[0;34m%}'
p_BLUE=$'%{\e[1;34m%}'
p_magenta=$'%{\e[0;35m%}'
p_MAGENTA=$'%{\e[1;35m%}'
p_cyan=$'%{\e[0;36m%}'
p_CYAN=$'%{\e[1;36m%}'
p_black=$'%{\e[0;37m%}'
p_white=$'%{\e[1;37m%}'

# colors in framebuffer!
if [[ $TERM = "linux" ]]; then
	${HOME}/bin/parse_xdefaults.sh
	clear #for background artifacting
fi

# some better colors for ls
eval "`dircolors ~/.dircolors`"

# colorful $PAGER
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'

# }}}
# functions {{{

swap() {
	if [[ -z $1 ]] || [[ -z $2 ]] || [[ $1 = "-h" ]]; then
		echo -e "${blue}Usage:$NC swap <file> <file>";
		echo -e "Swaps files";
		return 1
	fi
	if [[ -f $1 ]] && [[ -f $2 ]]; then
		local TMPFILE=tmp.$$
		mv "$1" $TMPFILE
		mv "$2" "$1"
		mv $TMPFILE "$2"
	else
		echo -e "${RED}Error:$NC One or more files don't exist"
		return 1
	fi
}

cget() {
	curl -fJOL --compressed "$@"
}

function f() {
	q="*$1*"
	find . -iname $q
}

# }}}
# prompt {{{

if [ $USER = "markus" ]; then
	_main="%{$fg_no_bold[yellow]%}%m"
else
	_main="%{$fg_no_bold[magenta]%}%n%{$reset_color%}@%{$fg_no_bold[yellow]%}%m"
fi

PROMPT="
${_main}%{$reset_color%} %{$fg_bold[green]%}%~
%{$fg_no_bold[red]%}─╼%{$reset_color%} "

# }}}
# env {{{

PATH=$HOME/bin:$PATH

VISUAL=vim
EDITOR=vim
PAGER=less
BROWSER=chromium
LESSCHARSET="UTF-8"
TIME_STYLE=long-iso

export PATH VISUAL EDITOR PAGER BROWSER LESSCHARSET TIME_STYLE

# }}}
# aliases {{{

alias s='sudo '
alias p='s pacman '
alias v='vim '
alias sv='s vim '
alias t='tmux attach'
alias g='git'

alias ls='ls --color=auto'
alias ll='ls -hl'
alias l='ll'
alias lt='ls -hltr'
alias la='ls -a'
alias lla='ll -a'

alias grep='grep --color'
alias sc='s systemctl'

alias -g T="| tail"
alias -g G="| grep"
alias -g H="| head"

alias mkdir='nocorrect mkdir'
alias wget='nocorrect noglob wget'
alias wgetc="wget --content-disposition"

# }}}
