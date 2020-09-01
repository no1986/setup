#!/bin/sh

echo "
########################################################
# install emacs
########################################################
"
VER=27.1
JOBS=`grep cpu.cores /proc/cpuinfo | wc -l`

if [ -e /etc/redhat-release ]; then
    yum -y install \
        autoconf automake curl gnupg2 ImageMagick-devel libacl-devel gsound-devel libcanberra-devel lcms2-devel dbus-devel giflib-devel \
        gnutls-devel gpm-devel gtk3-devel jansson-devel openjpeg-devel liblockfile-devel m17n-lib-devel ncurses-devel libotf-devel libpng-devel \
        librsvg2-devel libselinux-devel libtiff-devel libXaw-devel libxml2-devel openssh-clients texinfo zlib-devel ImageMagick nkf
    if ! type cmigemo > /dev/null 2>&1; then
        ghq get https://github.com/koron/cmigemo
        cd ~/ghq/github.com/koron/cmigemo
        ./configure
        make gcc -j${JOBS}
        make gcc-dict -j${JOBS}
        make gcc-install
    fi
elif [ -e /etc/os-release ]; then
    apt -y install \
        autoconf automake autotools-dev build-essential curl dpkg-dev git gnupg imagemagick ispell libacl1-dev libasound2-dev libcanberra-gtk3-module \
        liblcms2-dev libdbus-1-dev libgif-dev libgnutls28-dev libgpm-dev libgtk-3-dev libjansson-dev libjpeg-dev liblockfile-dev libm17n-dev libmagick++-6.q16-dev \
        libncurses5-dev libotf-dev libpng-dev librsvg2-dev libselinux1-dev libtiff-dev libxaw7-dev libxml2-dev openssh-client texinfo xaw3dg-dev zlib1g-dev \
        ruby cmigemo silversearcher-ag
fi

if ! type emacs > /dev/null 2>&1; then
    cd /usr/local/src/
    if [ ! -e /usr/local/src/emacs-${VER}.tar.gz ]; then
        wget http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-${VER}.tar.gz
    fi
    if [ ! -d /usr/local/src/emacs-${VER} ]; then
        tar -zxf emacs-${VER}.tar.gz
    fi
    cd emacs-${VER}
    ./configure --with-cairo
    make -j${JOBS}
    make install
fi
