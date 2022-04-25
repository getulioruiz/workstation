#!/bin/bash
set -e

# Paths
CONFIG_DIR="$HOME/.config/dotfiles"
DOTFILES_DIR="$HOME/.dotfiles"
SSH_DIR="$HOME/.ssh"

# Install Ansible
if ! [ -x "$(command -v ansible)" ]; then
  sudo apt-get install ansible git --yes -q
fi

# Generate SSH keys
# if ! [[ -f "$SSH_DIR/authorized_keys" ]]; then
#   mkdir -p "$SSH_DIR"

#   chmod 700 "$SSH_DIR"

#   ssh-keygen -b 4096 -t rsa -f "$SSH_DIR/id_rsa" -N "" -C "$USER@$HOSTNAME"

#   cat "$SSH_DIR/id_rsa.pub" >> "$SSH_DIR/authorized_keys"
# fi

# Clone repository
if ! [[ -d "$DOTFILES_DIR" ]]; then
  git clone "https://github.com/ruizgt/workstation.git" "$DOTFILES_DIR"
else
  git -C "$DOTFILES_DIR" pull
fi

# Create path
cd "$DOTFILES_DIR"

# Run playbook
if [[ -f "$DOTFILES_DIR/main.yaml" ]]; then
  ansible-playbook --diff --extra-vars "$DOTFILES_DIR/main.yaml" "$@"
fi
