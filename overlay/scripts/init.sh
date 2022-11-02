#!/bin/bash

mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts

apt-get update
apt-get install -y \
    apt-utils=2.0.9 \
    dialog=1.3-20190808-1 \
    systemd-sysv=245.4-4ubuntu3.18

dbus-uuidgen > /etc/machine-id
ln -fs /etc/machine-id /var/lib/dbus/machine-id

dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl
