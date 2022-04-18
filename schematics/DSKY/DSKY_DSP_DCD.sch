EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 4 14
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
L 74xx:74LS138 U26
U 1 1 637984DC
P 1800 6600
F 0 "U26" H 2100 7200 50  0000 C CNN
F 1 "74LS138" H 2100 7100 50  0000 C CNN
F 2 "" H 1800 6600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1800 6600 50  0001 C CNN
	1    1800 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6379B926
P 1300 5250
F 0 "#PWR0101" H 1300 5000 50  0001 C CNN
F 1 "GND" H 1305 5077 50  0000 C CNN
F 2 "" H 1300 5250 50  0001 C CNN
F 3 "" H 1300 5250 50  0001 C CNN
	1    1300 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 6379BB06
P 1800 5550
F 0 "#PWR0102" H 1800 5300 50  0001 C CNN
F 1 "GND" H 1805 5377 50  0000 C CNN
F 2 "" H 1800 5550 50  0001 C CNN
F 3 "" H 1800 5550 50  0001 C CNN
	1    1800 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 6379BCA3
P 1800 7300
F 0 "#PWR0105" H 1800 7050 50  0001 C CNN
F 1 "GND" H 1805 7127 50  0000 C CNN
F 2 "" H 1800 7300 50  0001 C CNN
F 3 "" H 1800 7300 50  0001 C CNN
	1    1800 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 6379F4A4
P 1800 6000
F 0 "#PWR0107" H 1800 5850 50  0001 C CNN
F 1 "+5V" H 1815 6173 50  0000 C CNN
F 2 "" H 1800 6000 50  0001 C CNN
F 3 "" H 1800 6000 50  0001 C CNN
	1    1800 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 637A0895
P 1200 6800
F 0 "#PWR0108" H 1200 6650 50  0001 C CNN
F 1 "+5V" H 1215 6973 50  0000 C CNN
F 2 "" H 1200 6800 50  0001 C CNN
F 3 "" H 1200 6800 50  0001 C CNN
	1    1200 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 6800 1200 6800
Wire Wire Line
	1000 6300 1300 6300
Wire Wire Line
	1300 6400 1000 6400
Wire Wire Line
	1300 6500 1000 6500
Wire Wire Line
	1300 6900 1000 6900
Wire Wire Line
	1300 7000 1000 7000
$Comp
L power:GND #PWR0109
U 1 1 637AE0B0
P 3500 5500
F 0 "#PWR0109" H 3500 5250 50  0001 C CNN
F 1 "GND" H 3505 5327 50  0000 C CNN
F 2 "" H 3500 5500 50  0001 C CNN
F 3 "" H 3500 5500 50  0001 C CNN
	1    3500 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 6600 2300 6600
NoConn ~ 2300 6400
NoConn ~ 2300 6500
NoConn ~ 2300 6700
NoConn ~ 2300 6800
NoConn ~ 2300 6900
NoConn ~ 2300 7000
Wire Wire Line
	2300 6300 2550 6300
Wire Wire Line
	2300 5250 2550 5250
Entry Wire Line
	2550 5250 2650 5350
Entry Wire Line
	2550 6300 2650 6400
Entry Wire Line
	2550 6600 2650 6700
Text Label 2550 6300 2    50   ~ 0
L15
Text Label 2550 6600 2    50   ~ 0
L1
$Comp
L 74xx:74LS138 U29
U 1 1 638E448A
P 6700 1400
F 0 "U29" H 6950 2000 50  0000 C CNN
F 1 "74LS138" H 6950 1900 50  0000 C CNN
F 2 "" H 6700 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 6700 1400 50  0001 C CNN
	1    6700 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U30
U 1 1 638E4490
P 6700 3200
F 0 "U30" H 6950 3800 50  0000 C CNN
F 1 "74LS138" H 6950 3700 50  0000 C CNN
F 2 "" H 6700 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 6700 3200 50  0001 C CNN
	1    6700 3200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U31
U 1 1 638E4496
P 6700 4950
F 0 "U31" H 6950 5550 50  0000 C CNN
F 1 "74LS138" H 6950 5450 50  0000 C CNN
F 2 "" H 6700 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 6700 4950 50  0001 C CNN
	1    6700 4950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U32
U 1 1 638E449C
P 5450 6500
F 0 "U32" H 5750 7100 50  0000 C CNN
F 1 "74LS138" H 5750 7000 50  0000 C CNN
F 2 "" H 5450 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5450 6500 50  0001 C CNN
	1    5450 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 638E44A2
P 6700 2100
F 0 "#PWR0110" H 6700 1850 50  0001 C CNN
F 1 "GND" H 6705 1927 50  0000 C CNN
F 2 "" H 6700 2100 50  0001 C CNN
F 3 "" H 6700 2100 50  0001 C CNN
	1    6700 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 638E44A8
P 6700 3900
F 0 "#PWR0117" H 6700 3650 50  0001 C CNN
F 1 "GND" H 6705 3727 50  0000 C CNN
F 2 "" H 6700 3900 50  0001 C CNN
F 3 "" H 6700 3900 50  0001 C CNN
	1    6700 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 638E44AE
