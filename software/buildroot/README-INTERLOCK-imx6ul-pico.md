Embedded INTERLOCK distribution for the Technexion i.MX6UL PICO
===============================================================

This directory contains [Buildroot](http://buildroot.uclibc.org/)
customizations for cross-compiling a minimal embedded Linux environment for the
[Technexion i.MX6UL PICO](https://www.technexion.com/products/system-on-modules/pico/pico-compute-modules/detail/PICO-IMX6UL-EMMC)
SoM on the [PICO-PI](https://www.technexion.com/products/pico-baseboards/detail/PICO-PI)
baseboard board with [INTERLOCK](https://github.com/inversepath/interlock) support.

Once installed on the eMMC of the i.MX6UL PICO, the Buildroot image allows
quick and easy access to the INTERLOCK web application, exposing advanced
interaction with an encrypted storage.

![INTERLOCK screenshot](https://inversepath.com/images/interlock.png)

Operation
=========

The i.MX6UL PICO + INTERLOCK Buildroot image operates as follows:

  * At boot a DHCP server is started to automatically expose the USB armory
    default IP address (10.0.0.1) to the host, which typically requires no
    explicit configuration as most OSes automatically point a DHCP client to
    the emulated Ethernet over USB interface.

  * Only at the very first boot (which therefore takes longer than subsequent
    ones), an encrypted partition is created and configured on volume `interlock`
    with default password `interlock`.

  * The INTERLOCK application is reachable at address https://10.0.0.1:4430
    allowing to change default credentials (`interlock:interlock`) and interaction
    with the encrypted storage.

    New HTTPS TLS certificates are generated at the very first boot.

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

  * The driver for the NXP Cryptographic Acceleration and Assurance Module (CAAM)
    is included as a Linux kernel module, loaded at boot and granted `interlock` user
    privileges. It is unused by INTERLOCK in its default configuration.

    Links:
    [caam-keyblob driver](https://github.com/inversepath/caam-keyblob)

  * A serial console is available on the the micro USB interface.
    default root password is `pico`.

The full list of features and capabilities of INTERLOCK is detailed in its
[documentation](https://github.com/inversepath/interlock/blob/master/README.md).

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
# cd buildroot && git checkout 2018.08.1
```

Download the USB armory [repository](https://github.com/inversepath/usbarmory)
and configure Buildroot by passing the directory holding this README file with
the `BR2_EXTERNAL` environment variable. This generates a `.config` file that
can be optionally customized if required:

```
# adjust the USBARMORY_GIT variable according to your environment
cd buildroot
make BR2_EXTERNAL=${USBARMORY_GIT}/software/buildroot interlock_imx6ul-pico_defconfig
```

The bootloader, kernel and filesystem can be built as follows:

```
make BR2_EXTERNAL=${USBARMORY_GIT}/software/buildroot
```

The process results in the following output files:

  * The bootloader: `output/images/u-boot.imx`
  * The Device Tree Blob (dtb) file: `output/images/imx6ul-pico-hobbit-caam.dtb`
  * The kernel and embedded root filesystem: `output/images/zImage`

The next section illustrates how to install the ouput files on the i.MX6UL PICO board.

Accessing the i.MX6UL PICO eMMC as USB storage device
=====================================================

**WARNING**: the following operations will destroy any previous contents on the
target eMMC.

Set the i.MX6UL PICO to boot in Serial Boot Loader mode as described on the
[PICO-PI hardware manual](https://s3.us-east-2.amazonaws.com/technexion/documentation/pico-pi-imx7-rev-b1.pdf)
(page 18). Connect the USB Type-C interface to the host and verify that your
host kernel successfully detects the board:

```
usb 1-1: new high-speed USB device number 48 using xhci_hcd
usb 1-1: New USB device found, idVendor=15a2, idProduct=007d, bcdDevice= 0.01
usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 1-1: Product: SP Blank 6UL 
usb 1-1: Manufacturer: Freescale SemiConductor Inc 
hid-generic 0003:15A2:007D.0009: hiddev0,hidraw0: USB HID v1.10 Device [Freescale SemiConductor Inc  SP Blank 6UL ] on usb-0000:00:14.0-1/input0

```

Load the bootloader using the [imx_loader](https://github.com/boundarydevices/imx_usb_loader) utility:

```
imx_usb output/images/u-boot.imx
```

On the i.MX6UL PICO console port accessible via the micro USB interface (serial
protocol: 115200 8N1) start the USB storage emulation mode:

```
=> ums 0 mmc 0
```

The host kernel should detect a USB storage device:

```
scsi 3:0:0:0: Direct-Access     Linux    UMS disk 0       ffff PQ: 0 ANSI: 2
sd 3:0:0:0: [sdX] 7471104 512-byte logical blocks: (3.83 GB/3.56 GiB)
sd 3:0:0:0: [sdX] Write Protect is off
sd 3:0:0:0: [sdX] Mode Sense: 0f 00 00 00
sd 3:0:0:0: [sdX] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
 sdX: sdX1 sdX2
sd 3:0:0:0: [sdX] Attached SCSI removable disk

```

Preparing the i.MX6UL PICO eMMC for the first time
==================================================

**IMPORTANT**: `TARGET_DEV` must be replaced with the device your kernel assigned to
the i.MX6UL PICO board, ensure that you are specifying the correct one. Errors
in target specification will result in disk corruption.

```
export TARGET_DEV=/dev/sdX # pick the appropriate device name for the eMMC device (e.g. /dev/sdb)
export TARGET_MNT=/mnt     # set the eMMC root file system mounting path
```

The eMMC must be configured with a single partition with Linux (83)
type and 100M of size, all previous partitions configured on the card must be
deleted before the following instructions are applied.

Create the partition:

```
parted $TARGET_DEV --script mkpart primary ext2 5M 100M
```

Format the partition with an ext2 filesystem:

```
mkfs.ext2 ${TARGET_DEV}1
```

Installing / Upgrading
======================

Set up access accordingly to section _Accessing the i.MX6UL PICO eMMC as USB
storage device_ instructions.

Mount the partition, copy the kernel and dtb files generated by Buildroot in
its `output/images` directory, to the root directory on the eMMC:

```
mount ${TARGET_DEV}1 $TARGET_MNT
cp output/images/zImage ${TARGET_MNT}
cp output/images/imx6ul-pico-hobbit-caam.dtb ${TARGET_MNT}
umount $TARGET_MNT
```

Install the bootloader:

```
dd if=output/images/u-boot.imx of=$TARGET_DEV bs=512 seek=2 conv=fsync
```

On the bootloader console press CTRL+C to stop the usb storage emulation mode.
Then disconnect the Type-C USB interface and restore eMMC boot mode.

You should now be able to boot the i.MX6UL PICO.

**NOTE**: upgrading can also be performed live on the running image using SSH
access (see Operation section) as the partition is automatically mounted under
`/mnt` and sudo access is available.
