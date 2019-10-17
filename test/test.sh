#!/usr/bin/env bash

git clone https://github.com/modul/dotfiles
cd dotfiles
./install

tree -a -I "dotfiles|test.sh|.bash*|.profile" ~

