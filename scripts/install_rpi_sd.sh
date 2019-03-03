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
cp tmp/deploy/images/raspberrypi*/bcm*dtb /media/$user/BOOT/
cp tmp/deploy/images/raspberrypi*/bcm2835-bootfiles/* /media/$user/BOOT/
mkdir -p /media/$user/BOOT/overlays/
cp tmp/deploy/images/raspberrypi*/[a-z]*.dtbo /media/$user/BOOT/overlays/

if [ ! -f tmp/deploy/images/raspberrypi*/u-boot.bin ]; then
  cp tmp/deploy/images/raspberrypi*/Image /media/$user/BOOT/kernel7.img
else
  cp tmp/deploy/images/raspberrypi*/*Image /media/$user/BOOT/
  cp tmp/deploy/images/raspberrypi*/boot.scr /media/$user/BOOT/

  if [ -f tmp/deploy/images/raspberrypi-64/Image ]; then
    cp tmp/deploy/images/raspberrypi*/u-boot.bin /media/$user/BOOT/kernel8.img
  else
    cp tmp/deploy/images/raspberrypi*/u-boot.bin /media/$user/BOOT/kernel7.img
  fi
fi

# image and kernel modules
echo "Copy image and kernel modules files..."
tar -C /media/$user/ROOT/ -xjf tmp/deploy/images/raspberrypi*/$1.tar.bz2

echo "Syncing!"
sync

echo "Unmounting SD card"
umount /media/$user/BOOT
umount /media/$user/ROOT

echo "Done!"

