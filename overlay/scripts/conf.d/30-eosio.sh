#!/bin/bash

# EOS Sw/eden apt
curl https://apt.eossweden.org/key 2> /dev/null | apt-key add -

cat <<EOF > /etc/apt/sources.list.d/eossweden.list
deb [arch=amd64] https://apt.eossweden.org/main focal stable
deb [arch=amd64] https://apt.eossweden.org/eosio bionic stable
EOF

# libicu60 Needed for cleos-v2 for bionic. don't exist in focal repo.
apt-get update
pkg-install \
    /scripts/deb/libicu60_60.2-3ubuntu3.2_amd64.deb \
    cleos-v2=1.8.4-rc1 \
	antelope-keygen=1.1.0-1 \
    antelope-keygen-gui=1.1.0-1
