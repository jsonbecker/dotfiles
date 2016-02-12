#!/bin/zsh
# Taken from tomsquest/dotfiles
set +e

function link_if_missing() {
  SRC=$1
  DEST=$2

  if ! [ -L $DEST ]; then
    ln -ivs $SRC $DEST
  else
    echo "Skipping, link already exists: $SRC"
  fi
}

# link_if_missing $PWD/bin          $HOME/bin
link_if_missing $PWD/bash_profile   $HOME/.bash_profile
link_if_missing $PWD/vim            $HOME/.vim
link_if_missing $PWD/zsh            $HOME/.zsh
# link_if_missing $PWD/ackrc        $HOME/.ackrc
link_if_missing $PWD/gitconfig      $HOME/.gitconfig
link_if_missing $PWD/gitmessage     $HOME/.gitmessage
# link_if_missing $PWD/gitignore    $HOME/.gitignore
# link_if_missing $PWD/imwheelrc    $HOME/.imwheelrc
# link_if_missing $PWD/irbrc        $HOME/.irbrc
# link_if_missing $PWD/plsqlrc      $HOME/.plsqlrc
# link_if_missing $PWD/rvmrc        $HOME/.rvmrc
# link_if_missing $PWD/tmux.conf    $HOME/.tmux.conf
link_if_missing $PWD/gvimrc         $HOME/.gvimrc
link_if_missing $PWD/vimrc          $HOME/.vimrc
link_if_missing $PWD/zshrc          $HOME/.zshrc
link_if_missing $PWD/zsh/jbecker.zsh-theme $HOME/.oh-my-zsh/themes/jbecker.zsh-theme
