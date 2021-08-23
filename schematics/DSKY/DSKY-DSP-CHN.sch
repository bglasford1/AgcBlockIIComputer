EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 4 10
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
L power:GND #PWR?
U 1 1 67D9AAB9
P 5150 4650
AR Path="/60F98A4F/67D9AAB9" Ref="#PWR?"  Part="1" 
AR Path="/60F98A64/67D1D986/67D9AAB9" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 5150 4400 50  0001 C CNN
F 1 "GND" H 5155 4477 50  0000 C CNN
F 2 "" H 5150 4650 50  0001 C CNN
F 3 "" H 5150 4650 50  0001 C CNN
	1    5150 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 67D9AAD1
P 5150 3050
AR Path="/60F98A4F/67D9AAD1" Ref="#PWR?"  Part="1" 
AR Path="/60F98A64/67D1D986/67D9AAD1" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 5150 2900 50  0001 C CNN
F 1 "+5V" H 5165 3223 50  0000 C CNN
F 2 "" H 5150 3050 50  0001 C CNN
F 3 "" H 5150 3050 50  0001 C CNN
	1    5150 3050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 2 1 67D9AB1B
P 3600 1550
AR Path="/60F98A4F/67D9AB1B" Ref="U?"  Part="4" 
AR Path="/60F98A64/67D1D986/67D9AB1B" Ref="U7"  Part="2" 
F 0 "U7" H 3600 1875 50  0000 C CNN
F 1 "74LS00" H 3600 1784 50  0000 C CNN
F 2 "" H 3600 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 3600 1550 50  0001 C CNN
	2    3600 1550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 3 1 67D9AB21
P 3600 2350
AR Path="/60F98A4F/67D9AB21" Ref="U?"  Part="3" 
AR Path="/60F98A64/67D1D986/67D9AB21" Ref="U7"  Part="3" 
F 0 "U7" H 3600 2675 50  0000 C CNN
F 1 "74LS00" H 3600 2584 50  0000 C CNN
F 2 "" H 3600 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 3600 2350 50  0001 C CNN
	3    3600 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1650 3150 1650
Wire Wire Line
	3300 2450 3150 2450
Wire Wire Line
	3150 2450 3150 1950
Wire Wire Line
	3300 2250 2450 2250
Wire Wire Line
	3300 1450 2450 1450
Wire Wire Line
	3150 1950 2900 1950
Connection ~ 3150 1950
Wire Wire Line
	3150 1950 3150 1650
Text HLabel 2900 1950 0    50   Input ~ 0
CLK2
$Comp
L 74xx:74LS04 U?
U 3 1 67D9AB30
P 2150 1450
AR Path="/60F98A4F/67D9AB30" Ref="U?"  Part="5" 
AR Path="/60F98A64/67D1D986/67D9AB30" Ref="U5"  Part="3" 
F 0 "U5" H 2150 1767 50  0000 C CNN
F 1 "74LS04" H 2150 1676 50  0000 C CNN
F 2 "" H 2150 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 2150 1450 50  0001 C CNN
	3    2150 1450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 4 1 67D9AB36
P 2150 2250
AR Path="/60F98A4F/67D9AB36" Ref="U?"  Part="6" 
AR Path="/60F98A64/67D1D986/67D9AB36" Ref="U5"  Part="4" 
F 0 "U5" H 2150 2567 50  0000 C CNN
F 1 "74LS04" H 2150 2476 50  0000 C CNN
F 2 "" H 2150 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 2150 2250 50  0001 C CNN
	4    2150 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2250 1500 2250
Wire Wire Line
	1850 1450 1500 1450
Text HLabel 1500 1450 0    50   Input ~ 0
DISP
Text HLabel 1500 2250 0    50   Input ~ 0
GENRST
Text Notes 4750 2750 0    100  ~ 0
CH10 Reg.
Connection ~ 3900 4350
Wire Wire Line
	3900 4350 3900 6450
Connection ~ 4100 4250
Wire Wire Line
	4100 4250 4100 6350
Wire Wire Line
	4650 4350 3900 4350
Wire Wire Line
	4650 4250 4100 4250
