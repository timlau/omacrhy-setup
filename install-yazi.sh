#!/bin/bash
theme_git="BennyOe/tokyo-night"
theme=$(basename "$theme_git")
plugins=(
    "smart-enter"
)

# install yazi
omarchy-pkg-add yazi

# Install theme
if [[ ! -d ~/.config/yazi/flavors/$theme.yazi ]]; then
  echo "    -> installing $theme yazi theme "
  ya pkg add $theme_git &>/dev/null
fi

# Install plugins
for plugin in "${plugins[@]}"; do
  if [[ ! -d ~/.config/yazi/plugins/$plugin.yazi ]]; then
    # install plugin
    echo "    -> installing $plugin yazi plugin "
    ya pkg add yazi-rs/plugins:$plugin &>/dev/null
  fi
done

# Update plugins/flavours
ya pkg upgrade &>/dev/null
