# yocto-tree

Yocto development tree.

## Boards

Following custom boards are supported:
- Raspberry Pi 3 32-bit (rpi-4.11.x, rpi-4.9.x-RT and rpi-4.1.y-ipipe kernels).

## Setup

- Clone the yocto-tree repository and enter the directory:
git clone https://github.com/s-vincent/yocto-tree.git
cd yocto-tree

- Clone the yocto-poky and meta-softwares-sv repository:
git clone -b pyro git://git.yoctoproject.org/poky.git yocto-poky
git clone https://github.com/s-vincent/meta-softwares-sv.git

- For raspberry Pi 3 boards, clone meta-raspberrypi and meta-raspberrypi-rt-sv repositories:
git clone git://git.yoctoproject.org/meta-raspberrypi.git
git clone https://github.com/s-vincent/meta-raspberrypi-rt-sv.git

## Raspberry Pi 3 boards

### Build

- Set the environment:
source ./yocto-poky/oe-init-build-env ./rpi3-build/

- Build the core-image-minimal image:
bitbake core-image-minimal

### Images available

- rpi-core-image-minimal-rt: same as core-image-minimal but with an RT kernel 
and rt-tests suite.
- rpi-core-image-minimal-xenomai: same as core-image-minimal but with an I-pipe
kernel and xenomai suite.
- rpi-basic-image-rt: same as rpi-basic-image but with an RT kernel and rt-tests
suite.
- rpi-basic-image--xenomai: same as rpi-basic-image but with an I-pipe kernel
and xenomai suite.

## Softwares

There is some additionnals sample softwares in meta-softwares-sv repository.

Please look at https://github.com/s-vincent/meta-softwares-sv.

## Links

* https://www.yoctoproject.org/docs/2.3/mega-manual/mega-manual.html
* https://github.com/s-vincent/meta-raspberrypi-rt-sv/
* https://github.com/s-vincent/meta-softwares-sv/

