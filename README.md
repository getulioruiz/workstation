# workstation

Fully automated development environment for `me`.


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


### Why Ansible?

Ansible replicates what we would do to setup a development environment pretty well. There are many automation solutions out there - we happen to enjoy using Ansible.


## Requirements


### Operating System

This Ansible playbook supports `Ubuntu` distribution. This is by design to provide a consistent development expierence across hosts.

- Download [Ubuntu](https://ubuntu.com/download/desktop)
- Install OS


### System Upgrade

Verify your `Ubuntu` installation has all latest packages installed before running the playbook.

```
sudo apt-get update && sudo apt-get upgrade
```

> NOTE: This will take some time.


## Setup

### values.yaml

The `values.yaml` file allows you to personalize your setup to your needs. Create a file located at `~/.config/dotfiles/values.yaml` and include your desired settings.

```bash
cd $HOME && mkdir -p Projects/Private && vim .config/dotfiles/values.yaml
```

Below is a list of all available values. Not all are required but incorrect values will break the playbook if not properly set.

| Name                  | Type                                | Required |
| -------------------   | ----------------------------------- | -------- |
| git_user_email        | string                              | yes      |
| git_user_name         | string                              | yes      |


### Examples

Below includes minimal and advanced configuration examples. If you would like to see a more real world example take a look at [blackglasses public configuration](https://github.com/ALT-F4-LLC/dotfiles-erikreinert) repository.

#### Minimal

Below is a minimal example of `values.yaml` file:

```yaml
---
git_user_email: foo@bar.com
git_user_name: Foo Bar
```




## Usage

### Install

This playbook includes a custom shell script located at `bin/dotfiles`. This script is added to your $PATH after installation and can be run multiple times while making sure any Ansible dependencies are installed and updated.

This shell script is also used to initialize your environment after installing `Manjaro with i3`, performing a full system upgrade and creating your `~/.config/dotfiles/values.yaml` configuration file as mentioned above.

> NOTE: You must follow required steps before running this command or things may become unusable until fixed.

```bash
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/ALT-F4-LLC/dotfiles/main/bin/dotfiles)"
```

### Update

This repository is continuously updated with new features and settings which become available to you when updating.

To update your environment run the `dotfiles` command in your shell:

```bash
$ dotfiles
```

This will handle the following tasks:

- Verify Ansible is up-to-date
- Generate SSH keys and add to `~/.ssh/authorized_keys`
- Clone this repository locally to `~/.dotfiles`
- Verify any `ansible-galaxy` plugins are updated
- Run this playbook with the values in `~/.config/dotfiles/values.yaml`


## Known Issues

