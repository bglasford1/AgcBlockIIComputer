EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 9 12
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
L 74xx:74LS74 U38
U 1 1 61C9F145
P 3800 1100
F 0 "U38" H 4000 1450 50  0000 C CNN
F 1 "74LS74" H 4000 1350 50  0000 C CNN
F 2 "" H 3800 1100 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3800 1100 50  0001 C CNN
	1    3800 1100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U38
U 2 1 61C9FA50
P 3800 2300
F 0 "U38" H 4000 2650 50  0000 C CNN
F 1 "74LS74" H 4000 2550 50  0000 C CNN
F 2 "" H 3800 2300 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3800 2300 50  0001 C CNN
	2    3800 2300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U45
U 1 1 61CA1E9C
P 2200 1000
F 0 "U45" H 2200 1317 50  0000 C CNN
F 1 "74LS04" H 2200 1226 50  0000 C CNN
F 2 "" H 2200 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2200 1000 50  0001 C CNN
	1    2200 1000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U45
U 2 1 61CA29DB
P 2200 2200
F 0 "U45" H 2200 2517 50  0000 C CNN
F 1 "74LS04" H 2200 2426 50  0000 C CNN
F 2 "" H 2200 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2200 2200 50  0001 C CNN
	2    2200 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1800 5000 1800
Wire Wire Line
	4300 1900 4350 1900
Wire Wire Line
	4100 1200 4300 1200
Wire Wire Line
	4300 1200 4300 1700
Wire Wire Line
	4300 1700 4350 1700
Wire Wire Line
	4100 1000 4950 1000
Wire Wire Line
	4950 1000 4950 1600
Wire Wire Line
	4950 1600 5000 1600
Wire Wire Line
	3100 1100 3500 1100
Wire Wire Line
	3100 2300 3500 2300
Wire Wire Line
	3500 1000 3300 1000
Wire Wire Line
	3300 1000 3300 1700
Wire Wire Line
	3300 2200 3500 2200
Wire Wire Line
	3300 1700 3000 1700
Wire Bus Line
	2900 1500 2800 1500
Entry Wire Line
	2900 1800 3000 1700
Text HLabel 2800 1500 0    50   Input ~ 0
OW[11..11]
Text Label 3000 1700 0    50   ~ 0
OW11
Text HLabel 900  2250 0    50   Input ~ 0
DSKYRST
Text HLabel 8800 1800 2    50   Output ~ 0
DSPBLANK
Text Notes 6500 7150 0    100  ~ 0
DSKY-DSP-SIGN:  Decode Sign Logic\nCopyright 2021, William Glasford
Text Notes 3550 900  2    80   ~ 0
R1+\nSign
Text Notes 3600 2050 2    80   ~ 0
R1-\nSign
Connection ~ 4300 1200
Connection ~ 3300 1700
Wire Wire Line
	3300 1700 3300 2200
$Comp
L 74xx:74LS74 U39
U 1 1 61D517F9
P 3800 3450
F 0 "U39" H 4000 3800 50  0000 C CNN
F 1 "74LS74" H 4000 3700 50  0000 C CNN
F 2 "" H 3800 3450 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3800 3450 50  0001 C CNN
	1    3800 3450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U39
U 2 1 61D517FF
P 3800 4650
F 0 "U39" H 4000 5000 50  0000 C CNN
F 1 "74LS74" H 4000 4900 50  0000 C CNN
F 2 "" H 3800 4650 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3800 4650 50  0001 C CNN
	2    3800 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 4150 5000 4150
Wire Wire Line
	4300 4250 4350 4250
Wire Wire Line
	4100 3550 4300 3550
Wire Wire Line
	4300 3550 4300 4050
Wire Wire Line
	4300 4050 4350 4050
Wire Wire Line
	4100 3350 4950 3350
Wire Wire Line
	4950 3350 4950 3950
Wire Wire Line
	4950 3950 5000 3950
Wire Wire Line
	4300 3550 6350 3550
Wire Wire Line
	7750 1200 8600 1200
Wire Wire Line
	3100 3450 3500 3450
Wire Wire Line
	3100 4650 3500 4650
Wire Wire Line
	3500 3350 3300 3350
Wire Wire Line
	3300 3350 3300 4050
Wire Wire Line
	3300 4550 3500 4550
Wire Wire Line
	3300 4050 3000 4050
Wire Bus Line
	2900 3850 2800 3850
Wire Bus Line
	8700 1100 8800 1100
Entry Wire Line
	8600 1200 8700 1300
Entry Wire Line
	2900 4150 3000 4050
Text HLabel 8800 1100 2    50   Output ~ 0
ID1[4..4]
Text HLabel 2800 3850 0    50   Input ~ 0
OW[11..11]
Text Label 3000 4050 0    50   ~ 0
OW11
Text Label 8600 1200 2    50   ~ 0
ID14
Text HLabel 8800 2400 2    50   Output ~ 0
DSPMINUS
Text Notes 3550 3250 2    80   ~ 0
R2+\nSign
Text Notes 3600 4450 2    80   ~ 0
R2-\nSign
Connection ~ 4300 3550
Connection ~ 3300 4050
Wire Wire Line
	3300 4050 3300 4550
$Comp
L 74xx:74LS74 U41
U 1 1 61D613A1
P 3800 5850
F 0 "U41" H 4000 6200 50  0000 C CNN
F 1 "74LS74" H 4000 6100 50  0000 C CNN
F 2 "" H 3800 5850 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3800 5850 50  0001 C CNN
	1    3800 5850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U41
U 2 1 61D613A7
P 3800 7050
F 0 "U41" H 4000 7400 50  0000 C CNN
F 1 "74LS74" H 4000 7300 50  0000 C CNN
F 2 "" H 3800 7050 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3800 7050 50  0001 C CNN
	2    3800 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 6550 5000 6550
Wire Wire Line
	4300 6650 4350 6650
Wire Wire Line
	4100 5950 4300 5950
Wire Wire Line
	4300 5950 4300 6450
Wire Wire Line
	4300 6450 4350 6450
Wire Wire Line
	4100 5750 4950 5750
Wire Wire Line
	4950 5750 4950 6350
Wire Wire Line
	4950 6350 5000 6350
Wire Wire Line
	4300 5950 5800 5950
Wire Wire Line
	3100 5850 3500 5850
Wire Wire Line
	3100 7050 3500 7050
Wire Wire Line
	3500 5750 3300 5750
Wire Wire Line
	3300 5750 3300 6450
Wire Wire Line
	3300 6950 3500 6950
Wire Wire Line
	3300 6450 3000 6450
Wire Bus Line
	2900 6250 2800 6250
Entry Wire Line
	2900 6550 3000 6450
Text HLabel 2800 6250 0    50   Input ~ 0
OW[11..11]
Text Label 3000 6450 0    50   ~ 0
OW11
Text Notes 3600 5650 2    80   ~ 0
R3+\nSign
Text Notes 3650 6800 2    80   ~ 0
R3-\nSign
Connection ~ 4300 5950
Connection ~ 3300 6450
Wire Wire Line
	3300 6450 3300 6950
Wire Wire Line
	5800 4650 5800 5950
Wire Wire Line
	6000 7150 6000 4850
Wire Wire Line
	6500 1700 5600 1700
Wire Wire Line
	5900 4750 5900 6450
Wire Wire Line
	5700 4350 5700 4050
$Comp
L 74xx:74LS04 U45
U 3 1 61DD12B5
P 2200 3350
F 0 "U45" H 2200 3667 50  0000 C CNN
F 1 "74LS04" H 2200 3576 50  0000 C CNN
F 2 "" H 2200 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2200 3350 50  0001 C CNN
	3    2200 3350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U45
U 4 1 61DD1E37
P 2200 4550
F 0 "U45" H 2200 4867 50  0000 C CNN
F 1 "74LS04" H 2200 4776 50  0000 C CNN
F 2 "" H 2200 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2200 4550 50  0001 C CNN
	4    2200 4550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U45
U 5 1 61DD276B
P 2200 5750
F 0 "U45" H 2200 6067 50  0000 C CNN
F 1 "74LS04" H 2200 5976 50  0000 C CNN
F 2 "" H 2200 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2200 5750 50  0001 C CNN
	5    2200 5750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U45
U 6 1 61DD30DB
P 2200 6950
F 0 "U45" H 2200 7267 50  0000 C CNN
F 1 "74LS04" H 2200 7176 50  0000 C CNN
F 2 "" H 2200 6950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2200 6950 50  0001 C CNN
	6    2200 6950
	1    0    0    -1  
$EndComp
Wire Bus Line
	1400 900  1500 900 
Text HLabel 1400 900  0    50   Input ~ 0
RWD[1..7]
Wire Wire Line
	1900 1000 1600 1000
Entry Wire Line
	1500 1100 1600 1000
Text Label 1600 1000 0    50   ~ 0
RWD7
Wire Wire Line
	1900 2200 1600 2200
Entry Wire Line
	1500 2300 1600 2200
Text Label 1600 2200 0    50   ~ 0
RWD6
Wire Wire Line
	1900 3350 1600 3350
Entry Wire Line
	1500 3450 1600 3350
Text Label 1600 3350 0    50   ~ 0
RWD5
Wire Wire Line
	1900 4550 1600 4550
Entry Wire Line
	1500 4650 1600 4550
Text Label 1600 4550 0    50   ~ 0
RWD4
Wire Wire Line
	1900 5750 1600 5750
Entry Wire Line
	1500 5850 1600 5750
Text Label 1600 5750 0    50   ~ 0
RWD2
Wire Wire Line
	1900 6950 1600 6950
Entry Wire Line
	1500 7050 1600 6950
Text Label 1600 6950 0    50   ~ 0
RWD1
$Comp
L 74xx:74LS04 U46
U 1 1 61E3EBB4
P 1050 2550
F 0 "U46" V 1000 2200 50  0000 L CNN
F 1 "74LS04" V 1100 2150 50  0000 L CNN
F 2 "" H 1050 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1050 2550 50  0001 C CNN
	1    1050 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 1400 1300 1400
$Comp
L power:+5V #PWR0110
U 1 1 61EED20D
P 3800 800
F 0 "#PWR0110" H 3800 650 50  0001 C CNN
F 1 "+5V" H 3815 973 50  0000 C CNN
F 2 "" H 3800 800 50  0001 C CNN
F 3 "" H 3800 800 50  0001 C CNN
	1    3800 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0117
U 1 1 61EF0C26
P 3800 2000
F 0 "#PWR0117" H 3800 1850 50  0001 C CNN
F 1 "+5V" H 3815 2173 50  0000 C CNN
F 2 "" H 3800 2000 50  0001 C CNN
F 3 "" H 3800 2000 50  0001 C CNN
	1    3800 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0118
U 1 1 61EF4611
P 3800 3150
F 0 "#PWR0118" H 3800 3000 50  0001 C CNN
F 1 "+5V" H 3815 3323 50  0000 C CNN
F 2 "" H 3800 3150 50  0001 C CNN
F 3 "" H 3800 3150 50  0001 C CNN
	1    3800 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0119
U 1 1 61EF7F61
P 3800 4350
F 0 "#PWR0119" H 3800 4200 50  0001 C CNN
F 1 "+5V" H 3815 4523 50  0000 C CNN
F 2 "" H 3800 4350 50  0001 C CNN
F 3 "" H 3800 4350 50  0001 C CNN
	1    3800 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 6150 1300 7450
$Comp
L power:+5V #PWR0120
U 1 1 61EFB8D0
P 3800 5550
F 0 "#PWR0120" H 3800 5400 50  0001 C CNN
F 1 "+5V" H 3815 5723 50  0000 C CNN
F 2 "" H 3800 5550 50  0001 C CNN
F 3 "" H 3800 5550 50  0001 C CNN
	1    3800 5550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0151
U 1 1 61F022ED
P 3800 6750
F 0 "#PWR0151" H 3800 6600 50  0001 C CNN
F 1 "+5V" H 3815 6923 50  0000 C CNN
F 2 "" H 3800 6750 50  0001 C CNN
F 3 "" H 3800 6750 50  0001 C CNN
	1    3800 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 5000 1300 6150
Wire Wire Line
	1300 2650 1300 3750
Wire Wire Line
	1300 1400 1300 2650
Wire Wire Line
	3800 2600 3800 2650
Wire Wire Line
	3800 4950 3800 5000
Wire Wire Line
	3800 7350 3800 7450
Connection ~ 1300 2650
Wire Wire Line
	1300 2650 3800 2650
Connection ~ 1300 5000
Wire Wire Line
	1300 5000 3800 5000
Wire Wire Line
	1300 3750 1300 5000
Connection ~ 1300 6150
Wire Wire Line
	1300 6150 3800 6150
Wire Wire Line
	1300 7450 3800 7450
$Comp
L 74xx:74LS04 U46
U 2 1 61F37E2B
P 1050 3450
F 0 "U46" V 1000 3100 50  0000 L CNN
F 1 "74LS04" V 1100 3050 50  0000 L CNN
F 2 "" H 1050 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1050 3450 50  0001 C CNN
	2    1050 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 2850 1050 3150
Wire Wire Line
	1050 2250 900  2250
Text Notes 550  2100 0    50   ~ 0
Added because\nDSKYRST can’t\ndrive 12 chips.
$Comp
L 74xx:74LS244 U50
U 1 1 61F4E7A9
P 7150 4650
F 0 "U50" H 7350 5450 50  0000 C CNN
F 1 "74LS244" H 7400 5350 50  0000 C CNN
F 2 "" H 7150 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS244" H 7150 4650 50  0001 C CNN
	1    7150 4650
	1    0    0    -1  
$EndComp
NoConn ~ 6650 4150
NoConn ~ 7650 4150
NoConn ~ 6650 4550
NoConn ~ 7650 4550
$Comp
L 74xx:74LS126 U60
U 1 1 61FA14FD
P 6850 1200
F 0 "U60" H 6950 1450 50  0000 C CNN
F 1 "74LS126" H 6950 1350 50  0000 C CNN
F 2 "" H 6850 1200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS126" H 6850 1200 50  0001 C CNN
	1    6850 1200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS126 U60
U 2 1 61FA2BE1
P 6850 1800
F 0 "U60" H 6950 2050 50  0000 C CNN
F 1 "74LS126" H 6950 1950 50  0000 C CNN
F 2 "" H 6850 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS126" H 6850 1800 50  0001 C CNN
	2    6850 1800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS126 U60
U 3 1 61FA3A43
P 6850 2400
F 0 "U60" H 6950 2650 50  0000 C CNN
F 1 "74LS126" H 6950 2550 50  0000 C CNN
F 2 "" H 6850 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS126" H 6850 2400 50  0001 C CNN
	3    6850 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4450 5700 4750
Wire Wire Line
	6350 3550 6350 4250
Wire Wire Line
	6350 4250 6650 4250
$Comp
L power:+5V #PWR0170
U 1 1 61FD2EA2
P 7150 3850
F 0 "#PWR0170" H 7150 3700 50  0001 C CNN
F 1 "+5V" H 7165 4023 50  0000 C CNN
F 2 "" H 7150 3850 50  0001 C CNN
F 3 "" H 7150 3850 50  0001 C CNN
	1    7150 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0178
U 1 1 61FD3D79
P 7150 5450
F 0 "#PWR0178" H 7150 5200 50  0001 C CNN
F 1 "GND" H 7155 5277 50  0000 C CNN
F 2 "" H 7150 5450 50  0001 C CNN
F 3 "" H 7150 5450 50  0001 C CNN
	1    7150 5450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U64
U 1 1 61FE5BEB
P 4650 2850
F 0 "U64" H 4650 3175 50  0000 C CNN
F 1 "74LS00" H 4650 3084 50  0000 C CNN
F 2 "" H 4650 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 4650 2850 50  0001 C CNN
	1    4650 2850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U64
U 2 1 61FEA2F3
P 4650 5200
F 0 "U64" H 4650 5525 50  0000 C CNN
F 1 "74LS00" H 4650 5434 50  0000 C CNN
F 2 "" H 4650 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 4650 5200 50  0001 C CNN
	2    4650 5200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U64
U 3 1 61FEB36F
P 4650 7650
F 0 "U64" H 4650 7975 50  0000 C CNN
F 1 "74LS00" H 4650 7884 50  0000 C CNN
F 2 "" H 4650 7650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 4650 7650 50  0001 C CNN
	3    4650 7650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U46
