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
Sheet 8 10
Title "USB armory test board"
Date "20 Aug 2014"
Rev "ALPHA"
Comp "Inverse Path S.r.l."
Comment1 "Copyright © 2014 Inverse Path S.r.l."
Comment2 "License: GNU General Public License, version 2"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MX53 U?
U 5 1 53C625CC
P 6550 5250
AR Path="/53834030/53C625CC" Ref="U?"  Part="5" 
AR Path="/53C623ED/53C625CC" Ref="U2"  Part="5" 
F 0 "U2" H 6370 5320 70  0000 C CNN
F 1 "MX53" H 6370 5180 60  0000 C CNN
F 2 "" H 6510 5290 60  0000 C CNN
F 3 "" H 6510 5290 60  0000 C CNN
	5    6550 5250
	1    0    0    -1  
$EndComp
NoConn ~ 7500 2050
NoConn ~ 7500 2150
NoConn ~ 7500 2250
NoConn ~ 7500 2450
NoConn ~ 7500 2850
NoConn ~ 7500 2950
NoConn ~ 7500 3250
NoConn ~ 7500 3350
NoConn ~ 7500 4350
NoConn ~ 7500 4450
NoConn ~ 7500 4550
NoConn ~ 7500 4650
NoConn ~ 7500 4750
NoConn ~ 7500 4850
NoConn ~ 7500 4950
NoConn ~ 7500 5050
NoConn ~ 7500 5250
NoConn ~ 7500 5350
NoConn ~ 7500 5450
NoConn ~ 7500 5550
NoConn ~ 7500 5650
NoConn ~ 7500 5750
NoConn ~ 7500 5950
NoConn ~ 7500 6050
NoConn ~ 7500 6150
NoConn ~ 7500 7550
NoConn ~ 7500 7650
NoConn ~ 7500 7750
NoConn ~ 7500 7850
NoConn ~ 7500 7950
NoConn ~ 7500 8350
NoConn ~ 7500 8450
NoConn ~ 7500 8550
NoConn ~ 7500 8650
NoConn ~ 7500 8750
NoConn ~ 7500 8850
NoConn ~ 7500 8950
NoConn ~ 7500 9050
NoConn ~ 7500 9150
NoConn ~ 7500 9250
Wire Wire Line
	7500 4250 8800 4250
Wire Wire Line
	7500 4150 9650 4150
Text Label 7850 4150 0    60   ~ 0
BT_CFG1_6
Text Label 7850 4250 0    60   ~ 0
BT_CFG1_7
Wire Wire Line
	7500 4050 8800 4050
Text Label 7850 4050 0    60   ~ 0
BT_CFG1_5
Text Notes 1000 5750 0    60   ~ 0
References:\n- i.MX53 Multimedia Applications Processor Reference Manual, Rev. 2.1, 6/2012, pg 479\n- i.MX53 Applications Processors for Industrial Products, Rev. 6, pg 142\n\nBOOT_CFG1[7:6] = 01 - Boot from ESDHC interfaces\nBOOT_CFG1[5] = 0 - SD/eSD\nBOOT_CFG1[4] = 0 - Fast Boot Support: Normal Boot\nBOOT_CFG1[3] = 0 - Normal Speed Mode\nBOOT_CFG1[2] = x - ignored in SD/eSD boot mode\nBOOT_CFG1[1]/BT_FREQ = 0 - ARM Frequency 800 MHz\nBOOT_CFG1[0]/BT_MMU_ENABLE = 0 - MMU/Cache is disabled during the boot\n\nBOOT_CFG2[7:5] = xx1 - Bus Width: 4 bit\nBOOT_CFG2[4]/AXI-DDR Freq = 0 - 200 MHz AXI, 400MHz DDR\nBOOT_CFG2[3]/OSC_FREQ_SEL = 0 - auto detection\n\nBOOT_CFG3[5:4] = 00 - Port ESDHCV2-1\nBOOT_CFG3[3] = 0 - Boot ROM default\nBOOT_CFG3[2] = 0 - Boot Acknowledge Enabled\n
Wire Wire Line
	7500 3950 8800 3950
Wire Wire Line
	7500 3850 8800 3850
