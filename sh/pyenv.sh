#!/bin/sh

VER=3.8.6

if [ -e /etc/redhat-release ]; then
    yum -y install libffi-devel openssl-devel readline-devel sqlite-devel bzip2-devel zlib-devel
elif [ -e /etc/os-release ]; then
    apt -y install libffi-dev libssl-dev libreadline-dev libsqlite3-dev libbz2-dev zlib1g-dev
fi

anyenv install pyenv -s
export PATH=~/.anyenv/envs/pyenv/bin:${PATH}
eval "$(pyenv init -)"
pyenv install ${VER} -s
pyenv global ${VER}
pip install --upgrade pip
pip install pipenv poetry
