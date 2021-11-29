EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 4 16
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
DSKY-DSP-TEST:  Raspberry PI I/F\nCopyright 2021, William Glasford
Entry Wire Line
	800  850  900  750 
Entry Wire Line
	800  1500 900  1400
Entry Wire Line
	800  2150 900  2050
Entry Wire Line
	800  2800 900  2700
Entry Wire Line
	800  3450 900  3350
Entry Wire Line
	800  4100 900  4000
Entry Wire Line
	800  4750 900  4650
Entry Wire Line
	800  5400 900  5300
Text Label 900  750  0    50   ~ 0
CH1
Text Label 900  1400 0    50   ~ 0
CH2
Text Label 900  2050 0    50   ~ 0
CH3
Text Label 900  2700 0    50   ~ 0
CH4
Text Label 900  3350 0    50   ~ 0
CH5
Text Label 900  4000 0    50   ~ 0
CH6
Text Label 900  4650 0    50   ~ 0
CH7
Text Label 900  5300 0    50   ~ 0
CH8
Entry Wire Line
	2800 2900 2900 2800
Text Label 2900 2800 0    50   ~ 0
CH15
Entry Wire Line
	800  6050 900  5950
Entry Wire Line
	800  6700 900  6600
Text Label 900  5950 0    50   ~ 0
CH9
Text Label 900  6600 0    50   ~ 0
CH10
Entry Wire Line
	800  7350 900  7250
Entry Wire Line
	2800 950  2900 850 
Text Label 900  7250 0    50   ~ 0
CH11
Text Label 2900 850  0    50   ~ 0
CH12
Entry Wire Line
	2800 1600 2900 1500
Entry Wire Line
	2800 2250 2900 2150
Text Label 2900 1500 0    50   ~ 0
CH13
Text Label 2900 2150 0    50   ~ 0
CH14
Wire Wire Line
	5250 5700 5000 5700
Wire Wire Line
	5250 5800 5000 5800
Wire Wire Line
	5250 5900 5000 5900
Wire Wire Line
	5250 6000 5000 6000
Wire Wire Line
	5250 6100 5000 6100
Wire Wire Line
	5250 6200 5000 6200
Wire Wire Line
	5250 6300 5000 6300
Wire Wire Line
	5250 6400 5000 6400
Wire Wire Line
	5750 6600 6050 6600
Wire Wire Line
	5750 6500 6050 6500
Wire Wire Line
	5750 6400 6050 6400
Wire Wire Line
	5750 6300 6050 6300
Wire Wire Line
	5750 6200 6050 6200
Entry Wire Line
	4900 5800 5000 5700
Entry Wire Line
	4900 5900 5000 5800
Entry Wire Line
	4900 6000 5000 5900
Entry Wire Line
	4900 6100 5000 6000
Entry Wire Line
	4900 6200 5000 6100
Entry Wire Line
	4900 6300 5000 6200
Entry Wire Line
	4900 6400 5000 6300
Entry Wire Line
	4900 6500 5000 6400
Entry Wire Line
	6150 6700 6050 6600
Entry Wire Line
	6150 6600 6050 6500
Entry Wire Line
	6150 6500 6050 6400
Entry Wire Line
	6150 6400 6050 6300
Entry Wire Line
	6150 6300 6050 6200
Text Label 5000 5700 0    50   ~ 0
CH1
Text Label 5000 5800 0    50   ~ 0
CH2
Text Label 5000 5900 0    50   ~ 0
CH3
Text Label 5000 6000 0    50   ~ 0
CH4
Text Label 5000 6100 0    50   ~ 0
CH5
Text Label 5000 6200 0    50   ~ 0
CH6
Text Label 5000 6300 0    50   ~ 0
CH7
Text Label 5000 6400 0    50   ~ 0
CH8
Text Label 6050 6600 2    50   ~ 0
CH11
Text Label 6050 6500 2    50   ~ 0
CH12
Text Label 6050 6400 2    50   ~ 0
CH13
Text Label 6050 6300 2    50   ~ 0
CH14
Text Label 6050 6200 2    50   ~ 0
CH15
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J?
U 1 1 62F04190
P 5450 6100
AR Path="/60F989FD/62F04190" Ref="J?"  Part="1" 
AR Path="/62ECFB9F/62F04190" Ref="J204"  Part="1" 
F 0 "J204" H 5500 6717 50  0000 C CNN
F 1 "Conn_02x10" H 5500 6626 50  0000 C CNN
F 2 "" H 5450 6100 50  0001 C CNN
F 3 "~" H 5450 6100 50  0001 C CNN
	1    5450 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 6500 5000 6500
Wire Wire Line
	5250 6600 5000 6600
Entry Wire Line
	4900 6600 5000 6500
Entry Wire Line
	4900 6700 5000 6600
Text Label 5000 6500 0    50   ~ 0
CH9
Text Label 5000 6600 0    50   ~ 0
CH10
NoConn ~ 5750 5700
NoConn ~ 5750 5800
NoConn ~ 5750 5900
Wire Bus Line
	4900 5400 6150 5400
$Comp
L Connector_Generic:Conn_02x08_Counter_Clockwise J?
U 1 1 62F041BA
P 5450 7400
AR Path="/60F989FD/62F041BA" Ref="J?"  Part="1" 
AR Path="/62ECFB9F/62F041BA" Ref="J203"  Part="1" 
F 0 "J203" H 5500 7917 50  0000 C CNN
F 1 "Conn_02x08" H 5500 7826 50  0000 C CNN
F 2 "" H 5450 7400 50  0001 C CNN
F 3 "~" H 5450 7400 50  0001 C CNN
	1    5450 7400
	1    0    0    -1  
$EndComp
NoConn ~ 5750 7100
NoConn ~ 5750 7200
NoConn ~ 5750 7300
NoConn ~ 5750 7400
NoConn ~ 5750 7500
Wire Wire Line
	6500 5700 6250 5700
Wire Wire Line
	6500 5800 6250 5800
Wire Wire Line
	6500 5900 6250 5900
Wire Wire Line
	6500 5500 6250 5500
Wire Wire Line
	6500 5400 6250 5400
Entry Wire Line
	6150 5800 6250 5700
Entry Wire Line
	2800 4200 2900 4100
Entry Wire Line
	2800 4850 2900 4750
