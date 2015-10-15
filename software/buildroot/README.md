Embedded INTERLOCK distribution for the USB armory
==================================================

This directory contains [Buildroot](http://buildroot.uclibc.org/)
customizations for cross-compiling a minimal embedded Linux environment for the
[USB armory](http://inversepath.com/usbarmory) with
[INTERLOCK](https://github.com/inversepath/interlock) support.

Once installed on a microSD card for the USB armory, the Buildroot image allows
quick and easy access to the INTERLOCK web application, exposing advanced
interaction with an encrypted storage.

![INTERLOCK screenshot](http://inversepath.com/images/interlock.png)

Operation
=========

The USB armory + INTERLOCK Buildroot image operates as follow:

  * The board LED is used to indicate startup (flashing), boot completed (off)
    and shutdown (on) stages.

  * At startup a DHCP server is started to automatically expose the USB armory
    default IP address (10.0.0.1) to the host, which typically requires no
    explicit configuration as most OSes automatically point a DHCP client to
    the emulated Ethernet over USB interface.

  * Only at the very first boot (which therefore takes longer than subsequent
    ones), an encrypted partition is created and configured on volume "armory"
    with default password "usbarmory".

  * The INTERLOCK application is reachable at address https://10.0.0.1:4430
    allowing to change default credentials ("armory":"usbarmory") and
    interaction with the encrypted storage.

  * The 'Poweroff' action, within INTERLOCK, allows safe shutdown.

  * The 'interlock' user home '.ssh' directory is linked to the encrypted
    partition, therefore you can upload an authorized_keys file with INTERLOCK
    to have SSH access.

    This is useful for [TextSecure registration](https://github.com/inversepath/interlock#textsecure-support)
    which can be accomplished by logging in via SSH, logging out from
    INTERLOCK, killing it and restarting it with
    'interlock -c /etc/interlock.conf -r'. TextSecure registration and operation requires the host computer to
    [share its Internet connection](https://github.com/inversepath/usbarmory/wiki/Host-communication#setup--connection-sharing-linux).

  * A serial console is available on the [breakout header](https://github.com/inversepath/usbarmory/wiki/GPIOs),
    default root password is 'usbarmory'.

The full list of features and capabilities of INTERLOCK is detailed in its
[documentation](https://github.com/inversepath/interlock/blob/master/README.md).

Binary releases
===============

**COMING SOON**: Users that do not desire to manually compile and install the
image will soon be able to find binary releases at
[http://dev.inversepath.com/usbarmory](http://dev.inversepath.com/usbarmory).

Compiling
=========

The [Buildroot requirements](http://buildroot.uclibc.org/downloads/manual/manual.html#requirement)
and [INTERLOCK requirements](https://github.com/inversepath/interlock#compiling) must be satisfied
before starting the compilation process.

The INTERLOCK  TextSecure feature is enabled by default in Buildroot configuration, therefore its
[dependencies](https://github.com/inversepath/interlock#textsecure-support) are also required. The feature
can be disabled in Buildroot configuration if desired.

Install Buildroot:

```
git clone git://git.buildroot.net/buildroot
```

Download the USB armory [repository](https://github.com/inversepath/usbarmory)
and configure Buildroot by passing the directory holding this README file with
the BR2_EXTERNAL environment variable. This generates a '.config' file that can
be optionally customized if required:

```
make BR2_EXTERNAL=<path to usbarmory repository>/software/buildroot usbarmory_mark_one_defconfig
```

The bootloader, kernel and filesystem can be built as follows:

```
make BR2_EXTERNAL=<path to usbarmory repository>/software/buildroot
```

The process results in the following output files:

  * The bootloader: output/images/u-boot.imx
  * The Device Tree Blob (dtb) file: output/images/imx53-usbarmory.dtb
  * The kernel and embedded roots filesystem: output/images/uImage

The next section illustrates how to install the ouput files on a target microSD
card.

Installation
============

**WARNING**: the following operations will destroy any previous contents on the
target microSD card.

**IMPORTANT**: $TARGET_DEV must be replaced with your microSD device, ensure
that you are specifying the correct one. Errors in target specification will
result in disk corruption.

```
export TARGET_DEV=/dev/sdX # pick the appropriate device name for your microSD card (e.g. /dev/sdb)
export TARGET_MNT=/mnt     # set the microSD root file system mounting path
```

The microSD card must be configured with a single partition with Linux (83)
type and 16M of size, all previous partitions configured on the card must be
deleted before the following instructions are applied.

Example using parted:

```
parted $TARGET_DEV --script mkpart primary ext2 5M 21M
```

Format the partition with an ext2 filesystem using mkfs.ext2:

```
mkfs.ext2 ${TARGET_DEV}1
```

Mount the first partition and copy the kernel and dtb file, located in
directory 'output/images' under the Buildroot installation as a result of the
compilation process, to the 'boot' directory on the microSD card:

```
mount ${TARGET_DEV}1 $TARGET_MNT
mkdir ${TARGET_MNT}/boot
cp output/images/uImage ${TARGET_MNT}/boot
cp output/images/imx53-usbarmory.dtb ${TARGET_MNT}/boot
umount $TARGET_MNT
```

Install the bootloader:

```
dd if=output/images/u-boot.imx of=$TARGET_DEV bs=512 seek=2 conv=fsync
```

You should now be able to boot the USB armory using the imaged microSD card.