P 6200 1800
F 0 "#PWR0118" H 6200 1550 50  0001 C CNN
F 1 "GND" H 6205 1627 50  0000 C CNN
F 2 "" H 6200 1800 50  0001 C CNN
F 3 "" H 6200 1800 50  0001 C CNN
	1    6200 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 638E44B4
P 6200 3600
F 0 "#PWR0119" H 6200 3350 50  0001 C CNN
F 1 "GND" H 6205 3427 50  0000 C CNN
F 2 "" H 6200 3600 50  0001 C CNN
F 3 "" H 6200 3600 50  0001 C CNN
	1    6200 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 638E44BA
P 6200 5350
F 0 "#PWR0120" H 6200 5100 50  0001 C CNN
F 1 "GND" H 6205 5177 50  0000 C CNN
F 2 "" H 6200 5350 50  0001 C CNN
F 3 "" H 6200 5350 50  0001 C CNN
	1    6200 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 638E44C0
P 6700 5650
F 0 "#PWR0121" H 6700 5400 50  0001 C CNN
F 1 "GND" H 6705 5477 50  0000 C CNN
F 2 "" H 6700 5650 50  0001 C CNN
F 3 "" H 6700 5650 50  0001 C CNN
	1    6700 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 638E44C6
P 5450 7200
F 0 "#PWR0122" H 5450 6950 50  0001 C CNN
F 1 "GND" H 5455 7027 50  0000 C CNN
F 2 "" H 5450 7200 50  0001 C CNN
F 3 "" H 5450 7200 50  0001 C CNN
	1    5450 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 638E44CC
P 6700 800
F 0 "#PWR0123" H 6700 650 50  0001 C CNN
F 1 "+5V" H 6715 973 50  0000 C CNN
F 2 "" H 6700 800 50  0001 C CNN
F 3 "" H 6700 800 50  0001 C CNN
	1    6700 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0124
U 1 1 638E44D2
P 6700 2600
F 0 "#PWR0124" H 6700 2450 50  0001 C CNN
F 1 "+5V" H 6715 2773 50  0000 C CNN
F 2 "" H 6700 2600 50  0001 C CNN
F 3 "" H 6700 2600 50  0001 C CNN
	1    6700 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0125
U 1 1 638E44D8
P 6700 4350
F 0 "#PWR0125" H 6700 4200 50  0001 C CNN
F 1 "+5V" H 6715 4523 50  0000 C CNN
F 2 "" H 6700 4350 50  0001 C CNN
F 3 "" H 6700 4350 50  0001 C CNN
	1    6700 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0126
U 1 1 638E44DE
P 5450 5900
F 0 "#PWR0126" H 5450 5750 50  0001 C CNN
F 1 "+5V" H 5465 6073 50  0000 C CNN
F 2 "" H 5450 5900 50  0001 C CNN
F 3 "" H 5450 5900 50  0001 C CNN
	1    5450 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0134
U 1 1 638E44E4
P 4850 6700
F 0 "#PWR0134" H 4850 6550 50  0001 C CNN
F 1 "+5V" H 4865 6873 50  0000 C CNN
F 2 "" H 4850 6700 50  0001 C CNN
F 3 "" H 4850 6700 50  0001 C CNN
	1    4850 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 6700 4850 6700
Wire Wire Line
	6200 1100 5800 1100
Wire Wire Line
	6200 1200 5800 1200
Wire Wire Line
	6200 1300 5800 1300
Wire Wire Line
	6200 1600 5800 1600
Wire Wire Line
	6200 1700 6050 1700
Wire Wire Line
	6200 2900 5800 2900
Wire Wire Line
	6200 3000 5800 3000
Wire Wire Line
	6200 3100 5800 3100
Wire Wire Line
	6200 3400 5800 3400
Wire Wire Line
	6200 3500 5800 3500
Wire Wire Line
	6200 4650 5800 4650
Wire Wire Line
	6200 4750 5800 4750
Wire Wire Line
	6200 4850 5800 4850
Wire Wire Line
	6200 5150 5800 5150
Wire Wire Line
	6200 5250 5800 5250
$Comp
L 74xx:74LS04 U5
U 6 1 638E4512
P 6250 2550
F 0 "U5" H 6250 2867 50  0000 C CNN
F 1 "74LS04" H 6250 2776 50  0000 C CNN
F 2 "" H 6250 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6250 2550 50  0001 C CNN
	6    6250 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2150 6050 1700
$Comp
L 74xx:74LS148 U33
U 1 1 638E451B
P 8400 3000
F 0 "U33" H 8650 3700 50  0000 C CNN
F 1 "74LS148" H 8650 3600 50  0000 C CNN
F 2 "" H 8400 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS148" H 8400 3000 50  0001 C CNN
	1    8400 3000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS148 U34
U 1 1 638E4521
P 8400 4900
F 0 "U34" H 8650 5600 50  0000 C CNN
F 1 "74LS148" H 8650 5500 50  0000 C CNN
F 2 "" H 8400 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS148" H 8400 4900 50  0001 C CNN
	1    8400 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 638E4527
