### NXP HABv4 Secure Boot utility

This directory includes scripts that can be used to create NXP HABv4 secure
boot keys, tables and signed images.

Please note that our [crucible](https://github.com/f-secure-foundry/crucible)
package provides a more modern replacement with the
[habtool](https://github.com/f-secure-foundry/crucible/tree/master/cmd/habtool)
utility and its corresponding [HAB library](https://pkg.go.dev/github.com/f-secure-foundry/crucible/hab).

### USB armory Mk II

The HAB feature enables on-chip internal Boot ROM authentication of initial
bootloader (i.e. Secure Boot) with a digital signature, establishing the first
trust anchor for code authentication. See
[Secure Boot](https://github.com/f-secure-foundry/usbarmory/wiki/Secure-boot-(Mk-II)) for
more information and usage instructions.

### USB armory Mk I

**IMPORTANT**: this feature is currently deprecated on i.MX53 based hardware,
see the related
[security advisory](https://github.com/f-secure-foundry/usbarmory/blob/master/software/secure_boot/Security_Advisory-Ref_QBVR2017-0001.txt).
