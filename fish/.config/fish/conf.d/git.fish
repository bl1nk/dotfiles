alias gs='git status'
alias gl='git log -15 --oneline --decorate'
alias gll='git log --graph --pretty=oneline --abbrev-commit --decorate'
alias gpr='git pull --rebase'

function gp
  if test -z $argv
    set BRANCH (git rev-parse --abbrev-ref HEAD)
  else
    set BRANCH $argv[1]
  end
  git push origin $BRANCH
end
