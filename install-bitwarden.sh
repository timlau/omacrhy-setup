#!/bin/bash

omarchy-pkg-add bitwarden

is_fish_installed() {
  pacman -Qi "fish" &>/dev/null
}

if is_fish_installed; then
  echo "    Setup for fish shell"
  fish -c "set -Ux SSH_AUTH_SOCK $HOME/.bitwarden-ssh-agent.sock"
fi

if grep -Fq "export SSH_AUTH_SOCK=" "$HOME/.bashrc"; then
  echo "    .bashrc is already configured for bitwarden as ssh agent"
else
  echo "" >>$HOME/.bashrc
  echo "# use bitwarden as ssh agent" >>$HOME/.bashrc
  echo "export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock" >>$HOME/.bashrc
  echo "" >>$HOME/.bashrc

fi
