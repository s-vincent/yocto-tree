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
cp tmp/deploy/images/raspberrypi3/bcm*dtb /media/seb/BOOT/
cp tmp/deploy/images/raspberrypi3/bcm2835-bootfiles/* /media/seb/BOOT/
mkdir -p /media/seb/BOOT/overlays/
cp tmp/deploy/images/raspberrypi3/[a-z]*.dtbo /media/seb/BOOT/overlays/
cp tmp/deploy/images/raspberrypi3/Image /media/seb/BOOT/kernel7.img

# image and kernel modules
echo "Copy image and kernel modules files..."
tar -C /media/seb/ROOT/ -xjf tmp/deploy/images/raspberrypi3/$1.tar.bz2
#tar -C /media/seb/ROOT/ -xzf tmp/deploy/images/raspberrypi3/modules-raspberrypi3.tgz 

echo "Syncing!"
sync

echo "Unmounting SD card"
umount /media/$user/BOOT
umount /media/$user/ROOT

echo "Done!"

