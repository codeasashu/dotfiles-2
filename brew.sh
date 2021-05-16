#!/usr/bin/env bash

###############################################################################
# My Customizations                                                       #
###############################################################################
echo "Hello $(whoami)! Let's get you set up."
read -p "Enter your emailid: " my_email

echo "mkdir -p ${HOME}/code"
mkdir -p "${HOME}/code"

echo "installing homebrew"
# install homebrew https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "brew installing stuff"

# Install command-line tools using Homebrew.
# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install git coreutils ripgrep zsh
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri
brew install vim --with-override-system-vi
brew install openssh screen gnupg

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff sfnt2woff-zopfli woff2

# Install other useful binaries.

brew install git ripgrep imagemagick p7zip pigz ssh-copy-id \
tree bat rlwrap rclone

echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "installing zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


echo "installing node (via n-install)"
curl -L https://git.io/n-install | bash

echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"

echo "installing a few global npm packages"
npm install --global serve fkill-cli npm-quick-run \
semantic-release-cli npm-check-updates

echo "installing apps with brew cask"
brew install --cask brave-browser visual-studio-code \
qlcolorcode qlmarkdown qlstephen quicklook-json webpquicklook \
qlvideo spotify qmoji slack

echo "Generating a new SSH key for GitHub"
ssh-keygen -t rsa -b 4096 -C "$my_email" -f ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
touch ~/.ssh/config
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa" | tee ~/.ssh/config
ssh-add -K ~/.ssh/id_rsa
echo "run 'pbcopy < ~/.ssh/id_rsa.pub' and paste that into GitHub"

# get bat and delta all configured
mkdir -p "${HOME}/.config/bat/themes"
git clone https://github.com/batpigandme/night-owlish "${HOME}/.config/bat/themes/night-owlish"
bat cache --build

echo "making system modifications:"

# Remove outdated versions from the cellar.
brew cleanup