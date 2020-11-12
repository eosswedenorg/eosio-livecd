#!/bin/bash

# EOS Sw/eden apt
curl https://apt.eossweden.org/key 2> /dev/null | apt-key add -

cat <<EOF > /etc/apt/sources.list.d/eossweden.list
deb [arch=amd64] https://apt.eossweden.org/main bionic stable
deb [arch=amd64] https://apt.eossweden.org/eosio bionic stable
EOF

apt-get update
apt-get install -y \
	cleos-v2=1.8.4-rc1 \
	eosio-keygen=1.0.6-1
