# AARCH64

- get UEFI firmware for qemu aarch64

```bash
sudo dnf install edk2-aarch64
```

the UEFI firmware will be stored at `/usr/share/edk2/aarch64/QEMU_EFI.fd`

- `install.sh <path_to_iso> disk.qcow2`

- `run.sh disk.qcow2 <ssh_port>`