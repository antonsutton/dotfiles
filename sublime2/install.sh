#!/bin/sh
# Setup a machine for Sublime Text 2
# set -x

# # symlink settings in
# sublime_dir=~/Library/Application\ Support/Sublime\ Text\ 2/Packages
# mv "$sublime_dir/User" "$sublime_dir/User.backup"
# ln -s "$ZSH/sublime2/User" "$sublime_dir"

# # Grab the Soda theme
# cd "$sublime_dir"
# git clone https://github.com/buymeasoda/soda-theme/ "Theme - Soda"

# # Grab source version of solarized them as bundled one has horrible low contrast selection colour
# curl -L --create-dirs --output "colors-solarized/Solarized (dark).tmTheme" https://github.com/altercation/solarized/raw/master/textmate-colors-solarized/Solarized%20(dark).tmTheme

# # Grab Package control http://wbond.net/sublime_packages/package_control
# curl -L --create-dirs --output "../Installed Packages/Package Control.sublime-package" http://sublime.wbond.net/Package%20Control.sublime-package

# brew cask install font-anonymous-pro
