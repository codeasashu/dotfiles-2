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
brew install git coreutils ripgrep zsh fzf fasd docker docker-compose \
diff-so-fancy httpie jq nvm go htop
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
$(brew --prefix)/opt/fzf/install

# Install some other useful utilities like `sponge`.
brew install moreutils findutils mysql \
openssh screen gnupg wget vim gnu-sed

# Install font tools.
brew tap bramstein/webfonttools 
brew tap homebrew/autoupdate
brew install sfnt2woff sfnt2woff-zopfli woff2

# Setup brew auto-update
brew autoupdate start --upgrade --cleanup

# Install other useful binaries.

brew install git ripgrep imagemagick p7zip pigz ssh-copy-id \
tree bat rlwrap rclone

echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "installing zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "installing node..."
nvm install node
curl -L https://git.io/n-install | bash

echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"

echo "installing a few global npm packages"
npm install --global serve fkill-cli npm-quick-run \
semantic-release-cli npm-check-updates instant-markdown-d

echo "installing apps with brew cask"
brew tap homebrew/cask-fonts
brew install --cask brave-browser iterm2 visual-studio-code \
qlcolorcode qlmarkdown qlstephen quicklook-json webpquicklook \
qlvideo spotify qmoji slack qbittorrent keepassxc font-hack-nerd-font \
docker openvpn-connect android-file-transfer mpv joplin dbeaver-community \
anydesk

# Download vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo "Generating a new SSH key for GitHub"
ssh-keygen -t rsa -b 4096 -C "$my_email" -f ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
touch ~/.ssh/config
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa" | tee ~/.ssh/config
ssh-add -K ~/.ssh/id_rsa
echo "run 'pbcopy < ~/.ssh/id_rsa.pub' and paste that into GitHub"

# Install COC extensions
vim -c 'CocInstall -sync coc-json coc-html coc-tsserver coc-flow coc-prettier coc-eslint coc-pyright coc-phpls coc-fzf-preview|q'

# get bat and delta all configured
mkdir -p "${HOME}/.config/bat/themes"
git clone https://github.com/batpigandme/night-owlish "${HOME}/.config/bat/themes/night-owlish"
bat cache --build

cp fonts/*.ttf /Library/Fonts
echo "making system modifications:"

# Remove outdated versions from the cellar.
brew cleanup