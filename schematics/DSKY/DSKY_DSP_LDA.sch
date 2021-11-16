EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 8500 11000 portrait
encoding utf-8
Sheet 14 15
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
L 74xx:74LS47 U66
U 1 1 65D8180A
P 2500 6850
F 0 "U66" H 2650 7400 50  0000 C CNN
F 1 "74LS47" H 2700 7300 50  0000 C CNN
F 2 "" H 2500 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS47" H 2500 6850 50  0001 C CNN
	1    2500 6850
	1    0    0    -1  
$EndComp
Text Notes 4100 9700 0    100  ~ 0
DSKY-DSP-LDA:  LCD Drivers Bank A\nCopyright 2021, William Glasford
NoConn ~ 2000 7150
$Comp
L power:+5V #PWR0224
U 1 1 67EF228F
P 2500 6250
F 0 "#PWR0224" H 2500 6100 50  0001 C CNN
F 1 "+5V" H 2515 6423 50  0000 C CNN
F 2 "" H 2500 6250 50  0001 C CNN
F 3 "" H 2500 6250 50  0001 C CNN
	1    2500 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0225
U 1 1 67EF35B7
P 2500 7550
F 0 "#PWR0225" H 2500 7300 50  0001 C CNN
F 1 "GND" H 2505 7377 50  0000 C CNN
F 2 "" H 2500 7550 50  0001 C CNN
F 3 "" H 2500 7550 50  0001 C CNN
	1    2500 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 7250 1850 7250
Wire Wire Line
	1850 7250 1850 7050
Wire Wire Line
	1850 7050 2000 7050
Wire Wire Line
	1850 7250 1750 7250
Wire Wire Line
	1750 7250 1750 7200
Connection ~ 1850 7250
$Comp
L power:+5V #PWR0226
U 1 1 67EF57A0
P 1750 7200
F 0 "#PWR0226" H 1750 7050 50  0001 C CNN
F 1 "+5V" H 1765 7373 50  0000 C CNN
F 2 "" H 1750 7200 50  0001 C CNN
F 3 "" H 1750 7200 50  0001 C CNN
	1    1750 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 6550 1600 6550
Wire Wire Line
	2000 6650 1600 6650
Wire Wire Line
	2000 6750 1600 6750
Wire Wire Line
	2000 6850 1600 6850
Entry Wire Line
	1500 6650 1600 6550
Entry Wire Line
	1500 6750 1600 6650
Entry Wire Line
	1500 6850 1600 6750
Entry Wire Line
	1500 6950 1600 6850
Wire Bus Line
	1500 6400 1450 6400
Text HLabel 1450 6400 0    50   Input ~ 0
OUTA[5..8]
Text Label 1600 6550 0    50   ~ 0
OUTA5
Text Label 1600 6650 0    50   ~ 0
OUTA6
Text Label 1600 6750 0    50   ~ 0
OUTA7
Text Label 1600 6850 0    50   ~ 0
OUTA8
$Comp
L Device:R_US R104
U 1 1 680A4C13
P 6050 4100
F 0 "R104" V 5845 4100 50  0000 C CNN
F 1 "47" V 5936 4100 50  0000 C CNN
F 2 "" V 6090 4090 50  0001 C CNN
F 3 "~" H 6050 4100 50  0001 C CNN
	1    6050 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R103
U 1 1 680A4507
P 6050 3650
F 0 "R103" V 5845 3650 50  0000 C CNN
F 1 "47" V 5936 3650 50  0000 C CNN
F 2 "" V 6090 3640 50  0001 C CNN
F 3 "~" H 6050 3650 50  0001 C CNN
	1    6050 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R102
U 1 1 680A4022
P 6050 3200
F 0 "R102" V 5845 3200 50  0000 C CNN
F 1 "47" V 5936 3200 50  0000 C CNN
F 2 "" V 6090 3190 50  0001 C CNN
F 3 "~" H 6050 3200 50  0001 C CNN
	1    6050 3200
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R101
U 1 1 680A38BF
P 6050 2750
F 0 "R101" V 5845 2750 50  0000 C CNN
F 1 "47" V 5936 2750 50  0000 C CNN
F 2 "" V 6090 2740 50  0001 C CNN
F 3 "~" H 6050 2750 50  0001 C CNN
	1    6050 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R100
