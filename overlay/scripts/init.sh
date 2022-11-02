#!/bin/bash

mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts

apt-get update
apt-get install -y \
    apt-utils=2.4.8 \
    dialog=1.3-20211214-1 \
    systemd-sysv=249.11-0ubuntu3.6

dbus-uuidgen > /etc/machine-id
ln -fs /etc/machine-id /var/lib/dbus/machine-id

dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl
