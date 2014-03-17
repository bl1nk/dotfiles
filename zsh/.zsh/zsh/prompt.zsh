# prompt
setopt prompt_subst

# colored path
function p_colored_path {
  local slash="%F{yellow}/%f"
  echo "${${PWD/#$HOME/~}//\//$slash}"
}

# git info
function p_vcs {
  vcs_info
  echo $vcs_info_msg_0_
}

# environments:
#  - ssh
#  - virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1
function p_envs {
  local envs
  [[ -n $SSH_CLIENT ]]  && envs+="×"
  [[ -n $VIRTUAL_ENV ]] && envs+="P"

  [[ -n $envs ]] && echo " %F{red}$envs%f"
}

PROMPT='%f$(p_colored_path)$(p_vcs)$(p_envs) %F{green}→%f '