U 1 1 680A3196
P 6050 2300
F 0 "R100" V 5845 2300 50  0000 C CNN
F 1 "47" V 5936 2300 50  0000 C CNN
F 2 "" V 6090 2290 50  0001 C CNN
F 3 "~" H 6050 2300 50  0001 C CNN
	1    6050 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R99
U 1 1 680A2C5A
P 6050 1850
F 0 "R99" V 5845 1850 50  0000 C CNN
F 1 "47" V 5936 1850 50  0000 C CNN
F 2 "" V 6090 1840 50  0001 C CNN
F 3 "~" H 6050 1850 50  0001 C CNN
	1    6050 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R98
U 1 1 6809E397
P 6050 1400
F 0 "R98" V 5845 1400 50  0000 C CNN
F 1 "47" V 5936 1400 50  0000 C CNN
F 2 "" V 6090 1390 50  0001 C CNN
F 3 "~" H 6050 1400 50  0001 C CNN
	1    6050 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 2250 5800 2700
Connection ~ 5800 2250
Wire Wire Line
	5800 2700 5800 3150
Connection ~ 5800 2700
Wire Wire Line
	5800 3150 5800 3600
Connection ~ 5800 3150
Wire Wire Line
	5800 4050 5800 4500
Connection ~ 5800 4050
Connection ~ 5800 4500
Wire Wire Line
	5800 3600 5800 4050
Connection ~ 5800 3600
Wire Wire Line
	5500 4500 5800 4500
Wire Wire Line
	5800 1800 5800 2250
Wire Wire Line
	3400 3400 3700 3400
Connection ~ 3400 3400
Wire Wire Line
	3200 3400 3400 3400
Wire Wire Line
	4850 3400 5200 3400
Connection ~ 4850 3400
Wire Wire Line
	4300 3400 4850 3400
Wire Wire Line
	4950 3850 5200 3850
Connection ~ 4950 3850
Wire Wire Line
	4300 3850 4950 3850
Wire Wire Line
	3500 3850 3700 3850
Connection ~ 3500 3850
Wire Wire Line
	3100 3850 3500 3850
Wire Wire Line
	3600 4300 3700 4300
Connection ~ 3600 4300
Wire Wire Line
	3000 4300 3600 4300
Wire Wire Line
	5050 4300 5200 4300
Connection ~ 5050 4300
Wire Wire Line
	4300 4300 5050 4300
Wire Wire Line
	5500 4100 5900 4100
Wire Wire Line
	5500 4050 5800 4050
Wire Wire Line
	5500 3600 5800 3600
Wire Wire Line
	5500 3200 5900 3200
Wire Wire Line
	5500 3150 5800 3150
Wire Wire Line
	5200 2050 5200 2150
$Comp
L Device:Q_NPN_EBC Q40
U 1 1 67F83D5F
P 5400 2950
F 0 "Q40" H 5591 2996 50  0000 L CNN
F 1 "NPN" H 5591 2905 50  0000 L CNN
F 2 "" H 5600 3050 50  0001 C CNN
F 3 "~" H 5400 2950 50  0001 C CNN
	1    5400 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2750 5900 2750
Wire Wire Line
	5500 2700 5800 2700
Wire Wire Line
	5200 2550 5200 2500
Wire Wire Line
	5500 2250 5800 2250
Wire Wire Line
	5500 1800 5800 1800
Wire Wire Line
	4550 2150 5200 2150
Wire Wire Line
	5500 2300 5900 2300
Wire Wire Line
	5200 1750 5200 1600
$Comp
L power:GND #PWR0227
U 1 1 67F9C1E5
P 5800 4500
F 0 "#PWR0227" H 5800 4250 50  0001 C CNN
F 1 "GND" H 5805 4327 50  0000 C CNN
F 2 "" H 5800 4500 50  0001 C CNN
F 3 "" H 5800 4500 50  0001 C CNN
	1    5800 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 1400 5900 1400
Wire Wire Line
	5500 3650 5900 3650
Wire Wire Line
	5500 1850 5900 1850
$Comp
L Device:Q_NPN_EBC Q38
U 1 1 67F811C8
P 5400 2050
F 0 "Q38" H 5591 2096 50  0000 L CNN
F 1 "NPN" H 5591 2005 50  0000 L CNN
F 2 "" H 5600 2150 50  0001 C CNN
F 3 "~" H 5400 2050 50  0001 C CNN
	1    5400 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_EBC Q39
