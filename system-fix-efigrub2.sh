#!/bin/bash
## 修复Linux+Windows双系统grub2

sudo fdisk -l
sudo mount /dev/sda5 /mnt/
sudo mount /dev/sad1 /mnt/boot/efi
sudo mount /dev/sda6 /mnt/home

sudo mount --bind /proc /mnt/proc/
sudo mount --bind /sys /mnt/sys/
sudo mount --bind /dev/ /mnt/dev/
sudo mount --bind /dev/pts/ /mnt/dev/pts/

sudo chroot /mnt
#grub-install /dev/sda1 --debug
#update-grub2

