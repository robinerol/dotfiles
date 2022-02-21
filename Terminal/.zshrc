export PATH=/usr/local/bin:$PATH

source "$HOME/.nvm/nvm.sh"
export NVM_DIR="$HOME/.nvm"

# Java
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
alias java11='export JAVA_HOME=$JAVA_11_HOME'
java11 # default to Java 11

# Oh my zsh stuff
ZSH_THEME="agnoster"
zstyle ':omz:update' mode reminder
HIST_STAMPS="yyyy-mm-dd"
plugins=(git nvm)
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh