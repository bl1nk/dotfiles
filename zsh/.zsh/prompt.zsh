# prompt
setopt prompt_subst
function remote_prompt {
	[[ -n $SSH_CLIENT ]] && echo -n " %F{white}%m%f"
}

PROMPT='
%F{green}%5~%f$(remote_prompt)
%(!.%F{red}.%F{white})λ%f '
