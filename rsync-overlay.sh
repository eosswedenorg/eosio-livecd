#!/bin/bash

# Sync files in overlay to rootfs.
sudo rsync -v -l -p -cr overlay/ rootfs
