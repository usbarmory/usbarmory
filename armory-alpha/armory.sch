EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:armory
LIBS:armory-cache
EELAYER 24 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 10
Title "USB armory test board"
Date "20 Aug 2014"
Rev "ALPHA"
Comp "Inverse Path S.r.l."
Comment1 "Copyright © 2014 Inverse Path S.r.l."
Comment2 "License: GNU General Public License, version 2"
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 4500 3900 1700 1200
U 5335DA0B
F0 "PMIC" 100
F1 "pmic.sch" 100
F2 "USB_VBUS" I L 4500 4300 60 
F3 "USB_GND" I L 4500 4700 60 
$EndSheet
$Sheet
S 7100 3900 1700 1200
U 53344146
F0 "i.MX53 POWER" 100
F1 "imx53-power.sch" 100
$EndSheet
$Sheet
S 9600 3900 1600 1200
U 533C7F27
F0 "i.MX53 MISC" 100
F1 "imx53-misc.sch" 100
F2 "USB_VBUS" I L 9600 4300 60 
$EndSheet
$Sheet
S 7100 6000 1700 1200
U 53722D05
F0 "Interfaces" 100
F1 "interfaces.sch" 100
$EndSheet
$Sheet
S 9600 6000 1600 1200
U 53834030
F0 "Unused" 100
F1 "unused.sch" 100
$EndSheet
$Comp
L USB_A_PLUG J2
U 1 1 538F1B2F
P 2600 2500
F 0 "J2" H 2600 2500 60  0000 C CNN
F 1 "USB_A_PLUG" H 2600 2600 60  0000 C CNN
F 2 "usb-PCB" H 2600 2500 60  0001 C CNN
F 3 "~" H 2600 2500 60  0000 C CNN
	1    2600 2500
	1    0    0    -1  
$EndComp
$Sheet
S 4500 6000 1700 1200
U 538352BD
F0 "USB" 100
F1 "USB.sch" 100
F2 "USB_D+" B L 4500 6600 60 
F3 "USB_D-" B L 4500 6800 60 
F4 "USB_VBUS" I L 4500 6400 60 
$EndSheet
Wire Wire Line
	2400 3200 2400 6400
Wire Wire Line
	2400 4300 4500 4300
Wire Wire Line
	2850 3200 2850 4700
Wire Wire Line
	2850 4700 4500 4700
Wire Wire Line
	2550 3200 2550 6800
Wire Wire Line
	2550 6800 4500 6800
Wire Wire Line
	2700 3200 2700 6600
Text Label 2400 4000 1    60   ~ 0
USB_VBUS
Text Label 2550 4000 1    60   ~ 0
USB_D-
Text Label 2700 4000 1    60   ~ 0
USB_D+
Text Label 2850 4000 1    60   ~ 0
USB_GND
Wire Wire Line
	2700 6600 4500 6600
Wire Wire Line
	2400 6400 4500 6400
Connection ~ 2400 4300
Wire Wire Line
	2400 3300 9300 3300
Wire Wire Line
	9300 3300 9300 4300
Wire Wire Line
	9300 4300 9600 4300
Connection ~ 2400 3300
$Sheet
S 12000 3900 1700 1250
U 53C623ED
F0 "Boot" 100
F1 "boot.sch" 100
$EndSheet
$Sheet
S 12000 6050 1700 1200
U 53834A3C
F0 "RAM" 100
F1 "RAM.sch" 100
$EndSheet
$Sheet
S 4500 7900 1700 1200
U 53C7C8E9
F0 "Debug Interfaces" 100
F1 "debug.sch" 100
$EndSheet
$EndSCHEMATC
