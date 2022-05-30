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

[Ubuntu](https://ubuntu.com/about) is an ancient African word meaning ‘humanity to others’. It is often described as reminding us that ‘I am what I am because of who we all are’. We bring the spirit of Ubuntu to the world of computers and software. The Ubuntu distribution represents the best of what the world’s software community has shared with the world.

### Why Ansible?


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

The `values.yaml` file allows you to personalize your setup to your needs. Create a file located at `~/.config/dotfiles/values.yaml` and include your settings.

```bash
cd $HOME && mkdir -p projects && vim .config/dotfiles/values.yaml
```

Below is a list of all available values. Not all are required but incorrect values will break the playbook if not properly set.

| Name                  | Type                                | Required |
| -------------------   | ----------------------------------- | -------- |
| git_user_email        | string                              | yes      |
| git_user_name         | string                              | yes      |


### Examples

#### Minimal

Below is a minimal example of `values.yaml` file:

```yaml
---
git_user_email: contact@getul.io
git_user_name: Getulio Ruiz
```

