EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 3 14
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
P 4650 2700
AR Path="/60F98A4F/67D9AAB9" Ref="#PWR?"  Part="1" 
AR Path="/60F98A64/67D1D986/67D9AAB9" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 4650 2450 50  0001 C CNN
F 1 "GND" H 4655 2527 50  0000 C CNN
F 2 "" H 4650 2700 50  0001 C CNN
F 3 "" H 4650 2700 50  0001 C CNN
	1    4650 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 67D9AAD1
P 4650 1100
AR Path="/60F98A4F/67D9AAD1" Ref="#PWR?"  Part="1" 
AR Path="/60F98A64/67D1D986/67D9AAD1" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 4650 950 50  0001 C CNN
F 1 "+5V" H 4665 1273 50  0000 C CNN
F 2 "" H 4650 1100 50  0001 C CNN
F 3 "" H 4650 1100 50  0001 C CNN
	1    4650 1100
	1    0    0    -1  
$EndComp
Text HLabel 1400 2650 0    50   Input ~ 0
DISP
Text HLabel 4000 6900 0    50   Input ~ 0
DSKYRST
Text Notes 4250 800  0    100  ~ 0
CH10 Reg.
Wire Wire Line
	3600 2300 3600 2750
Wire Wire Line
	4150 2300 3600 2300
$Comp
L 74xx:74LS273 U?
U 1 1 67D9AB75
P 4650 1900
AR Path="/60F98A4F/67D9AB75" Ref="U?"  Part="1" 
AR Path="/60F98A64/67D1D986/67D9AB75" Ref="U22"  Part="1" 
F 0 "U22" H 4900 2700 50  0000 C CNN
F 1 "74LS273" H 4900 2600 50  0000 C CNN
F 2 "" H 4650 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS273" H 4650 1900 50  0001 C CNN
	1    4650 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2750 2950 2750
Wire Wire Line
	5300 6000 5000 6000
Wire Wire Line
	5300 6400 5000 6400
Wire Wire Line
	5000 6200 5300 6200
Wire Wire Line
	5150 2100 5550 2100
Wire Wire Line
	5150 2000 5550 2000
Wire Wire Line
	5150 1900 5550 1900
Wire Wire Line
	5150 1800 5550 1800
Wire Wire Line
	5150 1700 5550 1700
Wire Wire Line
	5150 1600 5550 1600
Wire Wire Line
	5150 1500 5550 1500
Wire Wire Line
	4150 1500 3100 1500
Wire Wire Line
	4150 1600 3100 1600
Wire Wire Line
	4150 1700 3100 1700
Wire Wire Line
	4150 1800 3100 1800
Wire Wire Line
	4150 1900 3100 1900
Wire Wire Line
	4150 2000 3100 2000
Wire Wire Line
	4150 2100 3100 2100
$Comp
L 74xx:74LS273 U?
U 1 1 67EF035A
P 4500 6400
AR Path="/60F98A4F/67EF035A" Ref="U?"  Part="1" 
AR Path="/60F98A64/67D1D986/67EF035A" Ref="U20"  Part="1" 
F 0 "U20" H 4750 7200 50  0000 C CNN
F 1 "74LS273" H 4750 7100 50  0000 C CNN
F 2 "" H 4500 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS273" H 4500 6400 50  0001 C CNN
	1    4500 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 67EF0366
P 4500 7200
AR Path="/60F98A4F/67EF0366" Ref="#PWR?"  Part="1" 
AR Path="/60F98A64/67D1D986/67EF0366" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 4500 6950 50  0001 C CNN
F 1 "GND" H 4505 7027 50  0000 C CNN
F 2 "" H 4500 7200 50  0001 C CNN
F 3 "" H 4500 7200 50  0001 C CNN
	1    4500 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 67EF0372
P 4500 5600
AR Path="/60F98A4F/67EF0372" Ref="#PWR?"  Part="1" 
AR Path="/60F98A64/67D1D986/67EF0372" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 4500 5450 50  0001 C CNN
F 1 "+5V" H 4515 5773 50  0000 C CNN
F 2 "" H 4500 5600 50  0001 C CNN
F 3 "" H 4500 5600 50  0001 C CNN
	1    4500 5600
	1    0    0    -1  
$EndComp
Text Notes 4250 5300 0    100  ~ 0
CH11 Reg.
Wire Wire Line
	4000 6500 3600 6500
Wire Wire Line
	4000 6400 3600 6400
Wire Wire Line
	4000 6300 3600 6300
Wire Wire Line
	4000 6200 3600 6200
Wire Wire Line
	4000 6000 3600 6000
Wire Wire Line
	5050 3800 5550 3800
Wire Wire Line
	4050 3800 3100 3800
Wire Wire Line
	4050 3700 3100 3700
Wire Wire Line
	5050 3700 5550 3700
Wire Wire Line
	5050 3600 5550 3600
Wire Wire Line
	4050 3600 3100 3600
Wire Wire Line
	4050 3500 3100 3500
$Comp
L power:+5V #PWR?
U 1 1 67D9AAE3
P 4550 3200
AR Path="/60F98A4F/67D9AAE3" Ref="#PWR?"  Part="1" 
AR Path="/60F98A64/67D1D986/67D9AAE3" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 4550 3050 50  0001 C CNN
F 1 "+5V" H 4565 3373 50  0000 C CNN
F 2 "" H 4550 3200 50  0001 C CNN
F 3 "" H 4550 3200 50  0001 C CNN
	1    4550 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3500 5550 3500
Wire Wire Line
	5050 4200 5550 4200
Wire Wire Line
	4050 4200 3100 4200
Wire Wire Line
	4050 4100 3100 4100
Wire Wire Line
	5050 4100 5550 4100
Wire Wire Line
	5050 4000 5550 4000
Wire Wire Line
	4050 4000 3100 4000
Wire Wire Line
	4050 3900 3100 3900
Wire Wire Line
	4050 4400 3600 4400
$Comp
L power:GND #PWR?
U 1 1 67D9AACB
P 4550 4800
AR Path="/60F98A4F/67D9AACB" Ref="#PWR?"  Part="1" 
AR Path="/60F98A64/67D1D986/67D9AACB" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 4550 4550 50  0001 C CNN
F 1 "GND" H 4555 4627 50  0000 C CNN
F 2 "" H 4550 4800 50  0001 C CNN
F 3 "" H 4550 4800 50  0001 C CNN
	1    4550 4800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS273 U?
U 1 1 67D9AAB3
P 4550 4000
AR Path="/60F98A4F/67D9AAB3" Ref="U?"  Part="1" 
AR Path="/60F98A64/67D1D986/67D9AAB3" Ref="U21"  Part="1" 
F 0 "U21" H 4800 4800 50  0000 C CNN
F 1 "74LS273" H 4800 4700 50  0000 C CNN
F 2 "" H 4550 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS273" H 4550 4000 50  0001 C CNN
	1    4550 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3900 5550 3900
Wire Wire Line
	5300 6500 5000 6500
Wire Wire Line
	5300 6300 5000 6300
NoConn ~ 5000 5900
NoConn ~ 4000 5900
Wire Bus Line
	3000 1150 2900 1150
Text HLabel 2900 1150 0    50   Input ~ 0
CH[1..15]
Entry Wire Line
	3000 1600 3100 1500
Entry Wire Line
	3000 1700 3100 1600
Entry Wire Line
	3000 1800 3100 1700
Entry Wire Line
	3000 1900 3100 1800
Entry Wire Line
	3000 2000 3100 1900
Entry Wire Line
	3000 2100 3100 2000
Entry Wire Line
	3000 2200 3100 2100
Entry Wire Line
	3000 3600 3100 3500
Entry Wire Line
	3000 3700 3100 3600
Entry Wire Line
	3000 3800 3100 3700
Entry Wire Line
	3000 3900 3100 3800
Entry Wire Line
	3000 4000 3100 3900
Entry Wire Line
	3000 4100 3100 4000
