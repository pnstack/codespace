#!/bin/bash
apt-get update -y
# imsall fish
apt-get install fish -y
# install omf
curl -L https://get.oh-my.fish | fish
# install agnoster theme
omf theme agnoster | fish