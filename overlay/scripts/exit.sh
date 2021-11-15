#!/bin/bash

truncate -s 0 /etc/machine-id
rm /sbin/initctl
dpkg-divert --rename --remove /sbin/initctl
apt-get clean
rm -rf /tmp/* ~/.bash_history

# Unmount
umount /proc
umount /sys
umount /dev/pts
