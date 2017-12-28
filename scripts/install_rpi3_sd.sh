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
cp tmp/deploy/images/raspberrypi3*/bcm*dtb /media/seb/BOOT/
cp tmp/deploy/images/raspberrypi3*/bcm2835-bootfiles/* /media/seb/BOOT/
mkdir -p /media/seb/BOOT/overlays/
cp tmp/deploy/images/raspberrypi3*/[a-z]*.dtbo /media/seb/BOOT/overlays/

if [ ! -f tmp/deploy/images/raspberrypi3*/u-boot.bin ]; then
  cp tmp/deploy/images/raspberrypi3*/Image /media/seb/BOOT/kernel7.img
else
  cp tmp/deploy/images/raspberrypi3*/*Image /media/seb/BOOT/
  cp tmp/deploy/images/raspberrypi3*/boot.scr /media/seb/BOOT/

  if [ -f tmp/deploy/images/raspberrypi3-64/Image ]; then
    cp tmp/deploy/images/raspberrypi3*/u-boot.bin /media/seb/BOOT/kernel8.img
  else
    cp tmp/deploy/images/raspberrypi3*/u-boot.bin /media/seb/BOOT/kernel7.img
  fi
fi

# image and kernel modules
echo "Copy image and kernel modules files..."
tar -C /media/seb/ROOT/ -xjf tmp/deploy/images/raspberrypi3*/$1.tar.bz2

echo "Syncing!"
sync

echo "Unmounting SD card"
umount /media/$user/BOOT
umount /media/$user/ROOT

echo "Done!"