U 1 1 67F82227
P 5400 2500
F 0 "Q39" H 5591 2546 50  0000 L CNN
F 1 "NPN" H 5591 2455 50  0000 L CNN
F 2 "" H 5600 2600 50  0001 C CNN
F 3 "~" H 5400 2500 50  0001 C CNN
	1    5400 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_EBC Q42
U 1 1 67F83824
P 5400 3850
F 0 "Q42" H 5591 3896 50  0000 L CNN
F 1 "NPN" H 5591 3805 50  0000 L CNN
F 2 "" H 5600 3950 50  0001 C CNN
F 3 "~" H 5400 3850 50  0001 C CNN
	1    5400 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_EBC Q43
U 1 1 67F82E4F
P 5400 4300
F 0 "Q43" H 5591 4346 50  0000 L CNN
F 1 "NPN" H 5591 4255 50  0000 L CNN
F 2 "" H 5600 4400 50  0001 C CNN
F 3 "~" H 5400 4300 50  0001 C CNN
	1    5400 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_EBC Q41
U 1 1 67F828F5
P 5400 3400
F 0 "Q41" H 5591 3446 50  0000 L CNN
F 1 "NPN" H 5591 3355 50  0000 L CNN
F 2 "" H 5600 3500 50  0001 C CNN
F 3 "~" H 5400 3400 50  0001 C CNN
	1    5400 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 1600 5050 4300
Wire Wire Line
	4950 1600 4950 3850
Wire Wire Line
	4850 1600 4850 3400
Wire Wire Line
	4750 2950 5200 2950
Connection ~ 4750 2950
Wire Wire Line
	4750 1600 4750 2950
Wire Wire Line
	4650 2550 5200 2550
Connection ~ 4650 2550
Wire Wire Line
	4650 1600 4650 2550
Connection ~ 4550 2150
Wire Wire Line
	4550 1600 4550 2150
Wire Wire Line
	4300 2950 4750 2950
Wire Wire Line
	4300 2550 4650 2550
Wire Wire Line
	4300 2150 4550 2150
Wire Wire Line
	4450 1750 5200 1750
Connection ~ 4450 1750
Wire Wire Line
	4450 1600 4450 1750
Wire Wire Line
	4300 1750 4450 1750
$Comp
L Device:Q_NPN_EBC Q37
U 1 1 67F6376E
P 5400 1600
F 0 "Q37" H 5591 1646 50  0000 L CNN
F 1 "NPN" H 5591 1555 50  0000 L CNN
F 2 "" H 5600 1700 50  0001 C CNN
F 3 "~" H 5400 1600 50  0001 C CNN
	1    5400 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0228
U 1 1 67F603D0
P 4450 1200
F 0 "#PWR0228" H 4450 1050 50  0001 C CNN
F 1 "+5V" H 4465 1373 50  0000 C CNN
F 2 "" H 4450 1200 50  0001 C CNN
F 3 "" H 4450 1200 50  0001 C CNN
	1    4450 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network07_US RN2
U 1 1 67F5F171
P 4750 1400
F 0 "RN2" H 5138 1446 50  0000 L CNN
F 1 "1K" H 5138 1355 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP8" V 5225 1400 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4750 1400 50  0001 C CNN
	1    4750 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network07_US RN1
U 1 1 67F4A711
P 3300 1400
F 0 "RN1" H 3688 1446 50  0000 L CNN
F 1 "1K" H 3688 1355 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP8" V 3775 1400 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3300 1400 50  0001 C CNN
	1    3300 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1600 3600 4300
Wire Wire Line
	3500 1600 3500 3850
$Comp
L power:+5V #PWR0229
U 1 1 67F43CBC
P 3000 1200
F 0 "#PWR0229" H 3000 1050 50  0001 C CNN
F 1 "+5V" H 3015 1373 50  0000 C CNN
F 2 "" H 3000 1200 50  0001 C CNN
F 3 "" H 3000 1200 50  0001 C CNN
	1    3000 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1750 3700 1750
Wire Wire Line
	3100 2150 3700 2150
Wire Wire Line
	3200 2550 3700 2550
Wire Wire Line
	3400 1600 3400 3400
Wire Wire Line
	3300 2950 3700 2950
Connection ~ 3300 2950
Wire Wire Line
	3300 1600 3300 2950