Entry Wire Line
	2800 5500 2900 5400
Entry Wire Line
	6150 5900 6250 5800
Entry Wire Line
	6150 6000 6250 5900
Entry Wire Line
	6150 5600 6250 5500
Entry Wire Line
	6150 5500 6250 5400
Text Label 6250 5700 0    50   ~ 0
CLK1
Text Label 2900 4100 0    50   ~ 0
CLK2
Text Label 2900 4750 0    50   ~ 0
CLK3
Text Label 2900 5400 0    50   ~ 0
DISP
Text Label 6250 5800 0    50   ~ 0
INDC
Text Label 6250 5900 0    50   ~ 0
KBD1
Text Label 6250 5500 0    50   ~ 0
KBSTR
Text Label 6250 5400 0    50   ~ 0
RPRO
Entry Wire Line
	2800 3550 2900 3450
Text Label 2900 3450 0    50   ~ 0
RST
Wire Bus Line
	800  8000 2800 8000
Wire Wire Line
	5250 7100 5000 7100
Wire Wire Line
	5250 7200 5000 7200
Entry Wire Line
	4900 7200 5000 7100
Entry Wire Line
	4900 7300 5000 7200
Text Label 5000 7100 0    50   ~ 0
CLK1
Text Label 5000 7200 0    50   ~ 0
CLK2
Wire Wire Line
	5250 7300 5000 7300
Entry Wire Line
	4900 7400 5000 7300
Text Label 5000 7300 0    50   ~ 0
RST
Wire Wire Line
	5250 7500 5000 7500
Wire Wire Line
	5250 7600 5000 7600
Entry Wire Line
	4900 7600 5000 7500
Entry Wire Line
	4900 7700 5000 7600
Text Label 5000 7500 0    50   ~ 0
KBD1
Text Label 5000 7600 0    50   ~ 0
DISP
Wire Wire Line
	5250 7700 5000 7700
Entry Wire Line
	4900 7800 5000 7700
Text Label 5000 7700 0    50   ~ 0
INDC
Wire Wire Line
	5750 7800 6050 7800
Entry Wire Line
	6150 7900 6050 7800
Text Label 6050 7800 2    50   ~ 0
RPRO
Wire Bus Line
	9200 550  10450 550 
Entry Wire Line
	9200 1050 9300 950 
Entry Wire Line
	9200 1150 9300 1050
Entry Wire Line
	9200 1250 9300 1150
Entry Wire Line
	9200 1450 9300 1350
Entry Wire Line
	9200 1650 9300 1550
Entry Wire Line
	9200 1850 9300 1750
Entry Wire Line
	9200 1950 9300 1850
Entry Wire Line
	9200 2050 9300 1950
Entry Wire Line
	9200 2350 9300 2250
Entry Wire Line
	9200 2450 9300 2350
Entry Wire Line
	9200 2550 9300 2450
Entry Wire Line
	9200 2650 9300 2550
Entry Wire Line
	9200 2750 9300 2650
Entry Wire Line
	10450 2850 10350 2750
Entry Wire Line
	10450 2750 10350 2650
Entry Wire Line
	10450 2650 10350 2550
Entry Wire Line
	10450 1450 10350 1350
Entry Wire Line
	10450 1350 10350 1250
Entry Wire Line
	10450 1250 10350 1150
Entry Wire Line
	10450 2150 10350 2050
Entry Wire Line
	10450 2050 10350 1950
Entry Wire Line
	10450 1750 10350 1650
Entry Wire Line
	10450 1650 10350 1550
Entry Wire Line
	10450 2450 10350 2350
NoConn ~ 5250 7800
Entry Wire Line
	9200 1550 9300 1450
Wire Wire Line
	5250 7400 5000 7400
Entry Wire Line
	4900 7500 5000 7400
Text Label 5000 7400 0    50   ~ 0
STBY
Wire Wire Line
	6500 5600 6250 5600
Entry Wire Line
	6150 5700 6250 5600
Text Label 6250 5600 0    50   ~ 0
STBY
Entry Wire Line
	10450 1950 10350 1850
$Comp
L Transistor_BJT:2N3904 Q20
U 1 1 63B5703B
P 1950 3050
F 0 "Q20" H 2140 3096 50  0000 L CNN
F 1 "2N3904" H 2140 3005 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2150 2975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1950 3050 50  0001 L CNN
	1    1950 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R55
U 1 1 63B5778C
P 1600 3050
F 0 "R55" V 1395 3050 50  0000 C CNN
F 1 "1K" V 1486 3050 50  0000 C CNN
F 2 "" V 1640 3040 50  0001 C CNN
F 3 "~" H 1600 3050 50  0001 C CNN
	1    1600 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R74
U 1 1 63B6CCA4
P 2350 2850
F 0 "R74" V 2145 2850 50  0000 C CNN
F 1 "1K" V 2236 2850 50  0000 C CNN
F 2 "" V 2390 2840 50  0001 C CNN
F 3 "~" H 2350 2850 50  0001 C CNN
	1    2350 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 2850 2150 2850
$Comp
L power:GND #PWR0102
U 1 1 63B7A1EF
P 2650 7700
F 0 "#PWR0102" H 2650 7450 50  0001 C CNN
F 1 "GND" H 2655 7527 50  0000 C CNN
F 2 "" H 2650 7700 50  0001 C CNN
F 3 "" H 2650 7700 50  0001 C CNN
	1    2650 7700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0199
U 1 1 63B7AAC9
P 2550 800
F 0 "#PWR0199" H 2550 650 50  0001 C CNN
F 1 "+5V" H 2565 973 50  0000 C CNN
F 2 "" H 2550 800 50  0001 C CNN
F 3 "" H 2550 800 50  0001 C CNN
	1    2550 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2850 2500 2850
Wire Wire Line
	2050 3250 2650 3250
Wire Wire Line
	2650 3250 2650 3900
Wire Wire Line
	2150 2850 2150 2700
Connection ~ 2150 2850
Wire Wire Line
	2150 2850 2200 2850
$Comp
L Transistor_BJT:2N3904 Q21
U 1 1 63BAC1E7
P 1950 3700
F 0 "Q21" H 2140 3746 50  0000 L CNN
F 1 "2N3904" H 2140 3655 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2150 3625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1950 3700 50  0001 L CNN
	1    1950 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R56
