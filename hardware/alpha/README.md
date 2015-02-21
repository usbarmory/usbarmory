Introduction
============

USB armory | http://inversepath.com/usbarmory  
Copyright (c) 2014 Inverse Path S.r.l.

The USB armory from [Inverse Path](http://inversepath.com) is an open source
hardware design, implementing a flash drive sized computer.

This repository is aimed towards developers, if you wish to purchase a USB
armory board please see the [ordering information](http://inversepath.com/usbarmory#ordering).

Revision information
====================

This directory contains the hardware design for the USB armory test board,
revision alpha.

This revision is the first manufactured prototype with JTAG and power debugging
pin headers, it is provided for reference and not recommended for
manufacturing.

Current schematics and layout files have been designed in KiCad (release
2014-01-25 - 0.201403191418+4754~10~ubuntu12.04.1)

PCB Information
===============

8 layers, 2.00mm thickness  
Outer layers 0.5 oz base copper foil  
Inner layers   1 oz base copper foil  
width (X) 65.00 mm, height (Y) 37.80 mm  
Electroless Nickel Immersion Gold (ENIG) surface finish  
Selective hard gold (min 0.75um) plating and bevelling for J2 (USB)  
Black resist, white component legend

Layers
------

Order and type of copper layers:  
  TOP:         signal, front components  
  GND 1:       ground plane  
  SIGNAL 1:    signal  
  GND POWER 1: ground and power plane  
  GND POWER 2: ground and power plane  
  SIGNAL 2:    signal  
  GND 2:       ground plane  
  BOTTOM:      signal, back components  

| Layer | Description               |  Thickness (in um)  |
|:-----:|---------------------------|:-------------------:|
|       | LPI mask                  |   15                |
|       | ENIG plating              |   18                |
|   1   | copper                    |   18                |
|       | prepreg, 2 x FR4 2116A    |  117 x 2            |
|   2   | copper                    |   35                |
|       | core, FR4                 |  300                |
|   3   | copper                    |   35                |
|       | prepreg, 2 x FR4 2116A    |  117 x 2            |
|   4   | copper                    |   35                |
|       | core, FR4                 |  300                |
|   5   | copper                    |   35                |
|       | prepreg, 2 x FR4 2116A    |  117 x 2            |
|   6   | copper                    |   35                |
|       | core, FR4                 |  300                |
|   7   | copper                    |   35                |
|       | prepreg, 2 x FR4 2116A    |  117 x 2            |
|   8   | copper                    |   18                |
|       | ENIG plating              |   18                |
|       | LPI mask                  |   15                |

DRC Information
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


Regulatory Compliance & Handling
=================================

The USB armory board is intended for use as a development platform for hardware
or software. The board is an open system design, which does not include a
shielded enclosure. This may cause interference to other electrical or
electronic devices in close proximity. In a domestic environment, this product
may cause radio interference in which case the user may be required to take
adequate measures. In addition, this board should not be used near any medical
equipment or RF devices.

The board is sensitive to ESD. Hold the board only by its edges. After removing
the board from its box, place it on a grounded, static-free surface.

License
=======

USB armory | http://inversepath.com/usbarmory  
Copyright (c) 2015 Inverse Path S.r.l.

This is an open hardware design licensed under the terms of the CERN Open
Hardware Licence (OHL) v1.2.

You may redistribute and modify this documentation under the terms of the CERN
OHL v.1.2 (http://ohwr.org/cernohl). This documentation is distributed WITHOUT
ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY
QUALITY AND FITNESS FOR A PARTICULAR PURPOSE. Please see the CERN OHL v.1.2 for
applicable conditions.
