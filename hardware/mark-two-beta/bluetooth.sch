EESchema Schematic File Version 4
LIBS:armory-cache
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 9 13
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
L armory-mkII:ANNA-B112 U11
U 1 1 5CEA53D1
P 7900 3550
F 0 "U11" H 7900 3600 50  0000 C CNN
F 1 "ANNA-B112" H 7900 200 50  0000 C CNN
F 2 "armory-kicad:ANNA-B112" H 8050 3550 50  0001 C CNN
F 3 "https://www.u-blox.com/sites/default/files/ANNA-B112_DataSheet_%28UBX-18011707%29.pdf" H 8050 3550 50  0001 C CNN
F 4 "U-Blox" H 7900 3550 50  0001 C CNN "Mfg"
F 5 "ANNA-B112-01B" H 7900 3550 50  0001 C CNN "Mfg PN"
F 6 "BLE interface" H 7900 3550 50  0001 C CNN "Desc"
F 7 "-" H 7900 3550 50  0001 C CNN "Supplier"
F 8 "-" H 7900 3550 50  0001 C CNN "Supplier PN"
	1    7900 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CEA69B5
P 9100 6850
AR Path="/5BEA6694/5CEA69B5" Ref="#PWR?"  Part="1" 
AR Path="/53722D05/5CEA69B5" Ref="#PWR?"  Part="1" 
AR Path="/5CEA53B1/5CEA69B5" Ref="#PWR082"  Part="1" 
F 0 "#PWR082" H 9100 6600 50  0001 C CNN
F 1 "GND" H 9105 6677 50  0000 C CNN
F 2 "" H 9100 6850 50  0001 C CNN
F 3 "" H 9100 6850 50  0001 C CNN
	1    9100 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 4950 9100 4950
Wire Wire Line
	9100 4950 9100 5050
Wire Wire Line
	8900 5050 9100 5050
Connection ~ 9100 5050
Wire Wire Line
	9100 5050 9100 5150
Wire Wire Line
	8900 5150 9100 5150
Connection ~ 9100 5150
Wire Wire Line
	9100 5150 9100 5250
Wire Wire Line
	8900 5250 9100 5250
Connection ~ 9100 5250
Wire Wire Line
	9100 5250 9100 5350
Wire Wire Line
	8900 5350 9100 5350
Connection ~ 9100 5350
Wire Wire Line
	9100 5350 9100 5450
Wire Wire Line
	8900 5450 9100 5450
Connection ~ 9100 5450
Wire Wire Line
	9100 5450 9100 5550
Wire Wire Line
	8900 5550 9100 5550
Connection ~ 9100 5550
Wire Wire Line
	9100 5550 9100 5650
Wire Wire Line
	8900 5650 9100 5650
Connection ~ 9100 5650
Wire Wire Line
	9100 5650 9100 5750
Wire Wire Line
	8900 5750 9100 5750
Connection ~ 9100 5750
Wire Wire Line
	9100 5750 9100 5850
Wire Wire Line
	8900 5850 9100 5850
Connection ~ 9100 5850
Wire Wire Line
	9100 5850 9100 5950
Wire Wire Line
	8900 5950 9100 5950
Connection ~ 9100 5950
Wire Wire Line
	9100 5950 9100 6050
Wire Wire Line
	8900 6050 9100 6050
Connection ~ 9100 6050
Wire Wire Line
	9100 6050 9100 6150
Wire Wire Line
	8900 6150 9100 6150
Connection ~ 9100 6150
Wire Wire Line
	9100 6150 9100 6250
Wire Wire Line
	8900 6250 9100 6250
Connection ~ 9100 6250
Wire Wire Line
	9100 6250 9100 6350
Wire Wire Line
	8900 6350 9100 6350
Connection ~ 9100 6350
Wire Wire Line
	9100 6350 9100 6450
Wire Wire Line
	8900 6450 9100 6450
Connection ~ 9100 6450
Wire Wire Line
	9100 6450 9100 6550
Wire Wire Line
	8900 6550 9100 6550
Connection ~ 9100 6550
Wire Wire Line
	9100 6550 9100 6650
Wire Wire Line
	8900 6650 9100 6650
Connection ~ 9100 6650
Wire Wire Line
	9100 6650 9100 6850
Text GLabel 5400 3750 0    50   Input ~ 0
BT_3V3
Text Label 6400 3750 0    50   ~ 0
BT_3V3
Text GLabel 5400 6450 0    50   Input ~ 0
BT_UART_TX
Text GLabel 5400 6350 0    50   Output ~ 0
BT_UART_RX
Text GLabel 5400 6550 0    50   Output ~ 0
BT_UART_CTS
Text GLabel 5400 6650 0    50   Input ~ 0
BT_UART_RTS
Text Label 6400 5200 0    50   ~ 0
SWD_IO
Text Label 6400 5300 0    50   ~ 0
SWD_CLK
Text Notes 9600 4850 0    50   ~ 0
XL1 and XL2: floating as manufacturer advises to keep unconnected when using the internal oscillator ([1] pg 9)\nHowever this results in faulty behavior, see errata at\nhttps://github.com/inversepath/usbarmory/wiki/Errata-(Mk-II)
Text Notes 9600 4150 0    50   ~ 0
Use internal antenna.
Text Notes 1050 10750 0    50   ~ 0
[1] ANNA-B112 - System Integration Manual (UBX-18009821-R04)
$Comp
L power:GND #PWR?
U 1 1 5C0C4735
P 6000 4250
AR Path="/5BEA6694/5C0C4735" Ref="#PWR?"  Part="1" 
AR Path="/53722D05/5C0C4735" Ref="#PWR?"  Part="1" 
AR Path="/5CEA53B1/5C0C4735" Ref="#PWR080"  Part="1" 
F 0 "#PWR080" H 6000 4000 50  0001 C CNN
F 1 "GND" H 6005 4077 50  0000 C CNN
F 2 "" H 6000 4250 50  0001 C CNN
F 3 "" H 6000 4250 50  0001 C CNN
	1    6000 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4150 6000 4250
Text Notes 3800 3500 0    50   ~ 0
There is no strict requirement of adding bypass capacitance\nto the supply net close to the module. But depending on the\nlayout of the supply net and other consumers on the same net,\nbypass capacitors might still be beneficial.\n[1] pg 40
Wire Wire Line
	8900 4050 9300 4050
Wire Wire Line
	9300 4050 9300 4150
Wire Wire Line
	9300 4150 8900 4150
Text Notes 9600 4550 0    50   ~ 0
NFC_1 and NFC_2: floating\nNot found any reference, but should be safe as\nthey are also GPIO.
Text Notes 9600 3850 0    50   ~ 0
Integrated antenna module placed\n\n- in the corner of the PCB:\n  ANT_PCB   -> GND pattern\n  ANT_GND_x -> NC\n\n- on the side of the PCB:\n  ANT_PCB   -> NC\n  ANT_GND_x -> GND\n\n[1] pg 14
Text Label 6400 5400 0    50   ~ 0
RESET_N
Text GLabel 5400 5400 0    50   Input ~ 0
BT_RESET_B
NoConn ~ 8900 4350
NoConn ~ 8900 4450
NoConn ~ 8900 4650
NoConn ~ 8900 4750
NoConn ~ 6900 4450
NoConn ~ 6900 4550
NoConn ~ 6900 4650
NoConn ~ 6900 4750
NoConn ~ 6900 4850
NoConn ~ 6900 4950
NoConn ~ 6900 3950
NoConn ~ 6900 4050
NoConn ~ 6900 4150
NoConn ~ 6900 4250
NoConn ~ 6900 4350
NoConn ~ 6900 5650
NoConn ~ 6900 5850
NoConn ~ 8900 3850
NoConn ~ 8900 3950
Text GLabel 5400 5300 0    50   Input ~ 0
BT_SWDCLK
Text GLabel 5400 5200 0    50   BiDi ~ 0
BT_SWDIO
Text GLabel 5400 6250 0    50   Input ~ 0
BT_UART_DSR
Text GLabel 5400 6150 0    50   Output ~ 0
BT_UART_DTR
Wire Wire Line
	5750 6750 5750 6450
Wire Wire Line
	6150 6750 6150 6350