U 4 1 61FF53D6
P 5250 5200
F 0 "U46" H 5250 5517 50  0000 C CNN
F 1 "74LS04" H 5250 5426 50  0000 C CNN
F 2 "" H 5250 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5250 5200 50  0001 C CNN
	4    5250 5200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U46
U 5 1 61FF6D2B
P 5250 7650
F 0 "U46" H 5250 7967 50  0000 C CNN
F 1 "74LS04" H 5250 7876 50  0000 C CNN
F 2 "" H 5250 7650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5250 7650 50  0001 C CNN
	5    5250 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 7750 1600 7750
Entry Wire Line
	1500 7850 1600 7750
Text Label 1600 7750 0    50   ~ 0
RWD1
Wire Wire Line
	4350 7550 1600 7550
Entry Wire Line
	1500 7650 1600 7550
Text Label 1600 7550 0    50   ~ 0
RWD2
Wire Wire Line
	6100 5150 6100 7650
Wire Wire Line
	5700 5050 5700 5200
Wire Wire Line
	4350 5100 1600 5100
Entry Wire Line
	1500 5200 1600 5100
Text Label 1600 5100 0    50   ~ 0
RWD5
Wire Wire Line
	4350 5300 1600 5300
Entry Wire Line
	1500 5400 1600 5300
Text Label 1600 5300 0    50   ~ 0
RWD4
Wire Wire Line
	4350 2750 1600 2750
Entry Wire Line
	1500 2850 1600 2750
Text Label 1600 2750 0    50   ~ 0
RWD7
Entry Wire Line
	1500 3050 1600 2950
Text Label 1600 2950 0    50   ~ 0
RWD6
Wire Wire Line
	5700 5200 5550 5200
Wire Wire Line
	5700 5050 6650 5050
Wire Wire Line
	5700 4050 5600 4050
Wire Wire Line
	5700 4350 6650 4350
Wire Wire Line
	5700 4450 6650 4450
Wire Wire Line
	5800 4650 6650 4650
Wire Wire Line
	5900 6450 5600 6450
Wire Wire Line
	5900 4750 6650 4750
Wire Wire Line
	6000 4850 6650 4850
Wire Wire Line
	6100 7650 5550 7650
Wire Wire Line
	6100 5150 6650 5150
Wire Wire Line
	4300 1200 6550 1200
Wire Wire Line
	6550 1800 6500 1800
Wire Wire Line
	6500 1800 6500 1700
Wire Wire Line
	4950 2850 6250 2850
Wire Wire Line
	6850 2850 6850 2650
Connection ~ 6850 2650
Wire Wire Line
	6850 2650 6850 2600
Wire Wire Line
	6850 2050 6250 2050
Wire Wire Line
	6250 2050 6250 2850
Connection ~ 6250 2850
Wire Wire Line
	6250 2850 6850 2850
Wire Wire Line
	6850 1450 6250 1450
Wire Wire Line
	6250 1450 6250 2050
Connection ~ 6250 2050
Wire Wire Line
	7650 4650 7750 4650
Wire Wire Line
	7750 4650 7750 4250
Wire Wire Line
	7750 4250 7650 4250
Wire Wire Line
	7750 1200 7150 1200
Connection ~ 7750 4250
Wire Wire Line
	7150 1800 7850 1800
Wire Wire Line
	7150 2400 7950 2400
Connection ~ 7750 1200
Wire Wire Line
	7750 1200 7750 4250
Connection ~ 7850 1800
Connection ~ 7950 2400
Text Notes 9350 1950 0    50   ~ 0
These lines are all \nactive low so they \nneed pull up resistors \nwhen there is no input.
$Comp
L Device:R_US R14
U 1 1 622283B9
P 8100 2250
F 0 "R14" V 7895 2250 50  0000 C CNN
F 1 "100k" V 7986 2250 50  0000 C CNN
F 2 "" V 8140 2240 50  0001 C CNN
F 3 "~" H 8100 2250 50  0001 C CNN
	1    8100 2250
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0179
U 1 1 6222EBED
P 8350 2250
F 0 "#PWR0179" H 8350 2100 50  0001 C CNN
F 1 "+5V" H 8365 2423 50  0000 C CNN
F 2 "" H 8350 2250 50  0001 C CNN
F 3 "" H 8350 2250 50  0001 C CNN
	1    8350 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2250 8350 2250
