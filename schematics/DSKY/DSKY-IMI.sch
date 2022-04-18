EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 12 14
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 7450 2700 2    50   Output ~ 0
CLK2
Text HLabel 6250 2600 2    50   Output ~ 0
CLK1
Wire Wire Line
	3250 2500 3000 2500
Wire Wire Line
	3250 2600 3000 2600
Wire Wire Line
	3250 2700 3000 2700
Wire Wire Line
	3250 2800 3000 2800
Wire Wire Line
	3250 2900 3000 2900
Wire Wire Line
	3250 3000 3000 3000
Wire Wire Line
	3250 3100 3000 3100
Wire Wire Line
	3250 3200 3000 3200
Wire Wire Line
	3750 3400 4050 3400
Wire Wire Line
	3750 3300 4050 3300
Wire Wire Line
	3750 3200 4050 3200
Wire Wire Line
	3750 3100 4050 3100
Wire Wire Line
	3750 3000 4050 3000
Text HLabel 6250 2900 2    50   Output ~ 0
STBY
Text HLabel 3750 2900 2    50   Input ~ 0
KB_STR
Text HLabel 3750 2800 2    50   Output ~ 0
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
L power:GND #PWR0196
U 1 1 63206B7C
P 9600 1000
F 0 "#PWR0196" H 9600 750 50  0001 C CNN
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
L power:+5V #PWR0197
U 1 1 6320B47A
P 9100 1000
F 0 "#PWR0197" H 9100 850 50  0001 C CNN
F 1 "+5V" H 9115 1173 50  0000 C CNN
F 2 "" H 9100 1000 50  0001 C CNN
F 3 "" H 9100 1000 50  0001 C CNN
	1    9100 1000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x08_Counter_Clockwise J103
U 1 1 62CF5CC0
P 6050 2900
F 0 "J103" H 6100 3417 50  0000 C CNN
F 1 "Conn_02x08" H 6100 3326 50  0000 C CNN
F 2 "" H 6050 2900 50  0001 C CNN
F 3 "~" H 6050 2900 50  0001 C CNN
	1    6050 2900
	-1   0    0    -1  
$EndComp
Wire Bus Line
	2900 2200 2800 2200
Text HLabel 2800 2200 0    50   BiDi ~ 0
CH[1..15]
Entry Wire Line
	2900 2600 3000 2500
Entry Wire Line
	2900 2700 3000 2600
Entry Wire Line
	2900 2800 3000 2700
Entry Wire Line
	2900 2900 3000 2800
Entry Wire Line
	2900 3000 3000 2900
Entry Wire Line
	2900 3100 3000 3000
Entry Wire Line
	2900 3200 3000 3100
Entry Wire Line
	2900 3300 3000 3200
Entry Wire Line
	4150 3500 4050 3400
Entry Wire Line
	4150 3400 4050 3300
Entry Wire Line
	4150 3300 4050 3200
Entry Wire Line
	4150 3200 4050 3100
Entry Wire Line
	4150 3100 4050 3000
Text Label 3000 2500 0    50   ~ 0
CH1
Text Label 3000 2600 0    50   ~ 0
CH2
Text Label 3000 2700 0    50   ~ 0
CH3
Text Label 3000 2800 0    50   ~ 0
CH4
Text Label 3000 2900 0    50   ~ 0
CH5
Text Label 3000 3000 0    50   ~ 0
CH6
Text Label 3000 3100 0    50   ~ 0
CH7
Text Label 3000 3200 0    50   ~ 0
CH8
Text Label 4050 3400 2    50   ~ 0
CH11
Text Label 4050 3300 2    50   ~ 0
CH12
Text Label 4050 3200 2    50   ~ 0
CH13
Text Label 4050 3100 2    50   ~ 0
CH14
Text Label 4050 3000 2    50   ~ 0
CH15
Text Notes 3950 2100 2    80   ~ 0
Channel Bus
Text Notes 6200 2250 2    80   ~ 0
To CTL
Text HLabel 6250 3000 2    50   Output ~ 0
KBD1
Text HLabel 6250 3100 2    50   Output ~ 0
DISP
Text HLabel 6250 3200 2    50   Output ~ 0
INDC
Text Notes 6450 7150 0    100  ~ 0
DSKY-IMI:  Interface\nCopyright 2021, William Glasford
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J104
U 1 1 612DCF54
P 3450 2900
F 0 "J104" H 3500 3517 50  0000 C CNN
F 1 "Conn_02x10" H 3500 3426 50  0000 C CNN
F 2 "" H 3450 2900 50  0001 C CNN
F 3 "~" H 3450 2900 50  0001 C CNN
	1    3450 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 3300 3000 3300
