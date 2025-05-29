#!/bin/sh

set -xe

ISO_PATH="$1"
QCOW2_IMAGE="$2"
UEFI_FW="/usr/share/edk2/aarch64/QEMU_EFI.fd"

    # -nographic \
qemu-img create -f qcow2 "$QCOW2_IMAGE" 20G
qemu-system-aarch64 \
    -M virt \
    -cpu max -smp cores=12 \
    -m 16384 \
    -bios $UEFI_FW \
    -drive format=qcow2,file="$QCOW2_IMAGE" \
    -device ramfb \
    -cdrom "$ISO_PATH" \
    -nic user,model=virtio \
    -rtc base=utc,clock=host
