#!/bin/sh

set -xe

ISO_PATH="$1"
QCOW2_IMAGE="$2"

    #-enable-kvm \
    #-nographic \
qemu-img create -f qcow2 "$QCOW2_IMAGE" 20G
qemu-system-x86_64 \
    -cpu max -smp cores=6 \
    -m 4096 \
    -cdrom "$ISO_PATH" \
    -hda "$QCOW2_IMAGE" \
    -boot d
