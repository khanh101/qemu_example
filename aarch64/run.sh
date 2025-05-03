#!/bin/sh

set -xe

QCOW2_IMAGE="$1"
SSH_PORT="$2"
UEFI_FW="/usr/share/edk2/aarch64/QEMU_EFI.fd"


qemu-system-aarch64 \
    -nographic \
    -M virt \
    -cpu max -smp cores=12 \
    -m 16384 \
    -bios $UEFI_FW \
    -drive format=qcow2,file="$QCOW2_IMAGE" \
    -device ramfb \
    -device e1000,netdev=net0 \
    -netdev user,id=net0,hostfwd=tcp::"$SSH_PORT"-:22 \
    -rtc base=utc,clock=host
