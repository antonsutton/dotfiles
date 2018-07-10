export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

export CLICOLOR=true
export DEFAULT_USER="antonsutton"
export KEYTIMEOUT=1

fpath=($ZSH/zsh/functions $fpath)

# if test -f $completion
# then
#   source $completion
# fi

autoload -U $ZSH/zsh/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"


setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions

# set some history options
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify

setopt share_history

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

zle -N newtab

bindkey "^[[1;5D" beginning-of-line
bindkey "^[[1;5C" end-of-line
bindkey "\e[4~" end-of-line
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char

bindkey -e
bindkey '\ew' kill-region
bindkey -s '\el' "ls\n"
bindkey -s '\e.' "..\n"
bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

#bindkey "^[[H" beginning-of-line
#bindkey "^[[1~" beginning-of-line
#bindkey "^[[F"  end-of-line
#bindkey "^[[4~" end-of-line
bindkey ' ' magic-space    # also do history expansion on space


bindkey '^[[Z' reverse-menu-complete

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

#Colors for less pager (man pages)
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    eval `gdircolors ~/.dir_colors`
fi

# prompt config for powerlevel9k: https://github.com/bhilburn/powerlevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir vcs os_icon)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)
# POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"