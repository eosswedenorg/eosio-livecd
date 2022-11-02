#!/bin/bash

pkg-install ufw=0.36-6ubuntu1

yes | ufw enable

# deny outgoing trafic.
ufw default deny outgoing

# But allow HTTPS and DNS
ufw allow out to any port 53 proto udp comment DNS
ufw allow out to any port 443 proto tcp comment HTTPS
