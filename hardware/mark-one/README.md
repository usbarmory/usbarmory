Introduction
============

USB armory | http://inversepath.com/usbarmory  
Copyright (c) 2015 Inverse Path S.r.l.

The USB armory from [Inverse Path](http://inversepath.com) is an open source
hardware design, implementing a flash drive sized computer.

This repository is aimed towards developers, if you wish to purchase a USB
armory board please see the [ordering information](http://inversepath.com/usbarmory#ordering).

Revision information
====================

This directory contains the hardware design for the USB armory board, first
revision (Mark I).

Current schematics and layout files have been designed in KiCad (release
2014-01-25 - 0.201403191418+4754~10~ubuntu12.04.1)

PCB Information
===============

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

The board can become hot, like any fan-less design, during continuous high CPU
loads, mind its temperature while handling it.

License
=======

USB armory | http://inversepath.com/usbarmory  
Copyright (c) 2015 Inverse Path S.r.l.

This is a free hardware design; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; either version 2, or (at your option) any later version.

This design is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this design; see the file COPYING. If not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Boston, MA 02110-1301, USA.
