#!/bin/bash
echo "Starting setup for new mac"

#setting mac defaults
defaults write com.apple.dock "orientation" -string "right"
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-time-modifier" -float "0"
defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true"
killall Dock

defaults write com.apple.screencapture "disable-shadow" -bool "true"
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"

defaults write com.apple.ActivityMonitor "IconType" -int "6" && killall Activity\ Monitor
defaults write -g NSWindowShouldDragOnGesture -bool true
# defaults write com.apple.CloudSubscriptionFeatures.optIn "545129924" -bool "false"

echo "Setting mac defaults... Done"

# # mk relevant directories
mkdir ~/Applications/
mkdir ~/Coding/
echo "Create relevant directories... Done"


# devenv setup:
# first install xcode or xcode tools (can be simpler alt way later)
# accept xcodebuild license
sudo xcodebuild -license

# installing homebrew 
# preper env var in .zshenv
echo 'export HOMEBREW_CASK_OPTS="--appdir=${HOME}/Applications"' >> ~/.zshenv
echo 'set -x  HOMEBREW_CASK_OPTS "--appdir=${HOME}/Applications"' >> ~/.config/fish/config.fish
# installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.config/fish/config.fish

eval "$(/opt/homebrew/bin/brew shellenv)"
echo "Installing Homebrew... Done"

# # install brew formulaes
brew install fish neovim tmux python@3.9 node@22
echo "Installing Homebrew formulaes... Done"

# # after, installing brew casks
brew install --cask --appdir=${HOME}/Applications ghostty raycast orbstack legcord git-credential-manager
echo "Installing Homebrew casks... Done"

# set up git
git config --global user.name "MrFrost"
git config --global user.email "89649789+nrgaig@users.noreply.github.com"
echo "first set up git ... Done"

# set neovim 
echo alias vi='NVIM_APPNAME="nvim-kickstart" nvim' >> ~/.config/fish/config.fish
#git clone git@github.com:nrgaig/kickstart.nvim.git ./nvim-kickstart --branch master --single-branch
echo "Set neovim ... Done"