Text Label 7850 3950 0    60   ~ 0
BT_CFG1_4
Text Label 7850 3850 0    60   ~ 0
BT_CFG1_3
Wire Wire Line
	7500 3750 8800 3750
Text Label 7850 3750 0    60   ~ 0
BT_CFG1_2
Wire Wire Line
	7500 6750 8800 6750
Text Label 7850 6750 0    60   ~ 0
BT_CFG2_2
Wire Wire Line
	7500 6850 8800 6850
Text Label 7850 6850 0    60   ~ 0
BT_CFG3_7
Wire Wire Line
	7500 6950 8800 6950
Wire Wire Line
	7500 7050 8800 7050
Wire Wire Line
	7500 7150 8800 7150
Text Label 7850 6950 0    60   ~ 0
BT_CFG3_6
Text Label 7850 7050 0    60   ~ 0
BT_CFG3_5
Text Label 7850 7150 0    60   ~ 0
BT_CFG3_4
Wire Wire Line
	7500 7250 8800 7250
Text Label 7850 7250 0    60   ~ 0
BT_CFG3_3
Wire Wire Line
	7500 7350 8800 7350
Text Label 7850 7350 0    60   ~ 0
BT_CFG3_2
Wire Wire Line
	7500 7450 8800 7450
Text Label 7850 7450 0    60   ~ 0
BT_CFG3_1
Wire Wire Line
	7500 2650 8800 2650
Wire Wire Line
	7500 2750 8800 2750
Text Label 7850 2650 0    60   ~ 0
BT_CFG2_7
Text Label 7850 2750 0    60   ~ 0
BT_CFG2_6
Wire Wire Line
	7500 6450 9950 6450
Text Label 7850 6450 0    60   ~ 0
BT_CFG2_5
$Comp
L GND #PWR092
U 1 1 53C6261D
P 8800 4500
F 0 "#PWR092" H 8800 4500 30  0001 C CNN
F 1 "GND" H 8800 4430 30  0001 C CNN
F 2 "" H 8800 4500 60  0000 C CNN
F 3 "" H 8800 4500 60  0000 C CNN
	1    8800 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 2350 8800 4500
Connection ~ 8800 4250
Connection ~ 8800 4050
Text GLabel 10150 3200 2    60   Input ~ 0
PMIC_SW4_3V3
$Comp
L R R25
U 1 1 53C6262C
P 9650 3750
F 0 "R25" V 9730 3750 40  0000 C CNN
F 1 "4.7k" V 9657 3751 40  0000 C CNN
F 2 "SM0201" V 9580 3750 30  0001 C CNN
F 3 "~" H 9650 3750 30  0000 C CNN
F 4 "Vishay Draloric" V 9650 3750 60  0001 C CNN "Mfg"
F 5 "CRCW02014K70FNED" V 9650 3750 60  0001 C CNN "Mfg PN"
F 6 "1%, 50mW" V 9650 3750 60  0001 C CNN "Desc"
F 7 "Farnell" V 9650 3750 60  0001 C CNN "Supplier"
F 8 "2140150" V 9650 3750 60  0001 C CNN "Supplier PN"
	1    9650 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	10150 3200 9650 3200
Wire Wire Line
	9650 3200 9650 3500
Connection ~ 8800 3950
Connection ~ 8800 3850
Connection ~ 8800 2750
$Comp
L R R32
U 1 1 53C6263C
P 9950 3750
F 0 "R32" V 10030 3750 40  0000 C CNN
F 1 "4.7k" V 9957 3751 40  0000 C CNN
F 2 "SM0201" V 9880 3750 30  0001 C CNN
F 3 "~" H 9950 3750 30  0000 C CNN
F 4 "Vishay Draloric" V 9950 3750 60  0001 C CNN "Mfg"
F 5 "CRCW02014K70FNED" V 9950 3750 60  0001 C CNN "Mfg PN"
F 6 "1%, 50mW" V 9950 3750 60  0001 C CNN "Desc"
F 7 "Farnell" V 9950 3750 60  0001 C CNN "Supplier"
F 8 "2140150" V 9950 3750 60  0001 C CNN "Supplier PN"
	1    9950 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	9650 4150 9650 4000
Wire Wire Line
	9950 6450 9950 4000
