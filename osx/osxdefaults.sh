#!/bin/bash
# Sets reasonable OS X SL and Lion defaults
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run ./osxdefaults.sh and you'll be good to go.
ver=$(sw_vers)

if [[ "$ver" == *10.6.* ]]; then
	echo SL settings
	osxss=true
elif [[ "$ver" == *10.7.* ]]; then
	echo Lion settings
	osxss=true
	# Show the ~/Library folder
	chflags nohidden ~/Library
	
	# Always show scrollbars
	defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

	# Show indicator lights for open applications in the Dock
	defaults write com.apple.dock show-process-indicators -bool true

	# Don’t animate opening applications from the Dock
	defaults write com.apple.dock launchanim -bool false

	# Enable AirDrop over Ethernet and on unsupported Macs running Lion
	defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

	# Disable Resume system-wide
	defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

	# Disable press-and-hold for keys in favor of key repeat
	defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

	# Set a blazingly fast keyboard repeat rate
	defaults write NSGlobalDomain KeyRepeat -int 0

	# Reset Launchpad
	[ -e ~/Library/Application\ Support/Dock/*.db ] && rm ~/Library/Application\ Support/Dock/*.db

else
	osxss=false
	echo OSX is not SL or Lion. fix it fix it fix fix it.
fi

if  $osxss ; then
	# set generic settings for SL and Lion
	echo OK now both
	
	# Show all filename extensions in Finder
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true

	# Expand save panel by default
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

	# Expand print panel by default
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

	# Avoid creating .DS_Store files on network volumes
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

	# Display full POSIX path as Finder window title
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

	# Increase window resize speed for Cocoa applications
	defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

	# Disable the warning when changing a file extension
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

	# Show item info below desktop icons
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

	# Remove useless icons from Safari’s bookmarks bar
	defaults write com.apple.Safari ProxiesInBookmarksBar "()"

	# Only use UTF-8 in Terminal.app
	defaults write com.apple.terminal StringEncodings -array 4

	# Disable the Ping sidebar in iTunes
	defaults write com.apple.iTunes disablePingSidebar -bool true

	# Disable all the other Ping stuff in iTunes
	defaults write com.apple.iTunes disablePing -bool true

	# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

	# Enable subpixel font rendering on non-Apple LCDs
	defaults write NSGlobalDomain AppleFontSmoothing -int 2

	# Show all hidden files in finder
	defaults write com.apple.Finder AppleShowAllFiles TRUE
fi

# Kill affected applications
for app in Safari Finder Dock Mail; do killall "$app"; done