U 1 1 63BAC1ED
P 1600 3700
F 0 "R56" V 1395 3700 50  0000 C CNN
F 1 "1K" V 1486 3700 50  0000 C CNN
F 2 "" V 1640 3690 50  0001 C CNN
F 3 "~" H 1600 3700 50  0001 C CNN
	1    1600 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R75
U 1 1 63BAC1F3
P 2350 3500
F 0 "R75" V 2150 3500 50  0000 C CNN
F 1 "1K" V 2250 3500 50  0000 C CNN
F 2 "" V 2390 3490 50  0001 C CNN
F 3 "~" H 2350 3500 50  0001 C CNN
	1    2350 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 3500 2150 3500
Wire Wire Line
	2550 2850 2550 3500
Wire Wire Line
	2550 3500 2500 3500
Wire Wire Line
	2050 3900 2650 3900
Wire Wire Line
	2150 3500 2150 3350
Connection ~ 2150 3500
Wire Wire Line
	2150 3500 2200 3500
Connection ~ 2550 2850
Text Label 10350 1850 2    50   ~ 0
RSTBY
Wire Wire Line
	10050 1850 10350 1850
Text Label 9300 1450 0    50   ~ 0
RPALM
Wire Wire Line
	9550 1450 9300 1450
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J?
U 1 1 62F041AE
P 9750 1750
AR Path="/60F989FD/62F041AE" Ref="J?"  Part="1" 
AR Path="/62ECFB9F/62F041AE" Ref="J300"  Part="1" 
F 0 "J300" H 9800 2867 50  0000 C CNN
F 1 "RPI_Connector" H 9800 2776 50  0000 C CNN
F 2 "" H 9750 1750 50  0001 C CNN
F 3 "~" H 9750 1750 50  0001 C CNN
	1    9750 1750
	1    0    0    -1  
$EndComp
Text Label 10350 2350 2    50   ~ 0
RCH11
Wire Wire Line
	10050 2350 10350 2350
Text Label 10350 1550 2    50   ~ 0
RKBSTR
Text Label 10350 1650 2    50   ~ 0
RRPRO
Wire Wire Line
	10050 1550 10350 1550
Wire Wire Line
	10050 1650 10350 1650
Text Label 10350 1950 2    50   ~ 0
RCH7
Text Label 10350 2050 2    50   ~ 0
RCH6
Wire Wire Line
	10050 1950 10350 1950
Wire Wire Line
	10050 2050 10350 2050
Text Label 10350 1150 2    50   ~ 0
RCH13
Wire Wire Line
	10050 1150 10350 1150
Text Label 10350 1250 2    50   ~ 0
RCH14
Text Label 10350 1350 2    50   ~ 0
RCLK2
Wire Wire Line
	10050 1250 10350 1250
Wire Wire Line
	10050 1350 10350 1350
Text Label 10350 2550 2    50   ~ 0
RCH15
Wire Wire Line
	10050 2550 10350 2550
Text Label 10350 2650 2    50   ~ 0
RDISP
Text Label 10350 2750 2    50   ~ 0
RINDC
Wire Wire Line
	10050 2650 10350 2650
Wire Wire Line
	10050 2750 10350 2750
Text Label 9300 2650 0    50   ~ 0
RRST
Text Label 9300 2550 0    50   ~ 0
RCLK3
Wire Wire Line
	9550 2650 9300 2650
Wire Wire Line
	9550 2550 9300 2550
Text Label 9300 2450 0    50   ~ 0
RCH12
Text Label 9300 2350 0    50   ~ 0
RCH5
Text Label 9300 2250 0    50   ~ 0
RCH4
Wire Wire Line
	9550 2450 9300 2450
Wire Wire Line
	9550 2350 9300 2350
Wire Wire Line
	9550 2250 9300 2250
Text Label 9300 1950 0    50   ~ 0
RCH10
Text Label 9300 1850 0    50   ~ 0
RCH8
Text Label 9300 1750 0    50   ~ 0
RCH9
Wire Wire Line
	9550 1950 9300 1950
Wire Wire Line
	9550 1850 9300 1850
Wire Wire Line
	9550 1750 9300 1750
Text Label 9300 1550 0    50   ~ 0
RKBD1
Text Label 9300 1350 0    50   ~ 0
RCLK1
Wire Wire Line
	9550 1550 9300 1550
Wire Wire Line
	9550 1350 9300 1350
Text Label 9300 1150 0    50   ~ 0
RCH3
Text Label 9300 1050 0    50   ~ 0
RCH2
Text Label 9300 950  0    50   ~ 0
RCH1
Wire Wire Line
	9550 1150 9300 1150
Wire Wire Line
	9550 1050 9300 1050
Wire Wire Line
	9550 950  9300 950 
NoConn ~ 9550 1650
NoConn ~ 10050 1750
NoConn ~ 10050 1450
NoConn ~ 9550 2050
NoConn ~ 10050 2150
NoConn ~ 10050 2250
NoConn ~ 10050 2450
NoConn ~ 9550 1250
NoConn ~ 10050 950 
NoConn ~ 9550 850 
$Comp
L Transistor_BJT:2N3904 Q19
U 1 1 63CC54E2
P 1950 2400
F 0 "Q19" H 2140 2446 50  0000 L CNN
F 1 "2N3904" H 2140 2355 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2150 2325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1950 2400 50  0001 L CNN
	1    1950 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R54
U 1 1 63CC54E8
P 1600 2400
F 0 "R54" V 1395 2400 50  0000 C CNN
F 1 "1K" V 1486 2400 50  0000 C CNN
F 2 "" V 1640 2390 50  0001 C CNN
F 3 "~" H 1600 2400 50  0001 C CNN
	1    1600 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R73
U 1 1 63CC54EE
P 2350 2200
F 0 "R73" V 2145 2200 50  0000 C CNN
F 1 "1K" V 2236 2200 50  0000 C CNN
F 2 "" V 2390 2190 50  0001 C CNN
F 3 "~" H 2350 2200 50  0001 C CNN
	1    2350 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 2200 2150 2200
Wire Wire Line
	2550 2200 2500 2200
Wire Wire Line
	2050 2600 2650 2600
Wire Wire Line
	2150 2200 2150 2050
Connection ~ 2150 2200
Wire Wire Line
	2150 2200 2200 2200
