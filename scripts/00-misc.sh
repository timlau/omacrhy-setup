#!/bin/bash

# install misc packages with no special setup

# Read packages from data/packages file
while IFS= read -r pkg; do
  # Skip empty lines and comments
  [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
  if omarchy-pkg-missing $pkg; then
    echo "    -> Installing : $pkg"
    omarchy-pkg-add $pkg
  fi
done < "$(dirname "$0")/../data/packages"
