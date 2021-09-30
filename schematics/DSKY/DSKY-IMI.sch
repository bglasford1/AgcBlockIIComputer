EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 10 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR0102
U 1 1 5F61EFB4
P 7500 2050
AR Path="/5F5E4E3B/5F5F82D4/5F61EFB4" Ref="#PWR0102"  Part="1" 
AR Path="/60F989FD/5F61EFB4" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 7500 1800 50  0001 C CNN
F 1 "GND" H 7505 1877 50  0000 C CNN
F 2 "" H 7500 2050 50  0001 C CNN
F 3 "" H 7500 2050 50  0001 C CNN
	1    7500 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1950 8100 1950
Text HLabel 8150 2350 2    50   Output ~ 0
CLK2
Text HLabel 8150 1950 2    50   Output ~ 0
CLK1
Wire Wire Line
	3400 1750 3150 1750
Wire Wire Line
	3400 1850 3150 1850
Wire Wire Line
	3400 1950 3150 1950
Wire Wire Line
	3400 2050 3150 2050
Wire Wire Line
	3400 2150 3150 2150
Wire Wire Line
	3400 2250 3150 2250
Wire Wire Line
	3400 2350 3150 2350
Wire Wire Line
	3400 2450 3150 2450
Wire Wire Line
	3900 2650 4200 2650
Wire Wire Line
	3900 2550 4200 2550
Wire Wire Line
	3900 2450 4200 2450
Wire Wire Line
	3900 2350 4200 2350
Wire Wire Line
	3900 2250 4200 2250
Text HLabel 6400 2150 2    50   Output ~ 0
STBY
Text HLabel 3900 2150 2    50   Input ~ 0
KB_STR
Text HLabel 3900 2050 2    50   Input ~ 0
PARALM
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 63206258
P 9600 1000
F 0 "#FLG0101" H 9600 1075 50  0001 C CNN
F 1 "PWR_FLAG" H 9600 1173 50  0000 C CNN
F 2 "" H 9600 1000 50  0001 C CNN
F 3 "~" H 9600 1000 50  0001 C CNN
	1    9600 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0252
U 1 1 63206B7C
P 9600 1000
F 0 "#PWR0252" H 9600 750 50  0001 C CNN
F 1 "GND" H 9605 827 50  0000 C CNN
F 2 "" H 9600 1000 50  0001 C CNN
F 3 "" H 9600 1000 50  0001 C CNN
	1    9600 1000
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 63206EED
P 9100 1000
F 0 "#FLG0102" H 9100 1075 50  0001 C CNN
F 1 "PWR_FLAG" H 9100 1173 50  0000 C CNN
F 2 "" H 9100 1000 50  0001 C CNN
F 3 "~" H 9100 1000 50  0001 C CNN
	1    9100 1000
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR0253
U 1 1 6320B47A
P 9100 1000
F 0 "#PWR0253" H 9100 850 50  0001 C CNN
F 1 "+5V" H 9115 1173 50  0000 C CNN
F 2 "" H 9100 1000 50  0001 C CNN
F 3 "" H 9100 1000 50  0001 C CNN
	1    9100 1000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x08_Counter_Clockwise J103
U 1 1 62CF5CC0
P 6200 2150
F 0 "J103" H 6250 2667 50  0000 C CNN
F 1 "Conn_02x08" H 6250 2576 50  0000 C CNN
F 2 "" H 6200 2150 50  0001 C CNN
F 3 "~" H 6200 2150 50  0001 C CNN
	1    6200 2150
	-1   0    0    -1  
$EndComp
Wire Bus Line
	3050 1450 2950 1450
Text HLabel 2950 1450 0    50   BiDi ~ 0
CH[1..15]
Entry Wire Line
	3050 1850 3150 1750
Entry Wire Line
	3050 1950 3150 1850
Entry Wire Line
	3050 2050 3150 1950
Entry Wire Line
	3050 2150 3150 2050
Entry Wire Line
	3050 2250 3150 2150
Entry Wire Line
	3050 2350 3150 2250
Entry Wire Line
	3050 2450 3150 2350
Entry Wire Line
	3050 2550 3150 2450
Entry Wire Line
	4300 2750 4200 2650
Entry Wire Line
	4300 2650 4200 2550
Entry Wire Line
	4300 2550 4200 2450
Entry Wire Line
	4300 2450 4200 2350
Entry Wire Line
	4300 2350 4200 2250
Text Label 3150 1750 0    50   ~ 0
CH1
Text Label 3150 1850 0    50   ~ 0
CH2
Text Label 3150 1950 0    50   ~ 0
CH3
Text Label 3150 2050 0    50   ~ 0
CH4
Text Label 3150 2150 0    50   ~ 0
CH5
Text Label 3150 2250 0    50   ~ 0
CH6
Text Label 3150 2350 0    50   ~ 0
CH7
Text Label 3150 2450 0    50   ~ 0
CH8
Text Label 4200 2650 2    50   ~ 0
CH11
Text Label 4200 2550 2    50   ~ 0
CH12
Text Label 4200 2450 2    50   ~ 0
CH13
Text Label 4200 2350 2    50   ~ 0
CH14
Text Label 4200 2250 2    50   ~ 0
CH15
Text Notes 4100 1350 2    80   ~ 0
Channel Bus
Text Notes 6350 1500 2    80   ~ 0
To CTL
Text HLabel 6400 2250 2    50   Output ~ 0
KBD1
Text HLabel 6400 2350 2    50   Output ~ 0
DISP
Text HLabel 6400 2450 2    50   Output ~ 0
INDC
NoConn ~ 5900 2350
NoConn ~ 5900 2450
Wire Wire Line
	6400 1850 7500 1850