P 8400 3700
F 0 "#PWR0135" H 8400 3450 50  0001 C CNN
F 1 "GND" H 8405 3527 50  0000 C CNN
F 2 "" H 8400 3700 50  0001 C CNN
F 3 "" H 8400 3700 50  0001 C CNN
	1    8400 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0136
U 1 1 638E452D
P 8400 5600
F 0 "#PWR0136" H 8400 5350 50  0001 C CNN
F 1 "GND" H 8405 5427 50  0000 C CNN
F 2 "" H 8400 5600 50  0001 C CNN
F 3 "" H 8400 5600 50  0001 C CNN
	1    8400 5600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0137
U 1 1 638E4533
P 8400 2300
F 0 "#PWR0137" H 8400 2150 50  0001 C CNN
F 1 "+5V" H 8415 2473 50  0000 C CNN
F 2 "" H 8400 2300 50  0001 C CNN
F 3 "" H 8400 2300 50  0001 C CNN
	1    8400 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0138
U 1 1 638E4539
P 8400 4200
F 0 "#PWR0138" H 8400 4050 50  0001 C CNN
F 1 "+5V" H 8415 4373 50  0000 C CNN
F 2 "" H 8400 4200 50  0001 C CNN
F 3 "" H 8400 4200 50  0001 C CNN
	1    8400 4200
	1    0    0    -1  
$EndComp
NoConn ~ 8900 5100
NoConn ~ 8900 5000
NoConn ~ 8900 3100
Wire Wire Line
	7900 5300 7800 5300
Wire Wire Line
	7800 5300 7800 3950
Wire Wire Line
	8900 3950 8900 3200
$Comp
L power:GND #PWR0139
U 1 1 638E4545
P 7900 3400
F 0 "#PWR0139" H 7900 3150 50  0001 C CNN
F 1 "GND" H 7905 3227 50  0000 C CNN
F 2 "" H 7900 3400 50  0001 C CNN
F 3 "" H 7900 3400 50  0001 C CNN
	1    7900 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 4600 7650 4600
Wire Wire Line
	6200 6500 5950 6500
NoConn ~ 5950 6300
NoConn ~ 5950 6400
NoConn ~ 5950 6600
NoConn ~ 5950 6700
NoConn ~ 5950 6800
NoConn ~ 5950 6900
Wire Wire Line
	5950 6200 6200 6200
Wire Wire Line
	7650 3300 7900 3300
Wire Wire Line
	7200 5350 7450 5350
NoConn ~ 7200 4650
NoConn ~ 7200 4750
NoConn ~ 7200 4850
NoConn ~ 7200 4950
NoConn ~ 7200 5050
NoConn ~ 7200 5150
NoConn ~ 7200 5250
Wire Wire Line
	7200 3200 7450 3200
NoConn ~ 7200 3600
NoConn ~ 7200 3500
NoConn ~ 7200 3300
NoConn ~ 7200 3100
NoConn ~ 7200 3000
NoConn ~ 7200 2900
Wire Wire Line
	7650 4900 7900 4900
Wire Wire Line
	7650 5200 7900 5200
NoConn ~ 7200 1100
NoConn ~ 7200 1300
Wire Wire Line
	7200 1800 7450 1800
Wire Wire Line
	7650 2700 7900 2700
Wire Wire Line
	7200 1600 7450 1600
Wire Wire Line
	7650 2600 7900 2600
Wire Wire Line
	7200 1700 7450 1700
Wire Wire Line
	7200 1500 7450 1500
Wire Wire Line
	7200 1400 7450 1400
Wire Wire Line
	7200 1200 7450 1200
Wire Wire Line
	7900 4700 7650 4700
Wire Wire Line
	7900 4800 7650 4800
Wire Wire Line
	7900 5000 7650 5000
Wire Wire Line
	7900 5100 7650 5100
Wire Wire Line
	7800 3950 8900 3950
Entry Wire Line
	7450 1200 7550 1300
Entry Wire Line
	7450 1400 7550 1500
Entry Wire Line
	7450 1500 7550 1600
Entry Wire Line
	7450 1600 7550 1700
Entry Wire Line
	7450 1700 7550 1800
Entry Wire Line
	7450 1800 7550 1900
Entry Wire Line
	7450 3200 7550 3300
Entry Wire Line
	7450 5350 7550 5450
Entry Wire Line
	6200 6200 6300 6300
Entry Wire Line
	6200 6500 6300 6600
Entry Wire Line
	7550 3400 7650 3300
Entry Wire Line
	7550 2700 7650 2600
Entry Wire Line
	7550 2800 7650 2700
Entry Wire Line
	7550 4700 7650 4600
Entry Wire Line
	7550 4800 7650 4700
Entry Wire Line
	7550 4900 7650 4800
Entry Wire Line
	7550 5000 7650 4900
Entry Wire Line
	7550 5100 7650 5000
Entry Wire Line
	7550 5200 7650 5100
Entry Wire Line
	7550 5300 7650 5200
Text Label 7450 1800 2    50   ~ 0
H9
Text Label 7450 1200 2    50   ~ 0
H2
Text Label 7450 1400 2    50   ~ 0
H3
Text Label 7450 1700 2    50   ~ 0
H5
Text Label 7450 1600 2    50   ~ 0
H8
Text Label 7450 1500 2    50   ~ 0
H6
Text Label 7450 3200 2    50   ~ 0
H7
Text Label 7450 5350 2    50   ~ 0
H4
Text Label 6200 6200 2    50   ~ 0
H15
Text Label 6200 6500 2    50   ~ 0
H1
Text Label 7650 3300 0    50   ~ 0
H15
Text Label 7650 2600 0    50   ~ 0
H8
Text Label 7650 2700 0    50   ~ 0
H9
Text Label 7650 4600 0    50   ~ 0
H1
Text Label 7650 4700 0    50   ~ 0
H2
Text Label 7650 4800 0    50   ~ 0
H3
Text Label 7650 4900 0    50   ~ 0
H4
Text Label 7650 5000 0    50   ~ 0
H5
Text Label 7650 5100 0    50   ~ 0
H6
Text Label 7650 5200 0    50   ~ 0
H7
Wire Wire Line
	7900 3200 7800 3200
Wire Wire Line
	7800 3200 7800 3100
Wire Wire Line
	7900 2800 7800 2800
Connection ~ 7800 2800
Wire Wire Line
	7800 2800 7800 2400
Wire Wire Line
	7900 2900 7800 2900
Connection ~ 7800 2900
Wire Wire Line
	7800 2900 7800 2800
Wire Wire Line
	7900 3000 7800 3000
Connection ~ 7800 3000
Wire Wire Line
	7800 3000 7800 2900
Wire Wire Line
	7900 3100 7800 3100
Connection ~ 7800 3100
Wire Wire Line
	7800 3100 7800 3000
$Comp
L power:+5V #PWR0140
U 1 1 638E45B2
P 7800 2400
F 0 "#PWR0140" H 7800 2250 50  0001 C CNN
F 1 "+5V" H 7815 2573 50  0000 C CNN
F 2 "" H 7800 2400 50  0001 C CNN
F 3 "" H 7800 2400 50  0001 C CNN
	1    7800 2400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U35
U 4 1 638E45B8
P 9750 3650
F 0 "U35" H 9750 3975 50  0000 C CNN
F 1 "74LS00" H 9750 3884 50  0000 C CNN
F 2 "" H 9750 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 9750 3650 50  0001 C CNN
	4    9750 3650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U18
U 2 1 638E45BE
P 9750 4250
F 0 "U18" H 9750 4575 50  0000 C CNN
F 1 "74LS00" H 9750 4484 50  0000 C CNN
F 2 "" H 9750 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 9750 4250 50  0001 C CNN
	2    9750 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 3200 10350 3200
Wire Wire Line
	9100 4800 9450 4800
Wire Wire Line
	9200 2700 9200 4150
Wire Wire Line
	9200 4150 9450 4150
Wire Wire Line
	9300 2800 9300 3550
Wire Wire Line
	9300 3550 9450 3550
Wire Wire Line
	10050 3650 10350 3650
Wire Wire Line
	10050 4250 10350 4250
Wire Wire Line
	10050 4900 10350 4900
Wire Wire Line
	8900 2600 9100 2600
Wire Wire Line
	8900 2700 9200 2700
Wire Wire Line
	8900 2800 9300 2800
Wire Wire Line
	8900 4500 9000 4500
Wire Wire Line
	9000 5000 9450 5000
Wire Wire Line
	8900 4600 9200 4600
Wire Wire Line
	9200 4600 9200 4350
$Comp
L 74xx:74LS00 U18
U 3 1 638E45D5
P 9750 4900
F 0 "U18" H 9750 5225 50  0000 C CNN
F 1 "74LS00" H 9750 5134 50  0000 C CNN
F 2 "" H 9750 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 9750 4900 50  0001 C CNN
	3    9750 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 2600 9100 4800
Wire Wire Line
	9000 4500 9000 5000
Wire Wire Line
	9200 4350 9450 4350
Wire Wire Line
	8900 4700 9300 4700
Wire Wire Line
	9300 4700 9300 3750
Wire Wire Line
	9300 3750 9450 3750
Text Notes 8150 1500 0    100  ~ 0
Display High Word \nCode Converter
Wire Bus Line
	7550 6050 6300 6050
Entry Wire Line
	900  7000 1000 6900
Entry Wire Line
	900  7100 1000 7000
Entry Wire Line
	900  6500 1000 6400
Entry Wire Line
	900  6600 1000 6500
Entry Wire Line
	900  6400 1000 6300
Text Label 1000 6300 0    50   ~ 0
OW1
Text Label 1000 6400 0    50   ~ 0
OW2
Text Label 1000 6500 0    50   ~ 0
OW3
Text Label 1000 7000 0    50   ~ 0
OW4
Text Label 1000 6900 0    50   ~ 0
OW5
Wire Wire Line
	6550 2550 6550 2150
Wire Wire Line
	6550 2150 6050 2150
Wire Wire Line
	5950 2550 5800 2550
Entry Wire Line
	5700 2650 5800 2550
Text Label 5800 2550 0    50   ~ 0
OW9
Wire Bus Line
	5700 900  5600 900 
