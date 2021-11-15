#!/bin/bash

mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts

# Need to install ca-certificates from local debs before we can update apt.
dpkg -i /scripts/deb/libssl1.1_1.1.1-1ubuntu2.1~18.04.5_amd64.deb
dpkg -i /scripts/deb/openssl_1.1.1-1ubuntu2.1~18.04.5_amd64.deb
dpkg -i /scripts/deb/ca-certificates_20210119~18.04.2_all.deb

apt-get update
apt-get install -y systemd-sysv=237-3ubuntu10.43

dbus-uuidgen > /etc/machine-id
ln -fs /etc/machine-id /var/lib/dbus/machine-id

dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl
