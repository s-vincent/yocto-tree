# yocto-tree

Yocto development tree.

## Boards

Following custom boards are supported:
- Raspberry Pi 3 32-bit (rpi-4.9.y-RT);
- Raspberry Pi 3 64-bit (rpi-4.9.y-RT).

## Setup

Clone this yocto-tree repository and enter the directory:

```
git clone https://github.com/s-vincent/yocto-tree.git
cd yocto-tree
```

Clone the yocto-poky and meta-softwares-sv repository:

```
git clone -b rocko git://git.yoctoproject.org/poky.git yocto-poky
git clone -b rocko git://git.openembedded.org/meta-openembedded
git clone https://github.com/s-vincent/meta-softwares-sv.git
```

For raspberry Pi 3 boards, clone meta-raspberrypi and meta-raspberrypi-rt-sv
repositories:

```
git clone -b rocko git://git.yoctoproject.org/meta-raspberrypi.git
git clone https://github.com/s-vincent/meta-raspberrypi-rt-sv.git
```

## Raspberry Pi 3 boards

### Build environment

Set the environment:

* For 32-bit:
`source ./yocto-poky/oe-init-build-env ./rpi3-build/`

* For 64-bit:
`source ./yocto-poky/oe-init-build-env ./rpi3-64-build/`

To use a 4.9.x PREEMPT-RT kernel, modify conf/local.conf and adds:

`PREFERRED_PROVIDER_virtual/kernel := "linux-raspberrypi-rt"`

### Images available

* rpi-core-minimal-image-rt (same as rpi-minimal-image buth with PREEMPT-RT
kernel rt-tests suite);
* rpi-basic-image-rt (same as rpi-basic-image but with PREEMPT-RT kernel and
rt-tests suite).

Note: to use *-rt image, you have to set the RT kernel as specified in previous
section.

## Softwares

There is some additionnals sample softwares in meta-softwares-sv repository.

Please look at https://github.com/s-vincent/meta-softwares-sv.

## Links

* https://www.yoctoproject.org/docs/2.3/mega-manual/mega-manual.html
* https://github.com/s-vincent/meta-raspberrypi-rt-sv/
* https://github.com/s-vincent/meta-softwares-sv/

