#!/bin/sh

if [ $(id -u) -ne 0 ]                                                           
then                                                                            
  echo "Script has to be run as root or sudo"                                   
  exit 1                                                                        
fi   

if [ $# -eq 0 ]
then
  echo "Usage: $0 imagename"
  exit 1
fi

user=$SUDO_USER

if [ -z "$user" ]
then
  user=$(whoami)
fi

# bootloader
echo "Copy bootloader files..."
cp tmp/deploy/images/beaglebone-yocto/MLO /media/$user/BOOT
cp tmp/deploy/images/beaglebone-yocto/u-boot.img /media/$user/BOOT/

# image and kernel modules
echo "Copy image and kernel modules files..."
tar -C /media/$user/ROOT/ -xjf tmp/deploy/images/beaglebone-yocto/$1.tar.bz2
#tar -C /media/$user/ROOT/ -xzf tmp/deploy/images/beaglebone-yocto/modules-beaglebone.tgz 

echo "Syncing!"
sync

echo "Unmounting SD card"
umount /media/$user/BOOT
umount /media/$user/ROOT

echo "Done!"

