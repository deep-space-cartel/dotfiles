#!/usr/bin/env bash
set -euxo pipefail

# TODO: Use rsync to install

# Loop through each directory in /workspaces
for dir in /workspaces/*; do
  if [ -d "$dir" ]; then
    # Add the directory as a safe directory in Git
    git config --global --add safe.directory "$dir"
  fi
done

# Install Starship Config
#
# * /etc/profile.d/*.sh only used by login shells
# * Dev Containers use non-login shells by default

sudo cp -v bash_completion.d/99-starship.sh /etc/bash_completion.d/99-starship.sh
sudo chmod +x /etc/bash_completion.d/99-starship.sh
mkdir -pv ~/.config
cp -v .config/starship.toml ~/.config