Connection ~ 2650 3900
Connection ~ 2550 2200
Wire Wire Line
	2550 2200 2550 2850
$Comp
L Transistor_BJT:2N3904 Q18
U 1 1 63CF7E89
P 1950 1750
F 0 "Q18" H 2140 1796 50  0000 L CNN
F 1 "2N3904" H 2140 1705 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2150 1675 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1950 1750 50  0001 L CNN
	1    1950 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R53
U 1 1 63CF7E8F
P 1600 1750
F 0 "R53" V 1395 1750 50  0000 C CNN
F 1 "1K" V 1486 1750 50  0000 C CNN
F 2 "" V 1640 1740 50  0001 C CNN
F 3 "~" H 1600 1750 50  0001 C CNN
	1    1600 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R72
U 1 1 63CF7E95
P 2350 1550
F 0 "R72" V 2145 1550 50  0000 C CNN
F 1 "1K" V 2236 1550 50  0000 C CNN
F 2 "" V 2390 1540 50  0001 C CNN
F 3 "~" H 2350 1550 50  0001 C CNN
	1    2350 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 1550 2150 1550
Wire Wire Line
	2050 1950 2650 1950
Wire Wire Line
	2150 1550 2150 1400
Connection ~ 2150 1550
Wire Wire Line
	2150 1550 2200 1550
$Comp
L Transistor_BJT:2N3904 Q17
U 1 1 63D0638E
P 1950 1100
F 0 "Q17" H 2140 1146 50  0000 L CNN
F 1 "2N3904" H 2140 1055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2150 1025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1950 1100 50  0001 L CNN
	1    1950 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R52
U 1 1 63D06394
P 1600 1100
F 0 "R52" V 1395 1100 50  0000 C CNN
F 1 "1K" V 1486 1100 50  0000 C CNN
F 2 "" V 1640 1090 50  0001 C CNN
F 3 "~" H 1600 1100 50  0001 C CNN
	1    1600 1100
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R71
U 1 1 63D0639A
P 2350 900
F 0 "R71" V 2145 900 50  0000 C CNN
F 1 "1K" V 2236 900 50  0000 C CNN
F 2 "" V 2390 890 50  0001 C CNN
F 3 "~" H 2350 900 50  0001 C CNN
	1    2350 900 
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 900  2150 900 
Wire Wire Line
	2050 1300 2650 1300
Wire Wire Line
	2150 900  2150 750 
Connection ~ 2150 900 
Wire Wire Line
	2150 900  2200 900 
Wire Wire Line
	2650 3250 2650 2600
Connection ~ 2650 3250
Connection ~ 2650 2600
Wire Wire Line
	2650 2600 2650 1950
Wire Wire Line
	2550 800  2550 900 
Connection ~ 2650 1950
Wire Wire Line
	2650 1950 2650 1300
Wire Wire Line
	2500 900  2550 900 
Connection ~ 2550 900 
Wire Wire Line
	2550 900  2550 1550
Wire Wire Line
	2500 1550 2550 1550
Connection ~ 2550 1550
Wire Wire Line
	2550 1550 2550 2200
$Comp
L Transistor_BJT:2N3904 Q22
U 1 1 63D7B476
P 1950 4350
F 0 "Q22" H 2140 4396 50  0000 L CNN
F 1 "2N3904" H 2140 4305 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2150 4275 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1950 4350 50  0001 L CNN
	1    1950 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R57
U 1 1 63D7B47C
P 1600 4350
F 0 "R57" V 1395 4350 50  0000 C CNN
F 1 "1K" V 1486 4350 50  0000 C CNN
F 2 "" V 1640 4340 50  0001 C CNN
F 3 "~" H 1600 4350 50  0001 C CNN
	1    1600 4350
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R76
U 1 1 63D7B482
P 2350 4150
F 0 "R76" V 2150 4150 50  0000 C CNN
F 1 "1K" V 2250 4150 50  0000 C CNN
F 2 "" V 2390 4140 50  0001 C CNN
F 3 "~" H 2350 4150 50  0001 C CNN
	1    2350 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 4150 2150 4150
Wire Wire Line
	2550 4150 2500 4150
Wire Wire Line
	2050 4550 2650 4550
Wire Wire Line
	2150 4150 2150 4000
Connection ~ 2150 4150
Wire Wire Line
	2150 4150 2200 4150
$Comp
L Transistor_BJT:2N3904 Q23
U 1 1 63D8D152
P 1950 5000
F 0 "Q23" H 2140 5046 50  0000 L CNN
F 1 "2N3904" H 2140 4955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2150 4925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1950 5000 50  0001 L CNN
	1    1950 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R58
U 1 1 63D8D158
P 1600 5000
F 0 "R58" V 1395 5000 50  0000 C CNN
F 1 "1K" V 1486 5000 50  0000 C CNN
F 2 "" V 1640 4990 50  0001 C CNN
F 3 "~" H 1600 5000 50  0001 C CNN
	1    1600 5000
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R77
U 1 1 63D8D15E
P 2350 4800
F 0 "R77" V 2150 4800 50  0000 C CNN
F 1 "1K" V 2250 4800 50  0000 C CNN
F 2 "" V 2390 4790 50  0001 C CNN
F 3 "~" H 2350 4800 50  0001 C CNN
	1    2350 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 4800 2150 4800
Wire Wire Line
	2050 5200 2650 5200
Wire Wire Line
	2150 4800 2150 4650
Connection ~ 2150 4800
Wire Wire Line
	2150 4800 2200 4800
Connection ~ 2650 5200
Wire Wire Line
	2650 5200 2650 5850
Connection ~ 2650 4550
Wire Wire Line
	2650 4550 2650 5200
Wire Wire Line
	2550 4800 2500 4800
Wire Wire Line
	2650 3900 2650 4550
Wire Wire Line
	2550 3500 2550 4150
Connection ~ 2550 3500
Connection ~ 2550 4150
Wire Wire Line
	2550 4150 2550 4800
$Comp
L Transistor_BJT:2N3904 Q24
U 1 1 63E826BE
P 1950 5650
F 0 "Q24" H 2140 5696 50  0000 L CNN
F 1 "2N3904" H 2140 5605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2150 5575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1950 5650 50  0001 L CNN
	1    1950 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R59
U 1 1 63E826C4
P 1600 5650
F 0 "R59" V 1395 5650 50  0000 C CNN
F 1 "1K" V 1486 5650 50  0000 C CNN
F 2 "" V 1640 5640 50  0001 C CNN
F 3 "~" H 1600 5650 50  0001 C CNN
	1    1600 5650
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R78
U 1 1 63E826CA
P 2350 5450
F 0 "R78" V 2150 5450 50  0000 C CNN
F 1 "1K" V 2250 5450 50  0000 C CNN
F 2 "" V 2390 5440 50  0001 C CNN
F 3 "~" H 2350 5450 50  0001 C CNN
	1    2350 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 5450 2150 5450
Wire Wire Line
	2050 5850 2650 5850
Wire Wire Line
	2150 5450 2150 5300
Connection ~ 2150 5450
Wire Wire Line
	2150 5450 2200 5450
Wire Wire Line
	2550 5450 2500 5450
$Comp
L Transistor_BJT:2N3904 Q25
U 1 1 63E9737E
P 1950 6300
F 0 "Q25" H 2140 6346 50  0000 L CNN
F 1 "2N3904" H 2140 6255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2150 6225 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1950 6300 50  0001 L CNN
	1    1950 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R60
U 1 1 63E97384
P 1600 6300
F 0 "R60" V 1395 6300 50  0000 C CNN
F 1 "1K" V 1486 6300 50  0000 C CNN
F 2 "" V 1640 6290 50  0001 C CNN
F 3 "~" H 1600 6300 50  0001 C CNN
	1    1600 6300
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R79
U 1 1 63E9738A
P 2350 6100
F 0 "R79" V 2150 6100 50  0000 C CNN
F 1 "1K" V 2250 6100 50  0000 C CNN
F 2 "" V 2390 6090 50  0001 C CNN
F 3 "~" H 2350 6100 50  0001 C CNN
	1    2350 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 6100 2150 6100
Wire Wire Line
	2050 6500 2650 6500
Wire Wire Line
	2150 6100 2150 5950
Connection ~ 2150 6100
Wire Wire Line
	2150 6100 2200 6100
Wire Wire Line
	2550 6100 2500 6100
$Comp
L Transistor_BJT:2N3904 Q26
U 1 1 63EAC921
P 1950 6950
F 0 "Q26" H 2140 6996 50  0000 L CNN
F 1 "2N3904" H 2140 6905 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2150 6875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1950 6950 50  0001 L CNN
	1    1950 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R61
U 1 1 63EAC927
P 1600 6950
F 0 "R61" V 1395 6950 50  0000 C CNN
F 1 "1K" V 1486 6950 50  0000 C CNN
F 2 "" V 1640 6940 50  0001 C CNN
F 3 "~" H 1600 6950 50  0001 C CNN
	1    1600 6950
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R80
U 1 1 63EAC92D
P 2350 6750
F 0 "R80" V 2150 6750 50  0000 C CNN
F 1 "1K" V 2250 6750 50  0000 C CNN
F 2 "" V 2390 6740 50  0001 C CNN
F 3 "~" H 2350 6750 50  0001 C CNN
	1    2350 6750
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 6750 2150 6750
Wire Wire Line
	2050 7150 2650 7150
Wire Wire Line
	2150 6750 2150 6600
Connection ~ 2150 6750
Wire Wire Line
	2150 6750 2200 6750
Wire Wire Line
	2550 6750 2500 6750
$Comp
L Transistor_BJT:2N3904 Q27
U 1 1 63EC3B7E
P 1950 7600
F 0 "Q27" H 2140 7646 50  0000 L CNN
F 1 "2N3904" H 2140 7555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2150 7525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1950 7600 50  0001 L CNN
	1    1950 7600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R62
U 1 1 63EC3B84
P 1600 7600
F 0 "R62" V 1395 7600 50  0000 C CNN
F 1 "1K" V 1486 7600 50  0000 C CNN
F 2 "" V 1640 7590 50  0001 C CNN
F 3 "~" H 1600 7600 50  0001 C CNN
	1    1600 7600
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R81
U 1 1 63EC3B8A
P 2350 7400
F 0 "R81" V 2150 7400 50  0000 C CNN
F 1 "1K" V 2250 7400 50  0000 C CNN
F 2 "" V 2390 7390 50  0001 C CNN
F 3 "~" H 2350 7400 50  0001 C CNN
	1    2350 7400
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 7400 2150 7400
Wire Wire Line
	2150 7400 2150 7250
Connection ~ 2150 7400
Wire Wire Line
	2150 7400 2200 7400
Wire Wire Line
	2550 7400 2500 7400
Wire Wire Line
	2550 4800 2550 5450
Connection ~ 2550 4800
Connection ~ 2550 5450
Wire Wire Line
	2550 5450 2550 6100
Connection ~ 2550 6100
Wire Wire Line
	2550 6100 2550 6750
Connection ~ 2550 6750
Wire Wire Line
	2550 6750 2550 7400
Entry Wire Line
	6150 6200 6050 6100
Text Label 6050 6100 2    50   ~ 0
KBSTR
Wire Wire Line
	5750 6100 6050 6100
Entry Wire Line
	6150 6100 6050 6000
Text Label 6050 6000 2    50   ~ 0
PALM
Wire Wire Line
	5750 6000 6050 6000
NoConn ~ 10050 850 
NoConn ~ 9550 2750
Connection ~ 2650 5850
Wire Wire Line
	2650 5850 2650 6500
Connection ~ 2650 6500
Wire Wire Line
	2650 6500 2650 7150
Entry Wire Line
	1100 1200 1200 1100
Entry Wire Line
	1100 1850 1200 1750
Entry Wire Line
	1100 2500 1200 2400
Entry Wire Line
	1100 6400 1200 6300
Entry Wire Line
	1100 5750 1200 5650
Entry Wire Line
	1100 7050 1200 6950
Entry Wire Line
	1100 3150 1200 3050
Entry Wire Line
	1100 3800 1200 3700
Text Label 1200 3700 0    50   ~ 0
RCH5
Text Label 1200 3050 0    50   ~ 0
RCH4
Wire Wire Line
	1450 3700 1200 3700
Wire Wire Line
	1450 3050 1200 3050
Text Label 1200 6950 0    50   ~ 0
RCH10
Text Label 1200 5650 0    50   ~ 0
RCH8
Text Label 1200 6300 0    50   ~ 0
RCH9
Wire Wire Line
	1450 6950 1200 6950
Wire Wire Line
	1450 5650 1200 5650
Wire Wire Line
	1450 6300 1200 6300
Text Label 1200 2400 0    50   ~ 0
RCH3
Text Label 1200 1750 0    50   ~ 0
RCH2
Text Label 1200 1100 0    50   ~ 0
RCH1
Wire Wire Line
	1450 2400 1200 2400
Wire Wire Line
	1450 1750 1200 1750
Wire Wire Line
	1450 1100 1200 1100
Entry Wire Line
	1100 7700 1200 7600
Text Label 1200 7600 0    50   ~ 0
RCH11
Wire Wire Line
	1450 7600 1200 7600
Entry Wire Line
	1100 5100 1200 5000
Text Label 1200 5000 0    50   ~ 0
RCH7
Wire Wire Line
	1450 5000 1200 5000
Entry Wire Line
	1100 4450 1200 4350
Text Label 1200 4350 0    50   ~ 0
RCH6
Wire Wire Line
	1450 4350 1200 4350
$Comp
L Transistor_BJT:2N3904 Q31
U 1 1 64269937
P 4000 3150
F 0 "Q31" H 4190 3196 50  0000 L CNN
F 1 "2N3904" H 4190 3105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4200 3075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4000 3150 50  0001 L CNN
	1    4000 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R66
U 1 1 6426993D
P 3650 3150
F 0 "R66" V 3445 3150 50  0000 C CNN
F 1 "1K" V 3536 3150 50  0000 C CNN
F 2 "" V 3690 3140 50  0001 C CNN
F 3 "~" H 3650 3150 50  0001 C CNN
	1    3650 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R85
U 1 1 64269943
P 4400 2950
F 0 "R85" V 4195 2950 50  0000 C CNN
F 1 "1K" V 4286 2950 50  0000 C CNN
F 2 "" V 4440 2940 50  0001 C CNN
F 3 "~" H 4400 2950 50  0001 C CNN
	1    4400 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 2950 4200 2950
$Comp
L power:+5V #PWR0200
U 1 1 6426994A
P 4600 900
F 0 "#PWR0200" H 4600 750 50  0001 C CNN
F 1 "+5V" H 4615 1073 50  0000 C CNN
F 2 "" H 4600 900 50  0001 C CNN
F 3 "" H 4600 900 50  0001 C CNN
	1    4600 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2950 4550 2950
Wire Wire Line
	4100 3350 4700 3350
Wire Wire Line
	4700 3350 4700 4000
Wire Wire Line
	4200 2950 4200 2800
Connection ~ 4200 2950
Wire Wire Line
	4200 2950 4250 2950
$Comp
L Transistor_BJT:2N3904 Q32
U 1 1 64269957
P 4000 3800
F 0 "Q32" H 4190 3846 50  0000 L CNN
F 1 "2N3904" H 4190 3755 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4200 3725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4000 3800 50  0001 L CNN
	1    4000 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R67
U 1 1 6426995D
P 3650 3800
F 0 "R67" V 3445 3800 50  0000 C CNN
F 1 "1K" V 3536 3800 50  0000 C CNN
F 2 "" V 3690 3790 50  0001 C CNN
F 3 "~" H 3650 3800 50  0001 C CNN
	1    3650 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R86
U 1 1 64269963
P 4400 3600
F 0 "R86" V 4200 3600 50  0000 C CNN
F 1 "1K" V 4300 3600 50  0000 C CNN
F 2 "" V 4440 3590 50  0001 C CNN
F 3 "~" H 4400 3600 50  0001 C CNN
	1    4400 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 3600 4200 3600
Wire Wire Line
	4600 2950 4600 3600
Wire Wire Line
	4600 3600 4550 3600
Wire Wire Line
	4100 4000 4700 4000
Wire Wire Line
	4200 3600 4200 3450
Connection ~ 4200 3600
Wire Wire Line
	4200 3600 4250 3600
Connection ~ 4600 2950
$Comp
L Transistor_BJT:2N3904 Q30
U 1 1 64269972
P 4000 2500
F 0 "Q30" H 4190 2546 50  0000 L CNN
F 1 "2N3904" H 4190 2455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4200 2425 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4000 2500 50  0001 L CNN
	1    4000 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R65
U 1 1 64269978
P 3650 2500
F 0 "R65" V 3445 2500 50  0000 C CNN
F 1 "1K" V 3536 2500 50  0000 C CNN
F 2 "" V 3690 2490 50  0001 C CNN
F 3 "~" H 3650 2500 50  0001 C CNN
	1    3650 2500
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R84
U 1 1 6426997E
P 4400 2300
F 0 "R84" V 4195 2300 50  0000 C CNN
F 1 "1K" V 4286 2300 50  0000 C CNN
F 2 "" V 4440 2290 50  0001 C CNN
F 3 "~" H 4400 2300 50  0001 C CNN
	1    4400 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 2300 4200 2300
Wire Wire Line
	4600 2300 4550 2300
Wire Wire Line
	4100 2700 4700 2700
Wire Wire Line
	4200 2300 4200 2150
Connection ~ 4200 2300
Wire Wire Line
	4200 2300 4250 2300
Connection ~ 4700 4000
Connection ~ 4600 2300
Wire Wire Line
	4600 2300 4600 2950
$Comp
L Transistor_BJT:2N3904 Q29
U 1 1 6426998E
P 4000 1850
F 0 "Q29" H 4190 1896 50  0000 L CNN
F 1 "2N3904" H 4190 1805 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4200 1775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4000 1850 50  0001 L CNN
	1    4000 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R64
U 1 1 64269994
P 3650 1850
F 0 "R64" V 3445 1850 50  0000 C CNN
F 1 "1K" V 3536 1850 50  0000 C CNN
F 2 "" V 3690 1840 50  0001 C CNN
F 3 "~" H 3650 1850 50  0001 C CNN
	1    3650 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R83
U 1 1 6426999A
P 4400 1650
F 0 "R83" V 4195 1650 50  0000 C CNN
F 1 "1K" V 4286 1650 50  0000 C CNN
F 2 "" V 4440 1640 50  0001 C CNN
F 3 "~" H 4400 1650 50  0001 C CNN
	1    4400 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 1650 4200 1650
Wire Wire Line
	4100 2050 4700 2050
Wire Wire Line
	4200 1650 4200 1500
Connection ~ 4200 1650
Wire Wire Line
	4200 1650 4250 1650
$Comp
L Transistor_BJT:2N3904 Q28
U 1 1 642699A6
P 4000 1200
F 0 "Q28" H 4190 1246 50  0000 L CNN
F 1 "2N3904" H 4190 1155 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4200 1125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4000 1200 50  0001 L CNN
	1    4000 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R63
U 1 1 642699AC
P 3650 1200
F 0 "R63" V 3445 1200 50  0000 C CNN
F 1 "1K" V 3536 1200 50  0000 C CNN
F 2 "" V 3690 1190 50  0001 C CNN
F 3 "~" H 3650 1200 50  0001 C CNN
	1    3650 1200
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R82
U 1 1 642699B2
P 4400 1000
F 0 "R82" V 4195 1000 50  0000 C CNN
F 1 "1K" V 4286 1000 50  0000 C CNN
F 2 "" V 4440 990 50  0001 C CNN
F 3 "~" H 4400 1000 50  0001 C CNN
	1    4400 1000
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 1000 4200 1000
Wire Wire Line
	4100 1400 4700 1400
Wire Wire Line
	4200 1000 4200 850 
Connection ~ 4200 1000
Wire Wire Line
	4200 1000 4250 1000
Wire Wire Line
	4700 3350 4700 2700
Connection ~ 4700 3350
Connection ~ 4700 2700
Wire Wire Line
	4700 2700 4700 2050
Wire Wire Line
	4600 900  4600 1000
Connection ~ 4700 2050
Wire Wire Line
	4700 2050 4700 1400
Wire Wire Line
	4550 1000 4600 1000
Connection ~ 4600 1000
Wire Wire Line
	4600 1000 4600 1650
Wire Wire Line
	4550 1650 4600 1650
Connection ~ 4600 1650
Wire Wire Line
	4600 1650 4600 2300
$Comp
L Transistor_BJT:2N3904 Q33
U 1 1 642699CB
P 4000 4450
F 0 "Q33" H 4190 4496 50  0000 L CNN
F 1 "2N3904" H 4190 4405 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4200 4375 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4000 4450 50  0001 L CNN
	1    4000 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R68
U 1 1 642699D1
P 3650 4450
F 0 "R68" V 3445 4450 50  0000 C CNN
F 1 "1K" V 3536 4450 50  0000 C CNN
F 2 "" V 3690 4440 50  0001 C CNN
F 3 "~" H 3650 4450 50  0001 C CNN
	1    3650 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R87
U 1 1 642699D7
P 4400 4250
F 0 "R87" V 4200 4250 50  0000 C CNN
F 1 "1K" V 4300 4250 50  0000 C CNN
F 2 "" V 4440 4240 50  0001 C CNN
F 3 "~" H 4400 4250 50  0001 C CNN
	1    4400 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 4250 4200 4250
Wire Wire Line
	4600 4250 4550 4250
Wire Wire Line
	4100 4650 4700 4650
Wire Wire Line
	4200 4250 4200 4100
Connection ~ 4200 4250
Wire Wire Line
	4200 4250 4250 4250
$Comp
L Transistor_BJT:2N3904 Q34
U 1 1 642699E4
P 4000 5100
F 0 "Q34" H 4190 5146 50  0000 L CNN
F 1 "2N3904" H 4190 5055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4200 5025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4000 5100 50  0001 L CNN
	1    4000 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R69
U 1 1 642699EA
P 3650 5100
F 0 "R69" V 3445 5100 50  0000 C CNN
F 1 "1K" V 3536 5100 50  0000 C CNN
F 2 "" V 3690 5090 50  0001 C CNN
F 3 "~" H 3650 5100 50  0001 C CNN
	1    3650 5100
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R88
U 1 1 642699F0
P 4400 4900
F 0 "R88" V 4200 4900 50  0000 C CNN
F 1 "1K" V 4300 4900 50  0000 C CNN
F 2 "" V 4440 4890 50  0001 C CNN
F 3 "~" H 4400 4900 50  0001 C CNN
	1    4400 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 4900 4200 4900
Wire Wire Line
	4100 5300 4700 5300
Wire Wire Line
	4200 4900 4200 4750
Connection ~ 4200 4900
Wire Wire Line
	4200 4900 4250 4900
Connection ~ 4700 5300
Wire Wire Line
	4700 5300 4700 5950
Connection ~ 4700 4650
Wire Wire Line
	4700 4650 4700 5300
Wire Wire Line
	4600 4900 4550 4900
Wire Wire Line
	4700 4000 4700 4650
Wire Wire Line
	4600 3600 4600 4250
Connection ~ 4600 3600
Connection ~ 4600 4250
Wire Wire Line
	4600 4250 4600 4900
Wire Wire Line
	4600 4900 4600 5550
Connection ~ 4600 4900
Entry Wire Line
	3150 1300 3250 1200
Entry Wire Line
	3150 1950 3250 1850
Entry Wire Line
	3150 2600 3250 2500
Entry Wire Line
	3150 3250 3250 3150
Entry Wire Line
	3150 3900 3250 3800
Text Label 3250 3800 0    50   ~ 0
RRST
Text Label 3250 3150 0    50   ~ 0
RCH15
Wire Wire Line
	3500 3800 3250 3800
Wire Wire Line
	3500 3150 3250 3150
Text Label 3250 2500 0    50   ~ 0
RCH14
Text Label 3250 1850 0    50   ~ 0
RCH13
Text Label 3250 1200 0    50   ~ 0
RCH12
Wire Wire Line
	3500 2500 3250 2500
Wire Wire Line
	3500 1850 3250 1850
Wire Wire Line
	3500 1200 3250 1200
Entry Wire Line
	3150 5200 3250 5100
Text Label 3250 5100 0    50   ~ 0
RCLK3
Wire Wire Line
	3500 5100 3250 5100
Entry Wire Line
	3150 4550 3250 4450
Text Label 3250 4450 0    50   ~ 0
RCLK2
Wire Wire Line
	3500 4450 3250 4450
$Comp
L Transistor_BJT:2N3904 Q35
U 1 1 6430B0BB
P 4000 5750
F 0 "Q35" H 4190 5796 50  0000 L CNN
F 1 "2N3904" H 4190 5705 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4200 5675 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4000 5750 50  0001 L CNN
	1    4000 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R70
