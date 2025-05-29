#!/bin/sh

set -xe

QCOW2_IMAGE="$1"
SSH_PORT="$2"

    #-enable-kvm \
    #-nographic \
qemu-system-x86_64 \
    -cpu max -smp cores=6 \
    -m 4096 \
    -hda "$QCOW2_IMAGE" \
    -netdev user,id=net0,hostfwd=tcp::"$SSH_PORT"-:22 \
    -device e1000,netdev=net0
