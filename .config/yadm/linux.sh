#!/bin/sh
# Start with system upgrade
sudo pacman -Syyu

install_stuff() {
  sudo pacman -S fasd fzf jq httpie diff-so-fancy python python-pip ripgrep \
    tmux android-file-transfer mpv ctags kitty sxiv maim vivaldi
}

install_yay_stuff() {
  yay -S slack-desktop
}

post_install() {
  pip install subliminal
}

# Installations
install_stuff
install_yay_stuff
post_install
