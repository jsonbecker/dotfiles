# BOOTSTRAP OSX
## Build tools and brew
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
brew update

## Install Stuff with Brew
brew install ffmpeg
brew install mkvtoolnix
brew install mp4v2
brew install mplayer
brew install zsh 
brew install zsh-completions
brew install pandoc
brew install git
brew install libyaml
brew install libmatroska
brew install vim
brew install macvim
brew install s3cmd
brew install wget
brew install openssl
brew install curl
brew install flac
brew install pandoc
brew install postgresql
brew install sqlite
brew install handbrakecli
## Define Git stuff
git config --global user.name "jsonbecker"
git config --global user.email "jason@jbecker.co"
git config --global credential.helper osxkeychain

## Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

## Install applications with brew-cask
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions
brew update && brew upgrade brew-cask && brew cleanup
brew cask install r
brew cask install r-studio
brew cask install vlc
brew cask install postbox
brew cask install iterm2
brew cask install kaleidoscope
brew cask install sublime-text3
brew cask install bartender
brew cask install synology-cloud-station
brew cask install carbon-copy-cloner
brew cask install screenhero
brew cask install transmit
brew cask install dropbox
brew cask install betterzipql
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlprettypatch
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install quicknfoz Install

## Don Melton video_transcodiing

gem install video_transcoding


