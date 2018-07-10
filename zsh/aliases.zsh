alias reload!='. ~/.zshrc'
alias edit!='ed ~/.dotfiles'

alias bu='brew update && brew upgrade'

alias bua='brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup'

## Open current directory
alias oo='open .'

## Quick-look a file (^C to close)
alias ql='qlmanage -p 2>/dev/null'

## Start a local SMTP server and dump emails sent to it to the console
alias smtpconsole='python -m smtpd -n -c DebuggingServer localhost:1025'

## Serve the current folder on port 80
alias serve_this='python -m SimpleHTTPServer'

## Highlight-aware less command
alias hl='less -R'

## Show history
alias history='fc -l 1'

# refresh brew by upgrading all outdated casks
alias refreshbrew='brew outdated | while read cask; do brew upgrade $cask; done'
# rebuild Launch Services to remove duplicate entries on Open With menu
alias rebuildopenwith='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias 'bk=cd $OLDPWD'