$Comp
L Device:R_US R12
U 1 1 6224D3C6
P 7900 1050
F 0 "R12" V 7695 1050 50  0000 C CNN
F 1 "100k" V 7786 1050 50  0000 C CNN
F 2 "" V 7940 1040 50  0001 C CNN
F 3 "~" H 7900 1050 50  0001 C CNN
	1    7900 1050
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0196
U 1 1 6224D3CC
P 8150 1050
F 0 "#PWR0196" H 8150 900 50  0001 C CNN
F 1 "+5V" H 8165 1223 50  0000 C CNN
F 2 "" H 8150 1050 50  0001 C CNN
F 3 "" H 8150 1050 50  0001 C CNN
	1    8150 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 1050 8150 1050
Wire Wire Line
	7750 1050 7750 1200
$Comp
L Device:R_US R13
U 1 1 622538AF
P 8000 1600
F 0 "R13" V 7795 1600 50  0000 C CNN
F 1 "100k" V 7886 1600 50  0000 C CNN
F 2 "" V 8040 1590 50  0001 C CNN
F 3 "~" H 8000 1600 50  0001 C CNN
	1    8000 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 1600 8250 1600
Wire Wire Line
	7850 1600 7850 1800
Connection ~ 1300 3750
Wire Wire Line
	1300 3750 1050 3750
Wire Wire Line
	1300 3750 3800 3750
$Comp
L 74xx:74LS08 U7
U 3 1 6232F1AF
P 2800 1100
F 0 "U7" H 2800 1425 50  0000 C CNN
F 1 "74LS08" H 2800 1334 50  0000 C CNN
F 2 "" H 2800 1100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2800 1100 50  0001 C CNN
	3    2800 1100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U44
U 4 1 62334CE4
P 2800 2300
F 0 "U44" H 2800 2625 50  0000 C CNN
F 1 "74LS08" H 2800 2534 50  0000 C CNN
F 2 "" H 2800 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2800 2300 50  0001 C CNN
	4    2800 2300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U65
U 1 1 62368170
P 2800 3450
F 0 "U65" H 2800 3775 50  0000 C CNN
F 1 "74LS08" H 2800 3684 50  0000 C CNN
F 2 "" H 2800 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2800 3450 50  0001 C CNN
	1    2800 3450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U65
U 2 1 62368F16
P 2800 4650
F 0 "U65" H 2800 4975 50  0000 C CNN
F 1 "74LS08" H 2800 4884 50  0000 C CNN
F 2 "" H 2800 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2800 4650 50  0001 C CNN
	2    2800 4650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U65
U 3 1 62369D3E
P 2800 5850
F 0 "U65" H 2800 6175 50  0000 C CNN
F 1 "74LS08" H 2800 6084 50  0000 C CNN
F 2 "" H 2800 5850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2800 5850 50  0001 C CNN
	3    2800 5850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U65
U 4 1 6236DE64
P 2800 7050
F 0 "U65" H 2800 7375 50  0000 C CNN
F 1 "74LS08" H 2800 7284 50  0000 C CNN
F 2 "" H 2800 7050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2800 7050 50  0001 C CNN
	4    2800 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2950 1600 2950
Text HLabel 2500 1200 0    50   Input ~ 0
SGN_CLK2
Text HLabel 2500 2400 0    50   Input ~ 0
SGN_CLK2
Text HLabel 2500 3550 0    50   Input ~ 0
SGN_CLK2
Text HLabel 2500 4750 0    50   Input ~ 0
SGN_CLK2
Text HLabel 2500 5950 0    50   Input ~ 0
SGN_CLK2
Text HLabel 2500 7150 0    50   Input ~ 0
SGN_CLK2
Wire Wire Line
	7850 1800 8800 1800
$Comp
L power:+5V #PWR0198
U 1 1 624AABD3
P 8250 1600
F 0 "#PWR0198" H 8250 1450 50  0001 C CNN
F 1 "+5V" H 8265 1773 50  0000 C CNN
F 2 "" H 8250 1600 50  0001 C CNN
F 3 "" H 8250 1600 50  0001 C CNN
	1    8250 1600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U17