Wire Bus Line
	5700 5600 4650 5600
Entry Wire Line
	5700 1700 5800 1600
Entry Wire Line
	5700 1400 5800 1300
Entry Wire Line
	5700 1300 5800 1200
Entry Wire Line
	5700 1200 5800 1100
Entry Wire Line
	5700 3000 5800 2900
Entry Wire Line
	5700 3100 5800 3000
Entry Wire Line
	5700 3200 5800 3100
Entry Wire Line
	5700 3500 5800 3400
Entry Wire Line
	5700 3600 5800 3500
Entry Wire Line
	5700 4750 5800 4650
Entry Wire Line
	5700 4850 5800 4750
Entry Wire Line
	5700 4950 5800 4850
Entry Wire Line
	5700 5250 5800 5150
Entry Wire Line
	5700 5350 5800 5250
Text Label 5800 1100 0    50   ~ 0
OW6
Text Label 5800 1200 0    50   ~ 0
OW7
Text Label 5800 1300 0    50   ~ 0
OW8
Text Label 5800 1600 0    50   ~ 0
OW10
Text Label 5800 2900 0    50   ~ 0
OW6
Text Label 5800 3000 0    50   ~ 0
OW7
Text Label 5800 3100 0    50   ~ 0
OW8
Text Label 5800 3500 0    50   ~ 0
OW9
Text Label 5800 3400 0    50   ~ 0
OW10
Text Label 5800 4650 0    50   ~ 0
OW6
Text Label 5800 4750 0    50   ~ 0
OW7
Text Label 5800 4850 0    50   ~ 0
OW8
Text Label 5800 5150 0    50   ~ 0
OW9
Text Label 5800 5250 0    50   ~ 0
OW10
Wire Wire Line
	4950 6200 4750 6200
Wire Wire Line
	4950 6300 4750 6300
Wire Wire Line
	4950 6400 4750 6400
Wire Wire Line
	4950 6800 4750 6800
Wire Wire Line
	4950 6900 4750 6900
Entry Wire Line
	4650 6300 4750 6200
Entry Wire Line
	4650 6400 4750 6300
Entry Wire Line
	4650 6500 4750 6400
Entry Wire Line
	4650 6900 4750 6800
Entry Wire Line
	4650 7000 4750 6900
Text Label 4750 6200 0    50   ~ 0
OW6
Text Label 4750 6300 0    50   ~ 0
OW7
Text Label 4750 6400 0    50   ~ 0
OW8
Text Label 4750 6900 0    50   ~ 0
OW9
Text Label 4750 6800 0    50   ~ 0
OW10
Entry Wire Line
	10350 3200 10450 3300
Entry Wire Line
	10350 3650 10450 3750
Entry Wire Line
	10350 4250 10450 4350
Entry Wire Line
	10350 4900 10450 5000
Text HLabel 10450 2950 1    50   Output ~ 0
BCD[5..8]
Text Label 10350 4900 2    50   ~ 0
BCD5
Text Label 10350 4250 2    50   ~ 0
BCD6
Text Label 10350 3650 2    50   ~ 0
BCD7
Text Label 10350 3200 2    50   ~ 0
BCD8
Text Notes 6450 7150 0    100  ~ 0
DSKY-DSP-DCD:  Decode Data\nCopyright 2021, William Glasford
Wire Wire Line
	7200 3400 7450 3400
Entry Wire Line
	7450 3400 7550 3500
Text Label 7450 3400 2    50   ~ 0
H0
Wire Wire Line
	7900 4500 7650 4500
Entry Wire Line
	7550 4600 7650 4500
Text Label 7650 4500 0    50   ~ 0
H0
Connection ~ 4000 3100
Text Label 2750 4400 0    50   ~ 0
L0
Entry Wire Line
	2650 4500 2750 4400
Wire Wire Line
	3000 4400 2750 4400
Text Label 2550 3300 2    50   ~ 0
L0
Entry Wire Line
	2550 3300 2650 3400
Wire Wire Line
	2300 3300 2550 3300
Text Label 5400 3100 2    50   ~ 0
BCD4
Text Label 5400 3550 2    50   ~ 0
BCD3
Text Label 5400 4150 2    50   ~ 0
BCD2
Text Label 5400 4800 2    50   ~ 0
BCD1
Text HLabel 5500 2850 1    50   Output ~ 0
BCD[1..4]
Entry Wire Line
	5400 4800 5500 4900
Entry Wire Line
	5400 4150 5500 4250
Entry Wire Line
	5400 3550 5500 3650
Entry Wire Line
	5400 3100 5500 3200
Text HLabel 5600 900  0    50   Input ~ 0
OW[6..10]
Text Label 1000 4750 0    50   ~ 0
OW3
Text Label 1000 4650 0    50   ~ 0
OW2
Text Label 1000 4550 0    50   ~ 0
OW1
Text Label 1000 5150 0    50   ~ 0
OW5
Text Label 1000 5050 0    50   ~ 0
OW4
Text Label 1000 3400 0    50   ~ 0
OW4
Text Label 1000 3300 0    50   ~ 0
OW5
Text Label 1000 3000 0    50   ~ 0
OW3
Text Label 1000 2900 0    50   ~ 0
OW2
Text Label 1000 2800 0    50   ~ 0
OW1
Text Label 1000 2450 0    50   ~ 0
OW4
Wire Wire Line
	1000 2450 1100 2450
