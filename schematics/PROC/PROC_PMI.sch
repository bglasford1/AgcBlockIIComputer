EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 16 16
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
L Connector_Generic:Conn_02x20_Counter_Clockwise J100
U 1 1 6D525B96
P 4100 1900
F 0 "J100" H 4150 3017 50  0000 C CNN
F 1 "Conn_02x20" H 4150 2926 50  0000 C CNN
F 2 "" H 4100 1900 50  0001 C CNN
F 3 "~" H 4100 1900 50  0001 C CNN
	1    4100 1900
	-1   0    0    -1  
$EndComp
Text HLabel 5600 1300 2    50   Output ~ 0
CLK1
Text HLabel 3800 1000 0    50   Output ~ 0
CI
Text HLabel 3800 1200 0    50   Output ~ 0
RA
Text HLabel 3800 1300 0    50   Output ~ 0
RB
Text HLabel 3800 1500 0    50   Output ~ 0
RC
Text HLabel 3800 1600 0    50   Output ~ 0
RL
Text HLabel 3800 1700 0    50   Output ~ 0
RQ
Text HLabel 3800 2100 0    50   Output ~ 0
RU
Text HLabel 3800 2200 0    50   Output ~ 0
RZ
Text HLabel 3800 2500 0    50   Output ~ 0
R6
Text HLabel 3800 2400 0    50   Output ~ 0
R1C
Text HLabel 3800 2600 0    50   Output ~ 0
RB1
Text HLabel 3800 2700 0    50   Output ~ 0
R15
Text HLabel 3800 2300 0    50   Output ~ 0
RB2
Text HLabel 4300 2900 2    50   Output ~ 0
WA
Text HLabel 4300 2800 2    50   Output ~ 0
WALS
Text HLabel 4300 2700 2    50   Output ~ 0
WB
Text HLabel 4300 2600 2    50   Output ~ 0
WL
Text HLabel 4300 2200 2    50   Output ~ 0
WQ
Text HLabel 4300 2100 2    50   Output ~ 0
WY12
Text HLabel 4300 2000 2    50   Output ~ 0
WY
Text HLabel 4300 1900 2    50   Output ~ 0
WYD
Text HLabel 4300 1800 2    50   Output ~ 0
WZ
Text HLabel 4300 1700 2    50   Output ~ 0
A2X
Text HLabel 4300 1600 2    50   Output ~ 0
RQC
Text HLabel 4300 1500 2    50   Output ~ 0
WQC
Text HLabel 4300 1400 2    50   Output ~ 0
G2LS
Text HLabel 4300 1300 2    50   Output ~ 0
L2GD
Text HLabel 3800 2900 0    50   Output ~ 0
L16
Text HLabel 4300 1100 2    50   Output ~ 0
RCH
Text HLabel 4300 1000 2    50   Output ~ 0
WCH
$Comp
L 74xx:74LS04 U80
U 1 1 6D6DEFC8
P 6250 1200
F 0 "U80" H 6250 1517 50  0000 C CNN
F 1 "74LS04" H 6250 1426 50  0000 C CNN
F 2 "" H 6250 1200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6250 1200 50  0001 C CNN
	1    6250 1200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U80
U 2 1 6D6E3E9F
P 6950 1350
F 0 "U80" H 7050 1600 50  0000 C CNN
F 1 "74LS04" H 7050 1500 50  0000 C CNN
F 2 "" H 6950 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6950 1350 50  0001 C CNN
	2    6950 1350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U80
U 3 1 6D6E4BD4
P 6950 1750
F 0 "U80" H 7050 2000 50  0000 C CNN
F 1 "74LS04" H 7050 1900 50  0000 C CNN
F 2 "" H 6950 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6950 1750 50  0001 C CNN
	3    6950 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1200 6650 1200
Text HLabel 7250 800  2    50   Output ~ 0
AUA_CLK2
Text HLabel 7500 1750 2    50   Output ~ 0
CRB_CLK2
Text HLabel 3800 1100 0    50   Output ~ 0
RSTRT
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 610CE24E
P 10150 1300
F 0 "#FLG0101" H 10150 1375 50  0001 C CNN
F 1 "PWR_FLAG" H 10150 1473 50  0000 C CNN
F 2 "" H 10150 1300 50  0001 C CNN
F 3 "~" H 10150 1300 50  0001 C CNN
	1    10150 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0304
U 1 1 610CEF65
P 10150 1300
F 0 "#PWR0304" H 10150 1050 50  0001 C CNN
F 1 "GND" H 10155 1127 50  0000 C CNN
F 2 "" H 10150 1300 50  0001 C CNN
F 3 "" H 10150 1300 50  0001 C CNN
	1    10150 1300
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 610CF7C8
P 10150 800
F 0 "#FLG0102" H 10150 875 50  0001 C CNN
F 1 "PWR_FLAG" H 10150 973 50  0000 C CNN
F 2 "" H 10150 800 50  0001 C CNN
F 3 "~" H 10150 800 50  0001 C CNN
	1    10150 800 
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR0305
U 1 1 610D7EDF
P 10150 800
F 0 "#PWR0305" H 10150 650 50  0001 C CNN
F 1 "+5V" H 10165 973 50  0000 C CNN
F 2 "" H 10150 800 50  0001 C CNN
F 3 "" H 10150 800 50  0001 C CNN
	1    10150 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3650 6300 3650
Wire Wire Line
	6100 3750 6300 3750
Wire Wire Line
	6100 3850 6300 3850
Wire Wire Line
	6100 3950 6300 3950
Wire Wire Line
	6100 4050 6300 4050
Wire Wire Line
	6100 4150 6300 4150
Wire Wire Line
	6100 4250 6300 4250
Wire Wire Line
	6100 4350 6300 4350
Wire Wire Line
	5600 4350 5400 4350
Wire Wire Line
	5600 4250 5400 4250
Wire Wire Line
	5600 4150 5400 4150
Wire Wire Line
	5600 4050 5400 4050
Wire Wire Line
	5600 3950 5400 3950
Wire Wire Line
	5600 3850 5400 3850
Wire Wire Line
	5600 3750 5400 3750
Wire Wire Line
	5600 3650 5400 3650
Entry Wire Line
	6400 3750 6300 3650
Entry Wire Line
	6400 3850 6300 3750
Entry Wire Line
	6400 3950 6300 3850
Entry Wire Line
	6400 4050 6300 3950
Entry Wire Line
	6400 4150 6300 4050
Entry Wire Line
	6400 4250 6300 4150
Entry Wire Line
	6400 4350 6300 4250
Entry Wire Line
	6400 4450 6300 4350
Entry Wire Line
	5300 4450 5400 4350
Entry Wire Line
	5300 4350 5400 4250
Entry Wire Line
	5300 4250 5400 4150
Entry Wire Line
	5300 4150 5400 4050