U 1 1 6430B0C1
P 3650 5750
F 0 "R70" V 3445 5750 50  0000 C CNN
F 1 "1K" V 3536 5750 50  0000 C CNN
F 2 "" V 3690 5740 50  0001 C CNN
F 3 "~" H 3650 5750 50  0001 C CNN
	1    3650 5750
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R89
U 1 1 6430B0C7
P 4400 5550
F 0 "R89" V 4200 5550 50  0000 C CNN
F 1 "1K" V 4300 5550 50  0000 C CNN
F 2 "" V 4440 5540 50  0001 C CNN
F 3 "~" H 4400 5550 50  0001 C CNN
	1    4400 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 5550 4200 5550
Wire Wire Line
	4100 5950 4700 5950
Wire Wire Line
	4200 5550 4200 5400
Connection ~ 4200 5550
Wire Wire Line
	4200 5550 4250 5550
Wire Wire Line
	4600 5550 4550 5550
Entry Wire Line
	3150 5850 3250 5750
Text Label 3250 5750 0    50   ~ 0
RDISP
Wire Wire Line
	3500 5750 3250 5750
$Comp
L power:GND #PWR0201
U 1 1 6432C39A
P 4700 6900
F 0 "#PWR0201" H 4700 6650 50  0001 C CNN
F 1 "GND" H 4705 6727 50  0000 C CNN
F 2 "" H 4700 6900 50  0001 C CNN
F 3 "" H 4700 6900 50  0001 C CNN
	1    4700 6900
	1    0    0    -1  
$EndComp
Connection ~ 3150 550 
Wire Bus Line
	3150 550  1100 550 
Connection ~ 9200 550 
Wire Bus Line
	3150 550  9200 550 
Wire Wire Line
	900  7250 2150 7250
Wire Wire Line
	900  6600 2150 6600
Wire Wire Line
	900  5950 2150 5950
Wire Wire Line
	900  5300 2150 5300
Wire Wire Line
	900  4650 2150 4650
Wire Wire Line
	900  4000 2150 4000
Wire Wire Line
	900  3350 2150 3350
Wire Wire Line
	900  2700 2150 2700
Wire Wire Line
	900  2050 2150 2050
Wire Wire Line
	900  1400 2150 1400
Wire Wire Line
	900  750  2150 750 
Connection ~ 2800 8000
Wire Bus Line
	2800 8000 4900 8000
Wire Wire Line
	2650 7150 2650 7700
Connection ~ 2650 7150
Wire Wire Line
	2650 7700 2500 7700
Wire Wire Line
	2500 7700 2500 7800
Wire Wire Line
	2500 7800 2050 7800
Connection ~ 2650 7700
Wire Wire Line
	2900 2800 4200 2800
Wire Wire Line
	2900 2150 4200 2150
Wire Wire Line
	2900 1500 4200 1500
Wire Wire Line
	2900 850  4200 850 
Wire Wire Line
	2900 4100 4200 4100
Wire Wire Line
	2900 4750 4200 4750
Wire Wire Line
	2900 5400 4200 5400
Wire Wire Line
	2900 3450 4200 3450
Entry Wire Line
	10450 1150 10350 1050
Text Label 10350 1050 2    50   ~ 0
RGND
Wire Wire Line
	10050 1050 10350 1050
Connection ~ 4700 5950
Entry Wire Line
	3150 6950 3250 6850
Text Label 3250 6850 0    50   ~ 0
RGND
Wire Wire Line
	4700 6850 3250 6850
NoConn ~ 6500 5400
NoConn ~ 6500 5500
NoConn ~ 6500 5600
NoConn ~ 6500 5700
NoConn ~ 6500 5800
NoConn ~ 6500 5900
Wire Wire Line
	6500 6000 6250 6000
Entry Wire Line
	6150 6100 6250 6000
Text Label 6250 6000 0    50   ~ 0
PALM
NoConn ~ 6500 6000
Entry Wire Line
	9200 2700 9100 2600
Text Label 9100 2600 2    50   ~ 0
RINDC
Wire Wire Line
	8800 2600 9100 2600
NoConn ~ 8800 2600
Entry Wire Line
	9200 2600 9100 2500
Text Label 9100 2500 2    50   ~ 0
RSTBY
Wire Wire Line
	8800 2500 9100 2500
NoConn ~ 8800 2500
Entry Wire Line
	9200 2500 9100 2400
Text Label 9100 2400 2    50   ~ 0
RRPRO
Wire Wire Line
	8800 2400 9100 2400
NoConn ~ 8800 2400
Entry Wire Line
	9200 2400 9100 2300
Text Label 9100 2300 2    50   ~ 0
RKBSTR
Wire Wire Line
	8800 2300 9100 2300
NoConn ~ 8800 2300
Entry Wire Line
	9200 2300 9100 2200
Text Label 9100 2200 2    50   ~ 0
RKBD1
Wire Wire Line
	8800 2200 9100 2200
NoConn ~ 8800 2200
Entry Wire Line
	9200 2200 9100 2100
Text Label 9100 2100 2    50   ~ 0
RPALM
Wire Wire Line
	8800 2100 9100 2100
NoConn ~ 8800 2100
Entry Wire Line
	9200 2100 9100 2000
Text Label 9100 2000 2    50   ~ 0
RCLK1
Wire Wire Line
	8800 2000 9100 2000
NoConn ~ 8800 2000
Connection ~ 4700 6850
Wire Wire Line
	4700 6850 4700 6900
NoConn ~ 5750 7600
Wire Wire Line
	5750 7700 6050 7700
Entry Wire Line
	6150 7800 6050 7700
Text Label 6050 7700 2    50   ~ 0
CLK3
NoConn ~ 9550 2150
Wire Wire Line
	4700 5950 4700 6850
Wire Bus Line
	2800 800  2800 8000
Wire Bus Line
	3150 550  3150 7000
Wire Bus Line
	800  650  800  8000
Wire Bus Line
	6150 5400 6150 7950
Wire Bus Line
	10450 550  10450 2900
Wire Bus Line
	1100 550  1100 7850
Wire Bus Line
	4900 5400 4900 8000
Wire Bus Line
	9200 550  9200 2800
$EndSCHEMATC
