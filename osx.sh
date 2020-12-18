# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
brew update

PACKAGES=(
    git
    python
    python3
    neovim
    wget
    the_silver_searcher
    ripgrep
    grv
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew install caskroom/cask/brew-cask

CASKS=(
    firefox
    google-chrome
    iterm2
    slack
    spectacle
    vlc
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Clone configs..."
git clone https://github.com/shabashj/dotfiles.git ~/

touch ~/.zshrc
echo "source dotfiles/.zshrc" >> ~/.zshrc
