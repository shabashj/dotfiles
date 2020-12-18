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

echo "Clone configs..."
git clone https://github.com/shabashj/dotfiles.git ~/
