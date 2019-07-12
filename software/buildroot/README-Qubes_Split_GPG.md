Qubes Split GPG server for the USB armory Mk I
==============================================

This directory contains [Buildroot](http://buildroot.uclibc.org/)
customizations for cross-compiling a minimal embedded Linux environment for the
[USB armory](https://inversepath.com/usbarmory) Mk I with
[Qubes Split GPG](https://www.qubes-os.org/doc/split-gpg/) support.

Once installed on a microSD card for the USB armory, the Buildroot image
results in a minimal GPG installation, protected by encrypted storage, that can
act as gpg-server for Qubes Split GPG clients.

![Qubes Split GPG with USB armory](https://cdn.rawgit.com/inversepath/qubes-qrexec-to-tcp/master/images/qrexec-to-tcp.svg)

Operation
=========

The USB armory + Qubes Split GPG Buildroot image operates as follows:

  * The board LED is used to indicate startup (flashing), boot completed (off)
    and shutdown (on) stages.

  * At boot a DHCP server is started to automatically expose the USB armory
    default IP address (10.0.0.1) to the host, which typically requires no
    explicit configuration as most OSes automatically point a DHCP client to
    the emulated Ethernet over USB interface.

  * Only at the very first boot (which therefore takes longer than subsequent
    ones), an encrypted partition is created and configured on volume `armory`
    with default password `usbarmory`.

  * The `gpg` user allows operation with 3 different SSH public keys (see
    Compiling for their configuration):

    `LOGIN_PUBKEY`:  full shell access, use to unlock the encrypted partition
                     after boot and setup GPG keyring at first boot;

    `GPG_PUBKEY`:    used by Qubes Split GPG client (see Qubes OS setup);

    `IMPORT_PUBKEY`: used by Qubes Split GPG client for import commands
                     (see Qubes OS setup).

  * The `LED_TIMEOUT` variable, passed at Buildroot image compilation, controls
    the time the USB armory LED lights up to warn the user about GPG
    operations.

  * A serial console is available on the
    [breakout header](https://github.com/inversepath/usbarmory/wiki/GPIOs),
    default root password is `usbarmory`.

Qubes OS setup and operation
============================

See repository [qubes-qrexec-to-tcp](https://github.com/inversepath/qubes-qrexec-to-tcp)
for configuration files and instructions.

Compiling
=========

The [Buildroot requirements](http://buildroot.uclibc.org/downloads/manual/manual.html#requirement)
must be satisfied before starting the compilation process.

Additionally the `dropbearkey` binary is required for key generation, provided
part of the "dropbear" package on most distributions.

Install Buildroot:

```
git clone https://github.com/buildroot/buildroot
```

Download the USB armory [repository](https://github.com/inversepath/usbarmory)
and configure Buildroot by passing the directory holding this README file with
the `BR2_EXTERNAL` environment variable. This generates a `.config` file that
can be optionally customized if required:

```
# adjust the USBARMORY_GIT variable according to your environment
cd buildroot
make BR2_EXTERNAL=${USBARMORY_GIT}/software/buildroot qubes_split_gpg_mark-one_defconfig
```

Set the following environment variables for the 3 required SSH public keys (see
Operation), note that three *different* public keys are required.

```
# IMPORTANT: the 3 variables must point to different keys
export  LOGIN_PUBKEY=<path to public key>
export    GPG_PUBKEY=<path to public key>
export IMPORT_PUBKEY=<path to public key>
```

Set the LED_TIMEOUT environment variable, which represents the seconds for USB
armory LED light up to notify about GPG operation requests.

```
# example of 4 seconds
export LED_TIMEOUT=4
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
