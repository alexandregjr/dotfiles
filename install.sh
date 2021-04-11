#!/bin/bash

sudo apt update
sudo apt upgrade -y

./scripts/programs.sh
./scripts/link.sh
