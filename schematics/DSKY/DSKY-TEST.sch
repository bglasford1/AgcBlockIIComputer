EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 11 14
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 6500 7200 0    100  ~ 0
DSKY-TEST:  Raspberry PI I/F\nCopyright 2021, William Glasford
Wire Wire Line
	2050 5450 1800 5450
Wire Wire Line
	2050 5550 1800 5550
Wire Wire Line
	2050 5650 1800 5650
Wire Wire Line
	2050 5750 1800 5750
Wire Wire Line
	2050 5850 1800 5850
Wire Wire Line
	2050 5950 1800 5950
Wire Wire Line
	2050 6050 1800 6050
Wire Wire Line
	2050 6150 1800 6150
Wire Wire Line
	2550 6350 2850 6350
Wire Wire Line
	2550 6250 2850 6250
Wire Wire Line
	2550 6150 2850 6150
Wire Wire Line
	2550 6050 2850 6050
Wire Wire Line
	2550 5950 2850 5950
Entry Wire Line
	1700 5550 1800 5450
Entry Wire Line
	1700 5650 1800 5550
Entry Wire Line
	1700 5750 1800 5650
Entry Wire Line
	1700 5850 1800 5750
Entry Wire Line
	1700 5950 1800 5850
Entry Wire Line
	1700 6050 1800 5950
Entry Wire Line
	1700 6150 1800 6050
Entry Wire Line
	1700 6250 1800 6150
Entry Wire Line
	2950 6450 2850 6350
Entry Wire Line
	2950 6350 2850 6250
Entry Wire Line
	2950 6250 2850 6150
Entry Wire Line
	2950 6150 2850 6050
Entry Wire Line
	2950 6050 2850 5950
Text Label 1800 5450 0    50   ~ 0
CH1
Text Label 1800 5550 0    50   ~ 0
CH2
Text Label 1800 5650 0    50   ~ 0
CH3
Text Label 1800 5750 0    50   ~ 0
CH4
Text Label 1800 5850 0    50   ~ 0
CH5
Text Label 1800 5950 0    50   ~ 0
CH6
Text Label 1800 6050 0    50   ~ 0
CH7
Text Label 1800 6150 0    50   ~ 0
CH8
Text Label 2850 6350 2    50   ~ 0
CH11
Text Label 2850 6250 2    50   ~ 0
CH12
Text Label 2850 6150 2    50   ~ 0
CH13
Text Label 2850 6050 2    50   ~ 0
CH14
Text Label 2850 5950 2    50   ~ 0
CH15
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J?
U 1 1 62F04190
P 2250 5850
AR Path="/60F989FD/62F04190" Ref="J?"  Part="1" 
AR Path="/62ECFB9F/62F04190" Ref="J204"  Part="1" 
F 0 "J204" H 2300 6467 50  0000 C CNN
F 1 "Conn_02x10" H 2300 6376 50  0000 C CNN
F 2 "" H 2250 5850 50  0001 C CNN
F 3 "~" H 2250 5850 50  0001 C CNN
	1    2250 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 6250 1800 6250
Wire Wire Line
	2050 6350 1800 6350
Entry Wire Line
	1700 6350 1800 6250
Entry Wire Line
	1700 6450 1800 6350
Text Label 1800 6250 0    50   ~ 0
CH9
Text Label 1800 6350 0    50   ~ 0
CH10
NoConn ~ 2550 5450
NoConn ~ 2550 5550
NoConn ~ 2550 5650
$Comp
L Connector_Generic:Conn_02x08_Counter_Clockwise J?
U 1 1 62F041BA
P 2250 7150
AR Path="/60F989FD/62F041BA" Ref="J?"  Part="1" 
AR Path="/62ECFB9F/62F041BA" Ref="J203"  Part="1" 
F 0 "J203" H 2300 7667 50  0000 C CNN
F 1 "Conn_02x08" H 2300 7576 50  0000 C CNN
F 2 "" H 2250 7150 50  0001 C CNN
F 3 "~" H 2250 7150 50  0001 C CNN
	1    2250 7150
	1    0    0    -1  
