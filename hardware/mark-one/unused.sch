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
Sheet 6 9
Title "USB ARMORY - i.MX53 UNUSED"
Date "10 Nov 2014"
Rev "MARK I"
Comp "Inverse Path S.r.l."
Comment1 "Copyright © 2014 Inverse Path S.r.l."
Comment2 "License: GNU General Public License, version 2"
Comment3 "http://inversepath.com/usbarmory"
Comment4 ""
$EndDescr
$Comp
L MX53 U2
U 8 1 53834052
P 9170 3930
F 0 "U2" H 8990 4000 70  0000 C CNN
F 1 "MX53" H 8990 3860 60  0000 C CNN
F 2 "" H 9130 3970 60  0000 C CNN
F 3 "" H 9130 3970 60  0000 C CNN
	8    9170 3930
	1    0    0    -1  
$EndComp
NoConn ~ 10120 3630
NoConn ~ 10120 3730
NoConn ~ 10120 3930
NoConn ~ 10120 4030
NoConn ~ 10120 4230
NoConn ~ 8220 4330
NoConn ~ 8220 4230
$Comp
L GND #PWR064
U 1 1 538340B8
P 7870 3830
F 0 "#PWR064" H 7870 3830 30  0001 C CNN
F 1 "GND" H 7870 3760 30  0001 C CNN
F 2 "" H 7870 3830 60  0000 C CNN
F 3 "" H 7870 3830 60  0000 C CNN
	1    7870 3830
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR065
U 1 1 538340C5
P 7720 3730
F 0 "#PWR065" H 7720 3730 30  0001 C CNN
F 1 "GND" H 7720 3660 30  0001 C CNN
F 2 "" H 7720 3730 60  0000 C CNN
F 3 "" H 7720 3730 60  0000 C CNN
	1    7720 3730
	1    0    0    -1  
$EndComp
Wire Wire Line
	8220 3630 7720 3630
Wire Wire Line
	7720 3630 7720 3730
Wire Wire Line
	8220 3730 7870 3730
Wire Wire Line
	7870 3730 7870 3830
$Comp
L GND #PWR066
U 1 1 538340D0
P 7720 4030
F 0 "#PWR066" H 7720 4030 30  0001 C CNN
F 1 "GND" H 7720 3960 30  0001 C CNN
F 2 "" H 7720 4030 60  0000 C CNN
F 3 "" H 7720 4030 60  0000 C CNN
	1    7720 4030
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR067
U 1 1 538340D6
P 7870 4130
F 0 "#PWR067" H 7870 4130 30  0001 C CNN
F 1 "GND" H 7870 4060 30  0001 C CNN
F 2 "" H 7870 4130 60  0000 C CNN
F 3 "" H 7870 4130 60  0000 C CNN
	1    7870 4130
	1    0    0    -1  
$EndComp
Wire Wire Line
	8220 3930 7720 3930
Wire Wire Line
	7720 3930 7720 4030
Wire Wire Line
	8220 4030 7870 4030
Wire Wire Line
	7870 4030 7870 4130
$Comp
L MX53 U2
U 9 1 538340EA
P 12730 4020
F 0 "U2" H 12550 4090 70  0000 C CNN
F 1 "MX53" H 12550 3950 60  0000 C CNN
F 2 "" H 12690 4060 60  0000 C CNN
F 3 "" H 12690 4060 60  0000 C CNN
	9    12730 4020
	-1   0    0    1   
$EndComp
NoConn ~ 13680 3820
NoConn ~ 13680 3620
NoConn ~ 11780 3720
NoConn ~ 11780 3820
NoConn ~ 11780 3920
NoConn ~ 11780 4020
NoConn ~ 11780 4220
NoConn ~ 11780 4120
$Comp
L MX53 U2
U 1 1 53834141
P 5110 4800
F 0 "U2" H 4930 4870 70  0000 C CNN
F 1 "MX53" H 4930 4730 60  0000 C CNN
F 2 "" H 5070 4840 60  0000 C CNN
F 3 "" H 5070 4840 60  0000 C CNN
	1    5110 4800
	1    0    0    -1  
$EndComp
NoConn ~ 6060 6500
NoConn ~ 6060 6400
NoConn ~ 6060 6200
NoConn ~ 6060 6100
NoConn ~ 6060 5900
NoConn ~ 6060 5800
NoConn ~ 6060 5600
NoConn ~ 6060 5500
NoConn ~ 6060 5300
NoConn ~ 6060 5200
NoConn ~ 6060 5000
NoConn ~ 6060 4900
NoConn ~ 6060 4700
NoConn ~ 6060 4600
NoConn ~ 6060 4400
NoConn ~ 6060 4300
NoConn ~ 6060 4100
NoConn ~ 6060 4000
NoConn ~ 6060 3800
NoConn ~ 6060 3700
NoConn ~ 4160 5200
Text GLabel 2960 3700 0    60   Input ~ 0
PMIC_SW3_2V5
$Comp
L C C88
U 1 1 538341C5
P 4060 4150
F 0 "C88" H 4060 4250 40  0000 L CNN
F 1 "0.01uF" H 4066 4065 40  0000 L CNN
F 2 "SM0201" H 4098 4000 30  0001 C CNN
F 3 "~" H 4060 4150 60  0000 C CNN
F 4 "TDK" H 4060 4150 60  0001 C CNN "Mfg"
F 5 "C0603X7R1A103K030BA" H 4060 4150 60  0001 C CNN "Mfg PN"
F 6 "X7R, 10V, 10%" H 4060 4150 60  0001 C CNN "Desc"
F 7 "Farnell" H 4060 4150 60  0001 C CNN "Supplier"
F 8 "2354055" H 4060 4150 60  0001 C CNN "Supplier PN"
	1    4060 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3960 3800 4160 3800
