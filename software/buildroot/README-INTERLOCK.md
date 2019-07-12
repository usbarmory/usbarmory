Embedded INTERLOCK distribution for the USB armory Mk I
=======================================================

This directory contains [Buildroot](http://buildroot.uclibc.org/)
customizations for cross-compiling a minimal embedded Linux environment for the
[USB armory](https://inversepath.com/usbarmory) Mk I with
[INTERLOCK](https://github.com/inversepath/interlock) support.

Once installed on a microSD card for the USB armory, the Buildroot image allows
quick and easy access to the INTERLOCK web application, exposing advanced
interaction with an encrypted storage.

![INTERLOCK screenshot](https://inversepath.com/images/interlock.png)

Operation
=========

The USB armory + INTERLOCK Buildroot image operates as follows:

  * The board LED is used to indicate startup (flashing), boot completed (off)
    and shutdown (on) stages.

  * At boot a DHCP server is started to automatically expose the USB armory
    default IP address (10.0.0.1) to the host, which typically requires no
    explicit configuration as most OSes automatically point a DHCP client to
    the emulated Ethernet over USB interface.

  * Only at the very first boot (which therefore takes longer than subsequent
    ones), an encrypted partition is created and configured on volume `armory`
    with default password `usbarmory`.

  * The INTERLOCK application is reachable at address https://10.0.0.1:4430
    allowing to change default credentials (`armory:usbarmory`) and interaction
    with the encrypted storage.

    New HTTPS TLS certificates are generated at the very first boot, you can
    access them, for import or customization, on the first microSD partition.

  * The 'Poweroff' action, within INTERLOCK, allows safe shutdown.

  * The `interlock` user `.ssh` directory can be referenced within the
    encrypted partition, therefore you can upload a `.ssh/authorized_keys` file
    with INTERLOCK to have SSH access for debugging or upgrading (see Upgrading
    section).

  * INTERLOCK Signal support is enabled, its registration and operation require
    the host computer to share its Internet connection.

    Links:
    [Signal support](https://github.com/inversepath/interlock#signal-support),
    [Internet connection sharing](https://github.com/inversepath/usbarmory/wiki/Host-communication#setup--connection-sharing-linux).

  * The driver for the USB armory SoC Security Controller (SCCv2) is included
    as a Linux kernel module, loaded at boot and granted `interlock` user
    privileges. It is unused by INTERLOCK in its default configuration.

    Links:
    [mxc-scc2 driver](https://github.com/inversepath/mxc-scc2)

  * A serial console is available on the
    [breakout header](https://github.com/inversepath/usbarmory/wiki/GPIOs),
    default root password is `usbarmory`.

The full list of features and capabilities of INTERLOCK is detailed in its
[documentation](https://github.com/inversepath/interlock/blob/master/README.md).

Binary releases
===============

Users that do not desire to manually compile and install the
image can find binary releases at the following URL:

https://github.com/inversepath/interlock/releases

Compiling
=========

The [Buildroot requirements](http://buildroot.uclibc.org/downloads/manual/manual.html#requirement)
and [INTERLOCK requirements](https://github.com/inversepath/interlock#compiling)
must be satisfied before starting the compilation process.

INTERLOCK Signal support is enabled by default in the Buildroot configuration,
therefore its [dependencies](https://github.com/inversepath/interlock#signal-support)
are also required. The feature can be disabled in Buildroot `.config` file if
desired.

Install Buildroot:

```
git clone https://github.com/buildroot/buildroot
# NOTE: you are welcome to try the current branch and report any issues that
# you may encounter, for the last tested branch checkout the following one:
# cd buildroot && git checkout 2019.02.4
```

Download the USB armory [repository](https://github.com/inversepath/usbarmory)
and configure Buildroot by passing the directory holding this README file with
the `BR2_EXTERNAL` environment variable. This generates a `.config` file that
can be optionally customized if required:

```
# adjust the USBARMORY_GIT variable according to your environment
cd buildroot
make BR2_EXTERNAL=${USBARMORY_GIT}/software/buildroot interlock_mark-one_defconfig
```

The bootloader, kernel and filesystem can be built as follows:

```
make BR2_EXTERNAL=${USBARMORY_GIT}/software/buildroot
```

The process results in the following output files:

  * The bootloader: `output/images/u-boot.imx`
  * The Device Tree Blob (dtb) file: `output/images/imx53-usbarmory.dtb`
  * The kernel and embedded root filesystem: `output/images/zImage`

The next section illustrates how to install the output files on a target
microSD card.

Preparing the microSD card for the first time
=============================================

**WARNING**: the following operations will destroy any previous contents on the
target microSD card.

**IMPORTANT**: `TARGET_DEV` must be replaced with your microSD device, ensure
that you are specifying the correct one. Errors in target specification will
result in disk corruption.

```
export TARGET_DEV=/dev/sdX # pick the appropriate device name for your microSD card (e.g. /dev/sdb)
export TARGET_MNT=/mnt     # set the microSD root file system mounting path
```

The microSD card must be configured with a single partition with Linux (83)
type and 16M of size, all previous partitions configured on the card must be
deleted before the following instructions are applied.

Create the partition:

```
parted $TARGET_DEV --script mkpart primary ext2 5M 21M
```

Format the partition with an ext2 filesystem:

```
mkfs.ext2 ${TARGET_DEV}1
```

Installing / Upgrading
======================

Mount the partition, copy the kernel and dtb files generated by Buildroot in
its `output/images` directory, to the `boot` directory on the microSD card:

```
mount ${TARGET_DEV}1 $TARGET_MNT
mkdir ${TARGET_MNT}/boot
cp output/images/zImage ${TARGET_MNT}/boot
cp output/images/imx53-usbarmory.dtb ${TARGET_MNT}/boot
umount $TARGET_MNT
```

Install the bootloader:

```
dd if=output/images/u-boot.imx of=$TARGET_DEV bs=512 seek=2 conv=fsync
```

You should now be able to boot the USB armory using the imaged microSD card.

**NOTE**: upgrading can also be performed live on the running image using SSH
access (see Operation section) as the partition is automatically mounted under
`/mnt` and sudo access is available.
