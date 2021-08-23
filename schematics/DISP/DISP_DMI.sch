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
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J104
U 1 1 61156605
P 4900 1850
F 0 "J104" H 4950 2467 50  0000 C CNN
F 1 "Conn_02x10" H 4950 2376 50  0000 C CNN
F 2 "" H 4900 1850 50  0001 C CNN
F 3 "~" H 4900 1850 50  0001 C CNN
	1    4900 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x08_Counter_Clockwise J101
U 1 1 611580FF
P 7350 1750
F 0 "J101" H 7400 2267 50  0000 C CNN
F 1 "Conn_02x08" H 7400 2176 50  0000 C CNN
F 2 "" H 7350 1750 50  0001 C CNN
F 3 "~" H 7350 1750 50  0001 C CNN
	1    7350 1750
	1    0    0    -1  
$EndComp
Text Notes 4750 1150 0    80   ~ 0
Channel\nBus
Text Notes 7150 1150 0    80   ~ 0
Write Bus
Wire Bus Line
	6800 2300 8000 2300
Wire Bus Line
	8000 1300 8050 1300
Entry Wire Line
	7900 1450 8000 1550
Entry Wire Line
	7900 1550 8000 1650
Entry Wire Line
	7900 1650 8000 1750
Entry Wire Line
	7900 1750 8000 1850
Entry Wire Line
	7900 1850 8000 1950
Entry Wire Line
	7900 1950 8000 2050
Entry Wire Line
	7900 2050 8000 2150
Entry Wire Line
	7900 2150 8000 2250
Wire Wire Line
	7650 1450 7900 1450
Wire Wire Line
	7650 1550 7900 1550
Wire Wire Line
	7650 1650 7900 1650
Wire Wire Line
	7650 1750 7900 1750
Wire Wire Line
	7650 1850 7900 1850
Wire Wire Line
	7650 1950 7900 1950
Wire Wire Line
	7650 2050 7900 2050
Wire Wire Line
	7650 2150 7900 2150
Wire Wire Line
	6900 1450 7150 1450
Wire Wire Line
	6900 1550 7150 1550
Wire Wire Line
	6900 1650 7150 1650
Wire Wire Line
	6900 1750 7150 1750
Wire Wire Line
	6900 1850 7150 1850
Wire Wire Line
	6900 1950 7150 1950
Wire Wire Line
	6900 2050 7150 2050
Wire Wire Line
	6900 2150 7150 2150
Entry Wire Line
	6800 1550 6900 1450
Entry Wire Line
	6800 1650 6900 1550
Entry Wire Line
	6800 1750 6900 1650
Entry Wire Line
	6800 1850 6900 1750
Entry Wire Line
	6800 1950 6900 1850
Entry Wire Line
	6800 2050 6900 1950
Entry Wire Line
	6800 2150 6900 2050
Entry Wire Line
	6800 2250 6900 2150
Text Label 6900 1450 0    50   ~ 0
W1
Text Label 6900 1550 0    50   ~ 0
W2
Text Label 6900 1650 0    50   ~ 0
W3
Text Label 6900 1750 0    50   ~ 0
W4
Text Label 6900 1850 0    50   ~ 0
W5
Text Label 6900 1950 0    50   ~ 0
W6
Text Label 6900 2050 0    50   ~ 0
W7
Text Label 6900 2150 0    50   ~ 0
W8
Text Label 7900 2150 2    50   ~ 0
W9
Text Label 7900 2050 2    50   ~ 0
W10
Text Label 7900 1950 2    50   ~ 0
W11
Text Label 7900 1850 2    50   ~ 0
W12
Text Label 7900 1650 2    50   ~ 0
W14
Text Label 7900 1550 2    50   ~ 0
W15
Text Label 7900 1450 2    50   ~ 0
W16
Text Label 7900 1750 2    50   ~ 0
W13
Text HLabel 8050 1300 2    50   Output ~ 0
W[1..16]
Wire Bus Line
	4350 2500 5550 2500
Wire Bus Line
	5550 1400 5600 1400
Entry Wire Line
	5450 1950 5550 2050
Entry Wire Line
	5450 2050 5550 2150
Entry Wire Line
	5450 2150 5550 2250
Entry Wire Line
	5450 2250 5550 2350
Entry Wire Line
	5450 2350 5550 2450
Wire Wire Line
	5200 1950 5450 1950
Wire Wire Line
	5200 2050 5450 2050
Wire Wire Line
	5200 2150 5450 2150
Wire Wire Line
	5200 2250 5450 2250
Wire Wire Line
	5200 2350 5450 2350
Wire Wire Line
	4450 1450 4700 1450
Wire Wire Line
	4450 1550 4700 1550
Wire Wire Line
	4450 1650 4700 1650
Wire Wire Line
	4450 1750 4700 1750
Wire Wire Line
	4450 1850 4700 1850
Wire Wire Line
	4450 1950 4700 1950
Wire Wire Line
	4450 2050 4700 2050
Wire Wire Line
	4450 2150 4700 2150
Entry Wire Line
	4350 1550 4450 1450
Entry Wire Line
	4350 1650 4450 1550
Entry Wire Line
	4350 1750 4450 1650
Entry Wire Line
	4350 1850 4450 1750
Entry Wire Line
	4350 1950 4450 1850
Entry Wire Line
	4350 2050 4450 1950
Entry Wire Line
	4350 2150 4450 2050
Entry Wire Line
	4350 2250 4450 2150
Text Label 4450 1450 0    50   ~ 0
CH1
Text Label 4450 1550 0    50   ~ 0
CH2
Text Label 4450 1650 0    50   ~ 0
CH3
Text Label 4450 1750 0    50   ~ 0
CH4
Text Label 4450 1850 0    50   ~ 0
CH5
Text Label 4450 1950 0    50   ~ 0
CH6
Text Label 4450 2050 0    50   ~ 0
CH7
Text Label 4450 2150 0    50   ~ 0
CH8
Text Label 5450 2350 2    50   ~ 0
CH11
Text Label 5450 2250 2    50   ~ 0
CH12
Text Label 5450 2150 2    50   ~ 0
CH13
Text Label 5450 2050 2    50   ~ 0
CH14
Text Label 5450 1950 2    50   ~ 0
CH15
Text HLabel 5600 1400 2    50   Output ~ 0
CH[1..15]
Wire Wire Line
	4450 2250 4700 2250
Wire Wire Line
	4450 2350 4700 2350
Entry Wire Line
	4350 2350 4450 2250
Entry Wire Line
	4350 2450 4450 2350
Text Label 4450 2250 0    50   ~ 0
CH9
Text Label 4450 2350 0    50   ~ 0
CH10
NoConn ~ 5200 1450
NoConn ~ 5200 1550
NoConn ~ 5200 1650
NoConn ~ 5200 1750
NoConn ~ 5200 1850
Wire Bus Line
	5550 1400 5550 2500
Wire Bus Line
	6800 1400 6800 2300
Wire Bus Line
	8000 1300 8000 2300
Wire Bus Line
	4350 1400 4350 2500
$EndSCHEMATC
