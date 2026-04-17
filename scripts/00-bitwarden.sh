#!/bin/bash

env_file=$HOME/.config/uwsm/env
packages=("bitwarden" "bitwarden-cli")
use_bitwarden_as_ssh_agent=false

echo ${packages[@]}
if omarchy-pkg-missing "${packages[@]}"; then
  echo "Installing Bitwarden..."
  omarchy-pkg-add "${packages[@]}"
else
  echo "Bitwarden already installed"
fi

if ! grep -Fq "SSH_AUTH_SOCK" $env_file; then
  # ask user if they want to use Bitwarden as their SSH agent and configure SSH_AUTH_SOCK accordingly
  if gum confirm "Use Bitwarden as SSH agent?"; then
    use_bitwarden_as_ssh_agent=true
    echo "export SSH_AUTH_SOCK=/home/$USER/.bitwarden-ssh-agent.sock" | tee -a $env_file &>/dev/null
    echo "Make sure to enable SSH agent support in Bitwarden settings."
  fi
fi

setsid gtk-launch bitwarden &>/dev/null

if [[ $use_bitwarden_as_ssh_agent == "true" ]]; then
  touch ~/.local/state/omarchy/reboot-required
  omarchy-update-restart
fi
