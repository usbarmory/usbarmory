EESchema Schematic File Version 4
LIBS:armory-cache
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 6 13
Title "USB ARMORY"
Date "2019-06-25"
Rev "MARK II"
Comp "F-Secure"
Comment1 "Copyright © 2019 F-Secure"
Comment2 "License: CERN OHL v1.2"
Comment3 "https://github.com/inversepath/usbarmory"
Comment4 ""
$EndDescr
$Comp
L armory-mkII:MX6UL-VM U2
U 7 1 5C13E74F
P 4450 4250
F 0 "U2" H 4450 4300 70  0000 C CNN
F 1 "MX6UL-VM" H 4450 350 60  0000 C CNN
F 2 "armory-kicad:SOT1534-2" H 4960 3090 60  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/IMX6ULCEC.pdf" H 4960 3090 60  0001 C CNN
	7    4450 4250
	1    0    0    -1  
$EndComp
Text Label 5750 5450 0    50   ~ 0
BT_CFG1[0]
Text Label 5750 5550 0    50   ~ 0
BT_CFG1[1]
Text Label 5750 5650 0    50   ~ 0
BT_CFG1[2]
Text Label 5750 5750 0    50   ~ 0
BT_CFG1[3]
Text Label 5750 5850 0    50   ~ 0
BT_CFG1[4]
Text Label 5750 6050 0    50   ~ 0
BT_CFG1[6]
Text Label 5750 6150 0    50   ~ 0
BT_CFG1[7]
Text Label 5750 6250 0    50   ~ 0
BT_CFG2[0]
Text Label 5750 6350 0    50   ~ 0
BT_CFG2[1]
Text Label 5750 6450 0    50   ~ 0
BT_CFG2[2]
Text Label 5750 6650 0    50   ~ 0
BT_CFG2[4]
Text Label 5750 6950 0    50   ~ 0
BT_CFG2[7]
Text Label 5750 7050 0    50   ~ 0
BT_CFG4[0]
Text Label 5750 7150 0    50   ~ 0
BT_CFG4[1]
Text Label 5750 7250 0    50   ~ 0
BT_CFG4[2]
Text Label 5750 7350 0    50   ~ 0
BT_CFG4[3]
Text Label 5750 7450 0    50   ~ 0
BT_CFG4[4]
Text Label 5750 7550 0    50   ~ 0
BT_CFG4[5]
Text Label 5750 7650 0    50   ~ 0
BT_CFG4[6]
Text Label 5750 7750 0    50   ~ 0
BT_CFG4[7]
Text Notes 3470 2360 0    50   ~ 0
Boot from eMMC\n\nBOOT_CFG1[7:6] = 01 - Boot from uSDHC interfaces\nBOOT_CFG1[5] = 1 - Boot from eMMC\nBOOT_CFG1[4] = 0 - Fast boot support: Regular\nBOOT_CFG1[3] = 0 - SD/MMC Speed: High\nBOOT_CFG1[2] = 0 - Fast Boot Acknowledge Disable: Boot Ack Enabled\nBOOT_CFG1[1] = 0 - SD Power Cycle Enable: No power cycle\nBOOT_CFG1[0] = 0 - SD Loopback Clock Source Sel: through SD pad\n\nBOOT_CFG2[7:5] = 010 - Bus Width: 8-bit\nBOOT_CFG2[4:3] = 01 - Port Select: eSDHC2\nBOOT_CFG2[2] = 0 - Boot Frequencies (ARM/DDR): 500/400 MHz\nBOOT_CFG2[1] = 0 - SD Voltage Selection: 3.3V\nBOOT_CFG2[0] = 0 - Reserved\n\n\nBOOT_CFG4[7] = 0 - Reserved\nBOOT_CFG4[6] = 0 - EEPROM Recovery Enable: Disabled\nBOOT_CFG4[5:4] = 00 - eCSPI chip select: ECSPIx_SS0\nBOOT_CFG4[3] = 0 - eCSPI Addressing: 16-bit\nBOOT_CFG4[2:0] = 000 - eCSPI1
Text Notes 6350 7350 0    50   ~ 0
BOOT_CFG4[7:0] = 00000000
Text Notes 6750 1800 0    50   ~ 0
SWITCH:               TOP        BOTTOM\n\nBOOT_CFG1[5]          1            0\nBOOT_CFG2[6]          1            0\nBOOT_CFG2[5]          0            1\nBOOT_CFG2[3]          1            0\n\nBOOT FROM:          eMMC         SD
Text Notes 6350 6550 0    50   ~ 0
BOOT_CFG2[7:0] = 0??0?000
Text Notes 6350 5800 0    50   ~ 0
BOOT_CFG1[7:0] = 01?00000
Wire Wire Line
	5750 6550 6200 6550
