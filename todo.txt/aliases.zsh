# todo.sh: https://github.com/ginatrapani/todo.txt-cli
function t() { 
  if [ $# -eq 0 ]; then
    todo.sh ls
  else
    todo.sh $*
  fi
}

export TODOTXT_DEFAULT_ACTION=ls
alias t='todo.sh -d $HOME/Dropbox/tools/todo.cfg'
alias n="t ls +next"