$EndComp
NoConn ~ 2550 6850
NoConn ~ 2550 6950
NoConn ~ 2550 7050
NoConn ~ 2550 7150
NoConn ~ 2550 7250
Wire Wire Line
	2050 6850 1800 6850
Wire Wire Line
	2050 6950 1800 6950
Entry Wire Line
	1700 6950 1800 6850
Entry Wire Line
	1700 7050 1800 6950
Text Label 1800 6850 0    50   ~ 0
CLK1
Text Label 1800 6950 0    50   ~ 0
CLK2
Wire Wire Line
	2050 7050 1800 7050
Entry Wire Line
	1700 7150 1800 7050
Text Label 1800 7050 0    50   ~ 0
RST
Wire Wire Line
	2050 7250 1800 7250
Wire Wire Line
	2050 7350 1800 7350
Entry Wire Line
	1700 7350 1800 7250
Entry Wire Line
	1700 7450 1800 7350
Text Label 1800 7250 0    50   ~ 0
KBD1
Text Label 1800 7350 0    50   ~ 0
DISP
Wire Wire Line
	2050 7450 1800 7450
Entry Wire Line
	1700 7550 1800 7450
Text Label 1800 7450 0    50   ~ 0
INDC
Wire Wire Line
	2550 7450 2850 7450
Entry Wire Line
	2950 7550 2850 7450
Text Label 2850 7450 2    50   ~ 0
CLK3
Wire Wire Line
	2550 7550 2850 7550
Entry Wire Line
	2950 7650 2850 7550
Text Label 2850 7550 2    50   ~ 0
RPRO
Wire Bus Line
	7600 700  8850 700 
Entry Wire Line
	7600 1200 7700 1100
Entry Wire Line
	7600 1300 7700 1200
Entry Wire Line
	7600 1400 7700 1300
Entry Wire Line
	7600 1600 7700 1500
Entry Wire Line
	7600 1800 7700 1700
Entry Wire Line
	7600 2000 7700 1900
Entry Wire Line
	7600 2100 7700 2000
Entry Wire Line
	7600 2200 7700 2100
Entry Wire Line
	7600 2500 7700 2400
Entry Wire Line
	7600 2600 7700 2500
Entry Wire Line
	7600 2700 7700 2600
Entry Wire Line
	7600 2800 7700 2700
Entry Wire Line
	7600 2900 7700 2800
Entry Wire Line
	8850 3000 8750 2900
Entry Wire Line
	8850 2900 8750 2800
Entry Wire Line
	8850 2800 8750 2700
Entry Wire Line
	8850 1600 8750 1500
Entry Wire Line
	8850 1500 8750 1400
Entry Wire Line
	8850 1400 8750 1300
Entry Wire Line
	8850 2300 8750 2200
Entry Wire Line
	8850 2200 8750 2100
Entry Wire Line
	8850 1900 8750 1800
Entry Wire Line
	8850 1800 8750 1700
Entry Wire Line
	8850 2600 8750 2500
NoConn ~ 2050 7550
Entry Wire Line
	7600 1700 7700 1600
Wire Wire Line
	2050 7150 1800 7150
Entry Wire Line
	1700 7250 1800 7150
Text Label 1800 7150 0    50   ~ 0
STBY
Entry Wire Line
	8850 2100 8750 2000
Text Label 8750 2000 2    50   ~ 0
RSTBY
Wire Wire Line
	8450 2000 8750 2000
Text Label 7700 1600 0    50   ~ 0
RPALM
Wire Wire Line
	7950 1600 7700 1600
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J?
U 1 1 62F041AE
P 8150 1900
AR Path="/60F989FD/62F041AE" Ref="J?"  Part="1" 
AR Path="/62ECFB9F/62F041AE" Ref="J300"  Part="1" 
F 0 "J300" H 8200 3017 50  0000 C CNN
F 1 "RPI_Connector" H 8200 2926 50  0000 C CNN
F 2 "" H 8150 1900 50  0001 C CNN
F 3 "~" H 8150 1900 50  0001 C CNN
	1    8150 1900
	1    0    0    -1  
