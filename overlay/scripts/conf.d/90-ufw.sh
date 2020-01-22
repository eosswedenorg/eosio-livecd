#!/bin/bash

apt-get install -y ufw

ufw enable

# deny outgoing trafic.
ufw default deny outgoing

# But allow HTTPS and DNS
ufw allow out to any port 53 proto udp comment DNS
ufw allow out to any port 443 proto tcp comment HTTPS