U 1 1 624C129D
P 5300 1700
F 0 "U17" H 5300 2025 50  0000 C CNN
F 1 "74LS02" H 5300 1934 50  0000 C CNN
F 2 "" H 5300 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 5300 1700 50  0001 C CNN
	1    5300 1700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U17
U 3 1 624C69AD
P 5300 6450
F 0 "U17" H 5300 6775 50  0000 C CNN
F 1 "74LS02" H 5300 6684 50  0000 C CNN
F 2 "" H 5300 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 5300 6450 50  0001 C CNN
	3    5300 6450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U17
U 2 1 624C978D
P 5300 4050
F 0 "U17" H 5300 4375 50  0000 C CNN
F 1 "74LS02" H 5300 4284 50  0000 C CNN
F 2 "" H 5300 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 5300 4050 50  0001 C CNN
	2    5300 4050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U66
U 1 1 624D2A39
P 4650 1800
F 0 "U66" H 4650 2125 50  0000 C CNN
F 1 "74LS86" H 4650 2034 50  0000 C CNN
F 2 "" H 4650 1800 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 4650 1800 50  0001 C CNN
	1    4650 1800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U66
U 2 1 624D43EF
P 4650 4150
F 0 "U66" H 4650 4475 50  0000 C CNN
F 1 "74LS86" H 4650 4384 50  0000 C CNN
F 2 "" H 4650 4150 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 4650 4150 50  0001 C CNN
	2    4650 4150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U66
U 3 1 624D610B
P 4650 6550
F 0 "U66" H 4650 6875 50  0000 C CNN
F 1 "74LS86" H 4650 6784 50  0000 C CNN
F 2 "" H 4650 6550 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 4650 6550 50  0001 C CNN
	3    4650 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4750 5700 4750
Wire Wire Line
	4100 2400 6550 2400
Wire Wire Line
	4100 7150 6000 7150
Wire Wire Line
	4100 6950 4300 6950
Wire Wire Line
	4300 6950 4300 6650
Wire Wire Line
	4100 4550 4300 4550
Wire Wire Line
	4300 4550 4300 4250
Wire Wire Line
	4100 2200 4300 2200
Wire Wire Line
	4300 2200 4300 1900
Wire Wire Line
	7950 2250 7950 2400
Wire Wire Line
	7950 2400 8800 2400
Wire Wire Line
	7850 4350 7650 4350
Wire Wire Line
	7850 1800 7850 4350
Wire Wire Line
	7650 4750 7850 4750
Wire Wire Line
	7650 4850 7950 4850
Wire Wire Line
	7950 4450 7650 4450
Connection ~ 7850 4350
Wire Wire Line
	7850 4750 7850 4350
Wire Wire Line
	7950 4850 7950 4450
Connection ~ 7950 4450
Wire Wire Line
	7950 2400 7950 4450
Wire Wire Line
	2500 6950 2500 6600
Wire Wire Line
	2500 6600 2550 6600
Connection ~ 2500 6950
Wire Wire Line
	2500 5750 2500 5400
Wire Wire Line
	2500 5400 2550 5400
Connection ~ 2500 5750
Wire Wire Line
	2500 4550 2500 4200
Wire Wire Line
	2500 4200 2550 4200
Connection ~ 2500 4550
Wire Wire Line
	2500 3350 2500 3050
Wire Wire Line
	2500 3050 2550 3050
Connection ~ 2500 3350
Text HLabel 2550 3050 2    50   Output ~ 0
NRWD5
Text HLabel 2550 4200 2    50   Output ~ 0
NRWD4
Text HLabel 2550 5400 2    50   Output ~ 0
NRWD2
Text HLabel 2550 6600 2    50   Output ~ 0
NRWD1
Wire Bus Line
	2900 6250 2900 6600
Wire Bus Line
	2900 3850 2900 4200
Wire Bus Line
	8700 1100 8700 1350
Wire Bus Line
	2900 1500 2900 1850
Wire Bus Line
	1500 900  1500 7900
$EndSCHEMATC
