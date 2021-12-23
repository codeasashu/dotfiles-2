#!/bin/sh
# Start with system upgrade
sudo pacman -Syyu

install_stuff() {
  sudo pacman -S fasd fzf jq httpie diff-so-fancy python python-pip ripgrep \
    tmux android-file-transfer mpv ncmpcpp mopidy bat ctags docker \
    tig kitty sxiv maim
}

install_yay_stuff() {
  yay -S brave-browser slack-desktop mopidy-mpd
}

post_install() {
  pip install subliminal
}

# Installations
install_stuff
install_yay_stuff
post_install