Entry Wire Line
	5300 4050 5400 3950
Entry Wire Line
	5300 3950 5400 3850
Entry Wire Line
	5300 3850 5400 3750
Entry Wire Line
	5300 3750 5400 3650
Text Label 5400 3650 0    50   ~ 0
W1
Text Label 5400 3750 0    50   ~ 0
W2
Text Label 5400 3850 0    50   ~ 0
W3
Text Label 5400 3950 0    50   ~ 0
W4
Text Label 5400 4050 0    50   ~ 0
W5
Text Label 5400 4150 0    50   ~ 0
W6
Text Label 5400 4250 0    50   ~ 0
W7
Text Label 5400 4350 0    50   ~ 0
W8
Text Label 6300 4350 2    50   ~ 0
W9
Text Label 6300 4250 2    50   ~ 0
W10
Text Label 6300 4150 2    50   ~ 0
W11
Text Label 6300 4050 2    50   ~ 0
W12
Text Label 6300 3950 2    50   ~ 0
W13
Text Label 6300 3850 2    50   ~ 0
W14
Text Label 6300 3750 2    50   ~ 0
W15
Text Label 6300 3650 2    50   ~ 0
W16
Wire Wire Line
	2900 1650 3100 1650
Wire Wire Line
	2900 1750 3100 1750
Wire Wire Line
	2900 1850 3100 1850
Wire Wire Line
	2900 1950 3100 1950
Wire Wire Line
	2900 2050 3100 2050
Wire Wire Line
	2900 2150 3100 2150
Wire Wire Line
	2400 2150 2200 2150
Wire Wire Line
	2400 2050 2200 2050
Wire Wire Line
	2400 1950 2200 1950
Wire Wire Line
	2400 1850 2200 1850
Wire Wire Line
	2400 1750 2200 1750
Wire Wire Line
	2400 1650 2200 1650
Wire Wire Line
	2400 1550 2200 1550
Wire Wire Line
	2400 1450 2200 1450
Wire Wire Line
	2400 1250 2200 1250
Wire Bus Line
	2100 750  2200 750 
Text HLabel 2200 750  2    50   BiDi ~ 0
LG[1..16]
Wire Wire Line
	2400 1350 2200 1350
Entry Wire Line
	2100 1350 2200 1250
Entry Wire Line
	2100 1450 2200 1350
Entry Wire Line
	2100 1550 2200 1450
Entry Wire Line
	2100 1650 2200 1550
Entry Wire Line
	2100 1750 2200 1650
Entry Wire Line
	2100 1850 2200 1750
Entry Wire Line
	2100 1950 2200 1850
Entry Wire Line
	2100 2050 2200 1950
Entry Wire Line
	2100 2150 2200 2050
Entry Wire Line
	2100 2250 2200 2150
Entry Wire Line
	3200 2250 3100 2150
Entry Wire Line
	3200 2150 3100 2050
Entry Wire Line
	3200 2050 3100 1950
Entry Wire Line
	3200 1950 3100 1850
Entry Wire Line
	3200 1850 3100 1750
Entry Wire Line
	3200 1750 3100 1650
Text Label 2200 1250 0    50   ~ 0
LG1
Text Label 2200 1350 0    50   ~ 0
LG2
Text Label 3100 1650 2    50   ~ 0
LG16
Text Label 3100 1750 2    50   ~ 0
LG15
Text Label 3100 1850 2    50   ~ 0
LG14
Text Label 3100 1950 2    50   ~ 0
LG13
Text Label 3100 2050 2    50   ~ 0
LG12
Text Label 3100 2150 2    50   ~ 0
LG11
Text Label 2200 2150 0    50   ~ 0
LG10
Text Label 2200 1450 0    50   ~ 0
LG3
Text Label 2200 1550 0    50   ~ 0
LG4
Text Label 2200 1650 0    50   ~ 0
LG5
Text Label 2200 1750 0    50   ~ 0
LG6
Text Label 2200 1850 0    50   ~ 0
LG7
Text Label 2200 1950 0    50   ~ 0
LG8
Text Label 2200 2050 0    50   ~ 0
LG9
Wire Wire Line
	1450 1800 1750 1800
Wire Wire Line
	1450 1900 1750 1900
Wire Wire Line
	1450 2100 1750 2100
Wire Wire Line
	1450 2200 1750 2200
Wire Wire Line
	950  2200 750  2200
Wire Wire Line
	950  2100 750  2100
Wire Wire Line
	950  2000 750  2000
Wire Wire Line
	950  1900 750  1900
Wire Wire Line
	950  1800 750  1800
Wire Wire Line
	950  1700 750  1700
Wire Wire Line
	950  1600 750  1600
Wire Wire Line
	950  1500 750  1500
Wire Wire Line
	950  1400 750  1400
Wire Wire Line
	950  1300 750  1300
Wire Bus Line
	1850 750  1750 750 
Text HLabel 1750 750  0    50   BiDi ~ 0
CH[1..16]
Entry Wire Line
	750  1300 650  1400
Entry Wire Line
	750  1400 650  1500
Entry Wire Line
	750  1500 650  1600
Entry Wire Line
	750  1600 650  1700
Entry Wire Line
	750  1700 650  1800
Entry Wire Line
	750  1800 650  1900
Entry Wire Line
	750  1900 650  2000
Entry Wire Line
	750  2000 650  2100
Entry Wire Line
	750  2100 650  2200
Entry Wire Line
	750  2200 650  2300
Entry Wire Line
	1750 2200 1850 2300
Entry Wire Line
	1750 2100 1850 2200
Entry Wire Line
	1750 1900 1850 2000
Entry Wire Line
	1750 1800 1850 1900
Text Label 750  1300 0    50   ~ 0
CH1
Text Label 750  1400 0    50   ~ 0
CH2
Text Label 750  1500 0    50   ~ 0
CH3
Text Label 750  1600 0    50   ~ 0
CH4
Text Label 750  1700 0    50   ~ 0
CH5
Text Label 750  1800 0    50   ~ 0
CH6
Text Label 750  1900 0    50   ~ 0
CH7
Text Label 750  2000 0    50   ~ 0
CH8
Text Label 750  2100 0    50   ~ 0
CH9
Text Label 750  2200 0    50   ~ 0
CH10
Text Label 1750 2200 2    50   ~ 0
CH11
Text Label 1750 2100 2    50   ~ 0
CH12
Text Label 1750 1900 2    50   ~ 0
CH14
Text Label 1750 1800 2    50   ~ 0
CH15
Text HLabel 4300 2500 2    50   Output ~ 0
RLC
Text HLabel 4300 2400 2    50   Output ~ 0
WLC
Text HLabel 3800 1800 0    50   Output ~ 0
Z15
Text HLabel 3800 2000 0    50   Output ~ 0
Z16
Text HLabel 2900 1550 2    50   Output ~ 0
G1
Text HLabel 2900 1450 2    50   Output ~ 0
G16
Text Notes 4200 700  2    80   ~ 0
To CTL
Text Notes 5550 700  2    80   ~ 0
To CTL
Text Notes 1600 950  2    80   ~ 0
Channel Bus
Text Notes 2850 950  2    80   ~ 0
To MEM
$Comp
L power:GND #PWR?
U 1 1 8994B1F1
P 3750 5400
AR Path="/6D28EE8A/6EC168B2/8994B1F1" Ref="#PWR?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/8994B1F1" Ref="#PWR?"  Part="1" 
AR Path="/6D28EBF6/8994B1F1" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 3750 5150 50  0001 C CNN
F 1 "GND" H 3755 5227 50  0000 C CNN
F 2 "" H 3750 5400 50  0001 C CNN
F 3 "" H 3750 5400 50  0001 C CNN
	1    3750 5400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 8994B1F7
