autoload -Uz compinit promptinit colors select-word-style bracketed-paste-magic url-quote-magic zmv
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic 
select-word-style bash
compinit -i
promptinit
colors

# history
setopt hist_ignore_space
setopt append_history
setopt hist_ignore_dups
setopt share_history
setopt extendedglob
HISTFILE=~/.zsh/histfile
HISTSIZE=10000
SAVEHIST=500000
#readonly HISTFILE
export HISTFILE HISTSIZE SAVEHIST
# statistics
REPORTTIME=10


# env vars
EDITOR=vim
VISUAL=vim
PAGER=less
export EDITOR VISUAL PAGER

# colorful $PAGER
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'

# configuration files
for file in ~/.zsh/*.zsh; do
	source $file
done

