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

function install_latest_node {
    which node &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: node..."
        ./scripts/node.sh
    else
        echo "Already installed: node"
    fi
}

function install_latest_go {
    which go &> /dev/null

    if [ $? -ne 0 ]; then
        latest="$(curl https://golang.org/VERSION?m=text)"
        echo "Downloading latest go: $latest"
        wget --no-check-certificate --continue --show-progress "https://golang.org/dl/$latest.linux-amd64.tar.gz"
        echo "Installing $latest"
        rm -rf /usr/local/go && tar -C /usr/local -xzf "$latest.linux-amd64.tar.gz"
        rm "$latest.linux-amd64.tar.gz"
    else
        echo "Already installed: go"
    fi
}

function node_install {
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
install python3
install python3-pip
install python3-autopep8
install network-manager
install rfkill

install_latest_node

node_install prettier
node_install expo-cli

install_latest_go

go get github.com/tsoding/snitch

./scripts/vimplug.sh
