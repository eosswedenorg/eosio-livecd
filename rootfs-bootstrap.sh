#!/bin/bash
# This script creates the base root filesystem.

CACHE_FILE=.cache/rootfs.base.tar.gz

sudo rm -fr ./rootfs

# extract from cache if it exists.
if [ -f ${CACHE_FILE} ]; then
    tar -xf ${CACHE_FILE}
else :

    source config/rootfs-bootstrap.vars

    # Bootstrap root filesystem
    sudo debootstrap \
        --arch=${ROOTFS_ARCH} \
        --variant=${ROOTFS_VARIANT} \
        ${ROOTFS_VERSION} \
        ./rootfs \
        http://us.archive.ubuntu.com/ubuntu/

    # Cache in tar file.
    sudo tar -z -cf ${CACHE_FILE} rootfs/
fi
