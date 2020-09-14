#!/bin/bash
# Requires scrot and xclip installed

# Working directory
wf=$HOME/Pictures/screenshots/

# Filename to save (including full path)
F=$wf$(date +%Y%m%d-%H%M%S.png)

# Create directory if does not exist?
[[ ! -d "$wf" ]] && mkdir -p $wf

#Take the screenshot with scrot
scrot -s "$F"

# Copy image to clipboard for ease of use
xclip -sel clip -t $(file -b --mime-type "$F") < "$F"
