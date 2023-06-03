#!/bin/bash

pkg-install ufw=0.36-6ubuntu1

config-install /etc/default/ufw
config-install /etc/ufw/ufw.conf
config-install /etc/ufw/user.rules

# See https://github.com/husarnet/docker-example/issues/1
update-alternatives --set ip6tables /usr/sbin/ip6tables-nft
