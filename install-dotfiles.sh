#!/bin/bash

ORIGINAL_DIR=$(pwd)
REPO_URL="git@github.com:timlau/dotfiles_omarchy.git"
REPO_NAME="dotfiles"

is_stow_installed() {
  pacman -Qi "stow" &>/dev/null
}

if ! is_stow_installed; then
  echo "Install stow first"
  exit 1
fi

cd ~

# Check if the repository already exists
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL" "$REPO_NAME"
fi

# Check if the clone was successful
if [ $? -eq 0 ]; then
  echo "removing old configs"
  rm -rf ~/.config/starship.toml ~/.config/zed
  cd "$REPO_NAME"
  stow -R -v fish
  stow -R -v starship
  stow -R -v zed
  stow -R -v mpv
else
  echo "Failed to clone the repository."
  exit 1
fi
