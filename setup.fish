#!/usr/bin/env fish

mkdir -p ~/.config
mkdir -p ~/.config/fish
mkdir -p ~/.config/fish/functions
ln -svi $PWD/config/fish/config.fish ~/.config/fish/config.fish
ln -svi $PWD/config/fish/fish_plugins ~/.config/fish/fish_plugins
touch ~/.config/fish/fish_variables

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/fisher
fisher update

ln -sf $PWD/config/fish/functions/* ~/.config/fish/functions/