$EndComp
Text Label 8750 2500 2    50   ~ 0
RCH11
Wire Wire Line
	8450 2500 8750 2500
Text Label 8750 1700 2    50   ~ 0
RKBSTR
Text Label 8750 1800 2    50   ~ 0
RRPRO
Wire Wire Line
	8450 1700 8750 1700
Wire Wire Line
	8450 1800 8750 1800
Text Label 8750 2100 2    50   ~ 0
RCH7
Text Label 8750 2200 2    50   ~ 0
RCH6
Wire Wire Line
	8450 2100 8750 2100
Wire Wire Line
	8450 2200 8750 2200
Text Label 8750 1300 2    50   ~ 0
RCH13
Wire Wire Line
	8450 1300 8750 1300
Text Label 8750 1400 2    50   ~ 0
RCH14
Text Label 8750 1500 2    50   ~ 0
RCLK2
Wire Wire Line
	8450 1400 8750 1400
Wire Wire Line
	8450 1500 8750 1500
Text Label 8750 2700 2    50   ~ 0
RCH15
Wire Wire Line
	8450 2700 8750 2700
Text Label 8750 2800 2    50   ~ 0
RDISP
Text Label 8750 2900 2    50   ~ 0
RINDC
Wire Wire Line
	8450 2800 8750 2800
Wire Wire Line
	8450 2900 8750 2900
Text Label 7700 2800 0    50   ~ 0
RRST
Text Label 7700 2700 0    50   ~ 0
RCLK3
Wire Wire Line
	7950 2800 7700 2800
Wire Wire Line
	7950 2700 7700 2700
Text Label 7700 2600 0    50   ~ 0
RCH12
Text Label 7700 2500 0    50   ~ 0
RCH5
Text Label 7700 2400 0    50   ~ 0
RCH4
Wire Wire Line
	7950 2600 7700 2600
Wire Wire Line
	7950 2500 7700 2500
Wire Wire Line
	7950 2400 7700 2400
Text Label 7700 2100 0    50   ~ 0
RCH10
Text Label 7700 2000 0    50   ~ 0
RCH8
Text Label 7700 1900 0    50   ~ 0
RCH9
Wire Wire Line
	7950 2100 7700 2100
Wire Wire Line
	7950 2000 7700 2000
Wire Wire Line
	7950 1900 7700 1900
Text Label 7700 1700 0    50   ~ 0
RKBD1
Text Label 7700 1500 0    50   ~ 0
RCLK1
Wire Wire Line
	7950 1700 7700 1700
Wire Wire Line
	7950 1500 7700 1500
Text Label 7700 1300 0    50   ~ 0
RCH3
Text Label 7700 1200 0    50   ~ 0
RCH2
Text Label 7700 1100 0    50   ~ 0
RCH1
Wire Wire Line
	7950 1300 7700 1300
Wire Wire Line
	7950 1200 7700 1200
Wire Wire Line
	7950 1100 7700 1100
NoConn ~ 7950 1800
NoConn ~ 8450 1900
NoConn ~ 8450 1600
NoConn ~ 7950 2200
NoConn ~ 8450 2300
NoConn ~ 8450 2400
NoConn ~ 8450 2600
NoConn ~ 7950 1400
NoConn ~ 8450 1100
Entry Wire Line
	2950 5950 2850 5850
Text Label 2850 5850 2    50   ~ 0
KBSTR
Wire Wire Line
	2550 5850 2850 5850
Entry Wire Line
	2950 5850 2850 5750
Text Label 2850 5750 2    50   ~ 0
PALM
Wire Wire Line
	2550 5750 2850 5750
NoConn ~ 8450 1000
NoConn ~ 7950 2900
Connection ~ 7600 700 
Entry Wire Line
	8850 1300 8750 1200
