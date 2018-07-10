## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
autoload -U zmv
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER='less -R'
export LC_CTYPE=en_US.UTF-8

## pretty man pages
function pman() {
    man $1 -t | open -f -a Preview
}


## Color grep results
## Examples: http://rubyurl.com/ZXv
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh # Load autojump


function bt() {
  local output="Bluetooth restarted"

  if [ $# -eq 1 ]; then
    if [ $1 -eq "1" ]; then
      sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist ControllerPowerState 1
      output="Bluetooth is on"
    elif [ $1 -eq "0" ]; then
      sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist ControllerPowerState 0
      output="Bluetooth is off"
    fi;
  fi;


  sudo kextunload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
  sudo kextload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport

  echo $output
}