autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

git_branch() {
  echo $(/usr/local/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$(/usr/local/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$(/usr/local/bin/git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  /usr/local/bin/git cherry -v origin/$(git_branch) 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

rvm_prompt(){
  if $(which rvm &> /dev/null)
  then
	  echo "%{$fg_bold[yellow]%}$(rvm tools identifier)%{$reset_color%}"
	else
	  echo ""
  fi
}

# This keeps the number of todos always available the right hand side of my
# command line. I filter it to only count those tagged as "+next", so it's more
# of a motivation to clear out the list.
todo(){
  if $(which todo.sh &> /dev/null)
  then
    num=$(echo $(todo.sh ls +next | wc -l))
    let todos=num-2
    if [ $todos != 0 ]
    then
      echo "$todos"
    else
      echo ""
    fi
  else
    echo ""
  fi
}

# Returns the type of session we're in: empty string for normal terminal locally or [rem/ssh] for remote sessions
function sesh_type { 
  local sesh=""
  
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
      sesh="[rem/ssh] "
    # many other tests omitted
    else
      case $(ps -o comm= -p $PPID) in
        sshd|*/sshd) sesh="[rem/ssh] ";;
      esac
  fi
  echo "$sesh"
}

# Return either hostname -s (shortened) or the contetns of the file .box-name if it exists
function box_name { 
  [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function directory_name(){
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="white"; fi

# %(?..) means 'True if the exit status of the last command was n. n = 0 when left out'
# So this line will be a red x:exit code if the last command return a non-zero exit code
local return_status="%(?..•%{$fg[red]%}✘%{$reset_color%}:)%(?,,%{${fg_bold[white]}%}%?%{$reset_color%})"

# will look like this:
# antonsutton@scruffy:~/.dotfiles/ on master                                           •22:20:33•Just do it:4•
export PROMPT='$(sesh_type)%{$fg[$NCOLOR]%}%B%n%b%{$reset_color%}@%{$fg[yellow]%}$(box_name)%{$reset_color%}:%{$fg[blue]%}%B${PWD/#$HOME/~}/%b%{$reset_color%} $(git_dirty)$(need_push)%(!.#.) '

#export PROMPT=$'\n%m at $(rvm_prompt) in $(collapse_pwd) $(git_dirty)$(need_push)\n› '
#export PROMPT=$'\n$(rvm_prompt) in $(collapse_pwd) $(git_dirty)$(need_push)\n› '

function set_prompt () {
  export RPROMPT='${return_status}%{$reset_color%}•%{$fg_bold[magenta]%}%*%{$reset_color%}•Just do it:%{$fg_bold[white]%}$(todo)%{$reset_color%}•'
}

function precmd() {
  title "zsh" "$USER@%m" "%55<...<%~"
  set_prompt
}

function preexec() {
  title "$1" "$USER@%m" "%35<...<%~"
}