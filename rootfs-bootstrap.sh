#!/bin/bash
# This script creates the base root filesystem.

[ $# -lt 1 ] || ( [ "$1" != "--update" ] && [ "$1" != "-u" ] ); UPDATE=$?

source config.sh

CACHE_FILE=.cache/rootfs-${UBUNTU_VERSION}.base.tar.gz

sudo rm -fr ./rootfs

# extract from cache if it exists and update is not requested
if [ -f ${CACHE_FILE} ] && [ $UPDATE -eq 0 ]; then
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