Connection ~ 3200 2550
Wire Wire Line
	3200 1600 3200 2550
Connection ~ 3100 2150
Wire Wire Line
	3100 1600 3100 2150
Connection ~ 3000 1750
Wire Wire Line
	3000 1750 3000 1600
Wire Wire Line
	3200 3050 3200 3400
Wire Wire Line
	3000 3050 3200 3050
Wire Wire Line
	3100 3150 3100 3850
Wire Wire Line
	3000 3150 3100 3150
Wire Wire Line
	3000 3250 3000 4300
Wire Wire Line
	3200 2850 3200 2550
Wire Wire Line
	3000 2850 3200 2850
Wire Wire Line
	3100 2750 3100 2150
Wire Wire Line
	3000 2750 3100 2750
Wire Wire Line
	3000 2650 3000 1750
Wire Wire Line
	3000 2950 3300 2950
$Comp
L 74xx:74LS04 U73
U 1 1 67F02D06
P 4000 4300
F 0 "U73" H 4100 4550 50  0000 C CNN
F 1 "74LS04" H 4100 4450 50  0000 C CNN
F 2 "" H 4000 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 4300 50  0001 C CNN
	1    4000 4300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U69
U 6 1 67F01FCB
P 4000 3850
F 0 "U69" H 4100 4100 50  0000 C CNN
F 1 "74LS04" H 4100 4000 50  0000 C CNN
F 2 "" H 4000 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 3850 50  0001 C CNN
	6    4000 3850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U69
U 5 1 67F01966
P 4000 3400
F 0 "U69" H 4100 3650 50  0000 C CNN
F 1 "74LS04" H 4100 3550 50  0000 C CNN
F 2 "" H 4000 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 3400 50  0001 C CNN
	5    4000 3400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U69
U 4 1 67F00EAB
P 4000 2950
F 0 "U69" H 4100 3200 50  0000 C CNN
F 1 "74LS04" H 4100 3100 50  0000 C CNN
F 2 "" H 4000 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 2950 50  0001 C CNN
	4    4000 2950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U69
U 3 1 67F00675
P 4000 2550
F 0 "U69" H 4050 2800 50  0000 C CNN
F 1 "74LS04" H 4100 2700 50  0000 C CNN
F 2 "" H 4000 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 2550 50  0001 C CNN
	3    4000 2550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U69
U 2 1 67F0038F
P 4000 2150
F 0 "U69" H 4100 2400 50  0000 C CNN
F 1 "74LS04" H 4100 2300 50  0000 C CNN
F 2 "" H 4000 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 2150 50  0001 C CNN
	2    4000 2150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U69
U 1 1 67EFF26C
P 4000 1750
F 0 "U69" H 4100 2000 50  0000 C CNN
F 1 "74LS04" H 4100 1900 50  0000 C CNN
F 2 "" H 4000 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 1750 50  0001 C CNN
	1    4000 1750
	1    0    0    -1  
$EndComp
Text Label 1600 2950 0    50   ~ 0
OUTA4
Text Label 1600 2850 0    50   ~ 0
OUTA3
Text Label 1600 2750 0    50   ~ 0
OUTA2
Text Label 1600 2650 0    50   ~ 0
OUTA1
Entry Wire Line
	1500 3050 1600 2950
Entry Wire Line
	1500 2950 1600 2850
Entry Wire Line
	1500 2850 1600 2750
Entry Wire Line
	1500 2750 1600 2650
Wire Wire Line
	2000 2950 1600 2950
Wire Wire Line
	2000 2850 1600 2850
Wire Wire Line
	2000 2750 1600 2750
Wire Wire Line
	2000 2650 1600 2650
$Comp
L power:+5V #PWR0230
U 1 1 67EF4291
P 1750 3300
F 0 "#PWR0230" H 1750 3150 50  0001 C CNN
F 1 "+5V" H 1765 3473 50  0000 C CNN
F 2 "" H 1750 3300 50  0001 C CNN
F 3 "" H 1750 3300 50  0001 C CNN
	1    1750 3300
	1    0    0    -1  
$EndComp
Connection ~ 1850 3350
Wire Wire Line
	1750 3350 1750 3300
Wire Wire Line
	1850 3350 1750 3350
Wire Wire Line
	1850 3150 2000 3150
Wire Wire Line
	1850 3350 1850 3150
