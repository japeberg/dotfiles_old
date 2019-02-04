#!/bin/bash
############################


echo "Install fish 3.x repository"
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish

echo "Change default shell to fish"
chsh -s `which fish`

echo "Check if version 3.x is installed"
fish -v