Text Label 1000 1500 0    50   ~ 0
OW5
Text Label 1000 1200 0    50   ~ 0
OW3
Text Label 1000 1100 0    50   ~ 0
OW2
Text Label 1000 1000 0    50   ~ 0
OW1
Text HLabel 900  950  1    50   Input ~ 0
OW[1..5]
Entry Wire Line
	900  1100 1000 1000
Entry Wire Line
	900  1200 1000 1100
Entry Wire Line
	900  1300 1000 1200
Entry Wire Line
	900  1600 1000 1500
Entry Wire Line
	900  2550 1000 2450
Entry Wire Line
	900  3100 1000 3000
Entry Wire Line
	900  3000 1000 2900
Entry Wire Line
	900  2900 1000 2800
Entry Wire Line
	900  3500 1000 3400
Entry Wire Line
	900  3400 1000 3300
Entry Wire Line
	900  4850 1000 4750
Entry Wire Line
	900  4650 1000 4550
Entry Wire Line
	900  4750 1000 4650
Entry Wire Line
	900  5250 1000 5150
Entry Wire Line
	900  5150 1000 5050
Wire Wire Line
	1150 2050 1700 2050
Text Notes 3200 1550 0    100  ~ 0
Display Low Word \nCode Converter
Wire Wire Line
	4400 3650 4550 3650
Wire Wire Line
	4400 4600 4400 3650
Wire Wire Line
	4000 4600 4400 4600
Wire Wire Line
	4300 4250 4550 4250
Wire Wire Line
	4100 4400 4100 4900
Wire Wire Line
	4200 2500 4200 4700
$Comp
L 74xx:74LS00 U35
U 3 1 637ECC3B
P 4850 4800
F 0 "U35" H 4850 5125 50  0000 C CNN
F 1 "74LS00" H 4850 5034 50  0000 C CNN
F 2 "" H 4850 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 4850 4800 50  0001 C CNN
	3    4850 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4500 4300 4250
Wire Wire Line
	4000 4500 4300 4500
Wire Wire Line
	4100 4900 4550 4900
Wire Wire Line
	4000 4400 4100 4400
Wire Wire Line
	4000 2700 4400 2700
Wire Wire Line
	4000 2600 4300 2600
Wire Wire Line
	4000 2500 4200 2500
Wire Wire Line
	5150 4800 5400 4800
Wire Wire Line
	5150 4150 5400 4150
Wire Wire Line
	5150 3550 5400 3550
Wire Wire Line
	4400 3450 4550 3450
Wire Wire Line
	4400 2700 4400 3450
Wire Wire Line
	4300 4050 4550 4050
Wire Wire Line
	4300 2600 4300 4050
Wire Wire Line
	4200 4700 4550 4700
Wire Wire Line
	4000 3100 5400 3100
$Comp
L 74xx:74LS00 U35
U 2 1 637EABBC
P 4850 4150
F 0 "U35" H 4850 4475 50  0000 C CNN
F 1 "74LS00" H 4850 4384 50  0000 C CNN
F 2 "" H 4850 4150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 4850 4150 50  0001 C CNN
	2    4850 4150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U35
U 1 1 637E9C4B
P 4850 3550
F 0 "U35" H 4850 3875 50  0000 C CNN
F 1 "74LS00" H 4850 3784 50  0000 C CNN
F 2 "" H 4850 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 4850 3550 50  0001 C CNN
	1    4850 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0141
U 1 1 637E8C3A
P 2900 2300
F 0 "#PWR0141" H 2900 2150 50  0001 C CNN
F 1 "+5V" H 2915 2473 50  0000 C CNN
F 2 "" H 2900 2300 50  0001 C CNN
F 3 "" H 2900 2300 50  0001 C CNN
	1    2900 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 3000 2900 2900
Connection ~ 2900 3000
Wire Wire Line
	3000 3000 2900 3000
Wire Wire Line
	2900 2900 2900 2800
Connection ~ 2900 2900
Wire Wire Line
	3000 2900 2900 2900
Wire Wire Line
	2900 2800 2900 2700
Connection ~ 2900 2800
Wire Wire Line
	3000 2800 2900 2800
Wire Wire Line
	2900 2700 2900 2300
Connection ~ 2900 2700
Wire Wire Line
	3000 2700 2900 2700
Wire Wire Line
	2900 3100 2900 3000
Wire Wire Line
	3000 3100 2900 3100
