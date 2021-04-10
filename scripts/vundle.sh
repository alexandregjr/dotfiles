#!/bin/bash

mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle

echo "Cloning vundle [1/2]"
git clone git://github.com/VundleVim/Vundle.vim.git

echo "Installing vim plugins [2/2]"
vim +PluginInstall +qall
