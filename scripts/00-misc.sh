#!/bin/bash

# install misc packages with no special setup

# Read packages from data/packages file
while IFS= read -r pkg; do
  # Skip empty lines and comments
  [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

  echo "    -> Installing : $pkg"
  omarchy-pkg-add $pkg
done < "$(dirname "$0")/../data/packages"
