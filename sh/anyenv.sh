#!/bin/sh

echo "
########################################################
# install anyenv
########################################################
"
git clone https://github.com/riywo/anyenv ~/.anyenv
export PATH=~/.anyenv/bin:${PATH}
eval "$(anyenv init -)"
anyenv install --init
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
