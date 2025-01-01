```
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle --global

cp .Brewfile ~/.Brewfile

proto setup
proto install bun
proto install npm
proto install pnpm
proto install yarn
proto install node
proto install go

proto plugin add terraform "https://raw.githubusercontent.com/theomessin/proto-toml-plugins/master/terraform.toml"
proto install terraform
```