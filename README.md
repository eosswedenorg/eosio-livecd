# EOSIO Livecd build scripts.

This repo contains scripts to proper build a EOSIO xubuntu livecd.

## Scripts

`tools.sh` - Installs packages needed for other scripts.

`rootfs-bootstrap.sh` - Creates the base root filesystem.

`rsync-overlay.sh` - Copy the *overlay* folder to *rootfs*

`chroot.sh` - Sets up a proper chroot environment.

`create-image.sh` - creates a bootable .iso image.

## Directories

`overlay` - Contains eosio-livecd specific files that should be copied to a base *rootfs*. these are copied during `rsync-overlay.sh`

`overlay/scripts` - contains scripts that should run in chrooted environment. these are copied during `rsync-overlay.sh`

`config` - misc config files used to create image, create base rootfs etc.

`image` - working directory for building the iso image.

`rootfs` - working directory for livecd root filesystem

`output` - resulting .iso directory

## Build instructions

1. First run `tools.sh` to prepare host system.

2. Run `rootfs-boostrap.sh` to create a base root filesystem.

   You can start from a custom state (previous livecd) by extracting the `casper/filesystem.squashfs` from the `iso`-file.

2. Run `chroot.sh` that will construct a proper chroot environment inside `rootfs/`

3. *(Optional)* run `./script/configure.sh` in chrooted    environment to install and configure the livecd. (only needed if you started from a base rootfs).

    **DO NOT** install grub on any disk when asked.

	Answer `NO` to any question about overriding files with package provided file.

4. Make any other changes you want inside chroot.

   Run `exit` to exit the chroot environment when you are done.

5. Run `create-image.sh`

   Make sure to edit `config/image.vars` if you want another name or update the version number.

   When done. you should have a iso file at `output/${IMAGE_FILENAME}`


## Author

Henrik Hautakoski - [henrik@eossweden.org](mailto:henrik@eossweden.org)