Wire Wire Line
	2000 3350 1850 3350
$Comp
L power:GND #PWR0231
U 1 1 67EF2FD1
P 2500 3650
F 0 "#PWR0231" H 2500 3400 50  0001 C CNN
F 1 "GND" H 2505 3477 50  0000 C CNN
F 2 "" H 2500 3650 50  0001 C CNN
F 3 "" H 2500 3650 50  0001 C CNN
	1    2500 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0232
U 1 1 67EF1CE0
P 2500 2350
F 0 "#PWR0232" H 2500 2200 50  0001 C CNN
F 1 "+5V" H 2515 2523 50  0000 C CNN
F 2 "" H 2500 2350 50  0001 C CNN
F 3 "" H 2500 2350 50  0001 C CNN
	1    2500 2350
	1    0    0    -1  
$EndComp
NoConn ~ 2000 3250
$Comp
L 74xx:74LS47 U65
U 1 1 65D8112F
P 2500 2950
F 0 "U65" H 2650 3500 50  0000 C CNN
F 1 "74LS47" H 2700 3400 50  0000 C CNN
F 2 "" H 2500 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS47" H 2500 2950 50  0001 C CNN
	1    2500 2950
	1    0    0    -1  
$EndComp
Wire Bus Line
	1500 2500 1450 2500
Text HLabel 1450 2500 0    50   Input ~ 0
OUTA[1..4]
Wire Wire Line
	6200 1400 6450 1400
Wire Wire Line
	6200 1850 6450 1850
Wire Wire Line
	6200 2300 6450 2300
Wire Wire Line
	6200 2750 6450 2750
Wire Wire Line
	6200 3200 6450 3200
Wire Wire Line
	6200 3650 6450 3650
Wire Wire Line
	6200 4100 6450 4100
Entry Wire Line
	6450 1400 6550 1500
Entry Wire Line
	6450 1850 6550 1950
Entry Wire Line
	6450 2300 6550 2400
Entry Wire Line
	6450 2750 6550 2850
Entry Wire Line
	6450 3200 6550 3300
Entry Wire Line
	6450 3650 6550 3750
Entry Wire Line
	6450 4100 6550 4200
Wire Bus Line
	6550 1250 6650 1250
Text HLabel 6650 1250 2    50   Input ~ 0
BAL[1..7]
Text Label 6450 1400 2    50   ~ 0
BAL1
Text Label 6450 1850 2    50   ~ 0
BAL2
Text Label 6450 2300 2    50   ~ 0
BAL3
Text Label 6450 2750 2    50   ~ 0
BAL4
Text Label 6450 3200 2    50   ~ 0
BAL5
Text Label 6450 3650 2    50   ~ 0
BAL6
Text Label 6450 4100 2    50   ~ 0
BAL7
$Comp
L Device:R_US R130
U 1 1 68156B1F
P 6050 8000
F 0 "R130" V 5845 8000 50  0000 C CNN
F 1 "47" V 5936 8000 50  0000 C CNN
F 2 "" V 6090 7990 50  0001 C CNN
F 3 "~" H 6050 8000 50  0001 C CNN
	1    6050 8000
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R110
U 1 1 68156B25
P 6050 7550
F 0 "R110" V 5845 7550 50  0000 C CNN
F 1 "47" V 5936 7550 50  0000 C CNN
F 2 "" V 6090 7540 50  0001 C CNN
F 3 "~" H 6050 7550 50  0001 C CNN
	1    6050 7550
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R109
U 1 1 68156B2B
P 6050 7100
F 0 "R109" V 5845 7100 50  0000 C CNN
F 1 "47" V 5936 7100 50  0000 C CNN
F 2 "" V 6090 7090 50  0001 C CNN
F 3 "~" H 6050 7100 50  0001 C CNN
	1    6050 7100
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R108
U 1 1 68156B31
P 6050 6650
F 0 "R108" V 5845 6650 50  0000 C CNN
F 1 "47" V 5936 6650 50  0000 C CNN
F 2 "" V 6090 6640 50  0001 C CNN
F 3 "~" H 6050 6650 50  0001 C CNN
	1    6050 6650
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R107
U 1 1 68156B37
P 6050 6200
F 0 "R107" V 5845 6200 50  0000 C CNN
F 1 "47" V 5936 6200 50  0000 C CNN
F 2 "" V 6090 6190 50  0001 C CNN
F 3 "~" H 6050 6200 50  0001 C CNN
	1    6050 6200
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R106
U 1 1 68156B3D
P 6050 5750
F 0 "R106" V 5845 5750 50  0000 C CNN
F 1 "47" V 5936 5750 50  0000 C CNN
F 2 "" V 6090 5740 50  0001 C CNN
F 3 "~" H 6050 5750 50  0001 C CNN
	1    6050 5750
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R105
U 1 1 68156B43
P 6050 5300
F 0 "R105" V 5845 5300 50  0000 C CNN
F 1 "47" V 5936 5300 50  0000 C CNN
F 2 "" V 6090 5290 50  0001 C CNN
F 3 "~" H 6050 5300 50  0001 C CNN
	1    6050 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 6150 5800 6600
