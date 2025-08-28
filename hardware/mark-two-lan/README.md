Introduction
============

The USB armory is an open source hardware design, implementing a compact secure
computer.

This repository is aimed towards developers, if you wish to purchase a USB
armory board please see the [ordering information](https://github.com/usbarmory/usbarmory/wiki/Ordering-information).

Authors
=======

Andrea Barisani  
andrea@inversepath.com  

Andrej Rosano  
andrej@inversepath.com  

Daniele Bianco  
daniele@inversepath.com  

Documentation
=============

The main documentation can be found on the
[project wiki](https://github.com/usbarmory/usbarmory/wiki).

Revision information
====================

This directory contains the hardware design for the USB armory Mk II LAN rev. β.

Current schematics and layout files have been designed in KiCad 7.0.3.

PCB Information
===============

<img src="https://github.com/usbarmory/usbarmory/wiki/images/armory-mark-two-lan-top-1.png" height="250"> <img src="https://github.com/usbarmory/usbarmory/wiki/images/armory-mark-two-lan-top-2.png" height="250">

6 layers, 0.8mm thickness  
Outer layers 0.5 oz base copper foil  
Inner layers   1 oz base copper foil  
width (X) 65.6 mm, height (Y) 19.5 mm  
Electroless Nickel Immersion Gold (ENIG) surface finish  
Black resist, white component legend

Layers
------

Order and type of copper layers:  
  TOP:         signal, front components  
  SIGNAL 1:    signal  
  GND POWER 1: ground and power plane  
  GND POWER 2: ground and power plane  
  SIGNAL 2:    signal  
  BOTTOM:      signal, back components  

| Layer | Description               |  Thickness (in um)  |
|:-----:|---------------------------|:-------------------:|
|       | LPI mask                  |   15                |
|       | ENIG plating              |   18                |
|   1   | copper                    |   30                |
|       | prepreg, 2 x PP 106       |  121                |
|   2   | copper                    |   17                |
|       | core, FR4 17/17           |  125                |
|   3   | copper                    |   17                |
|       | prepreg, 2 x PP 106       |  116                |
|   4   | copper                    |   17                |
|       | core, FR4 17/17           |  125                |
|   5   | copper                    |   17                |
|       | prepreg, 2 x PP 106       |  121                |
|   6   | copper                    |   30                |
|       | ENIG plating              |   18                |
|       | LPI mask                  |   15                |

Material: Isola PCL370-HR
Total thickness: 0.8 mm

DRC information
---------------

Minimum track width:            0.100 mm  
Minimum via diameter:           0.406 mm  
Outer layer track width:        0.100 mm  
Outer layer isolation distance: 0.100 mm  
Outer layer annular ring:       0.050 mm  
Inner layer track width:        0.100 mm  
Inner layer isolation distance: 0.100 mm  
Inner layer annular ring:       0.050 mm  
Smallest final hole (plated):   0.127 mm

Regulatory compliance & handling
================================

The USB armory board is an open system design, which does not include a
shielded enclosure. This may cause interference to other electrical or
electronic devices in close proximity. In a domestic environment, this product
may cause radio interference in which case the user may be required to take
adequate measures. In addition, this board should not be used near any medical
equipment or RF devices.

The board is sensitive to Electrostatic discharge (ESD). Hold the board only by
its edges. After removing the board from its box, place it on a grounded,
static-free surface.

The board can become hot, like any fan-less design, during continuous high CPU
loads, mind its temperature while handling it.

* [Compliance information](https://github.com/usbarmory/usbarmory/wiki/Compliance-information)

License
=======

USB armory | https://github.com/usbarmory/usbarmory  
Copyright (c) The USB armory authors

This source describes Open Hardware and is licensed under the CERN-OHL-S v2.

You may redistribute and modify this source and make products using it under
the terms of the CERN-OHL-S v2 (https://ohwr.org/cern_ohl_s_v2.txt).

This source is distributed WITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING
OF MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A PARTICULAR PURPOSE.
Please see the CERN-OHL-S v2 for applicable conditions.

As per CERN-OHL-S v2 section 4, should You produce hardware based on this
source, You must where practicable maintain the Source Location visible on the
external case of the USB armory or other products you make using this source.

The following exceptions apply:

- `../lib.snapeda`: all files in this directory are imported or modified
  from SnapEDA symbols and footprints, therefore the license at
  https://www.snapeda.com/about/FAQ/#license applies.