Wire Bus Line
	4300 2800 3050 2800
$Comp
L 74xx:74LS32 U201
U 4 1 5F6065A8
P 7800 1950
AR Path="/5F5E4E3B/5F5F82D4/5F6065A8" Ref="U201"  Part="1" 
AR Path="/60F989FD/5F6065A8" Ref="U40"  Part="4" 
F 0 "U40" H 7800 2275 50  0000 C CNN
F 1 "74LS32" H 7800 2184 50  0000 C CNN
F 2 "" H 7800 1950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7800 1950 50  0001 C CNN
	4    7800 1950
	1    0    0    -1  
$EndComp
Text Notes 6400 7150 0    100  ~ 0
DSKY-IMI:  Interface\nCopyright 2021, William Glasford
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J104
U 1 1 612DCF54
P 3600 2150
F 0 "J104" H 3650 2767 50  0000 C CNN
F 1 "Conn_02x10" H 3650 2676 50  0000 C CNN
F 2 "" H 3600 2150 50  0001 C CNN
F 3 "~" H 3600 2150 50  0001 C CNN
	1    3600 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2550 3150 2550
Wire Wire Line
	3400 2650 3150 2650
Entry Wire Line
	3050 2650 3150 2550
Entry Wire Line
	3050 2750 3150 2650
Text Label 3150 2550 0    50   ~ 0
CH9
Text Label 3150 2650 0    50   ~ 0
CH10
NoConn ~ 3900 1750
NoConn ~ 3900 1850
NoConn ~ 3900 1950
NoConn ~ 5900 1850
NoConn ~ 5900 1950
NoConn ~ 5900 2050
NoConn ~ 5900 2150
NoConn ~ 5900 2250
Text HLabel 6400 2550 2    50   Output ~ 0
PROG
Text HLabel 5900 2550 0    50   Output ~ 0
RPRO
Text HLabel 8200 3300 2    50   Output ~ 0
DSKYRST
$Comp
L 74xx:74LS00 U?
U 1 1 6395652F
P 7900 3300
AR Path="/5F5E4E3B/5F5F8347/6395652F" Ref="U?"  Part="1" 
AR Path="/60F98A72/6395652F" Ref="U?"  Part="1" 
AR Path="/66BEE9C8/6395652F" Ref="U?"  Part="1" 
AR Path="/60F98A72/66CE2F9E/6395652F" Ref="U?"  Part="1" 
AR Path="/60F989FD/6395652F" Ref="U6"  Part="1" 
F 0 "U6" H 7900 3625 50  0000 C CNN
F 1 "74LS00" H 7900 3534 50  0000 C CNN
F 2 "" H 7900 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7900 3300 50  0001 C CNN
	1    7900 3300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 2 1 63956535
P 7300 3400
AR Path="/5F5E4E3B/5F5F8347/63956535" Ref="U?"  Part="6" 
AR Path="/60F98A72/63956535" Ref="U?"  Part="2" 
AR Path="/66BEE9C8/63956535" Ref="U?"  Part="6" 
AR Path="/60F98A72/66CE2F9E/63956535" Ref="U?"  Part="6" 
AR Path="/60F989FD/63956535" Ref="U5"  Part="2" 
F 0 "U5" H 7400 3150 50  0000 C CNN
F 1 "74LS04" H 7400 3250 50  0000 C CNN
F 2 "" H 7300 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7300 3400 50  0001 C CNN
	2    7300 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2050 6800 2050
Wire Wire Line
	6800 2050 6800 3400
Wire Wire Line
	6800 3400 7000 3400
$Comp
L 74xx:74LS04 U42
U 5 1 6247150B
P 7900 2750
F 0 "U42" H 7900 3067 50  0000 C CNN
F 1 "74LS04" H 7900 2976 50  0000 C CNN
F 2 "" H 7900 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7900 2750 50  0001 C CNN
	5    7900 2750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U46
U 6 1 62471E0E
P 7300 2750
F 0 "U46" H 7300 3067 50  0000 C CNN
F 1 "74LS04" H 7300 2976 50  0000 C CNN
F 2 "" H 7300 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7300 2750 50  0001 C CNN
	6    7300 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1950 7000 1950
Wire Wire Line
	7000 1950 7000 2350
Wire Wire Line
	8150 2350 7000 2350
Connection ~ 7000 2350
Wire Wire Line
	7000 2350 7000 2750
Wire Wire Line
	7000 2750 7000 3200
Wire Wire Line
	7000 3200 7600 3200
Connection ~ 7000 2750
Text HLabel 8200 2750 2    50   Output ~ 0
SGN_CLK2
Wire Bus Line
	4300 2250 4300 2800
Wire Bus Line
	3050 1450 3050 2800
$EndSCHEMATC
