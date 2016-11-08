Embedded Buildroot distributions for the USB armory
===================================================

This directory contains [Buildroot](http://buildroot.uclibc.org/)
customizations for cross-compiling minimal single-purpose embedded Linux
environments for the [USB armory](https://inversepath.com/usbarmory).

Available profiles:

* [INTERLOCK](https://github.com/inversepath/interlock) support for encrypted
  storage and Signal messaging.

  Documentation: [Embedded INTERLOCK distribution](https://github.com/inversepath/usbarmory/blob/master/software/buildroot/README-INTERLOCK.md)

* [Qubes Split GPG](https://www.qubes-os.org/doc/split-gpg/) support for
  isolated Qubes OS GPG server with encrypted storage.

  *NOTE*: this is currently a work in progress, only preliminary/partial
  documentation is available.

  Documentation: [Qubes Split GPG server](https://github.com/inversepath/usbarmory/blob/master/software/buildroot/README-Qubes_Split_GPG.md)
