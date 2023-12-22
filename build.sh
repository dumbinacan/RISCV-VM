#!/bin/bash

qemu-img create -o backing_file=riscv-vm/image.qcow2,backing_fmt=qcow2 -f qcow2 overlay.qcow2