P 4250 4000
AR Path="/6D28EE8A/6EC168B2/8994B1F7" Ref="#PWR?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/8994B1F7" Ref="#PWR?"  Part="1" 
AR Path="/6D28EBF6/8994B1F7" Ref="#PWR0130"  Part="1" 
F 0 "#PWR0130" H 4250 3850 50  0001 C CNN
F 1 "+5V" H 4265 4173 50  0000 C CNN
F 2 "" H 4250 4000 50  0001 C CNN
F 3 "" H 4250 4000 50  0001 C CNN
	1    4250 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 8994B1FD
P 4250 5600
AR Path="/6D28EE8A/6EC168B2/8994B1FD" Ref="#PWR?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/8994B1FD" Ref="#PWR?"  Part="1" 
AR Path="/6D28EBF6/8994B1FD" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 4250 5350 50  0001 C CNN
F 1 "GND" H 4255 5427 50  0000 C CNN
F 2 "" H 4250 5600 50  0001 C CNN
F 3 "" H 4250 5600 50  0001 C CNN
	1    4250 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 5300 3750 5400
Wire Wire Line
	3750 5200 3750 5300
Connection ~ 3750 5300
$Comp
L 74xx:74LS244 U?
U 1 1 8994B206
P 4250 4800
AR Path="/6D28EE8A/6EC168B2/8994B206" Ref="U?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/8994B206" Ref="U?"  Part="1" 
AR Path="/6D28EBF6/8994B206" Ref="U88"  Part="1" 
F 0 "U88" H 4500 5600 50  0000 C CNN
F 1 "74LS244" H 4500 5500 50  0000 C CNN
F 2 "" H 4250 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS244" H 4250 4800 50  0001 C CNN
	1    4250 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 8994B20C
P 3750 7500
AR Path="/6D28EE8A/6EC168B2/8994B20C" Ref="#PWR?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/8994B20C" Ref="#PWR?"  Part="1" 
AR Path="/6D28EBF6/8994B20C" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 3750 7250 50  0001 C CNN
F 1 "GND" H 3755 7327 50  0000 C CNN
F 2 "" H 3750 7500 50  0001 C CNN
F 3 "" H 3750 7500 50  0001 C CNN
	1    3750 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 8994B212
P 4250 6100
AR Path="/6D28EE8A/6EC168B2/8994B212" Ref="#PWR?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/8994B212" Ref="#PWR?"  Part="1" 
AR Path="/6D28EBF6/8994B212" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 4250 5950 50  0001 C CNN
F 1 "+5V" H 4265 6273 50  0000 C CNN
F 2 "" H 4250 6100 50  0001 C CNN
F 3 "" H 4250 6100 50  0001 C CNN
	1    4250 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 8994B218
P 4250 7700
AR Path="/6D28EE8A/6EC168B2/8994B218" Ref="#PWR?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/8994B218" Ref="#PWR?"  Part="1" 
AR Path="/6D28EBF6/8994B218" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 4250 7450 50  0001 C CNN
F 1 "GND" H 4255 7527 50  0000 C CNN
F 2 "" H 4250 7700 50  0001 C CNN
F 3 "" H 4250 7700 50  0001 C CNN
	1    4250 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 7400 3750 7500
Wire Wire Line
	3750 7300 3750 7400
Connection ~ 3750 7400
$Comp
L 74xx:74LS244 U?
U 1 1 8994B221
P 4250 6900
AR Path="/6D28EE8A/6EC168B2/8994B221" Ref="U?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/8994B221" Ref="U?"  Part="1" 
AR Path="/6D28EBF6/8994B221" Ref="U89"  Part="1" 
F 0 "U89" H 4500 7700 50  0000 C CNN
F 1 "74LS244" H 4500 7600 50  0000 C CNN
F 2 "" H 4250 6900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS244" H 4250 6900 50  0001 C CNN
	1    4250 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4300 4950 4300
Wire Wire Line
	4750 4400 4950 4400
Wire Wire Line
	4750 4500 4950 4500
Wire Wire Line
	4750 4600 4950 4600
Wire Wire Line
	4750 4700 4950 4700
Wire Wire Line
	4750 4800 4950 4800
Wire Wire Line
	4750 4900 4950 4900
Wire Wire Line
	4750 5000 4950 5000
Wire Wire Line
	4750 6400 4950 6400
Wire Wire Line
	4750 6500 4950 6500
Wire Wire Line
	4750 6600 4950 6600
Wire Wire Line
	4750 6700 4950 6700
Wire Wire Line
	4750 6800 4950 6800
Wire Wire Line
	4750 6900 4950 6900
Wire Wire Line
	4750 7000 4950 7000
Wire Wire Line
	4750 7100 4950 7100
Entry Wire Line
	4950 4300 5050 4400
Entry Wire Line
	4950 4400 5050 4500
Entry Wire Line
	4950 4500 5050 4600
Entry Wire Line
	4950 4600 5050 4700
Entry Wire Line
	4950 4700 5050 4800
Entry Wire Line
	4950 4800 5050 4900
Entry Wire Line
	4950 4900 5050 5000
Entry Wire Line
	4950 5000 5050 5100
Entry Wire Line
	4950 6400 5050 6500
Entry Wire Line
	4950 6500 5050 6600
Entry Wire Line
	4950 6600 5050 6700
Entry Wire Line
	4950 6700 5050 6800
Entry Wire Line
	4950 6800 5050 6900
Entry Wire Line
	4950 6900 5050 7000
Entry Wire Line
	4950 7000 5050 7100
Entry Wire Line
	4950 7100 5050 7200