Text Label 8750 1200 2    50   ~ 0
RGND
Wire Wire Line
	8450 1200 8750 1200
NoConn ~ 2550 7350
$Comp
L 74xx:74LS245 U87
U 1 1 62C93B49
P 2100 1800
F 0 "U87" H 2300 2600 50  0000 C CNN
F 1 "74LS245" H 2350 2500 50  0000 C CNN
F 2 "" H 2100 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 2100 1800 50  0001 C CNN
	1    2100 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0193
U 1 1 62CC5E70
P 1600 2300
F 0 "#PWR0193" H 1600 2050 50  0001 C CNN
F 1 "GND" H 1605 2127 50  0000 C CNN
F 2 "" H 1600 2300 50  0001 C CNN
F 3 "" H 1600 2300 50  0001 C CNN
	1    1600 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1300 1350 1300
Wire Wire Line
	1600 1400 1350 1400
Wire Wire Line
	1600 1500 1350 1500
Wire Wire Line
	1600 1600 1350 1600
Wire Wire Line
	1600 1700 1350 1700
Wire Wire Line
	1600 1800 1350 1800
Wire Wire Line
	1600 1900 1350 1900
Wire Wire Line
	1600 2000 1350 2000
Entry Wire Line
	1250 1400 1350 1300
Entry Wire Line
	1250 1500 1350 1400
Entry Wire Line
	1250 1600 1350 1500
Entry Wire Line
	1250 1700 1350 1600
Entry Wire Line
	1250 1800 1350 1700
Entry Wire Line
	1250 1900 1350 1800
Entry Wire Line
	1250 2000 1350 1900
Entry Wire Line
	1250 2100 1350 2000
Text Label 2850 1300 2    50   ~ 0
CH1
Text Label 2850 1400 2    50   ~ 0
CH2
Text Label 2850 1500 2    50   ~ 0
CH3
Text Label 2850 1600 2    50   ~ 0
CH4
Text Label 2850 1700 2    50   ~ 0
CH5
Text Label 2850 1800 2    50   ~ 0
CH6
Text Label 2850 1900 2    50   ~ 0
CH7
Text Label 2850 2000 2    50   ~ 0
CH8
Wire Wire Line
	2600 1300 2850 1300
Wire Wire Line
	2600 1400 2850 1400
Wire Wire Line
	2600 1500 2850 1500
Wire Wire Line
	2600 1600 2850 1600
Wire Wire Line
	2600 1700 2850 1700
Wire Wire Line
	2600 1800 2850 1800
Wire Wire Line
	2600 1900 2850 1900
Wire Wire Line
	2600 2000 2850 2000
Entry Wire Line
	2950 1400 2850 1300
Entry Wire Line
	2950 1500 2850 1400
Entry Wire Line
	2950 1600 2850 1500
Entry Wire Line
	2950 1700 2850 1600
Entry Wire Line
	2950 1800 2850 1700
Entry Wire Line
	2950 1900 2850 1800
Entry Wire Line
	2950 2000 2850 1900
Entry Wire Line
	2950 2100 2850 2000
Text Label 1350 1300 0    50   ~ 0
RCH1
Text Label 1350 1400 0    50   ~ 0
RCH2
Text Label 1350 1500 0    50   ~ 0
RCH3
Text Label 1350 1600 0    50   ~ 0
RCH4
Text Label 1350 1700 0    50   ~ 0
RCH5
Text Label 1350 1800 0    50   ~ 0
RCH6
Text Label 1350 1900 0    50   ~ 0
RCH7
Text Label 1350 2000 0    50   ~ 0
RCH8
$Comp
L 74xx:74LS245 U88
U 1 1 62DD7D8D
P 2100 3900
F 0 "U88" H 2300 4700 50  0000 C CNN
F 1 "74LS245" H 2350 4600 50  0000 C CNN
F 2 "" H 2100 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 2100 3900 50  0001 C CNN
	1    2100 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0195
U 1 1 62DD7D93
P 1600 4400
F 0 "#PWR0195" H 1600 4150 50  0001 C CNN
F 1 "GND" H 1605 4227 50  0000 C CNN
F 2 "" H 1600 4400 50  0001 C CNN
F 3 "" H 1600 4400 50  0001 C CNN
	1    1600 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 3400 1350 3400
Wire Wire Line
	1600 3500 1350 3500
Wire Wire Line
	1600 3600 1350 3600
Wire Wire Line
	1600 3700 1350 3700
Wire Wire Line
	1600 3800 1350 3800
Wire Wire Line
	1600 3900 1350 3900
Wire Wire Line
	1600 4000 1350 4000
Entry Wire Line
	1250 3500 1350 3400
Entry Wire Line
	1250 3600 1350 3500
Entry Wire Line
	1250 3700 1350 3600
Entry Wire Line
	1250 3800 1350 3700
Entry Wire Line
	1250 3900 1350 3800
Entry Wire Line
	1250 4000 1350 3900
Entry Wire Line
	1250 4100 1350 4000
Text Label 2850 3400 2    50   ~ 0
CH9
Text Label 2850 3500 2    50   ~ 0
CH10
Text Label 2850 3600 2    50   ~ 0
CH11
Text Label 2850 3700 2    50   ~ 0
CH12
Text Label 2850 3800 2    50   ~ 0
CH13
Text Label 2850 3900 2    50   ~ 0
CH14
Text Label 2850 4000 2    50   ~ 0
CH15
Wire Wire Line
	2600 3400 2850 3400
Wire Wire Line
	2600 3500 2850 3500
Wire Wire Line
	2600 3600 2850 3600
Wire Wire Line
	2600 3700 2850 3700
Wire Wire Line
	2600 3800 2850 3800
Wire Wire Line
	2600 3900 2850 3900
Wire Wire Line
	2600 4000 2850 4000
Entry Wire Line
	2950 3500 2850 3400
Entry Wire Line
	2950 3600 2850 3500
Entry Wire Line
	2950 3700 2850 3600
Entry Wire Line
	2950 3800 2850 3700
Entry Wire Line
	2950 3900 2850 3800
Entry Wire Line
	2950 4000 2850 3900
Entry Wire Line
	2950 4100 2850 4000
Text Label 1350 3400 0    50   ~ 0
RCH9
Text Label 1350 3500 0    50   ~ 0
RCH10
Text Label 1350 3600 0    50   ~ 0
RCH11
Text Label 1350 3700 0    50   ~ 0
RCH12
Text Label 1350 3800 0    50   ~ 0
RCH13
Text Label 1350 3900 0    50   ~ 0
RCH14
Text Label 1350 4000 0    50   ~ 0
RCH15
NoConn ~ 2600 4100
NoConn ~ 1600 4100
Wire Wire Line
	1600 2200 850  2200
Wire Wire Line
	850  4300 1600 4300
Entry Wire Line
	7600 2400 7700 2300
Text Label 7700 2300 0    50   ~ 0
CHDIR
Wire Wire Line
	7950 2300 7700 2300
Wire Wire Line
	1150 3200 850  3200
Entry Wire Line
	1250 3300 1150 3200
Text Label 1150 3200 2    50   ~ 0
CHDIR
$Comp
L 74xx:74LS245 U89
U 1 1 62E10CA0
P 4850 1750
F 0 "U89" H 5050 2550 50  0000 C CNN
F 1 "74LS245" H 5100 2450 50  0000 C CNN
F 2 "" H 4850 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 4850 1750 50  0001 C CNN
	1    4850 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0262
U 1 1 62E10CA6
P 4350 2250
F 0 "#PWR0262" H 4350 2000 50  0001 C CNN
F 1 "GND" H 4355 2077 50  0000 C CNN
F 2 "" H 4350 2250 50  0001 C CNN
F 3 "" H 4350 2250 50  0001 C CNN
	1    4350 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1250 4100 1250