$Comp
L 74xx:74LS273 U?
U 1 1 67D9AB75
P 5150 3850
AR Path="/60F98A4F/67D9AB75" Ref="U?"  Part="1" 
AR Path="/60F98A64/67D1D986/67D9AB75" Ref="U20"  Part="1" 
F 0 "U20" H 5400 4650 50  0000 C CNN
F 1 "74LS273" H 5400 4550 50  0000 C CNN
F 2 "" H 5150 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS273" H 5150 3850 50  0001 C CNN
	1    5150 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1550 4100 4250
Wire Wire Line
	3900 2350 3900 4350
Wire Wire Line
	4100 1550 3900 1550
Wire Wire Line
	9450 1450 9150 1450
Wire Wire Line
	9450 1850 9150 1850
Wire Wire Line
	9150 1650 9450 1650
Wire Wire Line
	5650 4050 6050 4050
Wire Wire Line
	5650 3950 6050 3950
Wire Wire Line
	5650 3850 6050 3850
Wire Wire Line
	5650 3750 6050 3750
Wire Wire Line
	5650 3650 6050 3650
Wire Wire Line
	5650 3550 6050 3550
Wire Wire Line
	5650 3450 6050 3450
Wire Wire Line
	4650 3450 3600 3450
Wire Wire Line
	4650 3550 3600 3550
Wire Wire Line
	4650 3650 3600 3650
Wire Wire Line
	4650 3750 3600 3750
Wire Wire Line
	4650 3850 3600 3850
Wire Wire Line
	4650 3950 3600 3950
Wire Wire Line
	4650 4050 3600 4050
$Comp
L 74xx:74LS273 U?
U 1 1 67EF035A
P 8650 1850
AR Path="/60F98A4F/67EF035A" Ref="U?"  Part="1" 
AR Path="/60F98A64/67D1D986/67EF035A" Ref="U22"  Part="1" 
F 0 "U22" H 8900 2650 50  0000 C CNN
F 1 "74LS273" H 8900 2550 50  0000 C CNN
F 2 "" H 8650 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS273" H 8650 1850 50  0001 C CNN
	1    8650 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 67EF0366
P 8650 2650
AR Path="/60F98A4F/67EF0366" Ref="#PWR?"  Part="1" 
AR Path="/60F98A64/67D1D986/67EF0366" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 8650 2400 50  0001 C CNN
F 1 "GND" H 8655 2477 50  0000 C CNN
F 2 "" H 8650 2650 50  0001 C CNN
F 3 "" H 8650 2650 50  0001 C CNN
	1    8650 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 67EF0372
P 8650 1050
AR Path="/60F98A4F/67EF0372" Ref="#PWR?"  Part="1" 
AR Path="/60F98A64/67D1D986/67EF0372" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 8650 900 50  0001 C CNN
F 1 "+5V" H 8665 1223 50  0000 C CNN
F 2 "" H 8650 1050 50  0001 C CNN
F 3 "" H 8650 1050 50  0001 C CNN
	1    8650 1050
	1    0    0    -1  
$EndComp
Text Notes 8400 750  0    100  ~ 0
CH11 Reg.
Wire Wire Line
	8150 1950 7750 1950
Wire Wire Line
	8150 1850 7750 1850
Wire Wire Line
	8150 1750 7750 1750
Wire Wire Line
	8150 1650 7750 1650
Wire Wire Line
	8150 1450 7750 1450
Wire Wire Line
	5550 5750 6050 5750
Wire Wire Line
	4550 5750 3600 5750
Wire Wire Line
	4550 5650 3600 5650
Wire Wire Line
	5550 5650 6050 5650
Wire Wire Line
	5550 5550 6050 5550
Wire Wire Line
	4550 5550 3600 5550
Wire Wire Line
	4550 5450 3600 5450
$Comp
L power:+5V #PWR?
U 1 1 67D9AAE3
P 5050 5150
AR Path="/60F98A4F/67D9AAE3" Ref="#PWR?"  Part="1" 
AR Path="/60F98A64/67D1D986/67D9AAE3" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 5050 5000 50  0001 C CNN
F 1 "+5V" H 5065 5323 50  0000 C CNN
F 2 "" H 5050 5150 50  0001 C CNN
F 3 "" H 5050 5150 50  0001 C CNN
	1    5050 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5450 6050 5450
Wire Wire Line
	5550 6150 6050 6150
Wire Wire Line
	4550 6150 3600 6150
Wire Wire Line
	4550 6050 3600 6050
Wire Wire Line
	5550 6050 6050 6050
