#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`
print() {
  echo "🖋️ ${green}=>${reset} $1"
}

print_input() {
  echo "❔ ${yellow}=> $1 ${reset}"
}

print_error() {
  echo "❌ ${red}=> $1 ${reset}"
}

print "Installing xcode command line tools..."
xcode-select -p 1>/dev/null;
if [ $? != 0 ]; then
  xcode-select --install
fi

print "Installing homebrew..."
if [[ $(command -v brew) == "" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  brew update
  brew upgrade
fi

print "Installing zsh..."
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
  fi
else
  print_error "Please restart the script!"
  brew install zsh
  exit
fi

print_input "Run brewfile (y/n)?"
read RUN_BREW
if [ "$RUN_BREW" != "${RUN_BREW#[Yy]}" ] ;then
  print "Running brewfile (this might take a while)..."
  brew bundle --file=./Brew/Brewfile --verbose
fi

if [ ! -d ~/.oh-my-zsh ]; then
 	print "Installing oh my zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

print "Creating symlink for zsh theme..."
ln -f ./Terminal/agnoster.zsh-theme ~/.oh-my-zsh/themes/

print_input "Overwrite .zshrc (y/n)?"
read OVERWRITE_ZSHRC
if [ "$OVERWRITE_ZSHRC" != "${OVERWRITE_ZSHRC#[Yy]}" ] ;then
  ln -f ./Terminal/.zshrc ~/.zshrc
fi

print "Creating symlink for iterm2..."
ln -f ./Terminal/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

print_input "Overwrite .gitconfig (y/n)?"
read OVERWRITE_GITCONFIG
if [ "$OVERWRITE_GITCONFIG" != "${OVERWRITE_GITCONFIG#[Yy]}" ] ;then
  ln -f ./Git/.gitconfig ~/.gitconfig

  print_input "Global git username (John Doe)?"
  read GIT_NAME
  git config --global user.name "$GIT_NAME"
  print_input "Global git email (john@doe.com)?"
  read GIT_MAIL
  git config --global user.email "$GIT_MAIL"
fi

print_input "Install IntelliJ plugins (y/n)?"
read OVERWRITE_GITCONFIG
if [ "$OVERWRITE_GITCONFIG" != "${OVERWRITE_GITCONFIG#[Yy]}" ] ;then
  print "Customizing intellij..."
  source ./IntelliJ/intellij.sh
fi

print "Setup successful! 🥳"