Text Label 2750 5100 0    50   ~ 0
L7
Text Label 2750 5000 0    50   ~ 0
L6
Text Label 2750 4900 0    50   ~ 0
L5
Text Label 2750 4800 0    50   ~ 0
L4
Text Label 2750 4700 0    50   ~ 0
L3
Text Label 2750 4600 0    50   ~ 0
L2
Text Label 2750 4500 0    50   ~ 0
L1
Text Label 2750 2600 0    50   ~ 0
L9
Text Label 2750 2500 0    50   ~ 0
L8
Text Label 2750 3200 0    50   ~ 0
L15
Text Label 2550 5250 2    50   ~ 0
L4
Text Label 2550 3100 2    50   ~ 0
L7
Text Label 2550 1400 2    50   ~ 0
L6
Text Label 2550 1500 2    50   ~ 0
L8
Text Label 2550 1600 2    50   ~ 0
L5
Text Label 2550 1300 2    50   ~ 0
L3
Text Label 2550 1100 2    50   ~ 0
L2
Text Label 2550 1700 2    50   ~ 0
L9
Entry Wire Line
	2650 5200 2750 5100
Entry Wire Line
	2650 5100 2750 5000
Entry Wire Line
	2650 5000 2750 4900
Entry Wire Line
	2650 4900 2750 4800
Entry Wire Line
	2650 4800 2750 4700
Entry Wire Line
	2650 4700 2750 4600
Entry Wire Line
	2650 4600 2750 4500
Entry Wire Line
	2650 2700 2750 2600
Entry Wire Line
	2650 2600 2750 2500
Entry Wire Line
	2650 3300 2750 3200
Entry Wire Line
	2550 3100 2650 3200
Entry Wire Line
	2550 1700 2650 1800
Entry Wire Line
	2550 1600 2650 1700
Entry Wire Line
	2550 1500 2650 1600
Entry Wire Line
	2550 1400 2650 1500
Entry Wire Line
	2550 1300 2650 1400
Entry Wire Line
	2550 1100 2650 1200
Wire Wire Line
	2900 3850 4000 3850
Wire Wire Line
	3000 5000 2750 5000
Wire Wire Line
	3000 4900 2750 4900
Wire Wire Line
	3000 4700 2750 4700
Wire Wire Line
	3000 4600 2750 4600
Wire Wire Line
	2300 1100 2550 1100
Wire Wire Line
	2300 1300 2550 1300
Wire Wire Line
	2300 1400 2550 1400
Wire Wire Line
	2300 1600 2550 1600
Wire Wire Line
	2750 2500 3000 2500
Wire Wire Line
	2300 1500 2550 1500
Wire Wire Line
	2750 2600 3000 2600
Wire Wire Line
	2300 1700 2550 1700
NoConn ~ 2300 1200
NoConn ~ 2300 1000
Wire Wire Line
	2750 5100 3000 5100
Wire Wire Line
	2750 4800 3000 4800
NoConn ~ 2300 2800
NoConn ~ 2300 2900
NoConn ~ 2300 3000
NoConn ~ 2300 3200
NoConn ~ 2300 3400
NoConn ~ 2300 3500
Wire Wire Line
	2300 3100 2550 3100
NoConn ~ 2300 5150
NoConn ~ 2300 5050
NoConn ~ 2300 4950
NoConn ~ 2300 4850
NoConn ~ 2300 4750
NoConn ~ 2300 4650
NoConn ~ 2300 4550
Wire Wire Line
	2750 3200 3000 3200
Wire Wire Line
	3000 4500 2750 4500
$Comp
L power:GND #PWR0142
U 1 1 637B22A2
P 3000 3300
F 0 "#PWR0142" H 3000 3050 50  0001 C CNN
F 1 "GND" H 3005 3127 50  0000 C CNN
F 2 "" H 3000 3300 50  0001 C CNN
F 3 "" H 3000 3300 50  0001 C CNN
	1    3000 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3850 4000 3100
Wire Wire Line
	2900 5200 2900 3850
Wire Wire Line
	3000 5200 2900 5200
NoConn ~ 4000 3000
NoConn ~ 4000 4900
NoConn ~ 4000 5000
$Comp
L power:+5V #PWR0143
U 1 1 637AE63F
P 3500 4100
F 0 "#PWR0143" H 3500 3950 50  0001 C CNN
F 1 "+5V" H 3515 4273 50  0000 C CNN
F 2 "" H 3500 4100 50  0001 C CNN
F 3 "" H 3500 4100 50  0001 C CNN
	1    3500 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0144
U 1 1 637AE379
P 3500 2200
F 0 "#PWR0144" H 3500 2050 50  0001 C CNN
F 1 "+5V" H 3515 2373 50  0000 C CNN
F 2 "" H 3500 2200 50  0001 C CNN
F 3 "" H 3500 2200 50  0001 C CNN
	1    3500 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0145
U 1 1 637ADE12
P 3500 3600
F 0 "#PWR0145" H 3500 3350 50  0001 C CNN
F 1 "GND" H 3505 3427 50  0000 C CNN
F 2 "" H 3500 3600 50  0001 C CNN
F 3 "" H 3500 3600 50  0001 C CNN
	1    3500 3600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS148 U28
U 1 1 637ABE28
P 3500 4800
F 0 "U28" H 3750 5500 50  0000 C CNN
F 1 "74LS148" H 3750 5400 50  0000 C CNN
F 2 "" H 3500 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS148" H 3500 4800 50  0001 C CNN
	1    3500 4800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS148 U27
