#!/bin/bash

# Sync files in overlay to rootfs.
sudo rsync -v -l -cr overlay/ rootfs
