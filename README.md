# yocto-tree

Yocto development tree.

## Boards

Following custom boards are supported:
- Raspberry Pi 3 32-bit (rpi-4.11.x, rpi-4.9.x-RT and rpi-4.1.y-ipipe kernels).

## Setup

Clone the yocto-tree repository and enter the directory:

- git clone https://github.com/s-vincent/yocto-tree.git
- cd yocto-tree

Clone the yocto-poky and meta-softwares-sv repository:

- git clone -b pyro git://git.yoctoproject.org/poky.git yocto-poky
- git clone https://github.com/s-vincent/meta-softwares-sv.git

For raspberry Pi 3 boards, clone meta-raspberrypi and meta-raspberrypi-rt-sv
repositories:

- git clone git://git.yoctoproject.org/meta-raspberrypi.git
- git clone https://github.com/s-vincent/meta-raspberrypi-rt-sv.git

## Raspberry Pi 3 boards

### Build environment

Set the environment:

- source ./yocto-poky/oe-init-build-env ./rpi3-build/

To use a 4.9.x PREEMPT-RT kernel, modify conf/local.conf and adds:
- PREFERRED_PROVIDER_virtual/kernel := "linux-raspberrypi-rt"

To use a 4.11.x PREEMPT-RT kernel, modify conf/local.conf and adds:
- PREFERRED_PROVIDER_virtual/kernel := "linux-raspberrypi-rt-dev"

To use a 4.1.x I-pipe kernel, modify conf/local.conf and adds:
- PREFERRED_PROVIDER_virtual/kernel := "linux-raspberrypi-ipipe"

### Images available

rpi-core-image-minimal-rt (same as core-image-minimal but with an RT kernel 
and rt-tests suite):
- bitbake rpi-core-image-minimal-rt

rpi-core-image-minimal-xenomai (same as core-image-minimal but with an I-pipe
kernel and xenomai suite):
- bitbake rpi-core-image-minimal-xenomai

rpi-basic-image-rt (same as rpi-basic-image but with an RT kernel and rt-tests
suite):
- bitbake rpi-basic-image-rt

rpi-basic-image--xenomai (same as rpi-basic-image but with an I-pipe kernel
and xenomai suite):
- bitbake rpi-basic-image-xenomai

Note: to use *-rt image, you have to set the RT kernel as specified in previous
section. Same indication for *-xenomai image, you have to use the I-pipe kernel.

## Softwares

There is some additionnals sample softwares in meta-softwares-sv repository.

Please look at https://github.com/s-vincent/meta-softwares-sv.

## Links

* https://www.yoctoproject.org/docs/2.3/mega-manual/mega-manual.html
* https://github.com/s-vincent/meta-raspberrypi-rt-sv/
* https://github.com/s-vincent/meta-softwares-sv/