Text Label 4950 7100 2    50   ~ 0
W1
Text Label 4950 7000 2    50   ~ 0
W2
Text Label 4950 6900 2    50   ~ 0
W3
Text Label 4950 6800 2    50   ~ 0
W4
Text Label 4950 6700 2    50   ~ 0
W5
Text Label 4950 6600 2    50   ~ 0
W6
Text Label 4950 6500 2    50   ~ 0
W7
Text Label 4950 6400 2    50   ~ 0
W8
Text Label 4950 5000 2    50   ~ 0
W9
Text Label 4950 4900 2    50   ~ 0
W10
Text Label 4950 4800 2    50   ~ 0
W11
Text Label 4950 4700 2    50   ~ 0
W12
Text Label 4950 4600 2    50   ~ 0
W13
Text Label 4950 4500 2    50   ~ 0
W14
Text Label 4950 4400 2    50   ~ 0
W15
Text Label 4950 4300 2    50   ~ 0
W16
Wire Wire Line
	3750 4300 3500 4300
Wire Wire Line
	3750 4400 3500 4400
Wire Wire Line
	3750 4500 3500 4500
Wire Wire Line
	3750 4600 3500 4600
Wire Wire Line
	3750 4700 3500 4700
Wire Wire Line
	3750 4800 3500 4800
Wire Wire Line
	3750 4900 3500 4900
Wire Wire Line
	3750 5000 3500 5000
Wire Wire Line
	3750 6400 3500 6400
Wire Wire Line
	3750 6500 3500 6500
Wire Wire Line
	3750 6600 3500 6600
Wire Wire Line
	3750 6700 3500 6700
Wire Wire Line
	3750 6800 3500 6800
Wire Wire Line
	3750 6900 3500 6900
Wire Wire Line
	3750 7000 3500 7000
Wire Wire Line
	3750 7100 3500 7100
Text HLabel 3300 4100 0    50   Input ~ 0
IW[1..16]
Entry Wire Line
	3400 5100 3500 5000
Entry Wire Line
	3400 5000 3500 4900
Entry Wire Line
	3400 4900 3500 4800
Entry Wire Line
	3400 4800 3500 4700
Entry Wire Line
	3400 4700 3500 4600
Entry Wire Line
	3400 4600 3500 4500
Entry Wire Line
	3400 4500 3500 4400
Entry Wire Line
	3400 4400 3500 4300
Entry Wire Line
	3400 6500 3500 6400
Entry Wire Line
	3400 6600 3500 6500
Entry Wire Line
	3400 6700 3500 6600
Entry Wire Line
	3400 6800 3500 6700
Entry Wire Line
	3400 6900 3500 6800
Entry Wire Line
	3400 7000 3500 6900
Entry Wire Line
	3400 7100 3500 7000
Entry Wire Line
	3400 7200 3500 7100
Text Label 3500 7100 0    50   ~ 0
IW1
Text Label 3500 7000 0    50   ~ 0
IW2
Text Label 3500 6900 0    50   ~ 0
IW3
Text Label 3500 6800 0    50   ~ 0
IW4
Text Label 3500 6700 0    50   ~ 0
IW5
Text Label 3500 6600 0    50   ~ 0
IW6
Text Label 3500 6500 0    50   ~ 0
IW7
Text Label 3500 6400 0    50   ~ 0
IW8
Text Label 3500 5000 0    50   ~ 0
IW9
Text Label 3500 4900 0    50   ~ 0
IW10
Text Label 3500 4800 0    50   ~ 0
IW11
Text Label 3500 4700 0    50   ~ 0
IW12
Text Label 3500 4600 0    50   ~ 0
IW13
Text Label 3500 4500 0    50   ~ 0
IW14
Text Label 3500 4400 0    50   ~ 0
IW15
Text Label 3500 4300 0    50   ~ 0
IW16
$Comp
L power:GND #PWR?
U 1 1 89AA959B
P 2350 5200
AR Path="/6D28EE8A/6EC168B2/89AA959B" Ref="#PWR?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/89AA959B" Ref="#PWR?"  Part="1" 
AR Path="/6D28EBF6/89AA959B" Ref="#PWR0135"  Part="1" 
F 0 "#PWR0135" H 2350 4950 50  0001 C CNN
F 1 "GND" H 2355 5027 50  0000 C CNN
F 2 "" H 2350 5200 50  0001 C CNN
F 3 "" H 2350 5200 50  0001 C CNN
	1    2350 5200
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 89AA95A1
P 1850 3800
AR Path="/6D28EE8A/6EC168B2/89AA95A1" Ref="#PWR?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/89AA95A1" Ref="#PWR?"  Part="1" 
AR Path="/6D28EBF6/89AA95A1" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 1850 3650 50  0001 C CNN
F 1 "+5V" H 1865 3973 50  0000 C CNN
F 2 "" H 1850 3800 50  0001 C CNN
F 3 "" H 1850 3800 50  0001 C CNN
	1    1850 3800
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 89AA95A7
P 1850 5400
AR Path="/6D28EE8A/6EC168B2/89AA95A7" Ref="#PWR?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/89AA95A7" Ref="#PWR?"  Part="1" 
AR Path="/6D28EBF6/89AA95A7" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 1850 5150 50  0001 C CNN
F 1 "GND" H 1855 5227 50  0000 C CNN
F 2 "" H 1850 5400 50  0001 C CNN
F 3 "" H 1850 5400 50  0001 C CNN
	1    1850 5400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2350 5100 2350 5200
Wire Wire Line
	2350 5000 2350 5100
Connection ~ 2350 5100
$Comp
L 74xx:74LS244 U?
U 1 1 89AA95B0
P 1850 4600
AR Path="/6D28EE8A/6EC168B2/89AA95B0" Ref="U?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/89AA95B0" Ref="U?"  Part="1" 
AR Path="/6D28EBF6/89AA95B0" Ref="U86"  Part="1" 
F 0 "U86" H 2100 5400 50  0000 C CNN
F 1 "74LS244" H 2100 5300 50  0000 C CNN
F 2 "" H 1850 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS244" H 1850 4600 50  0001 C CNN
	1    1850 4600
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 89AA95B6
P 2350 7300
AR Path="/6D28EE8A/6EC168B2/89AA95B6" Ref="#PWR?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/89AA95B6" Ref="#PWR?"  Part="1" 
AR Path="/6D28EBF6/89AA95B6" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 2350 7050 50  0001 C CNN
F 1 "GND" H 2355 7127 50  0000 C CNN
F 2 "" H 2350 7300 50  0001 C CNN
F 3 "" H 2350 7300 50  0001 C CNN
	1    2350 7300
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 89AA95BC
P 1850 5900
AR Path="/6D28EE8A/6EC168B2/89AA95BC" Ref="#PWR?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/89AA95BC" Ref="#PWR?"  Part="1" 
AR Path="/6D28EBF6/89AA95BC" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 1850 5750 50  0001 C CNN
F 1 "+5V" H 1865 6073 50  0000 C CNN
F 2 "" H 1850 5900 50  0001 C CNN
F 3 "" H 1850 5900 50  0001 C CNN
	1    1850 5900
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 89AA95C2
P 1850 7500
AR Path="/6D28EE8A/6EC168B2/89AA95C2" Ref="#PWR?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/89AA95C2" Ref="#PWR?"  Part="1" 
AR Path="/6D28EBF6/89AA95C2" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 1850 7250 50  0001 C CNN
F 1 "GND" H 1855 7327 50  0000 C CNN
F 2 "" H 1850 7500 50  0001 C CNN
F 3 "" H 1850 7500 50  0001 C CNN
	1    1850 7500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2350 7200 2350 7300