Text Label 6400 6150 0    50   ~ 0
BT_UART_DTR
Text Label 6400 6250 0    50   ~ 0
BT_UART_DSR
Text Label 6400 6350 0    50   ~ 0
BT_UART_RX
Text Label 6400 6450 0    50   ~ 0
BT_UART_TX
Text Label 6400 6550 0    50   ~ 0
BT_UART_CTS
Text Label 6400 6650 0    50   ~ 0
BT_UART_RTS
Text GLabel 5400 5750 0    50   Input ~ 0
BT_SWITCH_1
Text GLabel 5400 5950 0    50   Input ~ 0
BT_SWITCH_2
Text Label 6400 5750 0    50   ~ 0
BT_SWITCH_1
Text Label 6400 5950 0    50   ~ 0
BT_SWITCH_2
$Comp
L Device:C C?
U 1 1 5D6FE077
P 6000 4000
AR Path="/5BEA6694/5D6FE077" Ref="C?"  Part="1" 
AR Path="/5335DA0B/5D6FE077" Ref="C?"  Part="1" 
AR Path="/53722D05/5D6FE077" Ref="C?"  Part="1" 
AR Path="/5C0717D2/5D6FE077" Ref="C?"  Part="1" 
AR Path="/5C1535D2/5D6FE077" Ref="C?"  Part="1" 
AR Path="/5CEA53B1/5D6FE077" Ref="C104"  Part="1" 
F 0 "C104" H 6100 4050 50  0000 L CNN
F 1 "0.1uF" H 6100 3950 50  0000 L CNN
F 2 "armory-kicad:SM0201" H 6038 3850 50  0001 C CNN
F 3 "~" H 6000 4000 50  0001 C CNN
F 4 "Murata Electronics North America" H 6000 4000 50  0001 C CNN "Mfg"
F 5 "GRM033R61A104ME15D" H 6000 4000 50  0001 C CNN "Mfg PN"
F 6 "X5R, 20%, 10V" H 6000 4000 50  0001 C CNN "Desc"
F 7 "Digikey" H 6000 4000 50  0001 C CNN "Supplier"
F 8 "490-5405-2-ND" H 6000 4000 50  0001 C CNN "Supplier PN"
F 9 "0201" H 6000 4000 30  0000 C CNN "FP"
F 10 "10V/20%" H 6150 3850 30  0000 C CNN "Rating"
	1    6000 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3750 6000 3750
Text Label 8900 3750 0    50   ~ 0
ANT_PCB
Wire Wire Line
	8900 3750 9450 3750
Text Label 8900 4150 0    50   ~ 0
ANT_INT
Wire Wire Line
	9450 3750 9450 3900
Wire Wire Line
	9450 3900 9350 3900
NoConn ~ 9350 3900
Wire Wire Line
	5400 5200 6900 5200
Wire Wire Line
	5400 5300 6900 5300
Wire Wire Line
	5400 5750 6900 5750
Wire Wire Line
	5400 5950 6900 5950
Wire Wire Line
	5400 6250 6900 6250
Wire Wire Line
	5400 6150 6900 6150
Wire Wire Line
	5400 6550 6900 6550
Wire Wire Line
	5400 6650 6900 6650
Wire Wire Line
	5400 5400 6900 5400
$Comp
L Connector:TestPoint TP8
U 1 1 5C9B31EC
P 5750 6750
F 0 "TP8" H 5700 7000 50  0000 L CNN
F 1 "TestPoint" H 5600 6950 50  0001 L CNN
F 2 "armory-kicad:TP" H 5950 6750 50  0001 C CNN
F 3 "~" H 5950 6750 50  0001 C CNN
	1    5750 6750
	1    0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP9
U 1 1 5C9B546F
P 6150 6750
F 0 "TP9" H 6100 7000 50  0000 L CNN
F 1 "TestPoint" H 6000 6950 50  0001 L CNN
F 2 "armory-kicad:TP" H 6350 6750 50  0001 C CNN
F 3 "~" H 6350 6750 50  0001 C CNN
	1    6150 6750
	1    0    0    1   
$EndComp
Text Notes 3350 5550 0    50   ~ 0
RESET_N: 13 kOhm internal pull-up.\n[2] pg 28
Text Notes 1050 10900 0    50   ~ 0
[2] ANNA-B112 - Data Sheet (UBX-18011707-R04)
Wire Wire Line
	6000 3850 6000 3750
Connection ~ 6000 3750
Wire Wire Line
	6000 3750 6900 3750
Connection ~ 5750 6450
Wire Wire Line
	5750 6450 6900 6450
Connection ~ 6150 6350
Wire Wire Line
	6150 6350 6900 6350
Wire Wire Line
	5400 6350 6150 6350
Wire Wire Line
	5400 6450 5750 6450
Text Notes 2750 7975 0    50   ~ 0
It has been witnessed that the ANNA-B112 can be back-powered via\nUART pins. To turn completelly off the module all the interfaces pins\nshould be kept low.
$EndSCHEMATC
