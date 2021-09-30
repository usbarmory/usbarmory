Embedded Buildroot distributions for the USB armory
===================================================

> :warning: these Buildroot profiles are no longer maintained, the following
> [TamaGo](https://github.com/f-secure-foundry/tamago) unikernels are
> recommended to embed similar single-purpose applications on the USB armory:
>
>  * [Armory Drive](https://github.com/f-secure-foundry/armory-drive)
>  * [GoKey](https://github.com/f-secure-foundry/GoKey)

This directory contains [Buildroot](http://buildroot.uclibc.org/)
customizations for cross-compiling minimal single-purpose embedded Linux
environments for the [USB armory](https://github.com/f-secure-foundry/usbarmory).

USB armory Mk II profiles:

* [INTERLOCK](https://github.com/f-secure-foundry/interlock) support for encrypted
  storage.

  Documentation: [Embedded INTERLOCK distribution (Mk II)](https://github.com/f-secure-foundry/usbarmory/blob/master/software/buildroot/README-INTERLOCK-mark-two.md)

USB armory Mk I profiles:

* [INTERLOCK](https://github.com/f-secure-foundry/interlock) support for encrypted
  storage.

  Documentation: [Embedded INTERLOCK distribution (Mk I)](https://github.com/f-secure-foundry/usbarmory/blob/master/software/buildroot/README-INTERLOCK.md)

* [Qubes Split GPG](https://www.qubes-os.org/doc/split-gpg/) support for
  isolated Qubes OS GPG server with encrypted storage.

  Documentation: [Qubes Split GPG server](https://github.com/f-secure-foundry/usbarmory/blob/master/software/buildroot/README-Qubes_Split_GPG.md)
