#!/bin/bash
theme_git="BennyOe/tokyo-night"
theme=$(basename "$theme_git")

omarchy-pkg-add yazi

if [[ ! -f ~/.config/yazi/flavors/$theme.yazi/flavor.toml ]]; then
  # install theme
  echo " --> installing $theme yazi theme "
  ya pkg add $theme_git
fi
# update plugins/flavours
ya pkg upgrade
