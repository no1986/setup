#!/bin/sh

echo "
########################################################
# install dotfiles
########################################################
"
CDIR=$(cd $(dirname ${BASH_SOURCE:-${0}}); pwd)/..
mkdir -p ${CDIR}/backup

cd ${CDIR}/dotfiles
for f in .??*
do
    if [ ! -L ${HOME}/${f} ]; then
        cp ${HOME}/${f} ${CDIR}/backup/
        ln -snfv ${CDIR}/dotfiles/${f} ${HOME}/${f}
    fi
done

if [ -e /etc/redhat-release ]; then
    DDIR=${CDIR}/dotfiles/centos
    yum -y install bash-completion
    if [ ! -e /etc/bash_completion.d/systemctl-bash-completion.sh ]; then
        wget https://github.com/terralinux/systemd/raw/master/src/systemctl-bash-completion.sh -O /etc/bash_completion.d/systemctl-bash-completion.sh
    fi
elif [ -e /etc/os-release ]; then
    DDIR=${CDIR}/dotfiles/ubuntu
fi

cd ${DDIR}
for f in .??*
do
    if [ ! -L ${HOME}/${f} ]; then
        cp ${HOME}/${f} ${CDIR}/backup/
        ln -snfv ${DDIR}/${f} ${HOME}/${f}
    fi
done

DDIR=${CDIR}/emacs
cd ${DDIR}
mkdir -p ${HOME}/.emacs.d
for f in *
do
    if [ ! -L ${HOME}/.emacs.d/${f} ]; then
        ln -snfv ${DDIR}/${f} ${HOME}/.emacs.d/${f}
    fi
done
cd ${CDIR}