Entry Wire Line
	4000 1350 4100 1250
Text Label 5700 1250 2    50   ~ 0
KBSTR
Wire Wire Line
	5350 1250 5700 1250
Entry Wire Line
	5800 1350 5700 1250
Text Label 4100 1250 0    50   ~ 0
RKBSTR
NoConn ~ 5350 1350
NoConn ~ 5350 1450
NoConn ~ 5350 1550
NoConn ~ 5350 1650
NoConn ~ 5350 1750
NoConn ~ 5350 1850
NoConn ~ 5350 1950
NoConn ~ 4350 1350
NoConn ~ 4350 1450
NoConn ~ 4350 1550
NoConn ~ 4350 1650
NoConn ~ 4350 1750
NoConn ~ 4350 1850
NoConn ~ 4350 1950
$Comp
L 74xx:74LS245 U90
U 1 1 62EA04B1
P 4850 3850
F 0 "U90" H 5050 4650 50  0000 C CNN
F 1 "74LS245" H 5100 4550 50  0000 C CNN
F 2 "" H 4850 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 4850 3850 50  0001 C CNN
	1    4850 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0263
U 1 1 62EA04B7
P 4350 4350
F 0 "#PWR0263" H 4350 4100 50  0001 C CNN
F 1 "GND" H 4355 4177 50  0000 C CNN
F 2 "" H 4350 4350 50  0001 C CNN
F 3 "" H 4350 4350 50  0001 C CNN
	1    4350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 3350 4100 3350
Wire Wire Line
	4350 3450 4100 3450
Wire Wire Line
	4350 3550 4100 3550
Wire Wire Line
	4350 3650 4100 3650
Wire Wire Line
	4350 3750 4100 3750
Wire Wire Line
	4350 3850 4100 3850
Wire Wire Line
	4350 3950 4100 3950
Wire Wire Line
	4350 4050 4100 4050
Entry Wire Line
	4000 3450 4100 3350
Entry Wire Line
	4000 3550 4100 3450
Entry Wire Line
	4000 3650 4100 3550
Entry Wire Line
	4000 3750 4100 3650
Entry Wire Line
	4000 3850 4100 3750
Entry Wire Line
	4000 3950 4100 3850
Entry Wire Line
	4000 4050 4100 3950
Entry Wire Line
	4000 4150 4100 4050
Text Label 5700 3350 2    50   ~ 0
CLK1
Text Label 5700 3450 2    50   ~ 0
CLK2
Text Label 5700 3550 2    50   ~ 0
CLK3
Text Label 5700 3650 2    50   ~ 0
RST
Text Label 5700 3750 2    50   ~ 0
STBY
Text Label 5700 3850 2    50   ~ 0
KBD1
Text Label 5700 3950 2    50   ~ 0
DISP
Text Label 5700 4050 2    50   ~ 0
INDC
Entry Wire Line
	5800 3450 5700 3350
Entry Wire Line
	5800 3550 5700 3450
Entry Wire Line
	5800 3650 5700 3550
Entry Wire Line
	5800 3750 5700 3650
Entry Wire Line
	5800 3850 5700 3750
Entry Wire Line
	5800 3950 5700 3850
Entry Wire Line
	5800 4050 5700 3950
Entry Wire Line
	5800 4150 5700 4050
Text Label 4100 3350 0    50   ~ 0
RCLK1
Text Label 4100 3450 0    50   ~ 0
RCLK2
Text Label 4100 3550 0    50   ~ 0
RCLK3
Text Label 4100 3650 0    50   ~ 0
RRST
Text Label 4100 3750 0    50   ~ 0
RSTBY
Text Label 4100 3850 0    50   ~ 0
RKBD1
Text Label 4100 3950 0    50   ~ 0
RDISP
Text Label 4100 4050 0    50   ~ 0
RINDC
$Comp
L 74xx:74LS245 U91
U 1 1 62EBBAC1
P 4850 5950
F 0 "U91" H 5050 6750 50  0000 C CNN
F 1 "74LS245" H 5100 6650 50  0000 C CNN
F 2 "" H 4850 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 4850 5950 50  0001 C CNN
	1    4850 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0266
U 1 1 62EBBAC7
P 4350 6450
F 0 "#PWR0266" H 4350 6200 50  0001 C CNN
F 1 "GND" H 4355 6277 50  0000 C CNN
F 2 "" H 4350 6450 50  0001 C CNN
F 3 "" H 4350 6450 50  0001 C CNN
	1    4350 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5450 4100 5450
Wire Wire Line
	4350 5550 4100 5550
Entry Wire Line
	4000 5550 4100 5450
Entry Wire Line
	4000 5650 4100 5550
Text Label 5700 5450 2    50   ~ 0
RPRO
Text Label 5700 5550 2    50   ~ 0
PALM
Entry Wire Line
	5800 5550 5700 5450
Entry Wire Line
	5800 5650 5700 5550
Text Label 4100 5450 0    50   ~ 0
RRPRO
Text Label 4100 5550 0    50   ~ 0
RPALM
Wire Wire Line
	5350 5450 5700 5450
Wire Wire Line
	5350 5550 5700 5550
NoConn ~ 5350 5650
NoConn ~ 5350 5750
NoConn ~ 5350 5850
NoConn ~ 5350 5950
NoConn ~ 5350 6050
NoConn ~ 5350 6150
NoConn ~ 4350 5650
NoConn ~ 4350 5750
NoConn ~ 4350 5850
NoConn ~ 4350 5950
NoConn ~ 4350 6050
NoConn ~ 4350 6150
Entry Wire Line
	7600 1100 7700 1000
Text Label 7700 1000 0    50   ~ 0
3.3V
Wire Wire Line
	7950 1000 7700 1000
Wire Wire Line
	4850 950  4100 950 
Entry Wire Line
	4000 1050 4100 950 
Text Label 4100 950  0    50   ~ 0
3.3V
$Comp
L power:PWR_FLAG #FLG?
U 1 1 630B7969
P 9200 1000
AR Path="/60F989FD/630B7969" Ref="#FLG?"  Part="1" 
AR Path="/62ECFB9F/630B7969" Ref="#FLG0103"  Part="1" 
F 0 "#FLG0103" H 9200 1075 50  0001 C CNN
F 1 "PWR_FLAG" H 9200 1173 50  0000 C CNN
F 2 "" H 9200 1000 50  0001 C CNN
F 3 "~" H 9200 1000 50  0001 C CNN
	1    9200 1000
	1    0    0    1   
$EndComp
Entry Wire Line
	8850 1100 8950 1000
Text Label 8950 1000 0    50   ~ 0
3.3V
Wire Wire Line
	9200 1000 8950 1000
$Comp
L power:PWR_FLAG #FLG?
U 1 1 630CB51D
P 9200 1400
AR Path="/60F989FD/630CB51D" Ref="#FLG?"  Part="1" 
AR Path="/62ECFB9F/630CB51D" Ref="#FLG0104"  Part="1" 
F 0 "#FLG0104" H 9200 1475 50  0001 C CNN
F 1 "PWR_FLAG" H 9200 1573 50  0000 C CNN
F 2 "" H 9200 1400 50  0001 C CNN
F 3 "~" H 9200 1400 50  0001 C CNN
	1    9200 1400
	1    0    0    1   
$EndComp
Entry Wire Line
	8850 1500 8950 1400
Text Label 8950 1400 0    50   ~ 0
RGND
Wire Wire Line
	9200 1400 8950 1400
Wire Wire Line
	5350 4050 5700 4050
Wire Wire Line
	5350 3950 5700 3950
Wire Wire Line
	5350 3850 5700 3850
Wire Wire Line
	5350 3750 5700 3750
Wire Wire Line
	5350 3650 5700 3650
Wire Wire Line
	5350 3550 5700 3550
Wire Wire Line
	5350 3450 5700 3450
Wire Wire Line
	5350 3350 5700 3350