Wire Wire Line
	2350 7100 2350 7200
Connection ~ 2350 7200
$Comp
L 74xx:74LS244 U?
U 1 1 89AA95CB
P 1850 6700
AR Path="/6D28EE8A/6EC168B2/89AA95CB" Ref="U?"  Part="1" 
AR Path="/6D28EE8A/6EC16906/89AA95CB" Ref="U?"  Part="1" 
AR Path="/6D28EBF6/89AA95CB" Ref="U87"  Part="1" 
F 0 "U87" H 2100 7500 50  0000 C CNN
F 1 "74LS244" H 2100 7400 50  0000 C CNN
F 2 "" H 1850 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS244" H 1850 6700 50  0001 C CNN
	1    1850 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1350 4100 1150 4100
Wire Wire Line
	1350 4200 1150 4200
Wire Wire Line
	1350 4300 1150 4300
Wire Wire Line
	1350 4400 1150 4400
Wire Wire Line
	1350 4500 1150 4500
Wire Wire Line
	1350 4600 1150 4600
Wire Wire Line
	1350 4700 1150 4700
Wire Wire Line
	1350 4800 1150 4800
Wire Wire Line
	1350 6200 1150 6200
Wire Wire Line
	1350 6300 1150 6300
Wire Wire Line
	1350 6400 1150 6400
Wire Wire Line
	1350 6500 1150 6500
Wire Wire Line
	1350 6600 1150 6600
Wire Wire Line
	1350 6700 1150 6700
Wire Wire Line
	1350 6800 1150 6800
Wire Wire Line
	1350 6900 1150 6900
Entry Wire Line
	1150 4100 1050 4200
Entry Wire Line
	1150 4200 1050 4300
Entry Wire Line
	1150 4300 1050 4400
Entry Wire Line
	1150 4400 1050 4500
Entry Wire Line
	1150 4500 1050 4600
Entry Wire Line
	1150 4600 1050 4700
Entry Wire Line
	1150 4700 1050 4800
Entry Wire Line
	1150 4800 1050 4900
Entry Wire Line
	1150 6200 1050 6300
Entry Wire Line
	1150 6300 1050 6400
Entry Wire Line
	1150 6400 1050 6500
Entry Wire Line
	1150 6500 1050 6600
Entry Wire Line
	1150 6600 1050 6700
Entry Wire Line
	1150 6700 1050 6800
Entry Wire Line
	1150 6800 1050 6900
Entry Wire Line
	1150 6900 1050 7000
Text Label 1150 6900 0    50   ~ 0
W1
Text Label 1150 6800 0    50   ~ 0
W2
Text Label 1150 6700 0    50   ~ 0
W3
Text Label 1150 6600 0    50   ~ 0
W4
Text Label 1150 6500 0    50   ~ 0
W5
Text Label 1150 6400 0    50   ~ 0
W6
Text Label 1150 6300 0    50   ~ 0
W7
Text Label 1150 6200 0    50   ~ 0
W8
Text Label 1150 4800 0    50   ~ 0
W9
Text Label 1150 4700 0    50   ~ 0
W10
Text Label 1150 4600 0    50   ~ 0
W11
Text Label 1150 4500 0    50   ~ 0
W12
Text Label 1150 4400 0    50   ~ 0
W13
Text Label 1150 4300 0    50   ~ 0
W14
Text Label 1150 4200 0    50   ~ 0
W15
Text Label 1150 4100 0    50   ~ 0
W16
Wire Wire Line
	2350 4100 2600 4100
Wire Wire Line
	2350 4200 2600 4200
Wire Wire Line
	2350 4300 2600 4300
Wire Wire Line
	2350 4400 2600 4400
Wire Wire Line
	2350 4500 2600 4500
Wire Wire Line
	2350 4600 2600 4600
Wire Wire Line
	2350 4700 2600 4700
Wire Wire Line
	2350 4800 2600 4800
Wire Wire Line
	2350 6200 2600 6200
Wire Wire Line
	2350 6300 2600 6300
Wire Wire Line
	2350 6400 2600 6400
Wire Wire Line
	2350 6500 2600 6500
Wire Wire Line
	2350 6600 2600 6600
Wire Wire Line
	2350 6700 2600 6700
Wire Wire Line
	2350 6800 2600 6800
Wire Wire Line
	2350 6900 2600 6900
Text HLabel 2800 3900 2    50   Output ~ 0
IW[1..16]
Entry Wire Line
	2700 4900 2600 4800
Entry Wire Line
	2700 4800 2600 4700
Entry Wire Line
	2700 4700 2600 4600
Entry Wire Line
	2700 4600 2600 4500
Entry Wire Line
	2700 4500 2600 4400
Entry Wire Line
	2700 4400 2600 4300
Entry Wire Line
	2700 4300 2600 4200
Entry Wire Line
	2700 4200 2600 4100
Entry Wire Line
	2700 6300 2600 6200
Entry Wire Line
	2700 6400 2600 6300
Entry Wire Line
	2700 6500 2600 6400
Entry Wire Line
	2700 6600 2600 6500
Entry Wire Line
	2700 6700 2600 6600
Entry Wire Line
	2700 6800 2600 6700
Entry Wire Line
	2700 6900 2600 6800
Entry Wire Line
	2700 7000 2600 6900
Text Label 2600 6900 2    50   ~ 0
IW1
Text Label 2600 6800 2    50   ~ 0
IW2
Text Label 2600 6700 2    50   ~ 0
IW3
Text Label 2600 6600 2    50   ~ 0
IW4
Text Label 2600 6500 2    50   ~ 0
IW5
Text Label 2600 6400 2    50   ~ 0
IW6
Text Label 2600 6300 2    50   ~ 0
IW7
Text Label 2600 6200 2    50   ~ 0
IW8
Text Label 2600 4800 2    50   ~ 0
IW9
Text Label 2600 4700 2    50   ~ 0
IW10
Text Label 2600 4600 2    50   ~ 0
IW11
Text Label 2600 4500 2    50   ~ 0
IW12
Text Label 2600 4400 2    50   ~ 0
IW13
Text Label 2600 4300 2    50   ~ 0
IW14
Text Label 2600 4200 2    50   ~ 0
IW15
Text Label 2600 4100 2    50   ~ 0
IW16
Wire Bus Line
	2700 3900 2800 3900