Wire Wire Line
	5750 6750 6200 6750
NoConn ~ 5750 4750
NoConn ~ 5750 4950
NoConn ~ 5750 5050
NoConn ~ 5750 5150
NoConn ~ 5750 5250
Text GLabel 2650 4750 0    50   Input ~ 0
DCDC_3V3
Text Label 2750 4750 0    50   ~ 0
DCDC_3V3
Wire Wire Line
	5750 7050 6200 7050
Wire Wire Line
	5750 7150 6200 7150
Wire Wire Line
	5750 7250 6200 7250
Wire Wire Line
	5750 6450 6200 6450
Wire Wire Line
	5750 6850 6200 6850
Wire Wire Line
	5750 5950 6200 5950
Wire Wire Line
	5750 5450 6200 5450
Text Label 5750 5950 0    50   ~ 0
BT_CFG1[5]
Text Label 5750 6550 0    50   ~ 0
BT_CFG2[3]
Text Label 5750 6750 0    50   ~ 0
BT_CFG2[5]
Text Label 5750 6850 0    50   ~ 0
BT_CFG2[6]
$Comp
L power:GND #PWR?
U 1 1 5D7233D9
P 2950 5150
AR Path="/5BEA6694/5D7233D9" Ref="#PWR?"  Part="1" 
AR Path="/53722D05/5D7233D9" Ref="#PWR?"  Part="1" 
AR Path="/5335DA0B/5D7233D9" Ref="#PWR?"  Part="1" 
AR Path="/53834A3C/5D7233D9" Ref="#PWR?"  Part="1" 
AR Path="/53C623ED/5D7233D9" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 2950 4900 50  0001 C CNN
F 1 "GND" H 2955 4977 50  0000 C CNN
F 2 "" H 2950 5150 50  0001 C CNN
F 3 "" H 2950 5150 50  0001 C CNN
	1    2950 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 5100 2950 5150
$Comp
L Device:C C?
U 1 1 5D7233EB
P 2950 4950
AR Path="/5BEA6694/5D7233EB" Ref="C?"  Part="1" 
AR Path="/5335DA0B/5D7233EB" Ref="C?"  Part="1" 
AR Path="/53722D05/5D7233EB" Ref="C?"  Part="1" 
AR Path="/53834A3C/5D7233EB" Ref="C?"  Part="1" 
AR Path="/53C623ED/5D7233EB" Ref="C55"  Part="1" 
F 0 "C55" H 3050 5000 50  0000 L CNN
F 1 "0.22uF" H 3050 4900 50  0000 L CNN
F 2 "armory-kicad:SM0201" H 2988 4800 50  0001 C CNN
F 3 "~" H 2950 4950 50  0001 C CNN
F 4 "Murata Electronics North America" H 2950 4950 50  0001 C CNN "Mfg"
F 5 "GRM033R60J224ME15D" H 2950 4950 50  0001 C CNN "Mfg PN"
F 6 "X5R, 20%, 6.3V" H 2950 4950 50  0001 C CNN "Desc"
F 7 "Digikey" H 2950 4950 50  0001 C CNN "Supplier"
F 8 "490-10407-1-ND" H 2950 4950 50  0001 C CNN "Supplier PN"
F 9 "0201" H 2950 4950 30  0000 C CNN "FP"
F 10 "6.3V/20%" H 3100 4800 30  0000 C CNN "Rating"
	1    2950 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 6650 6200 6650
Wire Wire Line
	5750 6350 6200 6350
Wire Wire Line
	5750 6950 6200 6950
Wire Wire Line
	5750 7350 6200 7350
Wire Wire Line
	5750 7450 6200 7450
Wire Wire Line
	5750 7550 6200 7550
Wire Wire Line
	5750 7650 6200 7650
Wire Wire Line
	5750 7750 6200 7750
Wire Wire Line
	5750 6250 6200 6250
Wire Wire Line
	5750 6150 6200 6150
Wire Wire Line
	5750 5850 6200 5850
Wire Wire Line
	5750 5750 6200 5750
Wire Wire Line
	5750 5650 6200 5650
Wire Wire Line
	6200 5550 5750 5550
NoConn ~ 6200 5450
NoConn ~ 6200 5550
NoConn ~ 6200 5650
NoConn ~ 6200 5750
NoConn ~ 6200 5850
NoConn ~ 6200 6150
NoConn ~ 6200 6250
NoConn ~ 6200 6350
NoConn ~ 6200 6450
NoConn ~ 6200 6650
NoConn ~ 6200 6950
NoConn ~ 6200 7050
NoConn ~ 6200 7150
NoConn ~ 6200 7250
NoConn ~ 6200 7350
NoConn ~ 6200 7450
NoConn ~ 6200 7550
NoConn ~ 6200 7650
NoConn ~ 6200 7750
Wire Wire Line
	6200 6050 5750 6050
Text Notes 6350 8150 0    50   ~ 0
Not required to pull-down as at boot all\nLCD_DATA pins are pulled down with 100K.\n(pg 96 [1])
Text Notes 1100 10800 0    50   ~ 0
[1] i.MX 6UltraLite Applications Processors for Consumer Products, Rev. 2.2, 05/2017\n
Wire Wire Line
	2950 4800 2950 4750
Wire Notes Line
	550  2400 3350 2400
Wire Notes Line
	3350 2400 3350 550 
Wire Notes Line
	3350 550  550  550 
Wire Notes Line
	550  550  550  2400
Wire Notes Line
	550  1350 3350 1350
Wire Notes Line
	550  1920 3350 1920
Wire Notes Line
	3450 550  3450 2400
Wire Notes Line
	3450 2400 6350 2400
Wire Notes Line
	6350 2400 6350 550 
Wire Notes Line
	6350 550  3450 550 
Wire Notes Line
	550  700  3350 700 
Wire Notes Line
	3450 700  6350 700 
Wire Notes Line
	3450 1350 6350 1350
Wire Notes Line
	3450 1920 6350 1920
Text Notes 560  2360 0    50   ~ 0
Boot from microSD\n\nBOOT_CFG1[7:6] = 01 - Boot from uSDHC interfaces\nBOOT_CFG1[5] = 0 - Boot from SD\nBOOT_CFG1[4] = 0 - Fast boot support: Regular\nBOOT_CFG1[3:2] =  00 - SD/SDXC Speed: Normal/SDR12\nBOOT_CFG1[1] = 0 - SD Power Cycle Enable: No power cycle\nBOOT_CFG1[0] = 0 - SD Loopback Clock Source Sel: through SD pad\n\n\nBOOT_CFG2[7:6] = 00 - SD Calibration Step: 1 delay cell\nBOOT_CFG2[5] = 1 - Bus Width: 4-bit\nBOOT_CFG2[4:3] = 00 - Port Select: eSDHC1\nBOOT_CFG2[2] = 0 - Boot Frequencies (ARM/DDR): 500/400 MHz\nBOOT_CFG2[1] = 0 - SD Voltage Selection: 3.3V\nBOOT_CFG2[0] = 0 - Reserved\n\nBOOT_CFG4[7] = 0 - Reserved\nBOOT_CFG4[6] = 0 - EEPROM Recovery Enable: Disabled\nBOOT_CFG4[5:4] = 00 - eCSPI chip select: ECSPIx_SS0\nBOOT_CFG4[3] = 0 - eCSPI Addressing: 16-bit\nBOOT_CFG4[2:0] = 000 - eCSPI1
Connection ~ 2950 4750
Wire Wire Line
	2950 4750 3150 4750
Wire Wire Line
	2650 4750 2950 4750
Wire Notes Line
	6700 1850 8450 1850
Wire Notes Line
	8450 1850 8450 1100
Wire Notes Line
	8450 1100 6700 1100
Wire Notes Line
	6700 1100 6700 1850
Wire Notes Line
	6700 1275 8450 1275
Wire Notes Line
	6700 1700 8450 1700
