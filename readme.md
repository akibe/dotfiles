```
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

cp .zshrc ~/.zshrc
cp .Brewfile ~/.Brewfile
cp .gitconfig ~/.gitconfig
cp -r .config ~/.config

brew bundle --global

proto setup
proto install node
proto install bun
proto install npm
proto install pnpm
# proto install yarn
# proto install go

proto plugin add biome https://raw.githubusercontent.com/Phault/proto-toml-plugins/main/biome/plugin.toml
proto install biome
```
