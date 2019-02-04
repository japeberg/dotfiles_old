#!/bin/bash
############################
echo "Installing Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "...done"

echo "Installing VIM-Plugins with Vundle"
vim +PluginInstall +qall
echo "...done"

echo "Compiling YouCompleteMe"
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
echo "...done"
