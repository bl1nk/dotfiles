MINI_ZSH_CONF="${HOME}/.mini-zsh/zsh.conf"
[[ -r "${MINI_ZSH_CONF}" ]] && . "${MINI_ZSH_CONF}"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
