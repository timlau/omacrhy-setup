#!/bin/bash

# remove unwanted packages

# Read packages from data/packages file
while IFS= read -r pkg; do
  # Skip empty lines and comments
  [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
  if omarchy-pkg-present $pkg; then
    echo "    -> Removing : $pkg"
    omarchy-pkg-drop $pkg
  fi
done < "$(dirname "$0")/../data/to_remove"