Connection ~ 5800 6150
Wire Wire Line
	5800 6600 5800 7050
Connection ~ 5800 6600
Wire Wire Line
	5800 7050 5800 7500
Connection ~ 5800 7050
Wire Wire Line
	5800 7950 5800 8400
Connection ~ 5800 7950
Connection ~ 5800 8400
Wire Wire Line
	5800 7500 5800 7950
Connection ~ 5800 7500
Wire Wire Line
	5500 8400 5800 8400
Wire Wire Line
	5800 5700 5800 6150
Wire Wire Line
	3400 7300 3700 7300
Connection ~ 3400 7300
Wire Wire Line
	3200 7300 3400 7300
Wire Wire Line
	4850 7300 5200 7300
Connection ~ 4850 7300
Wire Wire Line
	4300 7300 4850 7300
Wire Wire Line
	4950 7750 5200 7750
Connection ~ 4950 7750
Wire Wire Line
	4300 7750 4950 7750
Wire Wire Line
	3500 7750 3700 7750
Connection ~ 3500 7750
Wire Wire Line
	3100 7750 3500 7750
Wire Wire Line
	3600 8200 3700 8200
Connection ~ 3600 8200
Wire Wire Line
	3000 8200 3600 8200
Wire Wire Line
	5050 8200 5200 8200
Connection ~ 5050 8200
Wire Wire Line
	4300 8200 5050 8200
Wire Wire Line
	5500 8000 5900 8000
Wire Wire Line
	5500 7950 5800 7950
Wire Wire Line
	5500 7500 5800 7500
Wire Wire Line
	5500 7100 5900 7100
Wire Wire Line
	5500 7050 5800 7050
Wire Wire Line
	5200 5950 5200 6050
$Comp
L Device:Q_NPN_EBC Q47
U 1 1 68156B6E
P 5400 6850
F 0 "Q47" H 5591 6896 50  0000 L CNN
F 1 "NPN" H 5591 6805 50  0000 L CNN
F 2 "" H 5600 6950 50  0001 C CNN
F 3 "~" H 5400 6850 50  0001 C CNN
	1    5400 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 6650 5900 6650
Wire Wire Line
	5500 6600 5800 6600
Wire Wire Line
	5200 6450 5200 6400
Wire Wire Line
	5500 6150 5800 6150
Wire Wire Line
	5500 5700 5800 5700
Wire Wire Line
	4550 6050 5200 6050
Wire Wire Line
	5500 6200 5900 6200
Wire Wire Line
	5200 5650 5200 5500
$Comp
L power:GND #PWR0233
U 1 1 68156B7C
P 5800 8400
F 0 "#PWR0233" H 5800 8150 50  0001 C CNN
F 1 "GND" H 5805 8227 50  0000 C CNN
F 2 "" H 5800 8400 50  0001 C CNN
F 3 "" H 5800 8400 50  0001 C CNN
	1    5800 8400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5300 5900 5300
Wire Wire Line
	5500 7550 5900 7550
Wire Wire Line
	5500 5750 5900 5750
$Comp
L Device:Q_NPN_EBC Q45
U 1 1 68156B85
P 5400 5950
F 0 "Q45" H 5591 5996 50  0000 L CNN
F 1 "NPN" H 5591 5905 50  0000 L CNN
F 2 "" H 5600 6050 50  0001 C CNN
F 3 "~" H 5400 5950 50  0001 C CNN
	1    5400 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_EBC Q46