Wire Notes Line
	7950 1850 7950 1100
Wire Notes Line
	7450 1850 7450 1100
Wire Wire Line
	12000 5000 12000 5750
Wire Notes Line
	10850 5350 11600 5350
Connection ~ 10200 5800
Wire Wire Line
	10200 5800 10200 5950
Wire Wire Line
	10200 5650 10200 5800
Wire Wire Line
	12000 5750 12000 6200
Connection ~ 12000 5750
Wire Wire Line
	11800 5550 11800 6400
Wire Wire Line
	11800 6400 11800 6550
Connection ~ 11800 6400
Wire Wire Line
	11450 6400 11800 6400
Wire Wire Line
	11450 5550 11800 5550
Text Notes 6800 2050 0    50   ~ 0
Default position: TOP (2->3 and 5->6).
Wire Wire Line
	10700 5650 11050 5650
$Comp
L Device:R R?
U 1 1 5CAA3EDF
P 10550 6300
AR Path="/53722D05/5CAA3EDF" Ref="R?"  Part="1" 
AR Path="/53834A3C/5CAA3EDF" Ref="R?"  Part="1" 
AR Path="/53C623ED/5CAA3EDF" Ref="R27"  Part="1" 
F 0 "R27" H 10600 6350 50  0000 L CNN
F 1 "10K" H 10600 6250 50  0000 L CNN
F 2 "armory-kicad:SM0201" V 10480 6300 50  0001 C CNN
F 3 "~" H 10550 6300 50  0001 C CNN
F 4 "Vishay Dale" H 10550 6300 50  0001 C CNN "Mfg"
F 5 "CRCW020110K0JNED" H 10550 6300 50  0001 C CNN "Mfg PN"
F 6 "5%, 50mW" H 10550 6300 50  0001 C CNN "Desc"
F 7 "Digikey" H 10550 6300 50  0001 C CNN "Supplier"
F 8 "541-10KAGTR-ND" H 10550 6300 50  0001 C CNN "Supplier PN"
F 9 "0201" V 10550 6300 30  0000 C CNN "FP"
F 10 "50mW/1%" H 10700 6150 30  0000 C CNN "Rating"
	1    10550 6300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10700 5000 12000 5000
Wire Wire Line
	11050 6300 10700 6300
Text Notes 11000 5300 0    50   ~ 0
DPDT switch
$Comp
L power:GND #PWR?
U 1 1 5CA214CB
P 11800 6550
AR Path="/5BEA6694/5CA214CB" Ref="#PWR?"  Part="1" 
AR Path="/53C623ED/5CA214CB" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 11800 6300 50  0001 C CNN
F 1 "GND" H 11805 6377 50  0000 C CNN
F 2 "" H 11800 6550 50  0001 C CNN
F 3 "" H 11800 6550 50  0001 C CNN
	1    11800 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 6300 10400 6300
Wire Wire Line
	9550 5800 10200 5800
Wire Wire Line
	9550 5650 10200 5650
Wire Wire Line
	9550 5950 10200 5950
Text Label 12000 5000 2    50   ~ 0
DCDC_3V3
Wire Wire Line
	9550 5000 10400 5000
Text Label 9550 5000 0    50   ~ 0
BT_CFG1[6]
$Comp
L Device:R R?
U 1 1 5C94D729
P 10550 5650
AR Path="/53722D05/5C94D729" Ref="R?"  Part="1" 
AR Path="/53834A3C/5C94D729" Ref="R?"  Part="1" 
AR Path="/53C623ED/5C94D729" Ref="R48"  Part="1" 
F 0 "R48" H 10600 5700 50  0000 L CNN
F 1 "10K" H 10600 5600 50  0000 L CNN
F 2 "armory-kicad:SM0201" V 10480 5650 50  0001 C CNN
F 3 "~" H 10550 5650 50  0001 C CNN
F 4 "Vishay Dale" H 10550 5650 50  0001 C CNN "Mfg"
F 5 "CRCW020110K0JNED" H 10550 5650 50  0001 C CNN "Mfg PN"
F 6 "5%, 50mW" H 10550 5650 50  0001 C CNN "Desc"
F 7 "Digikey" H 10550 5650 50  0001 C CNN "Supplier"
F 8 "541-10KAGTR-ND" H 10550 5650 50  0001 C CNN "Supplier PN"
F 9 "0201" V 10550 5650 30  0000 C CNN "FP"
F 10 "50mW/1%" H 10700 5500 30  0000 C CNN "Rating"
	1    10550 5650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5C946E16
