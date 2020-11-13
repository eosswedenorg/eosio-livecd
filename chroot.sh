#!/bin/bash
# Setup a proper chroot environment.

ROOTFS=$(pwd)/rootfs

function exec_chroot {
	[[ "$@" ]] && echo -e "[\e[34mCHROOT\e[0m]" $@
    sudo chroot ${ROOTFS} env HOME=/root LC_ALL=C /bin/bash $@
}

# Check rootfs dir.
if [ ! -d "${ROOTFS}" ]; then
    echo "Missing rootfs (${ROOTFS}) directory."
    exit 1
fi

# Mount dev and run
sudo mount --bind /dev ${ROOTFS}/dev
sudo mount --bind /run ${ROOTFS}/run

# Init chroot.
exec_chroot /scripts/init.sh

# Enter chroot shell.
exec_chroot

# Clenup env.
exec_chroot /scripts/exit.sh

# Unmount.
sudo umount ${ROOTFS}/dev
sudo umount ${ROOTFS}/run