Wire Wire Line
	3250 3400 3000 3400
Entry Wire Line
	2900 3400 3000 3300
Entry Wire Line
	2900 3500 3000 3400
Text Label 3000 3300 0    50   ~ 0
CH9
Text Label 3000 3400 0    50   ~ 0
CH10
NoConn ~ 3750 2500
NoConn ~ 3750 2600
NoConn ~ 3750 2700
NoConn ~ 5750 2600
NoConn ~ 5750 2700
NoConn ~ 5750 2800
NoConn ~ 5750 2900
NoConn ~ 5750 3000
Text HLabel 5750 3300 0    50   Output ~ 0
RPRO
Text HLabel 8500 3050 2    50   Output ~ 0
DSKYRST
$Comp
L 74xx:74LS00 U?
U 1 1 6395652F
P 8200 3050
AR Path="/5F5E4E3B/5F5F8347/6395652F" Ref="U?"  Part="1" 
AR Path="/60F98A72/6395652F" Ref="U?"  Part="1" 
AR Path="/66BEE9C8/6395652F" Ref="U?"  Part="1" 
AR Path="/60F98A72/66CE2F9E/6395652F" Ref="U?"  Part="1" 
AR Path="/60F989FD/6395652F" Ref="U6"  Part="1" 
F 0 "U6" H 8200 3375 50  0000 C CNN
F 1 "74LS00" H 8200 3284 50  0000 C CNN
F 2 "" H 8200 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 8200 3050 50  0001 C CNN
	1    8200 3050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 2 1 63956535
P 7600 3150
AR Path="/5F5E4E3B/5F5F8347/63956535" Ref="U?"  Part="6" 
AR Path="/60F98A72/63956535" Ref="U?"  Part="2" 
AR Path="/66BEE9C8/63956535" Ref="U?"  Part="6" 
AR Path="/60F98A72/66CE2F9E/63956535" Ref="U?"  Part="6" 
AR Path="/60F989FD/63956535" Ref="U5"  Part="2" 
F 0 "U5" H 7700 2900 50  0000 C CNN
F 1 "74LS04" H 7700 3000 50  0000 C CNN
F 2 "" H 7600 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7600 3150 50  0001 C CNN
	2    7600 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2800 7100 2800
Wire Wire Line
	7100 2800 7100 3150
Wire Wire Line
	7100 3150 7300 3150
Wire Wire Line
	6250 2700 7300 2700
Wire Wire Line
	7450 2700 7300 2700
Wire Wire Line
	7300 2950 7900 2950
Text Notes 3950 4650 0    70   ~ 0
Note: RPRO & PARALM are Active High,\nthe rest are Active Low with the clock \nsignals and KB_STR being pulses.
Wire Bus Line
	2900 3550 4150 3550
Connection ~ 7300 2700
NoConn ~ 6250 3300
Text HLabel 5750 3200 0    50   Output ~ 0
CLK3
Wire Wire Line
	7300 2700 7300 2950
NoConn ~ 5750 3100
Wire Bus Line
	4150 3000 4150 3550
Wire Bus Line
	2900 2200 2900 3550
$EndSCHEMATC