Wire Bus Line
	3400 4100 3300 4100
$Comp
L Connector:Conn_01x40_Male J200
U 1 1 89D9131C
P 7350 4650
F 0 "J200" H 7458 6731 50  0000 C CNN
F 1 "Conn_01x40_Male" H 7458 6640 50  0000 C CNN
F 2 "" H 7350 4650 50  0001 C CNN
F 3 "~" H 7350 4650 50  0001 C CNN
	1    7350 4650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x40_Male J201
U 1 1 89D91322
P 8200 4650
F 0 "J201" H 8308 6731 50  0000 C CNN
F 1 "Conn_01x40_Male" H 8308 6640 50  0000 C CNN
F 2 "" H 8200 4650 50  0001 C CNN
F 3 "~" H 8200 4650 50  0001 C CNN
	1    8200 4650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x40_Male J202
U 1 1 89D91328
P 9050 4650
F 0 "J202" H 9158 6731 50  0000 C CNN
F 1 "Conn_01x40_Male" H 9158 6640 50  0000 C CNN
F 2 "" H 9050 4650 50  0001 C CNN
F 3 "~" H 9050 4650 50  0001 C CNN
	1    9050 4650
	1    0    0    -1  
$EndComp
Text GLabel 7550 2750 2    50   Output ~ 0
BP1
Text GLabel 7550 2850 2    50   Output ~ 0
BP2
Text GLabel 7550 2950 2    50   Output ~ 0
BP3
Text GLabel 7550 3050 2    50   Output ~ 0
BP4
Text GLabel 7550 3150 2    50   Output ~ 0
BP5
Text GLabel 7550 3250 2    50   Output ~ 0
BP6
Text GLabel 7550 3350 2    50   Output ~ 0
BP7
Text GLabel 7550 3450 2    50   Output ~ 0
BP8
Text GLabel 7550 3550 2    50   Output ~ 0
BP9
Text GLabel 7550 3650 2    50   Output ~ 0
BP10
Text GLabel 7550 3750 2    50   Output ~ 0
BP11
Text GLabel 7550 3850 2    50   Output ~ 0
BP12
Text GLabel 7550 3950 2    50   Output ~ 0
BP13
Text GLabel 7550 4050 2    50   Output ~ 0
BP14
Text GLabel 7550 4150 2    50   Output ~ 0
BP15
Text GLabel 7550 4250 2    50   Output ~ 0
BP16
Text GLabel 7550 4350 2    50   Output ~ 0
BP17
Text GLabel 7550 4450 2    50   Output ~ 0
BP18
Text GLabel 7550 4550 2    50   Output ~ 0
BP19
Text GLabel 7550 4650 2    50   Output ~ 0
BP20
Text GLabel 7550 4750 2    50   Output ~ 0
BP21
Text GLabel 7550 4850 2    50   Output ~ 0
BP22
Text GLabel 7550 4950 2    50   Output ~ 0
BP23
Text GLabel 7550 5050 2    50   Output ~ 0
BP24
Text GLabel 7550 5150 2    50   Output ~ 0
BP25
Text GLabel 7550 5450 2    50   Output ~ 0
BP28
Text GLabel 7550 5550 2    50   Output ~ 0
BP29
Text GLabel 7550 5650 2    50   Output ~ 0
BP30
Text GLabel 7550 5750 2    50   Output ~ 0
BP31
Text GLabel 7550 5850 2    50   Output ~ 0
BP32
Text GLabel 7550 5950 2    50   Output ~ 0
BP33
Text GLabel 7550 6050 2    50   Output ~ 0
BP34
Text GLabel 7550 6150 2    50   Output ~ 0
BP35
Text GLabel 7550 6250 2    50   Output ~ 0
BP36
Text GLabel 7550 6350 2    50   Output ~ 0
BP37
Text GLabel 7550 6450 2    50   Output ~ 0
BP38
Text GLabel 7550 6550 2    50   Output ~ 0
BP39
Text GLabel 7550 6650 2    50   Output ~ 0
BP40
Text GLabel 8400 2750 2    50   Output ~ 0
BP41
Text GLabel 8400 2850 2    50   Output ~ 0
BP42
Text GLabel 8400 2950 2    50   Output ~ 0
BP43
Text GLabel 8400 3050 2    50   Output ~ 0
BP44
Text GLabel 8400 3150 2    50   Output ~ 0
BP45
Text GLabel 8400 3250 2    50   Output ~ 0
BP46
Text GLabel 8400 3350 2    50   Output ~ 0
BP47
Text GLabel 8400 3450 2    50   Output ~ 0
BP48
Text GLabel 8400 3550 2    50   Output ~ 0
BP49
Text GLabel 8400 3650 2    50   Output ~ 0
BP50
Text GLabel 8400 3750 2    50   Output ~ 0
BP51
Text GLabel 8400 3850 2    50   Output ~ 0
BP52
Text GLabel 8400 4150 2    50   Output ~ 0
BP55
Text GLabel 8400 4250 2    50   Output ~ 0
BP56
Text GLabel 8400 4350 2    50   Output ~ 0
BP57
Text GLabel 8400 4450 2    50   Output ~ 0
BP58
Text GLabel 8400 4550 2    50   Output ~ 0
BP59
Text GLabel 8400 4650 2    50   Output ~ 0
BP60
Text GLabel 8400 4750 2    50   Output ~ 0
BP61
Text GLabel 8400 4850 2    50   Output ~ 0
BP62
Text GLabel 8400 4950 2    50   Output ~ 0
BP63
Text GLabel 8400 5050 2    50   Output ~ 0
BP64
Text GLabel 8400 5150 2    50   Output ~ 0
BP65
Text GLabel 8400 5250 2    50   Output ~ 0
BP66
Text GLabel 8400 5350 2    50   Output ~ 0
BP67
Text GLabel 8400 5450 2    50   Output ~ 0
BP68
Text GLabel 8400 5550 2    50   Output ~ 0
BP69
Text GLabel 8400 5650 2    50   Output ~ 0
BP70
Text GLabel 8400 5750 2    50   Output ~ 0
BP71
Text GLabel 8400 5850 2    50   Output ~ 0
BP72
Text GLabel 8400 5950 2    50   Output ~ 0
BP73
Text GLabel 8400 6050 2    50   Output ~ 0
BP74
Text GLabel 8400 6150 2    50   Output ~ 0
BP75
Text GLabel 8400 6250 2    50   Output ~ 0
BP76
Text GLabel 8400 6350 2    50   Output ~ 0
BP77
Text GLabel 8400 6450 2    50   Output ~ 0
BP78
Text GLabel 8400 6550 2    50   Output ~ 0
BP79
Text GLabel 9250 2850 2    50   Output ~ 0
BP82
Text GLabel 9250 2950 2    50   Output ~ 0
BP83
Text GLabel 9250 3050 2    50   Output ~ 0
BP84
Text GLabel 9250 3150 2    50   Output ~ 0
BP85
Text GLabel 9250 3250 2    50   Output ~ 0
BP86
Text GLabel 9250 3350 2    50   Output ~ 0
BP87
Text GLabel 9250 3450 2    50   Output ~ 0
BP88
Text GLabel 9250 3550 2    50   Output ~ 0
BP89
Text GLabel 9250 3650 2    50   Output ~ 0
BP90
Text GLabel 9250 3750 2    50   Output ~ 0
BP91
Text GLabel 9250 3850 2    50   Output ~ 0
BP92
Text GLabel 9250 3950 2    50   Output ~ 0
BP93
Text GLabel 9250 4050 2    50   Output ~ 0
BP94
Text GLabel 9250 4150 2    50   Output ~ 0
BP95
Text GLabel 9250 4250 2    50   Output ~ 0
BP96
Text GLabel 9250 6350 2    50   Output ~ 0
BP117
Text GLabel 9250 6450 2    50   Output ~ 0
BP118
Text GLabel 9250 6550 2    50   Output ~ 0
BP119
Text GLabel 9250 6650 2    50   Output ~ 0
BP120
Text GLabel 10100 2750 2    50   Output ~ 0
BP121
Text GLabel 10100 2850 2    50   Output ~ 0
BP122
Text GLabel 10100 2950 2    50   Output ~ 0
BP123
Text GLabel 10100 3050 2    50   Output ~ 0
BP124
Text GLabel 10100 3150 2    50   Output ~ 0
BP125
Text GLabel 10100 3250 2    50   Output ~ 0
BP126
Text GLabel 10100 3350 2    50   Output ~ 0
BP127
Text GLabel 10100 3450 2    50   Output ~ 0
BP128
Text GLabel 10100 3550 2    50   Output ~ 0
BP129
Text GLabel 10100 3650 2    50   Output ~ 0
BP130
Text GLabel 10100 3750 2    50   Output ~ 0
BP131
Text GLabel 10100 3850 2    50   Output ~ 0
BP132
Text GLabel 10100 3950 2    50   Output ~ 0
BP133
$Comp
L Connector_Generic:Conn_02x08_Counter_Clockwise J101
U 1 1 8C8E2D0A
P 5800 3950
F 0 "J101" H 5850 4467 50  0000 C CNN
F 1 "Conn_02x08" H 5850 4376 50  0000 C CNN
F 2 "" H 5800 3950 50  0001 C CNN
F 3 "~" H 5800 3950 50  0001 C CNN
	1    5800 3950
	1    0    0    -1  
