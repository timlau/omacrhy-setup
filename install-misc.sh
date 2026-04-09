#!/bin/bash

# install misc packages with no special setup

pkgs=("make" "stow")

for pkg in "${pkgs[@]}"; do
  echo "    Installing : $pkg"
  omarchy-pkg-add $pkg
done
