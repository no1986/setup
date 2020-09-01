#!/bin/sh

echo "
########################################################
# install git
########################################################
"
if [ -e /etc/redhat-release ]; then
    if ! type git > /dev/null 2>&1; then
        VER=2.28.0

        yum install -y autoconf gcc wget curl-devel expat-devel gettext-devel openssl-devel perl-devel zlib-devel
        cd /usr/local/src/
        if [ ! -e /usr/local/src/git-${VER}.tar.gz ]; then
            wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-${VER}.tar.gz
        fi
        if [ ! -d /usr/local/src/git-${VER} ]; then
            tar -zxf git-${VER}.tar.gz
        fi
        cd git-${VER}/
        make configure
        ./configure
        JOBS=`grep cpu.cores /proc/cpuinfo | wc -l`
        make all -j${JOBS}
        make install
    fi
elif [ -e /etc/os-release ]; then
    apt install -y git
fi

if [ ! -e ~/.git-completion.bash ]; then
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
    chmod a+x ~/.git-completion.bash
    source ~/.git-completion.bash
fi

if [ ! -e ~/.git-prompt.sh ]; then
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
    chmod a+x ~/.git-prompt.sh
    source ~/.git-prompt.sh
fi
