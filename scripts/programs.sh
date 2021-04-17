#!/bin/bash

sudo apt update

function install {
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        sudo apt install -y $1
    else
        echo "Already installed: ${1}"
    fi
}

function node {
    which node &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: node..."
        ./scripts/node.sh
    else
        echo "Already installed: node"
    fi
}

function install_node {
    which $1 &> /dev/null
    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        sudo npm install -g $1
    else
        echo "Already installed: ${1}"
    fi
}

install xorg
install i3
install vim
install git
install htop
install pavucontrol
install firefox
install ffmpeg
install rxvt-unicode-256color
install clang
install clang-format
install curl
install unzip
install zsh

node

install_node prettier
install_node expo-cli

./scripts/vimplug.sh
