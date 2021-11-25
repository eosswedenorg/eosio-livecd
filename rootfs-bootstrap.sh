#!/bin/bash
# This script creates the base root filesystem.

CACHE_FILE=.cache/rootfs.base.tar.gz

sudo rm -fr ./rootfs

# extract from cache if it exists.
if [ -f ${CACHE_FILE} ]; then
    sudo tar -xf ${CACHE_FILE}
else :

    source config.sh

    # Bootstrap root filesystem
    sudo -S debootstrap \
        --arch=amd64 \
        --variant=minbase \
        ${UBUNTU_CODENAME} \
        ./rootfs \
        http://us.archive.ubuntu.com/ubuntu/

    # Cache in tar file.
    sudo -S tar -z -cf ${CACHE_FILE} rootfs/
fi