Wire Wire Line
	4060 3950 4060 3800
Connection ~ 4060 3800
$Comp
L GND #PWR068
U 1 1 53834223
P 4060 4500
F 0 "#PWR068" H 4060 4500 30  0001 C CNN
F 1 "GND" H 4060 4430 30  0001 C CNN
F 2 "" H 4060 4500 60  0000 C CNN
F 3 "" H 4060 4500 60  0000 C CNN
	1    4060 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4060 4350 4060 4500
Wire Wire Line
	2960 3700 4160 3700
Wire Wire Line
	3460 3700 3460 3800
Connection ~ 3460 3700
$Comp
L R R14
U 1 1 53C3B046
P 3710 3800
F 0 "R14" V 3790 3800 40  0000 C CNN
F 1 "49.9" V 3717 3801 40  0000 C CNN
F 2 "SM0201" V 3640 3800 30  0001 C CNN
F 3 "~" H 3710 3800 30  0000 C CNN
F 4 "Vishay Draloric" V 3710 3800 60  0001 C CNN "Mfg"
F 5 "CRCW020149R9FNED" V 3710 3800 60  0001 C CNN "Mfg PN"
F 6 "50mW, 1%" V 3710 3800 60  0001 C CNN "Desc"
F 7 "Farnell" V 3710 3800 60  0001 C CNN "Supplier"
F 8 "2139901" V 3710 3800 60  0001 C CNN "Supplier PN"
	1    3710 3800
	0    1    1    0   
$EndComp
Text Notes 11830 3370 0    60   ~ 0
floating: TVDAC_VREF\n  https://community.freescale.com/thread/309316\n\nfloating: TVDAC_COMP\n  MX53UG Rev. 1, 3/2011, pg 29\n  Design checklist, Recommendation 14\n\nfloating: TVDAC_IO*, TVCDC_IO*\n  MX53UG Rev. 1, 3/2011, pg 29\n  Design checklist, Recommendation 15\n\nfloating: TVDAC_DHVDD, TVDAC_AHVDDRGB*\n  IMX53IEC Rev. 6, 03/2013, pg 26\n  4.2.3 Power Supplies Usage\n\nAll the TVE pads are not muxed.
Text Notes 3560 3300 0    60   ~ 0
powered: NVCC_LVDS, NVCC_LVDS_BG\n  https://community.freescale.com/thread/309316\n\nfloating: LVDS0_*, LVDS1_*\n  Freescale QSB and SABRE reference schematics\n\nfloating: LVDS_BG_RES\n  MX53UG Rev. 1, 3/2011, pg 30\n  Design checklist, Recommendation 21\n\nLVDS0_* and LVDS1_* pads are muxed,\nNVCC_LVDS, NVCC_LVDS_BG, LVDS_BG_RES are not.\n\n
Text Notes 7920 3280 0    60   ~ 0
floating: SATA_REFCLKP, SATA_REFCLKM, SATA_RXP, SATA_RXM,\nSATA_TXM, SATA_TXP, SATA_REXT\n  IMX53IEC Rev. 6, 03/2013, pg 117\n  4.7.13.4 SATA Connectivity when not in use\n\ngrounded: VP1, VP2, VPH1, VPH2\n  IMX53IEC Rev. 6, 03/2013, pg 117\n  4.7.13.4 SATA Connectivity when not in use\n\nAll the SATA pads are not muxed.\n\nWarning: The temperature sensor is disabled when SATA\nmodule is not powered.
NoConn ~ 13680 4020
NoConn ~ 13680 4220
NoConn ~ 13680 4320
$Comp
L PWR_FLAG #FLG069
U 1 1 540688C4
P 3710 4200
F 0 "#FLG069" H 3710 4295 30  0001 C CNN
F 1 "PWR_FLAG" H 3710 4380 30  0000 C CNN
F 2 "" H 3710 4200 60  0000 C CNN
F 3 "" H 3710 4200 60  0000 C CNN
	1    3710 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3710 4200 3910 4200
Wire Wire Line
	3910 4200 3910 3900
Wire Wire Line
	3910 3900 4060 3900
Connection ~ 4060 3900
$EndSCHEMATC
