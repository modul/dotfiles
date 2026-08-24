#!/usr/bin/env fish

mkdir -p ~/.config
mkdir -p ~/.config/fish
ln -svi $(pwd)/config/fish/config.fish ~/.config/fish/config.fish
ln -svi $(pwd)/config/fish/functions ~/.config/fish/functions
touch ~/.config/fish/fish_variables

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/fisher
fisher install jorgebucaran/hydro
fisher install jorgebucaran/nvm.fish