Entry Wire Line
	3000 4200 3100 4100
Entry Wire Line
	3000 4300 3100 4200
Text Label 3100 4200 0    50   ~ 0
CH1
Text Label 3100 4100 0    50   ~ 0
CH2
Text Label 3100 4000 0    50   ~ 0
CH3
Text Label 3100 3900 0    50   ~ 0
CH4
Text Label 3100 3800 0    50   ~ 0
CH5
Text Label 3100 3700 0    50   ~ 0
CH6
Text Label 3100 3600 0    50   ~ 0
CH7
Text Label 3100 3500 0    50   ~ 0
CH8
Text Label 3100 2100 0    50   ~ 0
CH9
Text Label 3100 2000 0    50   ~ 0
CH10
Text Label 3100 1900 0    50   ~ 0
CH11
Text Label 3100 1800 0    50   ~ 0
CH12
Text Label 3100 1700 0    50   ~ 0
CH13
Text Label 3100 1600 0    50   ~ 0
CH14
Text Label 3100 1500 0    50   ~ 0
CH15
Wire Bus Line
	3500 5700 3400 5700
Text HLabel 3400 5700 0    50   Input ~ 0
CH[2..7]
Entry Wire Line
	3500 6100 3600 6000
Entry Wire Line
	3500 6300 3600 6200
Entry Wire Line
	3500 6400 3600 6300
Entry Wire Line
	3500 6500 3600 6400
Entry Wire Line
	3500 6600 3600 6500
Text Label 3600 6500 0    50   ~ 0
CH2
Text Label 3600 6400 0    50   ~ 0
CH3
Text Label 3600 6300 0    50   ~ 0
CH4
Text Label 3600 6200 0    50   ~ 0
CH5
Text Label 3600 6000 0    50   ~ 0
CH7
Wire Bus Line
	5800 950  5650 950 
Entry Wire Line
	5550 2100 5650 2200
Entry Wire Line
	5550 2000 5650 2100
Entry Wire Line
	5550 1900 5650 2000
Entry Wire Line
	5550 1800 5650 1900
Entry Wire Line
	5550 1700 5650 1800
Entry Wire Line
	5550 1600 5650 1700
Entry Wire Line
	5550 1500 5650 1600
Text HLabel 5800 950  2    50   Output ~ 0
OW[1..15]
Entry Wire Line
	5550 3500 5650 3600
Entry Wire Line
	5550 3600 5650 3700
Entry Wire Line
	5550 3700 5650 3800
Entry Wire Line
	5550 3800 5650 3900
Entry Wire Line
	5550 3900 5650 4000
Entry Wire Line
	5550 4000 5650 4100
Entry Wire Line
	5550 4100 5650 4200
Entry Wire Line
	5550 4200 5650 4300
Text Label 5550 4200 2    50   ~ 0
OW1
Text Label 5550 4100 2    50   ~ 0
OW2
Text Label 5550 4000 2    50   ~ 0
OW3
Text Label 5550 3900 2    50   ~ 0
OW4
Text Label 5550 3800 2    50   ~ 0
OW5
Text Label 5550 3700 2    50   ~ 0
OW6
Text Label 5550 3600 2    50   ~ 0
OW7
Text Label 5550 3500 2    50   ~ 0
OW8
Text Label 5550 2100 2    50   ~ 0
OW9
Text Label 5550 2000 2    50   ~ 0
OW10
Text Label 5550 1900 2    50   ~ 0
OW11
Text Label 5550 1800 2    50   ~ 0
OW12
Text Label 5550 1700 2    50   ~ 0
OW13
Text Label 5550 1600 2    50   ~ 0
OW14
Text Label 5550 1500 2    50   ~ 0
OW15
Wire Bus Line
	5500 5700 5400 5700
Text HLabel 5500 5700 2    50   Output ~ 0
IND[2..7]
Entry Wire Line
	5300 6000 5400 6100
Entry Wire Line
	5300 6200 5400 6300
Entry Wire Line
	5300 6300 5400 6400
