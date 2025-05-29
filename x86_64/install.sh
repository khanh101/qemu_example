#!/bin/sh

set -xe

ISO_PATH="$1"
QCOW2_IMAGE="$2"

qemu-img create -f qcow2 "$QCOW2_IMAGE" 20G
qemu-system-x86_64 \
    -enable-kvm \
    -nographic \
    -cpu max -smp cores=12 \
    -m 16384 \
    -cdrom "$ISO_PATH" \
    -hda "$QCOW2_IMAGE" \
    -boot d
