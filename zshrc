# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jbecker"


# Comment the following line to disable command auto-correction.
ENABLE_CORRECTION="true"

# Comment the following line to disable display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew ruby macos gem jsontools gpg-agent)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:/Users/jason/bin:/Library/TeX/texbin:$PATH"
export GPG_TTY=$(tty) # so gpg works always

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Safe remove to trash after brew install trash
# # # # # # # # # alias rm='trash'

blowthistacostand (){
  npm cache clean && bower cache clean
  rm -rf bower_components
  rm -rf node_modules
  npm install && bower install
}

tunnel_pid () {
  sudo lsof -n -i :8080 | grep LISTEN | cut -c 9-14 | uniq
}

psql-staging() { 
  local tenant="${1:-public}"
  local port_number=$(unused-port-number)
  open-tunnel staging $port_number 
  env PGDATABASE=balance_foo PGHOST=localhost PGUSER=balance_rails PGPORT=${port_number} PGOPTIONS=--search_path="${tenant},shared_extensions" psql
  close-tunnel $port_number
}

close-tunnel() {
  local port_number="$1"
  ssh -S /tmp/tunnel_${port_number} -O exit zuul
}

open-tunnel() {
  local env="$1"
  local port_number="$2"
  case $env in
    staging|qa)
    ssh -M -S /tmp/tunnel_${port_number} -NfC -L ${port_number}:balance-staging.crkdkhrqjrq1.us-east-1.rds.amazonaws.com:5432 -o IdentitiesOnly=yes zuul;;
    production)
    ssh -M -S /tmp/tunnel_${port_number} -NfC -L ${port_number}:balance-production.crkdkhrqjrq1.us-east-1.rds.amazonaws.com:5432 -o IdentitiesOnly=yes zuul
    ;;
    *)
    ;;
    esac
}

unused-port-number() {
	ruby -e 'require "socket"; puts Addrinfo.tcp("", 0).bind {|s| s.local_address.ip_port }' 
}   


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="/Users/jason/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/Applications/Postgres.app/Contents/Versions/12/bin/:$PATH"
eval $(thefuck --alias)
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible/pass_file
export PSQL_EDITOR="nvim"
eval $(/opt/homebrew/bin/brew shellenv)
eval $(/opt/homebrew/bin/brew shellenv)
eval $(/opt/homebrew/bin/brew shellenv)
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/Library/Frameworks/R.framework/Resources:$PATH"
export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
export PATH="/Users/jason/.mix/escripts:$PATH"