U 1 1 637AA624
P 3500 2900
F 0 "U27" H 3750 3600 50  0000 C CNN
F 1 "74LS148" H 3750 3500 50  0000 C CNN
F 2 "" H 3500 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS148" H 3500 2900 50  0001 C CNN
	1    3500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 2050 1150 1600
Wire Wire Line
	1700 2450 1700 2050
$Comp
L 74xx:74LS04 U5
U 5 1 637A786D
P 1400 2450
F 0 "U5" H 1400 2767 50  0000 C CNN
F 1 "74LS04" H 1400 2676 50  0000 C CNN
F 2 "" H 1400 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1400 2450 50  0001 C CNN
	5    1400 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 5150 1000 5150
Wire Wire Line
	1300 5050 1000 5050
Wire Wire Line
	1300 4750 1000 4750
Wire Wire Line
	1300 4650 1000 4650
Wire Wire Line
	1300 4550 1000 4550
Wire Wire Line
	1300 3400 1000 3400
Wire Wire Line
	1300 3300 1000 3300
Wire Wire Line
	1300 3000 1000 3000
Wire Wire Line
	1300 2900 1000 2900
Wire Wire Line
	1300 2800 1000 2800
Wire Wire Line
	1300 1600 1150 1600
Wire Wire Line
	1300 1500 1000 1500
Wire Wire Line
	1300 1200 1000 1200
Wire Wire Line
	1300 1100 1000 1100
Wire Wire Line
	1300 1000 1000 1000
$Comp
L power:+5V #PWR0146
U 1 1 6379F2BA
P 1800 4250
F 0 "#PWR0146" H 1800 4100 50  0001 C CNN
F 1 "+5V" H 1815 4423 50  0000 C CNN
F 2 "" H 1800 4250 50  0001 C CNN
F 3 "" H 1800 4250 50  0001 C CNN
	1    1800 4250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0147
U 1 1 6379C046
P 1800 2500
F 0 "#PWR0147" H 1800 2350 50  0001 C CNN
F 1 "+5V" H 1815 2673 50  0000 C CNN
F 2 "" H 1800 2500 50  0001 C CNN
F 3 "" H 1800 2500 50  0001 C CNN
	1    1800 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0148
U 1 1 6379BE7C
P 1800 700
F 0 "#PWR0148" H 1800 550 50  0001 C CNN
F 1 "+5V" H 1815 873 50  0000 C CNN
F 2 "" H 1800 700 50  0001 C CNN
F 3 "" H 1800 700 50  0001 C CNN
	1    1800 700 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0149
U 1 1 6379B798
P 1300 3500
F 0 "#PWR0149" H 1300 3250 50  0001 C CNN
F 1 "GND" H 1305 3327 50  0000 C CNN
F 2 "" H 1300 3500 50  0001 C CNN
F 3 "" H 1300 3500 50  0001 C CNN
	1    1300 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0150
U 1 1 6379B61A
P 1300 1700
F 0 "#PWR0150" H 1300 1450 50  0001 C CNN
F 1 "GND" H 1305 1527 50  0000 C CNN
F 2 "" H 1300 1700 50  0001 C CNN
F 3 "" H 1300 1700 50  0001 C CNN
	1    1300 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0151
U 1 1 6379B4A8
P 1800 3800
F 0 "#PWR0151" H 1800 3550 50  0001 C CNN
F 1 "GND" H 1805 3627 50  0000 C CNN
F 2 "" H 1800 3800 50  0001 C CNN
F 3 "" H 1800 3800 50  0001 C CNN
	1    1800 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0152
U 1 1 6379B342
P 1800 2000
F 0 "#PWR0152" H 1800 1750 50  0001 C CNN
F 1 "GND" H 1805 1827 50  0000 C CNN
F 2 "" H 1800 2000 50  0001 C CNN
F 3 "" H 1800 2000 50  0001 C CNN
	1    1800 2000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U25
U 1 1 6379742F
P 1800 4850
F 0 "U25" H 2050 5450 50  0000 C CNN
F 1 "74LS138" H 2050 5350 50  0000 C CNN
F 2 "" H 1800 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1800 4850 50  0001 C CNN
	1    1800 4850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U24
U 1 1 63796725
P 1800 3100
F 0 "U24" H 2050 3700 50  0000 C CNN
F 1 "74LS138" H 2050 3600 50  0000 C CNN
F 2 "" H 1800 3100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1800 3100 50  0001 C CNN
	1    1800 3100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U23
U 1 1 637946B5
P 1800 1300
F 0 "U23" H 2050 1900 50  0000 C CNN
F 1 "74LS138" H 2050 1800 50  0000 C CNN
F 2 "" H 1800 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1800 1300 50  0001 C CNN
	1    1800 1300
	1    0    0    -1  
$EndComp
Connection ~ 8900 3200
Wire Bus Line
	6300 6050 6300 6650
Wire Bus Line
	10450 2950 10450 5100
Wire Bus Line
	4650 5600 4650 7100
Wire Bus Line
	5500 2850 5500 5000
Wire Bus Line
	900  950  900  7200
Wire Bus Line
	5700 900  5700 5600
Wire Bus Line
	7550 900  7550 6050
Wire Bus Line
	2650 1000 2650 6800
$EndSCHEMATC
