#!/bin/bash

# remove unwanted packages

# Read packages from data/packages file
while IFS= read -r pkg; do
  # Skip empty lines and comments
  [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

  echo "    -> Removing : $pkg"
  omarchy-pkg-drop $pkg
done < "$(dirname "$0")/../data/to_remove"
