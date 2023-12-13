#!/bin/bash
#
# used to install preqs and bring the needed files here..
# ideally this will just be for refreshing files here
# wget is a prereq to run this script

# dl the bios boi
wget "https://github.com/tasleson/qemu/raw/master/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf" -O opensbi-riscv64-generic-fw_dynamic.elf

# copy, pasted, and updated some code from
# https://colatkinson.site/linux/riscv/2021/01/27/riscv-qemu/
# Grab the URL from https://packages.debian.org/sid/u-boot-qemu
wget "http://ftp.us.debian.org/debian/pool/main/u/u-boot/u-boot-qemu_2023.07+dfsg-1_all.deb" -O u-boot-qemu.deb
mkdir -p u-boot-qemu
cd u-boot-qemu
ar -x ../u-boot-qemu.deb
tar xf data.tar.xz
cp ./usr/lib/u-boot/qemu-riscv64_smode/uboot.elf ../uboot.elf
