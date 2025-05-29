#!/bin/sh

set -xe

QCOW2_IMAGE="$1"
SSH_PORT="$2"

qemu-system-x86_64 \
    -enable-kvm \
    -nographic \
    -cpu max -smp cores=12 \
    -m 16384 \
    -hda "$QCOW2_IMAGE" \
    -netdev user,id=net0,hostfwd=tcp::"$SSH_PORT"-:22 \
    -device e1000,netdev=net0
