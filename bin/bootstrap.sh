# BOOTSTRAP OSX
## Build tools and brew
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
brew update

## From cowboy/dotfiles/init
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
      brew install $recipe
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


## Install Stuff with Brew
recipes =(
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
)
brew_install_recipes

## Define Git stuff
git config --global user.name "jsonbecker"
git config --global user.email "jason@jbecker.co"
git config --global credential.helper osxkeychain

## Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

## Install applications with brew-cask
kegs =(
    caskroom/cask
    caskroom/fonts
    caskroom/versions
)

brew_tap_kegs

brew install brew-cask
brew update && brew upgrade brew-cask && brew cleanup

casks=(
    handbrakecli
    r
    r-studio
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
)

brew_install_casks

## Install Fonts

fonts =(
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


