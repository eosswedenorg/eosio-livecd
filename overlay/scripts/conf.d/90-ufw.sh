#!/bin/bash

pkg-install ufw=0.36-6ubuntu1

yes | ufw enable

# See https://github.com/husarnet/docker-example/issues/1
update-alternatives --set ip6tables /usr/sbin/ip6tables-nft

# deny outgoing trafic.
ufw default deny outgoing

# But allow HTTPS and DNS
ufw allow out to any port 53 proto udp comment DNS
ufw allow out to any port 443 proto tcp comment HTTPS
