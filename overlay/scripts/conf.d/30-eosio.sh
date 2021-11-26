#!/bin/bash

# EOS Sw/eden apt
curl https://apt.eossweden.org/key 2> /dev/null | apt-key add -

cat <<EOF > /etc/apt/sources.list.d/eossweden.list
deb [arch=amd64] https://apt.eossweden.org/main focal stable
deb [arch=amd64] https://apt.eossweden.org/eosio bionic stable
EOF

apt-get update
pkg-install \
    # Needed for cleos-v2 for bionic. don't exist in focal repo.
    /scripts/deb/libicu60_60.2-3ubuntu3.2_amd64.deb
    cleos-v2=1.8.4-rc1 \
	eosio-keygen=1.0.7-1 \
    eosio-keygen-gui=1.0.7-1
