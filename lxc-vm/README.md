
# Building LXC VM Image

This document describes the steps to build a custom lxc vm image that is suited for building the eosio-livecd in.

# Building

Install distrobuilder

```sh
sudo distrobuilder build-lxd ubuntu-20.04.yml --vm
```

# Import into LXC

```sh
$ lxc image import lxd.tar.xz disk.qcow2 --alias eosio-livecd-build-20.04 -v
Image imported with fingerprint: ed8fad529e95cfcd508fd1d894c98779e4eabcb2aa7940d5329d9672118ef874
$ lxc image list livecd
+--------------------------+--------------+--------+-----------------------------------------------+--------------+-----------------+----------+-----------------------------+
|    ALIAS                 | FINGERPRINT  | PUBLIC |                  DESCRIPTION                  | ARCHITECTURE |      TYPE       |   SIZE   |         UPLOAD DATE         |
+--------------------------+--------------+--------+-----------------------------------------------+--------------+-----------------+----------+-----------------------------+
| eosio-livecd-build-20.04 | ed8fad529e95 | no     | Ubuntu focal for building eosio-livecd images | x86_64       | VIRTUAL-MACHINE | 256.31MB | Jun 2, 2023 at 3:03pm (UTC) |
+--------------------------+--------------+--------+-----------------------------------------------+--------------+-----------------+----------+-----------------------------+
```

## Launch a new vm

```sh
lxc launch eosio-livecd-build-20.04 builder --vm
```