#!/bin/bash

# install yazi
omarchy-pkg-add yazi

# install or Update plugins/flavours
ya pkg install &>/dev/null
ya pkg upgrade &>/dev/null