U 1 1 68156B8B
P 5400 6400
F 0 "Q46" H 5591 6446 50  0000 L CNN
F 1 "NPN" H 5591 6355 50  0000 L CNN
F 2 "" H 5600 6500 50  0001 C CNN
F 3 "~" H 5400 6400 50  0001 C CNN
	1    5400 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_EBC Q49
U 1 1 68156B91
P 5400 7750
F 0 "Q49" H 5591 7796 50  0000 L CNN
F 1 "NPN" H 5591 7705 50  0000 L CNN
F 2 "" H 5600 7850 50  0001 C CNN
F 3 "~" H 5400 7750 50  0001 C CNN
	1    5400 7750
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_EBC Q50
U 1 1 68156B97
P 5400 8200
F 0 "Q50" H 5591 8246 50  0000 L CNN
F 1 "NPN" H 5591 8155 50  0000 L CNN
F 2 "" H 5600 8300 50  0001 C CNN
F 3 "~" H 5400 8200 50  0001 C CNN
	1    5400 8200
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_EBC Q48
U 1 1 68156B9D
P 5400 7300
F 0 "Q48" H 5591 7346 50  0000 L CNN
F 1 "NPN" H 5591 7255 50  0000 L CNN
F 2 "" H 5600 7400 50  0001 C CNN
F 3 "~" H 5400 7300 50  0001 C CNN
	1    5400 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5500 5050 8200
Wire Wire Line
	4950 5500 4950 7750
Wire Wire Line
	4850 5500 4850 7300
Wire Wire Line
	4750 6850 5200 6850
Connection ~ 4750 6850
Wire Wire Line
	4750 5500 4750 6850
Wire Wire Line
	4650 6450 5200 6450
Connection ~ 4650 6450
Wire Wire Line
	4650 5500 4650 6450
Connection ~ 4550 6050
Wire Wire Line
	4550 5500 4550 6050
Wire Wire Line
	4300 6850 4750 6850
Wire Wire Line
	4300 6450 4650 6450
Wire Wire Line
	4300 6050 4550 6050
Wire Wire Line
	4450 5650 5200 5650
Connection ~ 4450 5650
Wire Wire Line
	4450 5500 4450 5650
Wire Wire Line
	4300 5650 4450 5650
$Comp
L Device:Q_NPN_EBC Q44
U 1 1 68156BB5
P 5400 5500
F 0 "Q44" H 5591 5546 50  0000 L CNN
F 1 "NPN" H 5591 5455 50  0000 L CNN
F 2 "" H 5600 5600 50  0001 C CNN
F 3 "~" H 5400 5500 50  0001 C CNN
	1    5400 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0234
U 1 1 68156BBB
P 4450 5100
F 0 "#PWR0234" H 4450 4950 50  0001 C CNN
F 1 "+5V" H 4465 5273 50  0000 C CNN
F 2 "" H 4450 5100 50  0001 C CNN
F 3 "" H 4450 5100 50  0001 C CNN
	1    4450 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network07_US RN4
U 1 1 68156BC1
P 4750 5300
F 0 "RN4" H 5138 5346 50  0000 L CNN
F 1 "1K" H 5138 5255 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP8" V 5225 5300 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4750 5300 50  0001 C CNN
	1    4750 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network07_US RN3
U 1 1 68156BC7
P 3300 5300
F 0 "RN3" H 3688 5346 50  0000 L CNN
F 1 "1K" H 3688 5255 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP8" V 3775 5300 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3300 5300 50  0001 C CNN
	1    3300 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 5500 3600 8200
Wire Wire Line
	3500 5500 3500 7750
$Comp
L power:+5V #PWR0235
U 1 1 68156BCF
P 3000 5100
F 0 "#PWR0235" H 3000 4950 50  0001 C CNN
F 1 "+5V" H 3015 5273 50  0000 C CNN
F 2 "" H 3000 5100 50  0001 C CNN
F 3 "" H 3000 5100 50  0001 C CNN
	1    3000 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5650 3700 5650
Wire Wire Line
	3100 6050 3700 6050
Wire Wire Line
	3200 6450 3700 6450
Wire Wire Line
	3400 5500 3400 7300
Wire Wire Line
	3300 6850 3700 6850
Connection ~ 3300 6850
Wire Wire Line
	3300 5500 3300 6850
Connection ~ 3200 6450
Wire Wire Line
	3200 5500 3200 6450
Connection ~ 3100 6050
Wire Wire Line
	3100 5500 3100 6050
