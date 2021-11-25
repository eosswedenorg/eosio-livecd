#!/bin/bash
# This script creates the base root filesystem.

CACHE_FILE=.cache/rootfs.base.tar.gz

source config.sh

sudo rm -fr ./rootfs

# extract from cache if it exists.
if [ -f ${CACHE_FILE} ]; then
    sudo tar -xf ${CACHE_FILE}
else :

    # Bootstrap root filesystem
    sudo -S debootstrap \
        --arch=amd64 \
        --variant=minbase \
        ${UBUNTU_CODENAME} \
        ./rootfs \
        ${UBUNTU_MIRROR}/ubuntu/

    # Cache in tar file.
    sudo -S tar -z -cf ${CACHE_FILE} rootfs/
fi

# Update apt sources
echo "deb ${UBUNTU_MIRROR}/ubuntu/ ${UBUNTU_CODENAME} main restricted universe multiverse
deb-src ${UBUNTU_MIRROR}/ubuntu/ ${UBUNTU_CODENAME} main restricted universe multiverse

deb ${UBUNTU_MIRROR}/ubuntu/ ${UBUNTU_CODENAME}-security main restricted universe multiverse
deb-src ${UBUNTU_MIRROR}/ubuntu/ ${UBUNTU_CODENAME}-security main restricted universe multiverse

deb ${UBUNTU_MIRROR}/ubuntu/ ${UBUNTU_CODENAME}-updates main restricted universe multiverse
deb-src h${UBUNTU_MIRROR}/ubuntu/ ${UBUNTU_CODENAME}-updates main restricted universe multiverse" | \
sudo tee rootfs/etc/apt/sources.list > /dev/null