Wire Wire Line
	5550 5950 6050 5950
Wire Wire Line
	4550 5950 3600 5950
Wire Wire Line
	4550 5850 3600 5850
Wire Wire Line
	4550 6350 4100 6350
$Comp
L power:GND #PWR?
U 1 1 67D9AACB
P 5050 6750
AR Path="/60F98A4F/67D9AACB" Ref="#PWR?"  Part="1" 
AR Path="/60F98A64/67D1D986/67D9AACB" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 5050 6500 50  0001 C CNN
F 1 "GND" H 5055 6577 50  0000 C CNN
F 2 "" H 5050 6750 50  0001 C CNN
F 3 "" H 5050 6750 50  0001 C CNN
	1    5050 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 6450 3900 6450
$Comp
L 74xx:74LS273 U?
U 1 1 67D9AAB3
P 5050 5950
AR Path="/60F98A4F/67D9AAB3" Ref="U?"  Part="1" 
AR Path="/60F98A64/67D1D986/67D9AAB3" Ref="U21"  Part="1" 
F 0 "U21" H 5300 6750 50  0000 C CNN
F 1 "74LS273" H 5300 6650 50  0000 C CNN
F 2 "" H 5050 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS273" H 5050 5950 50  0001 C CNN
	1    5050 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5850 6050 5850
Wire Wire Line
	9450 1950 9150 1950
Wire Wire Line
	9450 1750 9150 1750
NoConn ~ 9150 1350
NoConn ~ 8150 1350
Wire Bus Line
	3500 3100 3400 3100
Text HLabel 3400 3100 0    50   Input ~ 0
CH[1..15]
Entry Wire Line
	3500 3550 3600 3450
Entry Wire Line
	3500 3650 3600 3550
Entry Wire Line
	3500 3750 3600 3650
Entry Wire Line
	3500 3850 3600 3750
Entry Wire Line
	3500 3950 3600 3850
Entry Wire Line
	3500 4050 3600 3950
Entry Wire Line
	3500 4150 3600 4050
Entry Wire Line
	3500 5550 3600 5450
Entry Wire Line
	3500 5650 3600 5550
Entry Wire Line
	3500 5750 3600 5650
Entry Wire Line
	3500 5850 3600 5750
Entry Wire Line
	3500 5950 3600 5850
Entry Wire Line
	3500 6050 3600 5950
Entry Wire Line
	3500 6150 3600 6050
Entry Wire Line
	3500 6250 3600 6150
Text Label 3600 6150 0    50   ~ 0
CH1
Text Label 3600 6050 0    50   ~ 0
CH2
Text Label 3600 5950 0    50   ~ 0
CH3
Text Label 3600 5850 0    50   ~ 0
CH4
Text Label 3600 5750 0    50   ~ 0
CH5
Text Label 3600 5650 0    50   ~ 0
CH6
Text Label 3600 5550 0    50   ~ 0
CH7
Text Label 3600 5450 0    50   ~ 0
CH8
Text Label 3600 4050 0    50   ~ 0
CH9
Text Label 3600 3950 0    50   ~ 0
CH10
Text Label 3600 3850 0    50   ~ 0
CH11
Text Label 3600 3750 0    50   ~ 0
CH12
Text Label 3600 3650 0    50   ~ 0
CH13
Text Label 3600 3550 0    50   ~ 0
CH14
Text Label 3600 3450 0    50   ~ 0
CH15
Wire Bus Line
	7650 1150 7550 1150
Text HLabel 7550 1150 0    50   Input ~ 0
CH[2..7]
Entry Wire Line
	7650 1550 7750 1450
Entry Wire Line
	7650 1750 7750 1650
Entry Wire Line
	7650 1850 7750 1750
Entry Wire Line
	7650 1950 7750 1850
Entry Wire Line
	7650 2050 7750 1950
Text Label 7750 1950 0    50   ~ 0
CH2
Text Label 7750 1850 0    50   ~ 0
CH3
Text Label 7750 1750 0    50   ~ 0
CH4
Text Label 7750 1650 0    50   ~ 0
CH5
Text Label 7750 1450 0    50   ~ 0
CH7
Wire Bus Line
	6300 2900 6150 2900
Entry Wire Line
	6050 4050 6150 4150
Entry Wire Line
	6050 3950 6150 4050
