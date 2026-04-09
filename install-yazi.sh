#!/bin/bash
theme="BennyOe/tokyo-night"

omarchy-pkg-add yazi

# install theme
ya pkg add $theme

# update plugins/flavours
ya pkg upgrade
