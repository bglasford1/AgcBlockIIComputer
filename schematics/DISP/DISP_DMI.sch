EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 2 7
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
L Connector:Conn_01x40_Male J201
U 1 1 62159FED
P 1750 3250
F 0 "J201" H 1858 5331 50  0000 C CNN
F 1 "Conn_01x40_Male" H 1858 5240 50  0000 C CNN
F 2 "" H 1750 3250 50  0001 C CNN
F 3 "~" H 1750 3250 50  0001 C CNN
	1    1750 3250
	1    0    0    -1  
$EndComp
Text GLabel 1950 4550 2    50   Input ~ 0
BP116
Text GLabel 1950 4650 2    50   Input ~ 0
BP117
Text GLabel 1950 4750 2    50   Input ~ 0
BP118
Text GLabel 3300 2100 2    50   Input ~ 0
BP121
Text GLabel 3300 2200 2    50   Input ~ 0
BP122
Text GLabel 3300 2300 2    50   Input ~ 0
BP123
Text GLabel 3300 2400 2    50   Input ~ 0
BP124
Text GLabel 3300 2500 2    50   Input ~ 0
BP125
Text GLabel 3300 2600 2    50   Input ~ 0
BP126
Text GLabel 1950 1550 2    50   Input ~ 0
BP65
Text GLabel 1950 1650 2    50   Input ~ 0
BP66
Text GLabel 1950 1750 2    50   Input ~ 0
BP67
Text GLabel 1950 1850 2    50   Input ~ 0
BP68
Text GLabel 1950 1950 2    50   Input ~ 0
BP69
Text GLabel 1950 2050 2    50   Input ~ 0
BP70
Text GLabel 1950 2150 2    50   Input ~ 0
BP71
Text GLabel 1950 2250 2    50   Input ~ 0
BP72
Text GLabel 1950 2350 2    50   Input ~ 0
BP73
Text GLabel 1950 2450 2    50   Input ~ 0
BP74
Text GLabel 1950 2550 2    50   Input ~ 0
BP75
Text GLabel 1950 3550 2    50   Input ~ 0
BP104
Text GLabel 1950 3650 2    50   Input ~ 0
BP105
Text GLabel 1950 3750 2    50   Input ~ 0
BP106
Text GLabel 3300 3900 2    50   Output ~ 0
BP146
NoConn ~ 1950 1350
NoConn ~ 1950 1450
NoConn ~ 1950 2850
NoConn ~ 1950 4850
NoConn ~ 1950 4950
NoConn ~ 1950 5150
NoConn ~ 1950 5250
$Comp
L Connector:Conn_01x40_Male J200
U 1 1 62EBA0DD
P 3100 3300
F 0 "J200" H 3208 5381 50  0000 C CNN
F 1 "Conn_01x40_Male" H 3208 5290 50  0000 C CNN
F 2 "" H 3100 3300 50  0001 C CNN
F 3 "~" H 3100 3300 50  0001 C CNN
	1    3100 3300
	1    0    0    -1  
$EndComp
Text GLabel 3300 4000 2    50   Output ~ 0
BP147
Text GLabel 3300 4100 2    50   Output ~ 0
BP148
Text GLabel 3300 4200 2    50   Output ~ 0
BP149
Text GLabel 3300 4300 2    50   Output ~ 0
BP150
Text GLabel 3300 4400 2    50   Output ~ 0
BP151
NoConn ~ 1950 5050
NoConn ~ 3300 1400
NoConn ~ 3300 1500
NoConn ~ 3300 1600
NoConn ~ 3300 1700
NoConn ~ 3300 1800
NoConn ~ 3300 1900
NoConn ~ 3300 2000
NoConn ~ 3300 2700
NoConn ~ 3300 2900
NoConn ~ 3300 3000
NoConn ~ 3300 3100
NoConn ~ 3300 3200
NoConn ~ 3300 3300
NoConn ~ 3300 3400
NoConn ~ 3300 3500
NoConn ~ 3300 3600
NoConn ~ 3300 3700
NoConn ~ 3300 3800
NoConn ~ 3300 4500
NoConn ~ 3300 4600
NoConn ~ 3300 4700
NoConn ~ 3300 4800
NoConn ~ 3300 4900
NoConn ~ 3300 5000
NoConn ~ 3300 5100
NoConn ~ 3300 5300
NoConn ~ 3300 5200
Text Notes 1700 1000 0    80   ~ 0
Switches:
Text Notes 2850 1100 0    80   ~ 0
    Inputs:\nNote that very \nfew are shown.
$Comp
L power:+5V #PWR0123
U 1 1 62ECD368
P 9950 1000
F 0 "#PWR0123" H 9950 850 50  0001 C CNN
F 1 "+5V" H 9965 1173 50  0000 C CNN
F 2 "" H 9950 1000 50  0001 C CNN
F 3 "" H 9950 1000 50  0001 C CNN
	1    9950 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 62ECDBE3
P 9950 1500
F 0 "#PWR0125" H 9950 1250 50  0001 C CNN
F 1 "GND" H 9955 1327 50  0000 C CNN
F 2 "" H 9950 1500 50  0001 C CNN
F 3 "" H 9950 1500 50  0001 C CNN
	1    9950 1500
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 62ECE09E
P 9950 1500
F 0 "#FLG0101" H 9950 1575 50  0001 C CNN
F 1 "PWR_FLAG" H 9950 1673 50  0000 C CNN
F 2 "" H 9950 1500 50  0001 C CNN
F 3 "~" H 9950 1500 50  0001 C CNN
	1    9950 1500
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 62ECE730
P 9950 1000
F 0 "#FLG0102" H 9950 1075 50  0001 C CNN
F 1 "PWR_FLAG" H 9950 1173 50  0000 C CNN
F 2 "" H 9950 1000 50  0001 C CNN
F 3 "~" H 9950 1000 50  0001 C CNN
	1    9950 1000
	1    0    0    1   
$EndComp
Text GLabel 3300 2800 2    50   Input ~ 0
BP128
Text GLabel 1950 2650 2    50   Input ~ 0
BP76
Text GLabel 1950 3850 2    50   Input ~ 0
BP109
Text GLabel 1950 2750 2    50   Input ~ 0
BP77
Text Notes 6400 7200 0    100  ~ 0
DISP_DMI: Interface\nCopyright 2021, William Glasford
Text GLabel 1950 3950 2    50   Input ~ 0
BP110
Text GLabel 1950 4050 2    50   Input ~ 0
BP111
Text GLabel 1950 4150 2    50   Input ~ 0
BP112
Text GLabel 1950 4250 2    50   Input ~ 0
BP113
Text GLabel 1950 4350 2    50   Input ~ 0
BP114
Text GLabel 1950 4450 2    50   Input ~ 0
BP115
Text GLabel 1950 3450 2    50   Input ~ 0
BP103
Text GLabel 1950 3350 2    50   Input ~ 0
BP102
Text GLabel 1950 3250 2    50   Input ~ 0
BP101
Text GLabel 1950 3150 2    50   Input ~ 0
BP100
Text GLabel 1950 3050 2    50   Input ~ 0
BP99
Text GLabel 1950 2950 2    50   Input ~ 0
BP98
$EndSCHEMATC