Entry Wire Line
	5300 6400 5400 6500
Entry Wire Line
	5300 6500 5400 6600
Text Label 5300 6500 2    50   ~ 0
IND2
Text Label 5300 6400 2    50   ~ 0
IND3
Text Label 5300 6300 2    50   ~ 0
IND4
Text Label 5300 6200 2    50   ~ 0
IND5
Text Label 5300 6000 2    50   ~ 0
IND7
Text HLabel 2250 6700 0    50   Input ~ 0
INDC
NoConn ~ 5150 1400
NoConn ~ 4150 1400
Text Notes 6500 7200 0    100  ~ 0
DSKY-DSP-CHN:  Channel Registers\nCopyright 2021, William Glasford
Entry Wire Line
	3500 6200 3600 6100
Wire Wire Line
	4000 6100 3600 6100
Text Label 3600 6100 0    50   ~ 0
CH6
Entry Wire Line
	5300 6100 5400 6200
Wire Wire Line
	5300 6100 5000 6100
Text Label 5300 6100 2    50   ~ 0
IND6
NoConn ~ 5000 6600
NoConn ~ 4000 6600
Text HLabel 4150 2400 0    50   Input ~ 0
DSKYRST
Text HLabel 4050 4500 0    50   Input ~ 0
DSKYRST
Connection ~ 3600 2750
Wire Wire Line
	3600 2750 3600 4400
$Comp
L 74xx:74LS08 U7
U 4 1 61B5C630
P 3150 6800
F 0 "U7" H 3150 7125 50  0000 C CNN
F 1 "74LS08" H 3150 7034 50  0000 C CNN
F 2 "" H 3150 6800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3150 6800 50  0001 C CNN
	4    3150 6800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U7
U 2 1 61B5DD51
P 2650 2750
F 0 "U7" H 2650 3075 50  0000 C CNN
F 1 "74LS08" H 2650 2984 50  0000 C CNN
F 2 "" H 2650 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2650 2750 50  0001 C CNN
	2    2650 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 6800 4000 6800
Text HLabel 2350 2850 0    50   Input ~ 0
CLK2
Text HLabel 2850 6900 0    50   Input ~ 0
CLK2
$Comp
L 74xx:74LS04 U5
U 4 1 61B646F9
P 2550 6700
F 0 "U5" H 2550 7017 50  0000 C CNN
F 1 "74LS04" H 2550 6926 50  0000 C CNN
F 2 "" H 2550 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2550 6700 50  0001 C CNN
	4    2550 6700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U5
U 3 1 6221121E
P 1700 2650
F 0 "U5" H 1700 2967 50  0000 C CNN
F 1 "74LS04" H 1700 2876 50  0000 C CNN
F 2 "" H 1700 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1700 2650 50  0001 C CNN
	3    1700 2650
	1    0    0    -1  
$EndComp
Text HLabel 2050 3450 0    50   Input ~ 0
CLK3
$Comp
L 74xx:74LS08 U?
U 3 1 6246BD7F
P 2350 3350
AR Path="/60F98A64/70393FF4/6246BD7F" Ref="U?"  Part="3" 
AR Path="/60F98A64/67D1D986/6246BD7F" Ref="U7"  Part="3" 
F 0 "U7" H 2350 3675 50  0000 C CNN
F 1 "74LS08" H 2350 3584 50  0000 C CNN
F 2 "" H 2350 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2350 3350 50  0001 C CNN
	3    2350 3350
	1    0    0    -1  
$EndComp
Text HLabel 2650 3350 2    50   Output ~ 0
OUTDAT
Wire Wire Line
	2050 2650 2050 3250
Connection ~ 2050 2650
Wire Wire Line
	2050 2650 2350 2650
Wire Wire Line
	2000 2650 2050 2650
Wire Bus Line
	3500 5700 3500 6650
Wire Bus Line
	5400 5700 5400 6650
Wire Bus Line
	5650 950  5650 4400
Wire Bus Line
	3000 1150 3000 4350
$EndSCHEMATC