$EndComp
Wire Bus Line
	6400 4600 5300 4600
Text Notes 6100 3350 2    80   ~ 0
Write Bus
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J104
U 1 1 8CADBDC8
P 1150 1700
F 0 "J104" H 1200 2317 50  0000 C CNN
F 1 "Conn_02x10" H 1200 2226 50  0000 C CNN
F 2 "" H 1150 1700 50  0001 C CNN
F 3 "~" H 1150 1700 50  0001 C CNN
	1    1150 1700
	1    0    0    -1  
$EndComp
Text Label 1750 2000 2    50   ~ 0
CH13
Entry Wire Line
	1750 2000 1850 2100
Wire Wire Line
	1450 2000 1750 2000
NoConn ~ 1450 1300
NoConn ~ 1450 1400
Wire Bus Line
	650  2400 1850 2400
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J105
U 1 1 8CC8A247
P 2600 1650
F 0 "J105" H 2650 2267 50  0000 C CNN
F 1 "Conn_02x10" H 2650 2176 50  0000 C CNN
F 2 "" H 2600 1650 50  0001 C CNN
F 3 "~" H 2600 1650 50  0001 C CNN
	1    2600 1650
	1    0    0    -1  
$EndComp
NoConn ~ 2900 1250
Wire Bus Line
	3200 2400 2100 2400
Text HLabel 3800 2800 0    50   Output ~ 0
B15X
Text HLabel 5100 1100 0    50   Output ~ 0
PONEX
Text HLabel 5100 1200 0    50   Output ~ 0
PTWOX
Text HLabel 5100 1300 0    50   Output ~ 0
MONEX
Text HLabel 5100 1400 0    50   Output ~ 0
PIFL
Text HLabel 3800 1900 0    50   Output ~ 0
NEACON
Wire Bus Line
	1050 3550 5050 3550
Wire Bus Line
	5050 3550 5300 3550
Connection ~ 5050 3550
Wire Wire Line
	5600 1200 5950 1200
Text HLabel 5100 1500 0    50   Output ~ 0
NEACOF
Text HLabel 5100 1600 0    50   Output ~ 0
READ0
Text HLabel 5100 1700 0    50   Output ~ 0
RAND0
Text HLabel 5100 1800 0    50   Output ~ 0
ROR0
Text HLabel 5100 1900 0    50   Output ~ 0
RXOR0
Text HLabel 5600 1900 2    50   Output ~ 0
WRITE0
Text HLabel 5600 1800 2    50   Output ~ 0
WAND0
Text HLabel 5600 1700 2    50   Output ~ 0
WOR0
Text HLabel 4300 2300 2    50   Output ~ 0
CLXC
Text HLabel 5100 1000 0    50   Output ~ 0
RUS
Text HLabel 5600 1600 2    50   Output ~ 0
RL10BB
Text HLabel 5600 1500 2    50   Input ~ 0
U16
Text HLabel 5600 1400 2    50   Input ~ 0
L15
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J102
U 1 1 9C65F0AE
P 5300 1400
F 0 "J102" H 5350 2017 50  0000 C CNN
F 1 "Conn_02x10" H 5350 1926 50  0000 C CNN
F 2 "" H 5300 1400 50  0001 C CNN
F 3 "~" H 5300 1400 50  0001 C CNN
	1    5300 1400
	1    0    0    -1  
$EndComp
NoConn ~ 5600 1100
NoConn ~ 5600 1000
NoConn ~ 1450 1700
Wire Wire Line
	6650 1200 6650 1350
Connection ~ 6650 1200
NoConn ~ 9250 5450
$Comp
L 74xx:74LS04 U79
U 3 1 6BD3A936
P 6950 2250
F 0 "U79" H 6950 2567 50  0000 C CNN
F 1 "74LS04" H 6950 2476 50  0000 C CNN
F 2 "" H 6950 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6950 2250 50  0001 C CNN
	3    6950 2250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U103
U 4 1 6BD3E2BE
P 7800 2150
F 0 "U103" H 8000 2450 50  0000 C CNN
F 1 "74LS00" H 8000 2350 50  0000 C CNN
F 2 "" H 7800 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7800 2150 50  0001 C CNN
	4    7800 2150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U79
