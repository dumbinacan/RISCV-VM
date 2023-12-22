#!/usr/bin/env bash
#
# Inspired by
# https://colatkinson.site/linux/riscv/2021/01/27/riscv-qemu/

ALLOCATED_RAM="8196"
ALLOCATED_VGA="2048"

args=(
  -cpu rv64 -m "$ALLOCATED_RAM"
  -machine virt
  -device virtio-blk-device,drive=hd
  -drive file=overlay.qcow2,if=none,id=hd
  -device virtio-net-device,netdev=net
  # -netdev user,id=net,hostfwd=tcp::2222-:22
  -netdev user,id=net
  -bios opensbi-riscv64-generic-fw_dynamic.elf
  -kernel uboot.elf
  -object rng-random,filename=/dev/urandom,id=rng
  -device virtio-rng-device,rng=rng
  # -append "root=LABEL=rootfs console=ttyS0"
  -append "root=LABEL=rootfs"

  # -monitor stdio
  # -device VGA,vgamem_mb="$ALLOCATED_VGA"
  -vga std
)

qemu-system-riscv64 "${args[@]}"
