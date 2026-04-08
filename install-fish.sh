#!/bin/bash
if grep -Fq "fish shell" ~/.bashrc; then
  echo "fish already installad and setup"
else
  if comarchy-pkg-add omarchy-fish; then
    omarchy-setup-fish
  fi
fi