P 10550 5000
AR Path="/53722D05/5C946E16" Ref="R?"  Part="1" 
AR Path="/53834A3C/5C946E16" Ref="R?"  Part="1" 
AR Path="/53C623ED/5C946E16" Ref="R47"  Part="1" 
F 0 "R47" H 10600 5050 50  0000 L CNN
F 1 "10K" H 10600 4950 50  0000 L CNN
F 2 "armory-kicad:SM0201" V 10480 5000 50  0001 C CNN
F 3 "~" H 10550 5000 50  0001 C CNN
F 4 "Vishay Dale" H 10550 5000 50  0001 C CNN "Mfg"
F 5 "CRCW020110K0JNED" H 10550 5000 50  0001 C CNN "Mfg PN"
F 6 "5%, 50mW" H 10550 5000 50  0001 C CNN "Desc"
F 7 "Digikey" H 10550 5000 50  0001 C CNN "Supplier"
F 8 "541-10KAGTR-ND" H 10550 5000 50  0001 C CNN "Supplier PN"
F 9 "0201" V 10550 5000 30  0000 C CNN "FP"
F 10 "50mW/1%" H 10700 4850 30  0000 C CNN "Rating"
	1    10550 5000
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_DPDT_x2 SW1
U 2 1 5C1A71FB
P 11250 6300
F 0 "SW1" H 11250 6500 50  0000 C CNN
F 1 "CAS-220TA" H 11250 6100 50  0000 C CNN
F 2 "armory-kicad:CAS-220-A" H 11250 6300 50  0001 C CNN
F 3 "https://www.nidec-copal-electronics.com/e/catalog/switch/cas.pdf" H 11250 6300 50  0001 C CNN
F 4 "Nidec Copal Electronics" H 11250 6300 50  0001 C CNN "Mfg"
F 5 "CAS-220TA" H 11250 6300 50  0001 C CNN "Mfg PN"
F 6 "DPDT slide switch" H 11250 6300 50  0001 C CNN "Desc"
F 7 "Digikey" H 11250 6300 50  0001 C CNN "Supplier"
F 8 "CAS220JTR-ND" H 11250 6300 50  0001 C CNN "Supplier PN"
	2    11250 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11450 5750 12000 5750
Text Label 9550 5800 0    50   ~ 0
BT_CFG2[3]
Text Label 9550 5950 0    50   ~ 0
BT_CFG2[6]
Text Label 9550 6300 0    50   ~ 0
BT_CFG2[5]
Text Label 9550 5650 0    50   ~ 0
BT_CFG1[5]
Wire Wire Line
	12000 6200 11450 6200
Connection ~ 10200 5650
Wire Wire Line
	10400 5650 10200 5650
Wire Notes Line
	11600 5200 10850 5200
Wire Notes Line
	11600 6650 11600 5200
Wire Notes Line
	10850 6650 11600 6650
Wire Notes Line
	10850 5200 10850 6650
$Comp
L Switch:SW_DPDT_x2 SW1
U 1 1 5C1A718E
P 11250 5650
F 0 "SW1" H 11250 5850 50  0000 C CNN
F 1 "CAS-220TA" H 11250 5450 50  0000 C CNN
F 2 "armory-kicad:CAS-220-A" H 11250 5650 50  0001 C CNN
F 3 "https://www.nidec-copal-electronics.com/e/catalog/switch/cas.pdf" H 11250 5650 50  0001 C CNN
F 4 "Nidec Copal Electronics" H 11250 5650 50  0001 C CNN "Mfg"
F 5 "CAS-220TA" H 11250 5650 50  0001 C CNN "Mfg PN"
F 6 "DPDT slide switch" H 11250 5650 50  0001 C CNN "Desc"
F 7 "Digikey" H 11250 5650 50  0001 C CNN "Supplier"
F 8 "CAS220JTR-ND" H 11250 5650 50  0001 C CNN "Supplier PN"
	1    11250 5650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