Wire Wire Line
	9950 3500 9950 3200
Connection ~ 9950 3200
$Comp
L GND #PWR093
U 1 1 53C62646
P 8800 7750
F 0 "#PWR093" H 8800 7750 30  0001 C CNN
F 1 "GND" H 8800 7680 30  0001 C CNN
F 2 "" H 8800 7750 60  0000 C CNN
F 3 "" H 8800 7750 60  0000 C CNN
	1    8800 7750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 6550 8800 7750
Connection ~ 8800 7150
Connection ~ 8800 7250
Connection ~ 8800 7350
Wire Wire Line
	7500 3650 8800 3650
Text Label 7850 3650 0    60   ~ 0
BT_CFG1_1
Wire Wire Line
	7500 2350 8800 2350
Text Label 7850 2350 0    60   ~ 0
BT_CFG1_0
Connection ~ 8800 2650
Connection ~ 8800 3650
Wire Wire Line
	7500 6550 8800 6550
Text Label 7850 6550 0    60   ~ 0
BT_CFG2_4
Wire Wire Line
	7500 6650 8800 6650
Text Label 7850 6650 0    60   ~ 0
BT_CFG2_3
Connection ~ 8800 3750
Connection ~ 8800 7050
Connection ~ 8800 6650
Connection ~ 8800 6750
Connection ~ 8800 6850
Connection ~ 8800 6950
Connection ~ 8800 7450
Text GLabel 11700 5150 2    60   Input ~ 0
I2C1_SCL
Text GLabel 11700 5350 2    60   Input ~ 0
I2C1_SDA
Wire Wire Line
	7500 5150 11700 5150
Wire Wire Line
	7500 5850 10400 5850
Wire Wire Line
	10400 5850 10400 5350
Wire Wire Line
	10400 5350 11700 5350
Text Label 7850 5150 0    60   ~ 0
I2C1_SCL
Text Label 7850 5850 0    60   ~ 0
I2C1_SDA
$Comp
L R R33
U 1 1 53C6A47B
P 10700 4750
F 0 "R33" V 10780 4750 40  0000 C CNN
F 1 "4.7k" V 10707 4751 40  0000 C CNN
F 2 "SM0201" V 10630 4750 30  0001 C CNN
F 3 "~" H 10700 4750 30  0000 C CNN
F 4 "Vishay Draloric" V 10700 4750 60  0001 C CNN "Mfg"
F 5 "CRCW02014K70FNED" V 10700 4750 60  0001 C CNN "Mfg PN"
F 6 "1%, 50mW" V 10700 4750 60  0001 C CNN "Desc"
F 7 "Farnell" V 10700 4750 60  0001 C CNN "Supplier"
F 8 "2140150" V 10700 4750 60  0001 C CNN "Supplier PN"
	1    10700 4750
	-1   0    0    1   
$EndComp
$Comp
L R R34
U 1 1 53C6A486
P 11000 4750
F 0 "R34" V 11080 4750 40  0000 C CNN
F 1 "4.7k" V 11007 4751 40  0000 C CNN
F 2 "SM0201" V 10930 4750 30  0001 C CNN
F 3 "~" H 11000 4750 30  0000 C CNN
F 4 "Vishay Draloric" V 11000 4750 60  0001 C CNN "Mfg"
F 5 "CRCW02014K70FNED" V 11000 4750 60  0001 C CNN "Mfg PN"
F 6 "1%, 50mW" V 11000 4750 60  0001 C CNN "Desc"
F 7 "Farnell" V 11000 4750 60  0001 C CNN "Supplier"
F 8 "2140150" V 11000 4750 60  0001 C CNN "Supplier PN"
	1    11000 4750
	-1   0    0    1   
$EndComp
Text GLabel 11300 4200 2    60   Input ~ 0
PMIC_SW4_3V3
Wire Wire Line
	11300 4200 10700 4200
Wire Wire Line
	10700 4200 10700 4500
Wire Wire Line
	11000 4200 11000 4500
Connection ~ 11000 4200
Wire Wire Line
	10700 5000 10700 5150
Connection ~ 10700 5150
Wire Wire Line
	11000 5000 11000 5350
Connection ~ 11000 5350
$EndSCHEMATC