U 4 1 6BD40AB0
P 8650 2150
F 0 "U79" H 8650 2467 50  0000 C CNN
F 1 "74LS04" H 8650 2376 50  0000 C CNN
F 2 "" H 8650 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 8650 2150 50  0001 C CNN
	4    8650 2150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U79
U 5 1 6BD41A29
P 9450 1650
F 0 "U79" H 9450 1967 50  0000 C CNN
F 1 "74LS04" H 9450 1876 50  0000 C CNN
F 2 "" H 9450 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9450 1650 50  0001 C CNN
	5    9450 1650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U79
U 6 1 6BD43A1E
P 9450 2150
F 0 "U79" H 9450 2467 50  0000 C CNN
F 1 "74LS04" H 9450 2376 50  0000 C CNN
F 2 "" H 9450 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9450 2150 50  0001 C CNN
	6    9450 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2250 7500 2250
Wire Wire Line
	8100 2150 8350 2150
Wire Wire Line
	8950 2150 9000 2150
Wire Wire Line
	9000 2150 9000 1650
Wire Wire Line
	9000 1650 9150 1650
Connection ~ 9000 2150
Wire Wire Line
	9000 2150 9150 2150
Text HLabel 9750 2150 2    50   Output ~ 0
CR_RST
Text HLabel 9750 1650 2    50   Output ~ 0
AU_RST
Wire Wire Line
	7250 1750 7350 1750
Wire Wire Line
	7350 1750 7350 2050
Wire Wire Line
	7350 2050 7500 2050
Connection ~ 7350 1750
Wire Wire Line
	7350 1750 7500 1750
Text Notes 6250 2250 0    50   ~ 0
GENRST
Wire Wire Line
	3800 1400 3400 1400
Wire Wire Line
	3400 1400 3400 3050
Wire Wire Line
	3400 3050 5950 3050
Wire Wire Line
	5950 3050 5950 2250
Wire Wire Line
	5950 2250 6650 2250
Text Notes 6350 7200 0    100  ~ 0
PROC-PMI: Interface\nCopyright 2021, William Glasford
NoConn ~ 7550 5250
NoConn ~ 7550 5350
NoConn ~ 8400 6650
NoConn ~ 8400 4050
NoConn ~ 8400 3950
NoConn ~ 9250 2750
Text GLabel 9250 4350 2    50   Output ~ 0
BP97
Text GLabel 9250 4450 2    50   Output ~ 0
BP98
Text GLabel 9250 4550 2    50   Output ~ 0
BP99
Text GLabel 9250 4650 2    50   Output ~ 0
BP100
Text GLabel 9250 4750 2    50   Output ~ 0
BP101
Text GLabel 9250 4850 2    50   Output ~ 0
BP102
Text GLabel 9250 4950 2    50   Output ~ 0
BP103
NoConn ~ 9250 5350
NoConn ~ 10100 4050
NoConn ~ 10100 4150
NoConn ~ 4300 1200
NoConn ~ 2900 1350
NoConn ~ 1450 1600
Text HLabel 1450 1500 2    50   Input ~ 0
L2
NoConn ~ 9250 5550
NoConn ~ 9250 5650
NoConn ~ 9250 5750
NoConn ~ 9250 5850
NoConn ~ 9250 5950
NoConn ~ 9250 6050
NoConn ~ 9250 6150
NoConn ~ 9250 6250
NoConn ~ 9250 5050
NoConn ~ 9250 5150
NoConn ~ 9250 5250
Text GLabel 10100 4250 2    50   Output ~ 0
BP136
Text GLabel 10100 4350 2    50   Output ~ 0
BP137
Text GLabel 10100 4450 2    50   Output ~ 0
BP138
Text GLabel 10100 4550 2    50   Output ~ 0
BP139
Text GLabel 10100 4650 2    50   Output ~ 0
BP140
Text GLabel 10100 4750 2    50   Output ~ 0
BP141
Text GLabel 10100 4850 2    50   Output ~ 0
BP142
Text GLabel 10100 4950 2    50   Output ~ 0
BP143
Text GLabel 10100 5050 2    50   Output ~ 0
BP144
Text GLabel 10100 5150 2    50   Output ~ 0
BP145
Text GLabel 10100 5250 2    50   Output ~ 0
BP146
$Comp
L Connector:Conn_01x40_Male J203
U 1 1 61F62936
P 9900 4650
F 0 "J203" H 10008 6731 50  0000 C CNN
F 1 "Conn_01x40_Male" H 10008 6640 50  0000 C CNN
F 2 "" H 9900 4650 50  0001 C CNN
F 3 "~" H 9900 4650 50  0001 C CNN
	1    9900 4650
	1    0    0    -1  
$EndComp
NoConn ~ 10100 6650
NoConn ~ 10100 6550
NoConn ~ 10100 6450
NoConn ~ 10100 6350
NoConn ~ 10100 6250
NoConn ~ 10100 6150
NoConn ~ 10100 6050
NoConn ~ 10100 5950
NoConn ~ 10100 5850
NoConn ~ 10100 5750
NoConn ~ 10100 5650
NoConn ~ 10100 5550
NoConn ~ 10100 5450
NoConn ~ 10100 5350
$Comp
L 74xx:74LS04 U79
U 1 1 635E6D75
P 6950 800
F 0 "U79" H 7000 1050 50  0000 C CNN
F 1 "74LS04" H 7050 950 50  0000 C CNN
F 2 "" H 6950 800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6950 800 50  0001 C CNN
	1    6950 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 1200 6650 1000
Text HLabel 7250 1350 2    50   Output ~ 0
CRA_CLK2
Connection ~ 6650 1350
Wire Wire Line
	6650 1350 6650 1750
$Comp
L 74xx:74LS04 U79
U 2 1 6377E25F
P 7900 1000
F 0 "U79" H 7900 1317 50  0000 C CNN
F 1 "74LS04" H 7900 1226 50  0000 C CNN
F 2 "" H 7900 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7900 1000 50  0001 C CNN
	2    7900 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 1000 6650 1000
Wire Bus Line
	3200 1600 3200 2400
Wire Bus Line
	1850 750  1850 2400
Wire Bus Line
	650  1250 650  2400
Wire Bus Line
	2100 750  2100 2400
Wire Bus Line
	6400 3600 6400 4600
Wire Bus Line
	5300 3550 5300 4600
Wire Bus Line
	1050 3550 1050 7050
Wire Bus Line
	5050 3550 5050 7250
Wire Bus Line
	3400 4100 3400 7250
Wire Bus Line
	2700 3900 2700 7050
Connection ~ 6650 1000
Wire Wire Line
	6650 1000 6650 800 
Text HLabel 8200 1000 2    50   Output ~ 0
AUB_CLK2
$EndSCHEMATC
