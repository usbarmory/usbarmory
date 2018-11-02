Embedded Buildroot distributions for the USB armory
===================================================

This directory contains [Buildroot](http://buildroot.uclibc.org/)
customizations for cross-compiling minimal single-purpose embedded Linux
environments for the [USB armory](https://inversepath.com/usbarmory).

Available USB armory Mk I profiles:

* [INTERLOCK](https://github.com/inversepath/interlock) support for encrypted
  storage and Signal messaging.

  Documentation: [Embedded INTERLOCK distribution (Mk I)](https://github.com/inversepath/usbarmory/blob/master/software/buildroot/README-INTERLOCK.md)

* [Qubes Split GPG](https://www.qubes-os.org/doc/split-gpg/) support for
  isolated Qubes OS GPG server with encrypted storage.

  Documentation: [Qubes Split GPG server](https://github.com/inversepath/usbarmory/blob/master/software/buildroot/README-Qubes_Split_GPG.md)

The following profiles apply to the [Technexion i.MX6UL PICO](https://www.technexion.com/products/system-on-modules/pico/pico-compute-modules/detail/PICO-IMX6UL-EMMC)
board, an i.MX6UL device used for prototyping the USB armory Mk II software:

* [INTERLOCK](https://github.com/inversepath/interlock) support for encrypted
  storage and Signal messaging.

  Documentation: [Embedded INTERLOCK distribution (i.MX6UL PICO)](https://github.com/inversepath/usbarmory/blob/master/software/buildroot/README-INTERLOCK-imx6ul-pico.md)
