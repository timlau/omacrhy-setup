#!/bin/bash

# Install extra application
echo " -> Installing Bitwarden"
./install-bitwarden.sh
echo " -> Installing fish shell"
./install-fish.sh
echo " -> Installing stow"
./install-stow.sh
echo " -> Installing Brave browser"
./install-brave.sh