Entry Wire Line
	6050 3850 6150 3950
Entry Wire Line
	6050 3750 6150 3850
Entry Wire Line
	6050 3650 6150 3750
Entry Wire Line
	6050 3550 6150 3650
Entry Wire Line
	6050 3450 6150 3550
Text HLabel 6300 2900 2    50   Output ~ 0
OW[1..15]
Entry Wire Line
	6050 5450 6150 5550
Entry Wire Line
	6050 5550 6150 5650
Entry Wire Line
	6050 5650 6150 5750
Entry Wire Line
	6050 5750 6150 5850
Entry Wire Line
	6050 5850 6150 5950
Entry Wire Line
	6050 5950 6150 6050
Entry Wire Line
	6050 6050 6150 6150
Entry Wire Line
	6050 6150 6150 6250
Text Label 6050 6150 2    50   ~ 0
OW1
Text Label 6050 6050 2    50   ~ 0
OW2
Text Label 6050 5950 2    50   ~ 0
OW3
Text Label 6050 5850 2    50   ~ 0
OW4
Text Label 6050 5750 2    50   ~ 0
OW5
Text Label 6050 5650 2    50   ~ 0
OW6
Text Label 6050 5550 2    50   ~ 0
OW7
Text Label 6050 5450 2    50   ~ 0
OW8
Text Label 6050 4050 2    50   ~ 0
OW9
Text Label 6050 3950 2    50   ~ 0
OW10
Text Label 6050 3850 2    50   ~ 0
OW11
Text Label 6050 3750 2    50   ~ 0
OW12
Text Label 6050 3650 2    50   ~ 0
OW13
Text Label 6050 3550 2    50   ~ 0
OW14
Text Label 6050 3450 2    50   ~ 0
OW15
Wire Bus Line
	9650 1150 9550 1150
Text HLabel 9650 1150 2    50   Output ~ 0
IND[2..7]
Entry Wire Line
	9450 1450 9550 1550
Entry Wire Line
	9450 1650 9550 1750
Entry Wire Line
	9450 1750 9550 1850
Entry Wire Line
	9450 1850 9550 1950
Entry Wire Line
	9450 1950 9550 2050
Text Label 9450 1950 2    50   ~ 0
IND2
Text Label 9450 1850 2    50   ~ 0
IND3
Text Label 9450 1750 2    50   ~ 0
IND4
Text Label 9450 1650 2    50   ~ 0
IND5
Text Label 9450 1450 2    50   ~ 0
IND7
Connection ~ 3900 2350
Wire Wire Line
	8150 2250 8050 2250
Wire Wire Line
	8050 2250 8050 2750
Wire Wire Line
	8050 2750 7950 2750
$Comp
L 74xx:74LS00 U?
U 4 1 78C759B0
P 7650 2750
AR Path="/60F98A4F/78C759B0" Ref="U?"  Part="4" 
AR Path="/60F98A64/67D1D986/78C759B0" Ref="U7"  Part="4" 
F 0 "U7" H 7650 3075 50  0000 C CNN
F 1 "74LS00" H 7650 2984 50  0000 C CNN
F 2 "" H 7650 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7650 2750 50  0001 C CNN
	4    7650 2750
	1    0    0    -1  
$EndComp
Text HLabel 7350 2850 0    50   Input ~ 0
CLK2
Text HLabel 7350 2650 0    50   Input ~ 0
INDC
NoConn ~ 5650 3350
NoConn ~ 4650 3350
Text Notes 6350 7200 0    100  ~ 0
DSKY-DSP-CHN:  Channel Registers\nCopyright 2021, William Glasford
Entry Wire Line
	7650 1650 7750 1550
Wire Wire Line
	8150 1550 7750 1550
Text Label 7750 1550 0    50   ~ 0
CH6
Entry Wire Line
	9450 1550 9550 1650
Wire Wire Line
	9450 1550 9150 1550
Text Label 9450 1550 2    50   ~ 0
IND6
NoConn ~ 9150 2050
NoConn ~ 8150 2050
Wire Bus Line
	7650 1150 7650 2100
Wire Bus Line
	9550 1150 9550 2100
Wire Bus Line
	6150 2900 6150 6350
Wire Bus Line
	3500 3100 3500 6300
Wire Wire Line
	3900 2350 8150 2350
$EndSCHEMATC
