#!/bin/sh

# Source https://github.com/pyenv/pyenv
# Installer https://github.com/pyenv/pyenv-installer
# From installation wiki following packages are needed
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

# Run installation script
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

export PATH="/home/openpilot/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

