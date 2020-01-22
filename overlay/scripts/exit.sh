#!/bin/bash

# If we changed some files that are stored in initrd. we need to regenerate it.
# Just because i will forget to do this. we do it everytime :)
#update-initramfs -u -k $(uname -r)

truncate -s 0 /etc/machine-id
rm /sbin/initctl
dpkg-divert --rename --remove /sbin/initctl
apt-get clean
rm -rf /tmp/* ~/.bash_history

# Unmount
umount /proc
umount /sys
umount /dev/pts
