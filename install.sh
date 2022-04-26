#!/bin/bash
set -e

# Paths
CONFIG_DIR="$HOME/.config/dotfiles"
DOTFILES_DIR="$HOME/workstation"
SSH_DIR="$HOME/.ssh"

echo "configuring /etc/sudoers.d/${USER} sudoer file"
if [[ ! -e /etc/sudoers.d/${USER} ]]; then
  echo "${USER} ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/${USER}
  echo "sudoer is already configured."
fi
echo "The sudoer configuration is finished"

# Install Ansible
if ! [ -x "$(command -v ansible)" ]; then
  sudo apt-get install --yes -q ansible git 
fi

# Generate SSH keys
# if ! [[ -f "$SSH_DIR/authorized_keys" ]]; then
#   mkdir -p "$SSH_DIR"

#   chmod 700 "$SSH_DIR"

#   ssh-keygen -b 4096 -t rsa -f "$SSH_DIR/id_rsa" -N "" -C "$USER@$HOSTNAME"

#   cat "$SSH_DIR/id_rsa.pub" >> "$SSH_DIR/authorized_keys"
# fi

# Clone repository
# if ! [[ -d "$DOTFILES_DIR" ]]; then
#   git clone "https://github.com/ruizgt/workstation.git" "$DOTFILES_DIR"
# else
#   git -C "$DOTFILES_DIR" pull
# fi

# Create path
cd "$DOTFILES_DIR"

if [[ -f "$DOTFILES_DIR/main.yaml" ]]; then
  ansible-galaxy collection install community.general
  ansible-playbook main.yaml --ask-become-pass
fi
