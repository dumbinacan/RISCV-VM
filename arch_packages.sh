#!/bin/bash
# This script installs the packages needed to run this on Arch linux systems
# run this script as sudo


#                      hw-display-virtio-vga{,-gl},
pacman -S wget qemu-{img,system-riscv{,-firmware}}
