#!/bin/sh

if [ -e /etc/redhat-release ]; then
    yum -y install -y epel-release
elif [ -e /etc/os-release ]; then
    apt install -y build-essential
fi
