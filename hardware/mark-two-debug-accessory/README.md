USB armory Mk II debug accessory
================================

USB armory | https://inversepath.com/usbarmory  
Copyright (c) F-Secure Corporation

The USB armory from [F-Secure](https://www.f-secure.com) and
[Inverse Path](https://inversepath.com) is an open source hardware design,
implementing a flash drive sized computer.

The USB armory Mk II exposes a USB Type-C receptacle, which allows through the
so called USB-C 'debug accessory mode' to route analog/debug signals over its
connector, the USB armory Mk II design leverages on this to break out UART,
SPI, I²C, CAN (pre-transceiver), GPIOs connections to/from its application
processor.

The debug accessory board allows to access UART and GPIO signals through USB,
without requiring probes, through an FTDI FT4232H. This allows, for example,
access to the USB armory Mk II serial console without wires or probes, natively
using only USB cables. All other interfaces can be accessed through dedicated
breakout through holes.

This repository is aimed towards developers, if you wish to purchase a USB
armory, or the debug accessory, board please see the [ordering information](https://inversepath.com/usbarmory#ordering).

![Mk II debug accessory](https://github.com/inversepath/usbarmory/wiki/images/armory-mark-two-debug-accessory.png)

PCB Information
===============

![Mk II debug accessory](https://github.com/inversepath/usbarmory/wiki/images/armory-mark-two-debug-accessory.svg?sanitize=true)

2 layers, 0.80mm thickness, top only components  
Outer layers 0.5 oz base copper foil  
Inner layers   1 oz base copper foil  
width (X) 45.65 mm, height (Y) 25.90 mm  
Red soldermask, white component legend

DRC information
---------------

Minimum track width:            0.127 mm  
Minimum via diameter:           0.450 mm  
Outer layer track width:        0.127 mm  
Outer layer isolation distance: 0.127 mm  
Outer layer annular ring:       0.100 mm  
Smallest final hole (plated):   0.150 mm

USB armory Mk II debug I/Os
===========================

*NOTE*: the connection between the debug accessory and the target is supported
only with the same orientation for both top layers (side with components for
the accessory, side with LEDs for the USB armory).

The following table summarizes the available configurations on the USB armory
Mk II through debug accessory mode, which are exposed on its Type-C receptacle
port.

|  USB-C pin   | MUX mode ALT0 | MUX mode ALT8 | MUX mode ALT2 | MUX mode ALT5 |
|:-------------|---------------|---------------|---------------|---------------|
| SSTXp1 (A2)  | UART2_TX      | ECSPI3_SSO    | I2C4_SCL¹     | GPIO1_IO20   |
| SSTXn1 (A3)  | UART2_RX      | ECSPI3_SCLK   | I2C4_SDA¹     | GPIO1_IO21    |
| SSRXp1 (B11) | UART2_RTS_B   | ECSPI3_MISO   | FLEXCAN2_RX¹  | GPIO1_IO23    |
| SSRXn1 (B10) | UART2_CTS_B   | ECSPI3_MOSI   | FLEXCAN2_TX¹  | GPIO1_IO22    |
| SSRXp2 (A11) | UART4_TX      | ECSPI2_SCLK   | I2C1_SCL      | GPIO1_IO28    |
| SSTXn2 (B3)  | UART4_RX      | ECSPI2_SSO    | I2C1_SDA      | GPIO1_IO29    |
| SSRXn2 (A10) | UART5_TX~     | ECSPI2_MOSI   | I2C2_SCL      | GPIO1_IO30    |
| SSTXp2 (B2)  | UART5_RX~     | ECSPI2_MISO   | I2C2_SDA      | GPIO1_IO31    |

¹ Only on USB armory Mk II boards mounting i.MX6UL SoC, not available on
  versions mounting the i.MX6ULZ.

Debug accessory jumper settings
===============================

Power source
------------

The debug accessory always acts as a power source and is meant to be connected
exclusively to the USB armory Mk II Type-C receptacle port. The USB armory Mk
II Type-C can be safely plugged on a different receptacle as the board can
handle two power sources simultaneously.

It is not recommended to connect the debug accessory to anything other than the
USB armory Mk II, however in case this happens compliant Type-C receptacles
should handle the situation gracefully¹ without concerns.

¹ USB Type-C Cable and Connector Specification (1.3, 2017-07-14):
  "Legacy hosts/chargers that by default source VBUS when connected using any
  legacy USB connector (Standard-A, Micro-B, etc.) to USB Type-C cable or adapter
  are exempted from these two requirements."

I/O mode
--------

The GPIO and UART functions can be used directly using the FTDI FT4232H USB
interface accessible on the Micro USB Type-B connector, all other modes can be
accessed using the exposed breakout through holes.

The following table illustrates the required jumper positions and interfaces
for each available I/O mode.

| Mode  | GPIO¹ | Interface
|:------|-------|-----------------------------------|
| GPIO  |  GPIO | FTDI MPSSE mode on [A,B]DBUS[4-7] |
| UART2 | !GPIO | FTDI RS232 mode on CDBUS[0-3]     |
| UART4 | !GPIO | FTDI RS232 mode on BDBUS[0-1]     |
| UART5 | !GPIO | FTDI RS232 mode on ADBUS[0-1]     |
| SPI2  |  N/A² | through holes: A11, B3, A10, B2   |
| SPI3  |  N/A² | through holes: A2,  A3, B11, B10  |
| I2C1  |  N/A² | through holes: A11, B3            |
| I2C2  |  N/A² | through holes: A10, B2            |
| I2C4  |  N/A² | through holes: A2,  A3            |
| CAN2  |  N/A² | through holes: B11, B10           |

¹ The GPIO header position refers to termination either of the two pins facing
  the "GPIO" label (GPIO position, pins towards positions 3 and 2) or the
  opposite position (!GPIO position, pins towards positions 2 and 1).

² Any position can be used as the FTDI is not used in such mode.

Pin assignment: GPIO
====================

|  USB-C pin   | i.MX6UL pin | FTDI pin | FTDI MPSSE |
|:-------------|-------------|----------|------------|
| SSTXp1 (A2)  | GPIO1_IO20  | BDBUS6   | #B GPIOL2  |
| SSTXn1 (A3)  | GPIO1_IO21  | BDBUS7   | #B GPIOL3  |
| SSRXp1 (B11) | GPIO1_IO23  | BDBUS5   | #B GPIOL1  |
| SSRXn1 (B10) | GPIO1_IO22  | BDBUS4   | #B GPIOL0  |
| SSRXp2 (A11) | GPIO1_IO28  | ADBUS4   | #A GPIOL0  |
| SSTXn2 (B3)  | GPIO1_IO29  | ADBUS7   | #A GPIOL3  |
| SSRXn2 (A10) | GPIO1_IO30  | ADBUS5   | #A GPIOL1  |
| SSTXp2 (B2)  | GPIO1_IO31  | ADBUS6   | #A GPIOL2  |

Pin assignment: UART2
=====================

|  USB-C pin   | i.MX6UL pin | FTDI pin | FTDI MPSSE |
|:-------------|-------------|----------|------------|
| SSTXp1 (A2)  | UART2_TX    | CDBUS1   | #C RXD     |
| SSTXn1 (A3)  | UART2_RX    | CDBUS0   | #C TXD     |
| SSRXp1 (B11) | UART2_RTS_B | CDBUS3   | #C CTS     |
| SSRXn1 (B10) | UART2_CTS_B | CDBUS2   | #C RTS     |

Pin assignment: UART4
=====================

|  USB-C pin   | i.MX6UL pin | FTDI pin | FTDI MPSSE |
|:-------------|-------------|----------|------------|
| SSRXp2 (A11) | UART4_TX    | BDBUS1   | #B RXD     |
| SSTXn2 (B3)  | UART4_RX    | BDBUS0   | #B TXD     |

Pin assignment: UART5
=====================

|  USB-C pin   | i.MX6UL pin | FTDI pin | FTDI MPSSE |
|:-------------|-------------|----------|------------|
| SSRXn2 (A10) | UART5_TX    | ADBUS1   | #A RXD     |
| SSTXp2 (B2)  | UART5_RX    | ADBUS0   | #A TXD     |

License
=======

USB armory | https://inversepath.com/usbarmory  
Copyright (c) F-Secure Corporation

This is an open hardware design licensed under the terms of the CERN Open
Hardware Licence (OHL) v1.2.

You may redistribute and modify this documentation under the terms of the CERN
OHL v.1.2 (http://ohwr.org/cernohl). This documentation is distributed WITHOUT
ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY
QUALITY AND FITNESS FOR A PARTICULAR PURPOSE. Please see the CERN OHL v.1.2 for
applicable conditions.

The following exceptions apply:

- `../lib.snapeda`: all files in this directory are imported or modified
  from SnapEDA symbols and footprints, therefore the license at
  https://www.snapeda.com/about/FAQ/#license applies.
