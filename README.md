# workstation

Fully automated development environment using ansible plays for bootstrapping `my` workspace on `Ubuntu 21+`.

# Table of Contents

- [workstation](#workstation)
- [Table of Contents](#table-of-contents)
  - [Goals](#goals)
    - [Why Ubuntu?](#why-ubuntu)
    - [Why Ansible?](#why-ansible)
  - [Requirements](#requirements)
    - [Operating System](#operating-system)
    - [System Upgrade](#system-upgrade)
  - [Setup](#setup)
    - [values.yaml](#valuesyaml)
    - [Examples](#examples)
      - [Minimal](#minimal)
  - [Usage](#usage)
    - [Install](#install)
    - [Update](#update)
  - [Known Issues](#known-issues)


## Goals

Provide fully automated `Ubuntu 21+` development environment that is easy to setup and maintain.


### Why Ubuntu?

[Ubuntu](https://ubuntu.com/about) is an ancient African word meaning ‘humanity to others’. It is often described as reminding us that ‘I am what I am because of who we all are’. We bring the spirit of Ubuntu to the world of computers and software. The Ubuntu distribution represents the best of what the world’s software community has shared with the world.

### Why Ansible?
[Ansible](https://www.ansible.com/overview/it-automation) is an open source community project sponsored by Red Hat, it's the simplest way to automate IT. Ansible is the only automation language that can be used across entire IT teams from systems and network administrators to developers and managers.


## Requirements


### Operating System

This Ansible playbook supports `Ubuntu` distribution. This is by design to provide a consistent development expierence across hosts.

- Download [Ubuntu](https://ubuntu.com/download/desktop)
- Install OS


### System Upgrade

Verify your `Ubuntu` installation has all latest packages installed before running the playbook.

```
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get install vim git pip curl -y
```

> NOTE: This will take some time.


## Setup

### values.yaml

The `values.yaml` file allows you to personalize your setup to your needs. Create a file located at `~/.config/dotfiles/values.yaml` and include your settings.

```bash
cd $HOME && mkdir -p .config/dotfiles && vim .config/dotfiles/values.yaml
```

Below is a list of all available values. Not all are required but incorrect values will break the playbook if not properly set.

| Name                  | Type                                | Required |
| -------------------   | ----------------------------------- | -------- |
| git_user_email        | string                              | yes      |
| git_user_name         | string                              | yes      |


### Examples

Below is an example of `values.yaml` file:

```yaml
---
git_user_email: contact@getul.io
git_user_name: Getulio Ruiz
```

## Usage

### Install

This playbook includes a custom shell script located at `bin/dotfiles`. This script is added to your $PATH after installation and can be run multiple times while making sure any Ansible dependencies are installed and updated.

This shell script is also used to initialize your environment after installing `Manjaro with i3`, performing a full system upgrade and creating your `~/.config/dotfiles/values.yaml` configuration file as mentioned above.

> NOTE: You must follow required steps before running this command or things may become unusable until fixed.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/getulioruiz/workstation/main/bin/dotfiles)"
```

### Update

This repository is continuously updated with new features and settings which become available to you when updating.

To update your environment run the `dotfiles` command in your shell:

```bash
dotfiles
```
This will handle the following tasks:

- Verify Ansible is up-to-date
- Generate SSH keys and add to `~/.ssh/authorized_keys`
- Clone this repository locally to `~/.dotfiles`
- Verify any `ansible-galaxy` plugins are updated
- Run this playbook with the values in `~/.config/dotfiles/values.yaml`

## Known Issues

### Latest Ansible requires a specific version of resolvelib
fix: ```sudo -H pip install -Iv 'resolvelib<0.6.0'``` - Issue found [here](https://github.com/ansible-collections/community.digitalocean/issues/132#issuecomment-934355414)

