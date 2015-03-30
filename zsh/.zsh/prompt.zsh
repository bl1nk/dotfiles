# prompt
setopt prompt_subst
function remote_prompt {
	[[ -n $SSH_CLIENT ]] && echo -n " %F{white}%m%f"
}

PROMPT='
%{%F{magenta}%}%n%{%f%} @ %{%F{yellow}%}%m%{%f%} : %{%F{green}%}%5~%{%f%}
%{%(!.%F{red}.%F{white})%}─╼%{%f%} '
