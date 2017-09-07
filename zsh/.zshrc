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
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt share_history
setopt hist_ignore_all_dups
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
_fzf_compgen_path() {
  rg -g "" "$1"
}
export FZF_DEFAULT_OPTS='--color 16 --height 40% --reverse --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f /usr/local/etc/profile.d/z.sh ] && source /usr/local/etc/profile.d/z.sh
