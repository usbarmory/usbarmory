Introduction
============

USB armory | https://inversepath.com/usbarmory  
Copyright (c) F-Secure Corporation

The USB armory from [Inverse Path](https://inversepath.com) is an open source
hardware design, implementing a flash drive sized computer.

This repository is aimed towards developers, if you wish to purchase a USB
armory board please see the [ordering information](https://inversepath.com/usbarmory#ordering).

Revision information
====================

This directory contains the hardware design for the USB armory board, first
revision (Mark I).

Current schematics and layout files have been designed in KiCad (`release
2014-01-25 - 0.201403191418+4754~10~ubuntu12.04.1`)

PCB information
===============

![Mk I Top](https://github.com/inversepath/usbarmory/wiki/images/armory-mark-one-top.svg?sanitize=true)
![Mk I Bottom](https://github.com/inversepath/usbarmory/wiki/images/armory-mark-one-bottom.svg?sanitize=true)

6 layers, 2.00mm thickness  
Outer layers 0.5 oz base copper foil  
Inner layers   1 oz base copper foil  
width (X) 65.6 mm, height (Y) 19.5 mm  
Electroless Nickel Immersion Gold (ENIG) surface finish  
Selective hard gold (min 0.75um) plating for J2 (USB)  
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
|   1   | copper                    |   17                |
|       | prepreg, 3 x PP 1080      |  240 -> 220         |
|   2   | copper                    |   35                |
|       | core, FR4  35/35          |  300                |
|   3   | copper                    |   35                |
|       | prepreg, 4 x PP 7628      |  760 -> 720         |
|   4   | copper                    |   35                |
|       | core, FR4  35/35          |  300                |
|   5   | copper                    |   35                |
|       | prepreg, 3 x PP 1080      |  240 -> 220         |
|   6   | copper                    |   17                |
|       | ENIG plating              |   18                |
|       | LPI mask                  |   15                |

Material: Isola PCL370-HR
Total thickness: 2.0 mm

DRC information
---------------

Minimum track width:            0.127 mm  
Minimum via diameter:           0.406 mm  
Outer layer track width:        0.127 mm  
Outer layer isolation distance: 0.127 mm  
Outer layer annular ring:       0.075 mm  
Inner layer track width:        0.127 mm  
Inner layer isolation distance: 0.127 mm  
Inner layer annular ring:       0.075 mm  
Smallest final hole (plated):   0.150 mm


Regulatory compliance & handling
================================

The USB armory board is intended for use as a development platform for hardware
or software. The board is an open system design, which does not include a
shielded enclosure. This may cause interference to other electrical or
electronic devices in close proximity. In a domestic environment, this product
may cause radio interference in which case the user may be required to take
adequate measures. In addition, this board should not be used near any medical
equipment or RF devices.

The board is sensitive to ESD. Hold the board only by its edges. After removing
the board from its box, place it on a grounded, static-free surface.

The board can become hot, like any fan-less design, during continuous high CPU
loads, mind its temperature while handling it.

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
