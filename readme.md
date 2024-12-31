```
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle --global

cp .Brewfile ~/.Brewfile

proto setup
proto install bun
```