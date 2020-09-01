#!/bin/sh

echo "
########################################################
# install goenv
########################################################
"
VER=1.15.2

anyenv install goenv -s
export GOENV_ROOT=~/.anyenv/envs/goenv
export PATH=${GOENV_ROOT}/bin:${PATH}
eval "$(goenv init -)"

goenv install ${VER} -s
goenv global ${VER}

export PATH=${GOPATH}/bin:${PATH}

go get github.com/motemen/ghq
go get github.com/peco/peco/cmd/peco
go get github.com/direnv/direnv
