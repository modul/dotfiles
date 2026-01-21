#!/bin/bash -i

echo "----- creating symlinks …"
ln -svi $(pwd)/config/.vimrc ~/.vimrc
ln -svi $(pwd)/config/screenrc ~/.screenrc
ln -svi $(pwd)/config/gitconfig ~/.gitconfig
cp -iv config/gituser ~/.gituser

echo "----- installing homebrew …"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "----- installing software …"
brew bundle install

echo "----- setting shell to fish …"
echo "Adding fish to allowed shells via sudo."
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

echo "----- setting up fish …"
./setup.fish

echo "----- installing vundle …"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim || true
echo -e '\n\n\n' | vim -c 'BundleInstall!' -c 'BundleClean' -c 'qall' /dev/stdin | cat

echo "Done. You need to login again for some changes to take effect."
