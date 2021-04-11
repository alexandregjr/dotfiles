#!/bin/bash

echo "Downloading vim-plug [1/2]"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins [2/2]"
vim +PlugInstall +qall
