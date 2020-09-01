# .bash_profile

# anyenv
export ANYENV_ROOT=${HOME}/.anyenv
export PATH=${ANYENV_ROOT}/bin:${PATH}
eval "$(anyenv init -)"

# pyenv
export PYENV_ROOT=${HOME}/.anyenv/envs/pyenv
export PATH=${PYENV_ROOT}/bin:${PATH}
eval "$(pyenv init -)"
export PIPENV_VENV_IN_PROJECT=true
eval "$(pipenv --completion)"

# goenv
export GOENV_ROOT=${HOME}/.anyenv/envs/goenv
export PATH=${GOENV_ROOT}/bin:${PATH}
eval "$(goenv init -)"
export PATH=${GOPATH}/bin:${PATH}

# nodenv
export NODENV_ROOT=${HOME}/.anyenv/envs/nodenv
export PATH=${NODENV_ROOT}/bin:${PATH}
eval "$(nodenv init -)"

# direnv
eval "$(direnv hook bash)"

# nifcloud
export LOGIN=okawa.naoyoshi:EhWd7rA#

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
