#!/bin/sh

if [ ! -f alpine-make-vm-image ]; then
    curl -L https://github.com/alpinelinux/alpine-make-vm-image/archive/refs/tags/v0.7.0.tar.gz \
      | tar -xz alpine-make-vm-image-0.7.0/alpine-make-vm-image --strip-components 1
fi

sudo modprobe nbd
yes | sudo ./alpine-make-vm-image \
    --branch v3.13 \
    --packages 'docker' \
    --image-format qcow2 \
    --image-size 60G \
    --serial-console \
    --script-chroot \
    system.qcow2 chroot.sh

docker build -t kphoenix/dqd .
