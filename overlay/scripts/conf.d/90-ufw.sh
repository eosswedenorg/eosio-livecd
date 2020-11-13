#!/bin/bash

pkg-install ufw=0.36-0ubuntu0.18.04.1

ufw enable

# deny outgoing trafic.
ufw default deny outgoing

# But allow HTTPS and DNS
ufw allow out to any port 53 proto udp comment DNS
ufw allow out to any port 443 proto tcp comment HTTPS
