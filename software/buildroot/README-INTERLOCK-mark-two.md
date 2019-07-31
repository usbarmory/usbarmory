# Embedded INTERLOCK distribution for the USB armory Mk II

This directory contains [Buildroot](http://buildroot.uclibc.org/)
customizations for cross-compiling a minimal embedded Linux environment for the
[USB armory](https://inversepath.com/usbarmory) Mk II with
[INTERLOCK](https://github.com/inversepath/interlock) support.

Once installed on a microSD card for the USB armory, the Buildroot image allows
quick and easy access to the INTERLOCK web application, exposing advanced
interaction with an encrypted storage.

![INTERLOCK screenshot](https://inversepath.com/images/interlock.png)

## Operation

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

  * The INTERLOCK application is reachable at address https://10.0.0.1
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

  * The driver for the NXP Data Co-Processor (DCP) is included as a Linux
    kernel module and loaded at boot. It is unused by INTERLOCK in its default
    configuration.

    Links:
    [mxs-dcp driver](https://github.com/inversepath/mxs-dcp)

  * A serial console is available through the
    [debug accessory](https://github.com/inversepath/usbarmory/tree/master/hardware/mark-two-debug-accessory),
    default root password is `usbarmory`.

The full list of features and capabilities of INTERLOCK is detailed in its
[documentation](https://github.com/inversepath/interlock/blob/master/README.md).

## Binary releases

Users that do not desire to manually compile and install the
image can find binary releases at the following URL:

https://github.com/inversepath/interlock/releases

## Compiling

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
make BR2_EXTERNAL=${USBARMORY_GIT}/software/buildroot interlock_mark-two_defconfig
```

The bootloader, kernel and filesystem can be built as follows:

```
make BR2_EXTERNAL=${USBARMORY_GIT}/software/buildroot
```

The process results in the following output files:

  * The bootloader: `output/images/u-boot.imx`
  * The Device Tree Blob (dtb) file: `output/images/imx6ull-usbarmory.dtb`
  * The kernel and embedded root filesystem: `output/images/zImage`

By default the external microSD card is used as boot media, to use the internal
MMC card the U-Boot configuration must be changed to disable
`CONFIG_SYS_BOOT_DEV_MICROSD` and enable `CONFIG_SYS_BOOT_DEV_EMMC` in
`output/build/uboot-<version>/.config`, then recompile with `make
uboot-rebuild`.

The next sections illustrates how to install the output files on a target
microSD card or the built-in eMMC card, according to user boot media
preference.

## Using the external microSD as boot media

### Preparing the microSD card for the first time

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

### microSD installation / upgrade

Mount the partition, copy the kernel and dtb files generated by Buildroot in
its `output/images` directory, to the `boot` directory on the microSD card:

```
mount ${TARGET_DEV}1 $TARGET_MNT
mkdir ${TARGET_MNT}/boot
cp output/images/zImage ${TARGET_MNT}/boot
cp output/images/imx6ull-usbarmory.dtb ${TARGET_MNT}/boot
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

## Using the internal eMMC as boot media

The eMMC can be used as boot media only if the `BR2_TARGET_UBOOT_PATCH` has
been modified accordingly, as indicated in the _Compiling_ section.

### Accessing the eMMC as USB storage device

**WARNING**: the following operations will destroy any previous contents on the
target eMMC.

Set the USB armory Mk II to boot in Serial Boot Loader by setting the boot
switch towards the microSD slot, without a microSD card connected. Connect the
USB Type-C interface to the host and verify that your host kernel successfully
detects the board:

```
usb 1-1: new high-speed USB device number 8 using xhci_hcd
usb 1-1: New USB device found, idVendor=15a2, idProduct=0080, bcdDevice= 0.01
usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 1-1: Product: SE Blank 6ULL
usb 1-1: Manufacturer: Freescale SemiConductor Inc 
hid-generic 0003:15A2:0080.0003: hiddev96,hidraw1: USB HID v1.10 Device [Freescale SemiConductor Inc  SE Blank 6ULL] on usb-0000:00:14.0-1/input0
```

Load the bootloader using the [imx_loader](https://github.com/boundarydevices/imx_usb_loader) utility:

```
imx_usb output/images/u-boot.imx
```

On the USB armory Mk II serial console, accessible through the [debug
accessory](https://github.com/inversepath/usbarmory/tree/master/hardware/mark-two-debug-accessory),
start the USB storage emulation (UMS) mode:

```
=> ums 0 mmc 1
```

Alternatively, if external serial console access is not available, a
[patch](https://github.com/inversepath/usbarmory/tree/master/software/u-boot/0001-USB-armory-mark-two-alpha-UMS.patch)
to automatically enable UMS mode can be applied to U-Boot 2019.04.

Once in UMS mode, the host kernel should detect a USB storage device:

```
scsi 3:0:0:0: Direct-Access     Linux    UMS disk 0       ffff PQ: 0 ANSI: 2
sd 3:0:0:0: [sdX] 7471104 512-byte logical blocks: (3.83 GB/3.56 GiB)
sd 3:0:0:0: [sdX] Write Protect is off
sd 3:0:0:0: [sdX] Mode Sense: 0f 00 00 00
sd 3:0:0:0: [sdX] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
 sdX: sdX1 sdX2
sd 3:0:0:0: [sdX] Attached SCSI removable disk
```

### Preparing the eMMC for the first time

**WARNING**: the following operations will destroy any previous contents on the
target eMMC.

**IMPORTANT**: `TARGET_DEV` must be replaced with the device your kernel
assigned to the USB armory Mk II board, ensure that you are specifying the
correct one. Errors in target specification will result in disk corruption.

```
export TARGET_DEV=/dev/sdX # pick the appropriate device name for the eMMC device (e.g. /dev/sdb)
export TARGET_MNT=/mnt     # set the eMMC root file system mounting path
```

The eMMC must be configured with a single partition with Linux (83) type and at
least 21M of size, all previous partitions configured on the card must be
deleted before the following instructions are applied.

Create the partition:

```
parted $TARGET_DEV --script mkpart primary ext2 5M 21M
```

Format the partition with an ext2 filesystem:

```
mkfs.ext2 ${TARGET_DEV}1
```

### eMMC installation / upgrade

Set up access accordingly to section _Accessing the USB armory Mk II eMMC as USB
storage device_ instructions.

Mount the partition, copy the kernel and dtb files generated by Buildroot in
its `output/images` directory, to the root directory on the eMMC:

```
mount ${TARGET_DEV}1 $TARGET_MNT
cp output/images/zImage ${TARGET_MNT}
cp output/images/imx6ul-usbarmory.dtb ${TARGET_MNT}/
umount $TARGET_MNT
```

Install the bootloader:

```
dd if=output/images/u-boot.imx of=$TARGET_DEV bs=512 seek=2 conv=fsync
```

On the bootloader console press CTRL+C to stop the usb storage emulation mode.
Then disconnect the Type-C USB interface and restore eMMC boot mode.

**NOTE**: upgrading can also be performed live on the running image using SSH
access (see Operation section) as the partition is automatically mounted under
`/mnt` and sudo access is available.
