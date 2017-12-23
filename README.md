# yocto-tree

Yocto development tree.

## Boards

Following custom boards are supported:
- Raspberry Pi 3 32-bit (rpi-4.9.y-RT, rpi-4.9.y-ipipe);
- Raspberry Pi 3 64-bit (rpi-4.9.y-RT);
- BeagleBone Black (4.14.y-RT, 4.9.y-ipipe).

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

For Raspberry Pi 3 boards, clone meta-raspberrypi and meta-raspberrypi-rt-sv
repositories:

```
git clone -b rocko git://git.yoctoproject.org/meta-raspberrypi.git
git clone https://github.com/s-vincent/meta-raspberrypi-rt-sv.git
```

For BeagleBone boards, clone meta-beaglebone-rt-sv repositoriy:

```
git clone https://github.com/s-vincent/meta-beaglebone-rt-sv.git
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

To use a 4.9.x I-pipe/Xenomai kernel, modify conf/local.conf and adds:

`PREFERRED_PROVIDER_virtual/kernel := "linux-raspberrypi-ipipe"`

### Images available

* rpi-hwup-image-rt (same as rpi-hwup-image buth with PREEMPT-RT
kernel and rt-tests suite);
* rpi-basic-image-rt (same as rpi-basic-image but with PREEMPT-RT kernel and
rt-tests suite);
* rpi-hwup-image-xenomai (same as rpi-hwup-image buth with I-pipe/Xenomai 
kernel, rt-tests and Xenomai suite);
* rpi-basic-image-xenomai (same as rpi-basic-image buth with I-pipe/Xenomai 
kernel, rt-tests and Xenomai suite).

Note: to use *-rt image, be sure to set PREEMPT-RT kernel as specified in 
previous section. 

Note (2): to use *-xenomai image, be sure to set I-pipe/Xenomai kernel as 
specified in  previous section. 

## BeagleBone Black

### Build environment

Set the environment:

`source ./yocto-poky/oe-init-build-env ./beaglebone-build/`

To use a 4.14.x PREEMPT-RT kernel, modify conf/local.conf and adds:

`PREFERRED_PROVIDER_virtual/kernel := "linux-yocto-rt"`

To use a 4.9.x I-pipe/Xenomai kernel, modify conf/local.conf and adds:

`PREFERRED_PROVIDER_virtual/kernel := "linux-yocto-ipipe"`

### Images available

* beaglebone-hwup-image-rt (same as core-image-minimal buth with PREEMPT-RT
kernel and rt-tests suite);
* beaglebone-basic-image-rt (same as basic-image but with PREEMPT-RT kernel and
rt-tests suite);
* beaglebone-hwup-image-xenomai (same as core-image-minimal buth with 
I-pipe/Xenomai kernel, rt-tests and Xenomai suite);
* beaglebone-basic-image-xenomai (same as basic-image buth with I-pipe/Xenomai 
kernel, rt-tests and Xenomai suite).

Note: to use *-rt image, be sure to set PREEMPT-RT kernel as specified in 
previous section. 

Note (2): to use *-xenomai image, be sure to set I-pipe/Xenomai kernel as 
specified in  previous section. 

## Softwares

There is some additionnals sample softwares in meta-softwares-sv repository.

Please look at https://github.com/s-vincent/meta-softwares-sv.

## Links

* https://www.yoctoproject.org/docs/2.3/mega-manual/mega-manual.html
* https://github.com/s-vincent/meta-raspberrypi-rt-sv/
* https://github.com/s-vincent/meta-softwares-sv/

