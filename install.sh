#!/bin/sh

CDIR=$(cd $(dirname ${BASH_SOURCE:-${0}}); pwd)

cd ${CDIR}/sh/
source true_color.sh
cd ${CDIR}/sh/
source package.sh
cd ${CDIR}/sh/
source dotfiles.sh
cd ${CDIR}/sh/
source git.sh
cd ${CDIR}/sh/
source anyenv.sh
cd ${CDIR}/sh/
source pyenv.sh
cd ${CDIR}/sh/
source goenv.sh
cd ${CDIR}/sh/
source emacs.sh
