#!/usr/bin/env bash

set -e

git clone https://github.com/modul/dotfiles
cd dotfiles

./install 

tree -a -I "dotfiles|test.sh|.bash*|.profile" ~