Wire Wire Line
	3200 6950 3200 7300
Wire Wire Line
	3000 6950 3200 6950
Wire Wire Line
	3100 7050 3100 7750
Wire Wire Line
	3000 7050 3100 7050
Wire Wire Line
	3200 6750 3200 6450
Wire Wire Line
	3000 6750 3200 6750
Wire Wire Line
	3100 6650 3100 6050
Wire Wire Line
	3000 6650 3100 6650
Wire Wire Line
	3000 6850 3300 6850
$Comp
L 74xx:74LS04 U73
U 2 1 68156BE9
P 4000 8200
F 0 "U73" H 4100 8450 50  0000 C CNN
F 1 "74LS04" H 4100 8350 50  0000 C CNN
F 2 "" H 4000 8200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 8200 50  0001 C CNN
	2    4000 8200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U70
U 6 1 68156BEF
P 4000 7750
F 0 "U70" H 4100 8000 50  0000 C CNN
F 1 "74LS04" H 4100 7900 50  0000 C CNN
F 2 "" H 4000 7750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 7750 50  0001 C CNN
	6    4000 7750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U70
U 5 1 68156BF5
P 4000 7300
F 0 "U70" H 4100 7550 50  0000 C CNN
F 1 "74LS04" H 4100 7450 50  0000 C CNN
F 2 "" H 4000 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 7300 50  0001 C CNN
	5    4000 7300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U70
U 4 1 68156BFB
P 4000 6850
F 0 "U70" H 4100 7100 50  0000 C CNN
F 1 "74LS04" H 4100 7000 50  0000 C CNN
F 2 "" H 4000 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 6850 50  0001 C CNN
	4    4000 6850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U70
U 3 1 68156C01
P 4000 6450
F 0 "U70" H 4050 6700 50  0000 C CNN
F 1 "74LS04" H 4100 6600 50  0000 C CNN
F 2 "" H 4000 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 6450 50  0001 C CNN
	3    4000 6450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U70
U 2 1 68156C07
P 4000 6050
F 0 "U70" H 4100 6300 50  0000 C CNN
F 1 "74LS04" H 4100 6200 50  0000 C CNN
F 2 "" H 4000 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 6050 50  0001 C CNN
	2    4000 6050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U70
U 1 1 68156C0D
P 4000 5650
F 0 "U70" H 4100 5900 50  0000 C CNN
F 1 "74LS04" H 4100 5800 50  0000 C CNN
F 2 "" H 4000 5650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 5650 50  0001 C CNN
	1    4000 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5300 6450 5300
Wire Wire Line
	6200 5750 6450 5750
Wire Wire Line
	6200 6200 6450 6200
Wire Wire Line
	6200 6650 6450 6650
Wire Wire Line
	6200 7100 6450 7100
Wire Wire Line
	6200 7550 6450 7550
Wire Wire Line
	6200 8000 6450 8000
Entry Wire Line
	6450 5300 6550 5400
Entry Wire Line
	6450 5750 6550 5850
Entry Wire Line
	6450 6200 6550 6300
Entry Wire Line
	6450 6650 6550 6750
Entry Wire Line
	6450 7100 6550 7200
Entry Wire Line
	6450 7550 6550 7650
Entry Wire Line
	6450 8000 6550 8100
Wire Bus Line
	6550 5150 6650 5150
Text HLabel 6650 5150 2    50   Input ~ 0
BAH[1..7]
Text Label 6450 5300 2    50   ~ 0
BAH1
Text Label 6450 5750 2    50   ~ 0
BAH2
Text Label 6450 6200 2    50   ~ 0
BAH3
Text Label 6450 6650 2    50   ~ 0
BAH4
Text Label 6450 7100 2    50   ~ 0
BAH5
Text Label 6450 7550 2    50   ~ 0
BAH6
Text Label 6450 8000 2    50   ~ 0
BAH7
Wire Wire Line
	3000 8200 3000 7150
Wire Wire Line
	3000 5500 3000 5650
Wire Bus Line
	1500 6400 1500 7050
Wire Bus Line
	1500 2500 1500 3150
Wire Bus Line
	6550 1250 6550 4300
Wire Bus Line
	6550 5150 6550 8200
Connection ~ 3000 5650
Wire Wire Line
	3000 5650 3000 6550
$EndSCHEMATC