Wire Bus Line
	1250 700  4000 700 
Connection ~ 4000 700 
Wire Bus Line
	4000 700  7600 700 
Wire Wire Line
	4850 2550 4100 2550
Text Label 4100 2550 0    50   ~ 0
RGND
Entry Wire Line
	4000 2650 4100 2550
$Comp
L power:GND #PWR0269
U 1 1 63304DC9
P 4850 4650
F 0 "#PWR0269" H 4850 4400 50  0001 C CNN
F 1 "GND" H 4855 4477 50  0000 C CNN
F 2 "" H 4850 4650 50  0001 C CNN
F 3 "" H 4850 4650 50  0001 C CNN
	1    4850 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0270
U 1 1 63305504
P 4850 6750
F 0 "#PWR0270" H 4850 6500 50  0001 C CNN
F 1 "GND" H 4855 6577 50  0000 C CNN
F 2 "" H 4850 6750 50  0001 C CNN
F 3 "" H 4850 6750 50  0001 C CNN
	1    4850 6750
	1    0    0    -1  
$EndComp
Connection ~ 2950 7050
Wire Bus Line
	5800 7050 2950 7050
Wire Bus Line
	1700 7750 2950 7750
Wire Wire Line
	4250 4300 4250 4250
Wire Wire Line
	4150 4300 4250 4300
$Comp
L power:+5V #PWR0264
U 1 1 62EADDF5
P 4150 4300
F 0 "#PWR0264" H 4150 4150 50  0001 C CNN
F 1 "+5V" H 4165 4473 50  0000 C CNN
F 2 "" H 4150 4300 50  0001 C CNN
F 3 "" H 4150 4300 50  0001 C CNN
	1    4150 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4250 4250 4250
Wire Wire Line
	4150 6350 4350 6350
$Comp
L power:+5V #PWR0267
U 1 1 62EBBAFE
P 4150 6350
F 0 "#PWR0267" H 4150 6200 50  0001 C CNN
F 1 "+5V" H 4165 6523 50  0000 C CNN
F 2 "" H 4150 6350 50  0001 C CNN
F 3 "" H 4150 6350 50  0001 C CNN
	1    4150 6350
	1    0    0    -1  
$EndComp
Connection ~ 4350 2250
Wire Wire Line
	4350 2150 4350 2250
Wire Wire Line
	2100 1000 1350 1000
Entry Wire Line
	1250 1100 1350 1000
Text Label 1350 1000 0    50   ~ 0
3.3V
Wire Wire Line
	2100 3100 1350 3100
Entry Wire Line
	1250 3200 1350 3100
Text Label 1350 3100 0    50   ~ 0
3.3V
Wire Wire Line
	2100 2600 1350 2600
Text Label 1350 2600 0    50   ~ 0
RGND
Entry Wire Line
	1250 2700 1350 2600
Text Label 1350 4700 0    50   ~ 0
RGND
Entry Wire Line
	1250 4800 1350 4700
Wire Wire Line
	850  2200 850  3200
Connection ~ 850  3200
Wire Wire Line
	850  3200 850  4300
Wire Wire Line
	4850 3050 4100 3050
Entry Wire Line
	4000 3150 4100 3050
Text Label 4100 3050 0    50   ~ 0
3.3V
Wire Wire Line
	4850 5150 4100 5150
Entry Wire Line
	4000 5250 4100 5150
Text Label 4100 5150 0    50   ~ 0
3.3V
Wire Bus Line
	2950 7050 2950 7750
Wire Bus Line
	7600 700  7600 2950
Wire Bus Line
	8850 700  8850 3050
Wire Bus Line
	5800 1200 5800 7050
Wire Bus Line
	4000 700  4000 5750
Wire Bus Line
	1700 5400 1700 7750
Wire Bus Line
	2950 1250 2950 7050
Wire Bus Line
	1250 700  1250 4900
Wire Wire Line
	1350 4700 2100 4700
$EndSCHEMATC
