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

./scripts/node.sh
./scripts/vimplug.sh
