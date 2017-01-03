!#/bin/bash
# BOOTSTRAP OSX
## Build tools and brew
### Assume that XCode is installed since some recipes complain if using
### the xcode-select CLI tools instead of XCode.
# xcode-select --install

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
brew update

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

## From cowboy/dotfiles/init

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;34m➜\033[0m  $@"; }

function setdiff() {
  local debug skip a b
  if [[ "$1" == 1 ]]; then debug=1; shift; fi
  if [[ "$1" ]]; then
    local setdiffA setdiffB setdiffC
    setdiffA=($1); setdiffB=($2)
  fi
  setdiffC=()
  for a in "${setdiffA[@]}"; do
    skip=
    for b in "${setdiffB[@]}"; do
      [[ "$a" == "$b" ]] && skip=1 && break
    done
    [[ "$skip" ]] || setdiffC=("${setdiffC[@]}" "$a")
  done
  [[ "$debug" ]] && for a in setdiffA setdiffB setdiffC; do
    echo "$a ($(eval echo "\${#$a[*]}")) $(eval echo "\${$a[*]}")" 1>&2
  done
  [[ "$1" ]] && echo "${setdiffC[@]}"
}

function brew_tap_kegs() {
  kegs=($(setdiff "${kegs[*]}" "$(brew tap)"))
  if (( ${#kegs[@]} > 0 )); then
    e_header "Tapping Homebrew kegs: ${kegs[*]}"
    for keg in "${kegs[@]}"; do
      brew tap $keg
    done
  fi
}

function brew_install_recipes() {
  recipes=($(setdiff "${recipes[*]}" "$(brew list)"))
  if (( ${#recipes[@]} > 0 )); then
    e_header "Installing Homebrew recipes: ${recipes[*]}"
    for recipe in "${recipes[@]}"; do
      brew -v install $recipe
    done
  fi
}

function brew_install_casks(){
  casks=($(setdiff "${casks[*]}" "$(brew cask list 2>/dev/null)"))
  if (( ${#casks[@]} > 0 )); then
    e_header "Installing Homebrew casks: ${casks[*]}"
    for cask in "${casks[@]}"; do
      brew cask install $cask
    done
    brew cask cleanup
  fi
}

function brew_install_fonts(){
  fonts=($(setdiff "${fonts[*]}" "$(brew cask list 2>/dev/null)"))
  if (( ${#fonts[@]} > 0 )); then
    e_header "Installing Homebrew fonts: ${fonts[*]}"
    for font in "${fonts[@]}"; do
      brew cask install $font
    done
    brew cask cleanup
  fi
}


## For elasticsearch
brew install Caskroom/cask/java

## Install Stuff with Brew
recipes=(
    nodejs
    elasticsearch
    ffmpeg
    mkvtoolnix
    mp4v2
    mplayer
    zsh
    zsh-completions
    pandoc
    git
    libyaml
    libmatroska
    vim
    macvim
    s3cmd
    wget
    curl
    flac
    pandoc
    postgresql
    sqlite
    trash
)
brew_install_recipes

## Define Git stuff
git config --global user.name "jsonbecker"
git config --global user.email "jason@jbecker.co"
git config --global credential.helper osxkeychain

## Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

## Install applications with brew-cask
kegs=(
    caskroom/cask
    caskroom/fonts
    caskroom/versions
)

brew_tap_kegs

brew install caskroom/cask/brew-cask
brew update && brew upgrade brew-cask && brew cleanup

casks=(
    handbrakecli
    r
    rstudio
    vlc
    postbox
    iterm2
    macvim
    kaleidoscope
    sublime-text3
    bartender
    synology-cloud-station
    carbon-copy-cloner
    screenhero
    transmit
    dropbox
    betterzipql
    qlcolorcode
    qlmarkdown
    qlprettypatch
    qlstephen
    quicklook-csv
    quicklook-json
    backblaze
    balsamiq-mockups
    tower
    cleanmymac
    colorpicker-skalacolor
    transmit
    slack
    todoist
    dbeaver-community
)

brew_install_casks

## Install Fonts

fonts=(
    font-lato
    font-hack
    font-open-sans
    font-montserrat
    font-source-code-pro
    font-source-code-pro-for-powerline
    font-source-sans-pro
    font-fauna-one
)

brew_install_fonts

## Don Melton video_transcodiing

gem install video_transcoding

## Mac OSX settings taken from brandonb927/osx-for-hackers.sh gist
echo ""
echo "Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
 
echo ""
echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
 
echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
 
echo ""
echo "Enabling full keyboard access for all controls (enable Tab in modal dialogs, menu windows, etc.)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo ""
echo "Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

echo ""
echo "Hiding Safari's bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false
 
echo ""
echo "Hiding Safari's sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

echo ""
echo "Enabling Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo ""
echo "Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo ""
echo "Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

echo ""
echo "Disabling drop shadows on screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

echo ""
cecho "Note that some of these changes require a logout/restart to take effect." $red
cecho "Killing some open applications in order to take effect." $red
echo ""

 
find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
  "Terminal" "Transmission"; do
  killall "${app}" > /dev/null 2>&1
done
