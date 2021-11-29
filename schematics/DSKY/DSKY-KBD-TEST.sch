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
Text Notes 6500 7200 0    100  ~ 0
DSKY-KBD-TEST:  Raspberry PI I/F\nCopyright 2021, William Glasford
Entry Wire Line
	600  750  700  650 
Entry Wire Line
	600  1400 700  1300
Entry Wire Line
	600  2050 700  1950
Text Label 700  650  0    50   ~ 0
CH6
Text Label 700  1300 0    50   ~ 0
CH7
Text Label 700  1950 0    50   ~ 0
CH8
Entry Wire Line
	600  6000 700  5900
Text Label 700  5900 0    50   ~ 0
CH15
Entry Wire Line
	600  2700 700  2600
Entry Wire Line
	600  3350 700  3250
Text Label 700  2600 0    50   ~ 0
CH9
Text Label 700  3250 0    50   ~ 0
CH10
Entry Wire Line
	600  4000 700  3900
Entry Wire Line
	600  4700 700  4600
Text Label 700  3900 0    50   ~ 0
CH11
Text Label 700  4600 0    50   ~ 0
CH12
Entry Wire Line
	600  5350 700  5250
Text Label 700  5250 0    50   ~ 0
CH13
Wire Wire Line
	6850 4150 6600 4150
Wire Wire Line
	6850 4250 6600 4250
Wire Wire Line
	6850 4350 6600 4350
Wire Wire Line
	6850 4450 6600 4450
Wire Wire Line
	6850 4550 6600 4550
Wire Wire Line
	6850 4650 6600 4650
Wire Wire Line
	6850 4750 6600 4750
Wire Wire Line
	6850 4850 6600 4850
Wire Wire Line
	7350 5050 7650 5050
Wire Wire Line
	7350 4950 7650 4950
Wire Wire Line
	7350 4850 7650 4850
Wire Wire Line
	7350 4750 7650 4750
Wire Wire Line
	7350 4650 7650 4650
Entry Wire Line
	6500 4250 6600 4150
Entry Wire Line
	6500 4350 6600 4250
Entry Wire Line
	6500 4450 6600 4350
Entry Wire Line
	6500 4550 6600 4450
Entry Wire Line
	6500 4650 6600 4550
Entry Wire Line
	6500 4750 6600 4650
Entry Wire Line
	6500 4850 6600 4750
Entry Wire Line
	6500 4950 6600 4850
Entry Wire Line
	7750 5150 7650 5050
Entry Wire Line
	7750 5050 7650 4950
Entry Wire Line
	7750 4950 7650 4850
Entry Wire Line
	7750 4850 7650 4750
Entry Wire Line
	7750 4750 7650 4650
Text Label 6600 4150 0    50   ~ 0
CH1
Text Label 6600 4250 0    50   ~ 0
CH2
Text Label 6600 4350 0    50   ~ 0
CH3
Text Label 6600 4450 0    50   ~ 0
CH4
Text Label 6600 4550 0    50   ~ 0
CH5
Text Label 6600 4650 0    50   ~ 0
CH6
Text Label 6600 4750 0    50   ~ 0
CH7
Text Label 6600 4850 0    50   ~ 0
CH8
Text Label 7650 5050 2    50   ~ 0
CH11
Text Label 7650 4950 2    50   ~ 0
CH12
Text Label 7650 4850 2    50   ~ 0
CH13
Text Label 7650 4750 2    50   ~ 0
CH14
Text Label 7650 4650 2    50   ~ 0
CH15
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J?
U 1 1 6A2BD9B4
P 7050 4550
AR Path="/60F989FD/6A2BD9B4" Ref="J?"  Part="1" 
AR Path="/62ECFB9F/6A2BD9B4" Ref="J?"  Part="1" 
AR Path="/6A27E71F/6A2BD9B4" Ref="J?"  Part="1" 
F 0 "J?" H 7100 5167 50  0000 C CNN
F 1 "Conn_02x10" H 7100 5076 50  0000 C CNN
F 2 "" H 7050 4550 50  0001 C CNN
F 3 "~" H 7050 4550 50  0001 C CNN
	1    7050 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4950 6600 4950
Wire Wire Line
	6850 5050 6600 5050
Entry Wire Line
	6500 5050 6600 4950
Entry Wire Line
	6500 5150 6600 5050
Text Label 6600 4950 0    50   ~ 0
CH9
Text Label 6600 5050 0    50   ~ 0
CH10
NoConn ~ 7350 4150
NoConn ~ 7350 4250
NoConn ~ 7350 4350
Wire Bus Line
	6500 3850 7750 3850
$Comp
L Connector_Generic:Conn_02x08_Counter_Clockwise J?
U 1 1 6A2BD9C4
P 7050 5850
AR Path="/60F989FD/6A2BD9C4" Ref="J?"  Part="1" 
AR Path="/62ECFB9F/6A2BD9C4" Ref="J?"  Part="1" 
AR Path="/6A27E71F/6A2BD9C4" Ref="J?"  Part="1" 
F 0 "J?" H 7100 6367 50  0000 C CNN
F 1 "Conn_02x08" H 7100 6276 50  0000 C CNN
F 2 "" H 7050 5850 50  0001 C CNN
F 3 "~" H 7050 5850 50  0001 C CNN
	1    7050 5850
	1    0    0    -1  
$EndComp
NoConn ~ 7350 5550
NoConn ~ 7350 5650
NoConn ~ 7350 5750
NoConn ~ 7350 5850
NoConn ~ 7350 5950
Entry Wire Line
	2600 1500 2700 1400
Entry Wire Line
	2600 2150 2700 2050
Entry Wire Line
	2600 2800 2700 2700
Text Label 2700 1400 0    50   ~ 0
CLK1
Text Label 2700 2050 0    50   ~ 0
KBD1
Text Label 2700 2700 0    50   ~ 0
RPRO
Entry Wire Line
	2600 850  2700 750 
Text Label 2700 750  0    50   ~ 0
RST
Wire Wire Line
	6850 5550 6600 5550
Wire Wire Line
	6850 5650 6600 5650
Entry Wire Line
	6500 5650 6600 5550
Entry Wire Line
	6500 5750 6600 5650
Text Label 6600 5550 0    50   ~ 0
CLK1
Text Label 6600 5650 0    50   ~ 0
CLK2
Wire Wire Line
	6850 5750 6600 5750
Entry Wire Line
	6500 5850 6600 5750
Text Label 6600 5750 0    50   ~ 0
RST
Wire Wire Line
	6850 5950 6600 5950
Wire Wire Line
	6850 6050 6600 6050
Entry Wire Line
	6500 6050 6600 5950
Entry Wire Line
	6500 6150 6600 6050
Text Label 6600 5950 0    50   ~ 0
KBD1
Text Label 6600 6050 0    50   ~ 0
DISP
Wire Wire Line
	6850 6150 6600 6150
Entry Wire Line
	6500 6250 6600 6150
Text Label 6600 6150 0    50   ~ 0
INDC
Wire Wire Line
	7350 6250 7650 6250
Entry Wire Line
	7750 6350 7650 6250
Text Label 7650 6250 2    50   ~ 0
RPRO
NoConn ~ 6850 6250
Wire Wire Line
	6850 5850 6600 5850
Entry Wire Line
	6500 5950 6600 5850
Text Label 6600 5850 0    50   ~ 0
STBY
$Comp
L power:GND #PWR?
U 1 1 6A2BDA31
P 2450 6500
AR Path="/62ECFB9F/6A2BDA31" Ref="#PWR?"  Part="1" 
AR Path="/6A27E71F/6A2BDA31" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2450 6250 50  0001 C CNN
F 1 "GND" H 2455 6327 50  0000 C CNN
F 2 "" H 2450 6500 50  0001 C CNN
F 3 "" H 2450 6500 50  0001 C CNN
	1    2450 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6A2BDA37
P 2350 800
AR Path="/62ECFB9F/6A2BDA37" Ref="#PWR?"  Part="1" 
AR Path="/6A27E71F/6A2BDA37" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 650 50  0001 C CNN
F 1 "+5V" H 2365 973 50  0000 C CNN
F 2 "" H 2350 800 50  0001 C CNN
F 3 "" H 2350 800 50  0001 C CNN
	1    2350 800 
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDAF7
P 1750 1000
AR Path="/62ECFB9F/6A2BDAF7" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDAF7" Ref="Q?"  Part="1" 
F 0 "Q?" H 1940 1046 50  0000 L CNN
F 1 "2N3904" H 1940 955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 1950 925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1750 1000 50  0001 L CNN
	1    1750 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDAFD
P 1400 1000
AR Path="/62ECFB9F/6A2BDAFD" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDAFD" Ref="R?"  Part="1" 
F 0 "R?" V 1195 1000 50  0000 C CNN
F 1 "1K" V 1286 1000 50  0000 C CNN
F 2 "" V 1440 990 50  0001 C CNN
F 3 "~" H 1400 1000 50  0001 C CNN
	1    1400 1000
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDB03
P 2150 800
AR Path="/62ECFB9F/6A2BDB03" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDB03" Ref="R?"  Part="1" 
F 0 "R?" V 1950 800 50  0000 C CNN
F 1 "1K" V 2050 800 50  0000 C CNN
F 2 "" V 2190 790 50  0001 C CNN
F 3 "~" H 2150 800 50  0001 C CNN
	1    2150 800 
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 800  1950 800 
Wire Wire Line
	2350 800  2300 800 
Wire Wire Line
	1850 1200 2450 1200
Wire Wire Line
	1950 800  1950 650 
Connection ~ 1950 800 
Wire Wire Line
	1950 800  2000 800 
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDB0F
P 1750 1650
AR Path="/62ECFB9F/6A2BDB0F" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDB0F" Ref="Q?"  Part="1" 
F 0 "Q?" H 1940 1696 50  0000 L CNN
F 1 "2N3904" H 1940 1605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 1950 1575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1750 1650 50  0001 L CNN
	1    1750 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDB15
P 1400 1650
AR Path="/62ECFB9F/6A2BDB15" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDB15" Ref="R?"  Part="1" 
F 0 "R?" V 1195 1650 50  0000 C CNN
F 1 "1K" V 1286 1650 50  0000 C CNN
F 2 "" V 1440 1640 50  0001 C CNN
F 3 "~" H 1400 1650 50  0001 C CNN
	1    1400 1650
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDB1B
P 2150 1450
AR Path="/62ECFB9F/6A2BDB1B" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDB1B" Ref="R?"  Part="1" 
F 0 "R?" V 1950 1450 50  0000 C CNN
F 1 "1K" V 2050 1450 50  0000 C CNN
F 2 "" V 2190 1440 50  0001 C CNN
F 3 "~" H 2150 1450 50  0001 C CNN
	1    2150 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 1450 1950 1450
Wire Wire Line
	1850 1850 2450 1850
Wire Wire Line
	1950 1450 1950 1300
Connection ~ 1950 1450
Wire Wire Line
	1950 1450 2000 1450
Connection ~ 2450 1850
Wire Wire Line
	2450 1850 2450 2500
Wire Wire Line
	2450 1200 2450 1850
Wire Wire Line
	2350 1450 2300 1450
Wire Wire Line
	2350 800  2350 1450
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDB30
P 1750 2300
AR Path="/62ECFB9F/6A2BDB30" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDB30" Ref="Q?"  Part="1" 
F 0 "Q?" H 1940 2346 50  0000 L CNN
F 1 "2N3904" H 1940 2255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 1950 2225 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1750 2300 50  0001 L CNN
	1    1750 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDB36
P 1400 2300
AR Path="/62ECFB9F/6A2BDB36" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDB36" Ref="R?"  Part="1" 
F 0 "R?" V 1195 2300 50  0000 C CNN
F 1 "1K" V 1286 2300 50  0000 C CNN
F 2 "" V 1440 2290 50  0001 C CNN
F 3 "~" H 1400 2300 50  0001 C CNN
	1    1400 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDB3C
P 2150 2100
AR Path="/62ECFB9F/6A2BDB3C" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDB3C" Ref="R?"  Part="1" 
F 0 "R?" V 1950 2100 50  0000 C CNN
F 1 "1K" V 2050 2100 50  0000 C CNN
F 2 "" V 2190 2090 50  0001 C CNN
F 3 "~" H 2150 2100 50  0001 C CNN
	1    2150 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 2100 1950 2100
Wire Wire Line
	1850 2500 2450 2500
Wire Wire Line
	1950 2100 1950 1950
Connection ~ 1950 2100
Wire Wire Line
	1950 2100 2000 2100
Wire Wire Line
	2350 2100 2300 2100
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDB48
P 1750 2950
AR Path="/62ECFB9F/6A2BDB48" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDB48" Ref="Q?"  Part="1" 
F 0 "Q?" H 1940 2996 50  0000 L CNN
F 1 "2N3904" H 1940 2905 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 1950 2875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1750 2950 50  0001 L CNN
	1    1750 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDB4E
P 1400 2950
AR Path="/62ECFB9F/6A2BDB4E" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDB4E" Ref="R?"  Part="1" 
F 0 "R?" V 1195 2950 50  0000 C CNN
F 1 "1K" V 1286 2950 50  0000 C CNN
F 2 "" V 1440 2940 50  0001 C CNN
F 3 "~" H 1400 2950 50  0001 C CNN
	1    1400 2950
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDB54
P 2150 2750
AR Path="/62ECFB9F/6A2BDB54" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDB54" Ref="R?"  Part="1" 
F 0 "R?" V 1950 2750 50  0000 C CNN
F 1 "1K" V 2050 2750 50  0000 C CNN
F 2 "" V 2190 2740 50  0001 C CNN
F 3 "~" H 2150 2750 50  0001 C CNN
	1    2150 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 2750 1950 2750
Wire Wire Line
	1850 3150 2450 3150
Wire Wire Line
	1950 2750 1950 2600
Connection ~ 1950 2750
Wire Wire Line
	1950 2750 2000 2750
Wire Wire Line
	2350 2750 2300 2750
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDB60
P 1750 3600
AR Path="/62ECFB9F/6A2BDB60" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDB60" Ref="Q?"  Part="1" 
F 0 "Q?" H 1940 3646 50  0000 L CNN
F 1 "2N3904" H 1940 3555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 1950 3525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1750 3600 50  0001 L CNN
	1    1750 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDB66
P 1400 3600
AR Path="/62ECFB9F/6A2BDB66" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDB66" Ref="R?"  Part="1" 
F 0 "R?" V 1195 3600 50  0000 C CNN
F 1 "1K" V 1286 3600 50  0000 C CNN
F 2 "" V 1440 3590 50  0001 C CNN
F 3 "~" H 1400 3600 50  0001 C CNN
	1    1400 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDB6C
P 2150 3400
AR Path="/62ECFB9F/6A2BDB6C" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDB6C" Ref="R?"  Part="1" 
F 0 "R?" V 1950 3400 50  0000 C CNN
F 1 "1K" V 2050 3400 50  0000 C CNN
F 2 "" V 2190 3390 50  0001 C CNN
F 3 "~" H 2150 3400 50  0001 C CNN
	1    2150 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 3400 1950 3400
Wire Wire Line
	1850 3800 2450 3800
Wire Wire Line
	1950 3400 1950 3250
Connection ~ 1950 3400
Wire Wire Line
	1950 3400 2000 3400
Wire Wire Line
	2350 3400 2300 3400
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDB78
P 1750 4250
AR Path="/62ECFB9F/6A2BDB78" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDB78" Ref="Q?"  Part="1" 
F 0 "Q?" H 1940 4296 50  0000 L CNN
F 1 "2N3904" H 1940 4205 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 1950 4175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1750 4250 50  0001 L CNN
	1    1750 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDB7E
P 1400 4250
AR Path="/62ECFB9F/6A2BDB7E" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDB7E" Ref="R?"  Part="1" 
F 0 "R?" V 1195 4250 50  0000 C CNN
F 1 "1K" V 1286 4250 50  0000 C CNN
F 2 "" V 1440 4240 50  0001 C CNN
F 3 "~" H 1400 4250 50  0001 C CNN
	1    1400 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDB84
P 2150 4050
AR Path="/62ECFB9F/6A2BDB84" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDB84" Ref="R?"  Part="1" 
F 0 "R?" V 1950 4050 50  0000 C CNN
F 1 "1K" V 2050 4050 50  0000 C CNN
F 2 "" V 2190 4040 50  0001 C CNN
F 3 "~" H 2150 4050 50  0001 C CNN
	1    2150 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 4050 1950 4050
Wire Wire Line
	1950 4050 1950 3900
Connection ~ 1950 4050
Wire Wire Line
	1950 4050 2000 4050
Wire Wire Line
	2350 4050 2300 4050
Wire Wire Line
	2350 1450 2350 2100
Connection ~ 2350 1450
Connection ~ 2350 2100
Wire Wire Line
	2350 2100 2350 2750
Connection ~ 2350 2750
Wire Wire Line
	2350 2750 2350 3400
Connection ~ 2350 3400
Wire Wire Line
	2350 3400 2350 4050
Entry Wire Line
	7750 4650 7650 4550
Text Label 7650 4550 2    50   ~ 0
KBSTR
Wire Wire Line
	7350 4550 7650 4550
Entry Wire Line
	7750 4550 7650 4450
Text Label 7650 4450 2    50   ~ 0
PALM
Wire Wire Line
	7350 4450 7650 4450
Connection ~ 2450 2500
Wire Wire Line
	2450 2500 2450 3150
Connection ~ 2450 3150
Wire Wire Line
	2450 3150 2450 3800
Entry Wire Line
	900  3050 1000 2950
Entry Wire Line
	900  2400 1000 2300
Entry Wire Line
	900  3700 1000 3600
Text Label 1000 3600 0    50   ~ 0
RCH10
Text Label 1000 2300 0    50   ~ 0
RCH8
Text Label 1000 2950 0    50   ~ 0
RCH9
Wire Wire Line
	1250 3600 1000 3600
Wire Wire Line
	1250 2300 1000 2300
Wire Wire Line
	1250 2950 1000 2950
Entry Wire Line
	900  4350 1000 4250
Text Label 1000 4250 0    50   ~ 0
RCH11
Wire Wire Line
	1250 4250 1000 4250
Entry Wire Line
	900  1750 1000 1650
Text Label 1000 1650 0    50   ~ 0
RCH7
Wire Wire Line
	1250 1650 1000 1650
Entry Wire Line
	900  1100 1000 1000
Text Label 1000 1000 0    50   ~ 0
RCH6
Wire Wire Line
	1250 1000 1000 1000
$Comp
L power:+5V #PWR?
U 1 1 6A2BDBD7
P 4400 850
AR Path="/62ECFB9F/6A2BDBD7" Ref="#PWR?"  Part="1" 
AR Path="/6A27E71F/6A2BDBD7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4400 700 50  0001 C CNN
F 1 "+5V" H 4415 1023 50  0000 C CNN
F 2 "" H 4400 850 50  0001 C CNN
F 3 "" H 4400 850 50  0001 C CNN
	1    4400 850 
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDBE3
P 3800 1100
AR Path="/62ECFB9F/6A2BDBE3" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDBE3" Ref="Q?"  Part="1" 
F 0 "Q?" H 3990 1146 50  0000 L CNN
F 1 "2N3904" H 3990 1055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4000 1025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3800 1100 50  0001 L CNN
	1    3800 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDBE9
P 3450 1100
AR Path="/62ECFB9F/6A2BDBE9" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDBE9" Ref="R?"  Part="1" 
F 0 "R?" V 3245 1100 50  0000 C CNN
F 1 "1K" V 3336 1100 50  0000 C CNN
F 2 "" V 3490 1090 50  0001 C CNN
F 3 "~" H 3450 1100 50  0001 C CNN
	1    3450 1100
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDBEF
P 4200 900
AR Path="/62ECFB9F/6A2BDBEF" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDBEF" Ref="R?"  Part="1" 
F 0 "R?" V 4000 900 50  0000 C CNN
F 1 "1K" V 4100 900 50  0000 C CNN
F 2 "" V 4240 890 50  0001 C CNN
F 3 "~" H 4200 900 50  0001 C CNN
	1    4200 900 
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 900  4000 900 
Wire Wire Line
	4400 900  4350 900 
Wire Wire Line
	3900 1300 4500 1300
Wire Wire Line
	4000 900  4000 750 
Connection ~ 4000 900 
Wire Wire Line
	4000 900  4050 900 
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDC18
P 1750 5600
AR Path="/62ECFB9F/6A2BDC18" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDC18" Ref="Q?"  Part="1" 
F 0 "Q?" H 1940 5646 50  0000 L CNN
F 1 "2N3904" H 1940 5555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 1950 5525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1750 5600 50  0001 L CNN
	1    1750 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDC1E
P 1400 5600
AR Path="/62ECFB9F/6A2BDC1E" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDC1E" Ref="R?"  Part="1" 
F 0 "R?" V 1195 5600 50  0000 C CNN
F 1 "1K" V 1286 5600 50  0000 C CNN
F 2 "" V 1440 5590 50  0001 C CNN
F 3 "~" H 1400 5600 50  0001 C CNN
	1    1400 5600
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDC24
P 2150 5400
AR Path="/62ECFB9F/6A2BDC24" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDC24" Ref="R?"  Part="1" 
F 0 "R?" V 1945 5400 50  0000 C CNN
F 1 "1K" V 2036 5400 50  0000 C CNN
F 2 "" V 2190 5390 50  0001 C CNN
F 3 "~" H 2150 5400 50  0001 C CNN
	1    2150 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 5400 1950 5400
Wire Wire Line
	1850 5800 2450 5800
Wire Wire Line
	1950 5400 1950 5250
Connection ~ 1950 5400
Wire Wire Line
	1950 5400 2000 5400
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDC2F
P 1750 4950
AR Path="/62ECFB9F/6A2BDC2F" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDC2F" Ref="Q?"  Part="1" 
F 0 "Q?" H 1940 4996 50  0000 L CNN
F 1 "2N3904" H 1940 4905 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 1950 4875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1750 4950 50  0001 L CNN
	1    1750 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDC35
P 1400 4950
AR Path="/62ECFB9F/6A2BDC35" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDC35" Ref="R?"  Part="1" 
F 0 "R?" V 1195 4950 50  0000 C CNN
F 1 "1K" V 1286 4950 50  0000 C CNN
F 2 "" V 1440 4940 50  0001 C CNN
F 3 "~" H 1400 4950 50  0001 C CNN
	1    1400 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDC3B
P 2150 4750
AR Path="/62ECFB9F/6A2BDC3B" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDC3B" Ref="R?"  Part="1" 
F 0 "R?" V 1945 4750 50  0000 C CNN
F 1 "1K" V 2036 4750 50  0000 C CNN
F 2 "" V 2190 4740 50  0001 C CNN
F 3 "~" H 2150 4750 50  0001 C CNN
	1    2150 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 4750 1950 4750
Wire Wire Line
	1850 5150 2450 5150
Wire Wire Line
	1950 4750 1950 4600
Connection ~ 1950 4750
Wire Wire Line
	1950 4750 2000 4750
Wire Wire Line
	2300 4750 2350 4750
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDC53
P 3800 1750
AR Path="/62ECFB9F/6A2BDC53" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDC53" Ref="Q?"  Part="1" 
F 0 "Q?" H 3990 1796 50  0000 L CNN
F 1 "2N3904" H 3990 1705 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4000 1675 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3800 1750 50  0001 L CNN
	1    3800 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDC59
P 3450 1750
AR Path="/62ECFB9F/6A2BDC59" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDC59" Ref="R?"  Part="1" 
F 0 "R?" V 3245 1750 50  0000 C CNN
F 1 "1K" V 3336 1750 50  0000 C CNN
F 2 "" V 3490 1740 50  0001 C CNN
F 3 "~" H 3450 1750 50  0001 C CNN
	1    3450 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDC5F
P 4200 1550
AR Path="/62ECFB9F/6A2BDC5F" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDC5F" Ref="R?"  Part="1" 
F 0 "R?" V 4000 1550 50  0000 C CNN
F 1 "1K" V 4100 1550 50  0000 C CNN
F 2 "" V 4240 1540 50  0001 C CNN
F 3 "~" H 4200 1550 50  0001 C CNN
	1    4200 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 1550 4000 1550
Wire Wire Line
	4400 1550 4350 1550
Wire Wire Line
	3900 1950 4500 1950
Wire Wire Line
	4000 1550 4000 1400
Connection ~ 4000 1550
Wire Wire Line
	4000 1550 4050 1550
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDC6B
P 3800 2400
AR Path="/62ECFB9F/6A2BDC6B" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDC6B" Ref="Q?"  Part="1" 
F 0 "Q?" H 3990 2446 50  0000 L CNN
F 1 "2N3904" H 3990 2355 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4000 2325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3800 2400 50  0001 L CNN
	1    3800 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDC71
P 3450 2400
AR Path="/62ECFB9F/6A2BDC71" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDC71" Ref="R?"  Part="1" 
F 0 "R?" V 3245 2400 50  0000 C CNN
F 1 "1K" V 3336 2400 50  0000 C CNN
F 2 "" V 3490 2390 50  0001 C CNN
F 3 "~" H 3450 2400 50  0001 C CNN
	1    3450 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDC77
P 4200 2200
AR Path="/62ECFB9F/6A2BDC77" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDC77" Ref="R?"  Part="1" 
F 0 "R?" V 4000 2200 50  0000 C CNN
F 1 "1K" V 4100 2200 50  0000 C CNN
F 2 "" V 4240 2190 50  0001 C CNN
F 3 "~" H 4200 2200 50  0001 C CNN
	1    4200 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 2200 4000 2200
Wire Wire Line
	3900 2600 4500 2600
Wire Wire Line
	4000 2200 4000 2050
Connection ~ 4000 2200
Wire Wire Line
	4000 2200 4050 2200
Connection ~ 4500 2600
Wire Wire Line
	4500 2600 4500 3250
Connection ~ 4500 1950
Wire Wire Line
	4500 1950 4500 2600
Wire Wire Line
	4400 2200 4350 2200
Wire Wire Line
	4500 1300 4500 1950
Wire Wire Line
	4400 900  4400 1550
Connection ~ 4400 1550
Wire Wire Line
	4400 1550 4400 2200
Wire Wire Line
	4400 2200 4400 2850
Connection ~ 4400 2200
Entry Wire Line
	900  5050 1000 4950
Entry Wire Line
	900  5700 1000 5600
Entry Wire Line
	2950 1200 3050 1100
Text Label 3050 1100 0    50   ~ 0
RRST
Wire Wire Line
	3300 1100 3050 1100
Text Label 1000 5600 0    50   ~ 0
RCH13
Text Label 1000 4950 0    50   ~ 0
RCH12
Wire Wire Line
	1250 5600 1000 5600
Wire Wire Line
	1250 4950 1000 4950
Entry Wire Line
	2950 2500 3050 2400
Text Label 3050 2400 0    50   ~ 0
RKBD1
Wire Wire Line
	3300 2400 3050 2400
Entry Wire Line
	2950 1850 3050 1750
Text Label 3050 1750 0    50   ~ 0
RCLK1
Wire Wire Line
	3300 1750 3050 1750
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDCA3
P 3800 3050
AR Path="/62ECFB9F/6A2BDCA3" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDCA3" Ref="Q?"  Part="1" 
F 0 "Q?" H 3990 3096 50  0000 L CNN
F 1 "2N3904" H 3990 3005 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4000 2975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3800 3050 50  0001 L CNN
	1    3800 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDCA9
P 3450 3050
AR Path="/62ECFB9F/6A2BDCA9" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDCA9" Ref="R?"  Part="1" 
F 0 "R?" V 3245 3050 50  0000 C CNN
F 1 "1K" V 3336 3050 50  0000 C CNN
F 2 "" V 3490 3040 50  0001 C CNN
F 3 "~" H 3450 3050 50  0001 C CNN
	1    3450 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDCAF
P 4200 2850
AR Path="/62ECFB9F/6A2BDCAF" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDCAF" Ref="R?"  Part="1" 
F 0 "R?" V 4000 2850 50  0000 C CNN
F 1 "1K" V 4100 2850 50  0000 C CNN
F 2 "" V 4240 2840 50  0001 C CNN
F 3 "~" H 4200 2850 50  0001 C CNN
	1    4200 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 2850 4000 2850
Wire Wire Line
	3900 3250 4500 3250
Wire Wire Line
	4000 2850 4000 2700
Connection ~ 4000 2850
Wire Wire Line
	4000 2850 4050 2850
Wire Wire Line
	4400 2850 4350 2850
Entry Wire Line
	2950 3150 3050 3050
Text Label 3050 3050 0    50   ~ 0
RRPRO
Wire Wire Line
	3300 3050 3050 3050
$Comp
L power:GND #PWR?
U 1 1 6A2BDCBE
P 4500 7400
AR Path="/62ECFB9F/6A2BDCBE" Ref="#PWR?"  Part="1" 
AR Path="/6A27E71F/6A2BDCBE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4500 7150 50  0001 C CNN
F 1 "GND" H 4505 7227 50  0000 C CNN
F 2 "" H 4500 7400 50  0001 C CNN
F 3 "" H 4500 7400 50  0001 C CNN
	1    4500 7400
	1    0    0    -1  
$EndComp
Connection ~ 2950 550 
Wire Bus Line
	2950 550  900  550 
Wire Wire Line
	700  3900 1950 3900
Wire Wire Line
	700  3250 1950 3250
Wire Wire Line
	700  2600 1950 2600
Wire Wire Line
	700  1950 1950 1950
Wire Wire Line
	700  1300 1950 1300
Wire Wire Line
	700  650  1950 650 
Connection ~ 2450 3800
Wire Wire Line
	2700 1400 4000 1400
Wire Wire Line
	2700 2050 4000 2050
Wire Wire Line
	2700 2700 4000 2700
Wire Wire Line
	2700 750  4000 750 
Connection ~ 4500 3250
Entry Wire Line
	2950 7350 3050 7250
Text Label 3050 7250 0    50   ~ 0
RGND
Wire Wire Line
	4500 7250 3050 7250
NoConn ~ 7350 6050
Wire Wire Line
	7350 6150 7650 6150
Entry Wire Line
	7750 6250 7650 6150
Text Label 7650 6150 2    50   ~ 0
CLK3
Wire Wire Line
	4500 3250 4500 3900
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A31868A
P 3800 3700
AR Path="/62ECFB9F/6A31868A" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A31868A" Ref="Q?"  Part="1" 
F 0 "Q?" H 3990 3746 50  0000 L CNN
F 1 "2N3904" H 3990 3655 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4000 3625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3800 3700 50  0001 L CNN
	1    3800 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A318690
P 3450 3700
AR Path="/62ECFB9F/6A318690" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A318690" Ref="R?"  Part="1" 
F 0 "R?" V 3245 3700 50  0000 C CNN
F 1 "1K" V 3336 3700 50  0000 C CNN
F 2 "" V 3490 3690 50  0001 C CNN
F 3 "~" H 3450 3700 50  0001 C CNN
	1    3450 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A318696
P 4200 3500
AR Path="/62ECFB9F/6A318696" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A318696" Ref="R?"  Part="1" 
F 0 "R?" V 4000 3500 50  0000 C CNN
F 1 "1K" V 4100 3500 50  0000 C CNN
F 2 "" V 4240 3490 50  0001 C CNN
F 3 "~" H 4200 3500 50  0001 C CNN
	1    4200 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 3500 4000 3500
Wire Wire Line
	4000 3500 4000 3350
Connection ~ 4000 3500
Wire Wire Line
	4000 3500 4050 3500
Wire Wire Line
	4400 3500 4350 3500
Entry Wire Line
	2950 3800 3050 3700
Text Label 3050 3700 0    50   ~ 0
RCLK2
Wire Wire Line
	3300 3700 3050 3700
Wire Wire Line
	2700 3350 4000 3350
Text Label 2700 3350 0    50   ~ 0
CLK2
Entry Wire Line
	2600 3450 2700 3350
Wire Wire Line
	4400 2850 4400 3500
Connection ~ 4400 2850
Wire Wire Line
	3900 3900 4500 3900
Connection ~ 4500 3900
$Comp
L 74xx:74HC245 U?
U 1 1 6A49B8D4
P 5600 4650
F 0 "U?" H 5800 5400 50  0000 C CNN
F 1 "74HC245" H 5850 5300 50  0000 C CNN
F 2 "" H 5600 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 5600 4650 50  0001 C CNN
	1    5600 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6A49D8DD
P 5600 5450
F 0 "#PWR?" H 5600 5200 50  0001 C CNN
F 1 "GND" H 5605 5277 50  0000 C CNN
F 2 "" H 5600 5450 50  0001 C CNN
F 3 "" H 5600 5450 50  0001 C CNN
	1    5600 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 6A49E1A4
P 5600 3850
F 0 "#PWR?" H 5600 3700 50  0001 C CNN
F 1 "+3.3V" H 5615 4023 50  0000 C CNN
F 2 "" H 5600 3850 50  0001 C CNN
F 3 "" H 5600 3850 50  0001 C CNN
	1    5600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 5050 5100 5150
Connection ~ 5100 5150
Wire Wire Line
	5100 5150 5100 5250
$Comp
L power:GND #PWR?
U 1 1 6A4B92FA
P 5100 5250
F 0 "#PWR?" H 5100 5000 50  0001 C CNN
F 1 "GND" H 5105 5077 50  0000 C CNN
F 2 "" H 5100 5250 50  0001 C CNN
F 3 "" H 5100 5250 50  0001 C CNN
	1    5100 5250
	1    0    0    -1  
$EndComp
Entry Wire Line
	6500 4250 6400 4150
Text Label 6400 4150 2    50   ~ 0
CH1
Wire Wire Line
	6100 4150 6400 4150
Entry Wire Line
	6500 4350 6400 4250
Text Label 6400 4250 2    50   ~ 0
CH2
Wire Wire Line
	6100 4250 6400 4250
Entry Wire Line
	6500 4450 6400 4350
Text Label 6400 4350 2    50   ~ 0
CH3
Wire Wire Line
	6100 4350 6400 4350
Entry Wire Line
	6500 4550 6400 4450
Text Label 6400 4450 2    50   ~ 0
CH4
Wire Wire Line
	6100 4450 6400 4450
Entry Wire Line
	6500 4650 6400 4550
Text Label 6400 4550 2    50   ~ 0
CH5
Wire Wire Line
	6100 4550 6400 4550
Entry Wire Line
	6500 4750 6400 4650
Text Label 6400 4650 2    50   ~ 0
CH14
Wire Wire Line
	6100 4650 6400 4650
Entry Wire Line
	6500 4850 6400 4750
Text Label 6400 4750 2    50   ~ 0
KBSTR
Wire Wire Line
	6100 4750 6400 4750
NoConn ~ 6100 4850
NoConn ~ 5100 4850
Entry Wire Line
	4650 4250 4750 4150
Entry Wire Line
	4650 4350 4750 4250
Entry Wire Line
	4650 4450 4750 4350
Text Label 4750 4350 0    50   ~ 0
RCH3
Text Label 4750 4250 0    50   ~ 0
RCH2
Text Label 4750 4150 0    50   ~ 0
RCH1
Wire Wire Line
	5100 4350 4750 4350
Wire Wire Line
	5100 4250 4750 4250
Wire Wire Line
	5100 4150 4750 4150
Entry Wire Line
	4650 4550 4750 4450
Entry Wire Line
	4650 4650 4750 4550
Entry Wire Line
	4650 4750 4750 4650
Text Label 4750 4650 0    50   ~ 0
RCH14
Text Label 4750 4550 0    50   ~ 0
RCH5
Text Label 4750 4450 0    50   ~ 0
RCH4
Wire Wire Line
	5100 4650 4750 4650
Wire Wire Line
	5100 4550 4750 4550
Wire Wire Line
	5100 4450 4750 4450
Entry Wire Line
	4650 4850 4750 4750
Text Label 4750 4750 0    50   ~ 0
RKBSTR
Wire Wire Line
	5100 4750 4750 4750
Connection ~ 2350 800 
Wire Wire Line
	2450 3800 2450 4450
Wire Wire Line
	1850 4450 2450 4450
Connection ~ 2450 4450
Wire Wire Line
	700  5900 1950 5900
Wire Wire Line
	1250 6250 1000 6250
Text Label 1000 6250 0    50   ~ 0
RCH15
Entry Wire Line
	900  6350 1000 6250
Wire Wire Line
	1950 6050 2000 6050
Connection ~ 1950 6050
Wire Wire Line
	1950 6050 1950 5900
Wire Wire Line
	4400 850  4400 900 
Wire Wire Line
	1850 6450 2450 6450
Wire Wire Line
	2350 6050 2300 6050
Wire Wire Line
	1850 6050 1950 6050
$Comp
L Device:R_US R?
U 1 1 6A2BDBD0
P 2150 6050
AR Path="/62ECFB9F/6A2BDBD0" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDBD0" Ref="R?"  Part="1" 
F 0 "R?" V 1945 6050 50  0000 C CNN
F 1 "1K" V 2036 6050 50  0000 C CNN
F 2 "" V 2190 6040 50  0001 C CNN
F 3 "~" H 2150 6050 50  0001 C CNN
	1    2150 6050
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6A2BDBCA
P 1400 6250
AR Path="/62ECFB9F/6A2BDBCA" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6A2BDBCA" Ref="R?"  Part="1" 
F 0 "R?" V 1195 6250 50  0000 C CNN
F 1 "1K" V 1286 6250 50  0000 C CNN
F 2 "" V 1440 6240 50  0001 C CNN
F 3 "~" H 1400 6250 50  0001 C CNN
	1    1400 6250
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6A2BDBC4
P 1750 6250
AR Path="/62ECFB9F/6A2BDBC4" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6A2BDBC4" Ref="Q?"  Part="1" 
F 0 "Q?" H 1940 6296 50  0000 L CNN
F 1 "2N3904" H 1940 6205 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 1950 6175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1750 6250 50  0001 L CNN
	1    1750 6250
	1    0    0    -1  
$EndComp
Connection ~ 2450 5150
Wire Wire Line
	2450 4450 2450 5150
Connection ~ 2450 5800
Wire Wire Line
	2450 5800 2450 6450
Wire Wire Line
	2350 4750 2350 5400
Wire Wire Line
	2450 5150 2450 5800
Wire Wire Line
	2300 5400 2350 5400
Connection ~ 2350 5400
Wire Wire Line
	2350 5400 2350 6050
Wire Wire Line
	700  5250 1950 5250
Wire Wire Line
	700  4600 1950 4600
Wire Wire Line
	2350 4050 2350 4750
Connection ~ 2350 4050
Connection ~ 2350 4750
Connection ~ 2450 6450
Wire Wire Line
	2450 6450 2450 6500
Connection ~ 4400 900 
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6AC8E220
P 3800 4350
AR Path="/62ECFB9F/6AC8E220" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6AC8E220" Ref="Q?"  Part="1" 
F 0 "Q?" H 3990 4396 50  0000 L CNN
F 1 "2N3904" H 3990 4305 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4000 4275 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3800 4350 50  0001 L CNN
	1    3800 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6AC8E226
P 3450 4350
AR Path="/62ECFB9F/6AC8E226" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6AC8E226" Ref="R?"  Part="1" 
F 0 "R?" V 3245 4350 50  0000 C CNN
F 1 "1K" V 3336 4350 50  0000 C CNN
F 2 "" V 3490 4340 50  0001 C CNN
F 3 "~" H 3450 4350 50  0001 C CNN
	1    3450 4350
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6AC8E22C
P 4200 4150
AR Path="/62ECFB9F/6AC8E22C" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6AC8E22C" Ref="R?"  Part="1" 
F 0 "R?" V 4000 4150 50  0000 C CNN
F 1 "1K" V 4100 4150 50  0000 C CNN
F 2 "" V 4240 4140 50  0001 C CNN
F 3 "~" H 4200 4150 50  0001 C CNN
	1    4200 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 4150 4000 4150
Wire Wire Line
	4000 4150 4000 4000
Connection ~ 4000 4150
Wire Wire Line
	4000 4150 4050 4150
Wire Wire Line
	4400 4150 4350 4150
Entry Wire Line
	2950 4450 3050 4350
Text Label 3050 4350 0    50   ~ 0
RDISP
Wire Wire Line
	3300 4350 3050 4350
Wire Wire Line
	2700 4000 4000 4000
Wire Wire Line
	3900 4550 4500 4550
Text Label 2700 4000 0    50   ~ 0
DISP
Entry Wire Line
	2600 4100 2700 4000
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6ACBAC95
P 3800 5000
AR Path="/62ECFB9F/6ACBAC95" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6ACBAC95" Ref="Q?"  Part="1" 
F 0 "Q?" H 3990 5046 50  0000 L CNN
F 1 "2N3904" H 3990 4955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4000 4925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3800 5000 50  0001 L CNN
	1    3800 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6ACBAC9B
P 3450 5000
AR Path="/62ECFB9F/6ACBAC9B" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6ACBAC9B" Ref="R?"  Part="1" 
F 0 "R?" V 3245 5000 50  0000 C CNN
F 1 "1K" V 3336 5000 50  0000 C CNN
F 2 "" V 3490 4990 50  0001 C CNN
F 3 "~" H 3450 5000 50  0001 C CNN
	1    3450 5000
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6ACBACA1
P 4200 4800
AR Path="/62ECFB9F/6ACBACA1" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6ACBACA1" Ref="R?"  Part="1" 
F 0 "R?" V 4000 4800 50  0000 C CNN
F 1 "1K" V 4100 4800 50  0000 C CNN
F 2 "" V 4240 4790 50  0001 C CNN
F 3 "~" H 4200 4800 50  0001 C CNN
	1    4200 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 4800 4000 4800
Wire Wire Line
	4000 4800 4000 4650
Connection ~ 4000 4800
Wire Wire Line
	4000 4800 4050 4800
Wire Wire Line
	4400 4800 4350 4800
Entry Wire Line
	2950 5100 3050 5000
Text Label 3050 5000 0    50   ~ 0
RINDC
Wire Wire Line
	3300 5000 3050 5000
Wire Wire Line
	2700 4650 4000 4650
Wire Wire Line
	3900 5200 4500 5200
Text Label 2700 4650 0    50   ~ 0
INDC
Entry Wire Line
	2600 4750 2700 4650
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6ACEB447
P 3800 5650
AR Path="/62ECFB9F/6ACEB447" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6ACEB447" Ref="Q?"  Part="1" 
F 0 "Q?" H 3990 5696 50  0000 L CNN
F 1 "2N3904" H 3990 5605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4000 5575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3800 5650 50  0001 L CNN
	1    3800 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6ACEB44D
P 3450 5650
AR Path="/62ECFB9F/6ACEB44D" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6ACEB44D" Ref="R?"  Part="1" 
F 0 "R?" V 3245 5650 50  0000 C CNN
F 1 "1K" V 3336 5650 50  0000 C CNN
F 2 "" V 3490 5640 50  0001 C CNN
F 3 "~" H 3450 5650 50  0001 C CNN
	1    3450 5650
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6ACEB453
P 4200 5450
AR Path="/62ECFB9F/6ACEB453" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6ACEB453" Ref="R?"  Part="1" 
F 0 "R?" V 4000 5450 50  0000 C CNN
F 1 "1K" V 4100 5450 50  0000 C CNN
F 2 "" V 4240 5440 50  0001 C CNN
F 3 "~" H 4200 5450 50  0001 C CNN
	1    4200 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 5450 4000 5450
Wire Wire Line
	4000 5450 4000 5300
Connection ~ 4000 5450
Wire Wire Line
	4000 5450 4050 5450
Wire Wire Line
	4400 5450 4350 5450
Entry Wire Line
	2950 5750 3050 5650
Text Label 3050 5650 0    50   ~ 0
RCLK3
Wire Wire Line
	3300 5650 3050 5650
Wire Wire Line
	2700 5300 4000 5300
Wire Wire Line
	3900 5850 4500 5850
Text Label 2700 5300 0    50   ~ 0
CLK3
Entry Wire Line
	2600 5400 2700 5300
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6AD81050
P 3800 6300
AR Path="/62ECFB9F/6AD81050" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6AD81050" Ref="Q?"  Part="1" 
F 0 "Q?" H 3990 6346 50  0000 L CNN
F 1 "2N3904" H 3990 6255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4000 6225 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3800 6300 50  0001 L CNN
	1    3800 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6AD81056
P 3450 6300
AR Path="/62ECFB9F/6AD81056" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6AD81056" Ref="R?"  Part="1" 
F 0 "R?" V 3245 6300 50  0000 C CNN
F 1 "1K" V 3336 6300 50  0000 C CNN
F 2 "" V 3490 6290 50  0001 C CNN
F 3 "~" H 3450 6300 50  0001 C CNN
	1    3450 6300
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6AD8105C
P 4200 6100
AR Path="/62ECFB9F/6AD8105C" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6AD8105C" Ref="R?"  Part="1" 
F 0 "R?" V 4000 6100 50  0000 C CNN
F 1 "1K" V 4100 6100 50  0000 C CNN
F 2 "" V 4240 6090 50  0001 C CNN
F 3 "~" H 4200 6100 50  0001 C CNN
	1    4200 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 6100 4000 6100
Wire Wire Line
	4000 6100 4000 5950
Connection ~ 4000 6100
Wire Wire Line
	4000 6100 4050 6100
Wire Wire Line
	4400 6100 4350 6100
Entry Wire Line
	2950 6400 3050 6300
Text Label 3050 6300 0    50   ~ 0
RSTBY
Wire Wire Line
	3300 6300 3050 6300
Wire Wire Line
	2700 5950 4000 5950
Wire Wire Line
	3900 6500 4500 6500
Text Label 2700 5950 0    50   ~ 0
STBY
Entry Wire Line
	2600 6050 2700 5950
Wire Wire Line
	4400 3500 4400 4150
Connection ~ 4400 3500
Wire Wire Line
	4400 4150 4400 4800
Connection ~ 4400 4150
Wire Wire Line
	4400 4800 4400 5450
Connection ~ 4400 4800
Wire Wire Line
	4400 5450 4400 6100
Connection ~ 4400 5450
Wire Bus Line
	600  7650 2600 7650
Connection ~ 4500 7250
Wire Wire Line
	4500 7250 4500 7400
Wire Wire Line
	4500 3900 4500 7250
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 6AF06458
P 3800 6950
AR Path="/62ECFB9F/6AF06458" Ref="Q?"  Part="1" 
AR Path="/6A27E71F/6AF06458" Ref="Q?"  Part="1" 
F 0 "Q?" H 3990 6996 50  0000 L CNN
F 1 "2N3904" H 3990 6905 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4000 6875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3800 6950 50  0001 L CNN
	1    3800 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6AF0645E
P 3450 6950
AR Path="/62ECFB9F/6AF0645E" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6AF0645E" Ref="R?"  Part="1" 
F 0 "R?" V 3245 6950 50  0000 C CNN
F 1 "1K" V 3336 6950 50  0000 C CNN
F 2 "" V 3490 6940 50  0001 C CNN
F 3 "~" H 3450 6950 50  0001 C CNN
	1    3450 6950
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6AF06464
P 4200 6750
AR Path="/62ECFB9F/6AF06464" Ref="R?"  Part="1" 
AR Path="/6A27E71F/6AF06464" Ref="R?"  Part="1" 
F 0 "R?" V 4000 6750 50  0000 C CNN
F 1 "1K" V 4100 6750 50  0000 C CNN
F 2 "" V 4240 6740 50  0001 C CNN
F 3 "~" H 4200 6750 50  0001 C CNN
	1    4200 6750
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 6750 4000 6750
Wire Wire Line
	4000 6750 4000 6600
Connection ~ 4000 6750
Wire Wire Line
	4000 6750 4050 6750
Entry Wire Line
	2950 7050 3050 6950
Text Label 3050 6950 0    50   ~ 0
RPALM
Wire Wire Line
	3300 6950 3050 6950
Wire Wire Line
	2700 6600 4000 6600
Wire Wire Line
	3900 7150 4500 7150
Wire Wire Line
	4400 6100 4400 6750
Wire Wire Line
	4400 6750 4350 6750
Connection ~ 4400 6100
Text Label 2700 6600 0    50   ~ 0
PALM
Entry Wire Line
	2600 6700 2700 6600
Wire Bus Line
	2950 550  4650 550 
Connection ~ 2600 7650
Connection ~ 4650 550 
Wire Bus Line
	4650 550  5900 550 
NoConn ~ 5500 1050
Wire Wire Line
	5000 2750 4750 2750
Text Label 4750 2750 0    50   ~ 0
RGND
Entry Wire Line
	4650 2850 4750 2750
NoConn ~ 5000 2150
NoConn ~ 5500 850 
NoConn ~ 5000 850 
NoConn ~ 5500 950 
NoConn ~ 5000 1250
NoConn ~ 5500 2450
NoConn ~ 5500 2250
NoConn ~ 5500 2150
NoConn ~ 5000 2050
NoConn ~ 5500 1450
NoConn ~ 5500 1750
NoConn ~ 5000 1650
Wire Wire Line
	5000 950  4750 950 
Wire Wire Line
	5000 1050 4750 1050
Wire Wire Line
	5000 1150 4750 1150
Text Label 4750 950  0    50   ~ 0
RCH1
Text Label 4750 1050 0    50   ~ 0
RCH2
Text Label 4750 1150 0    50   ~ 0
RCH3
Wire Wire Line
	5000 1350 4750 1350
Wire Wire Line
	5000 1550 4750 1550
Text Label 4750 1350 0    50   ~ 0
RCLK1
Text Label 4750 1550 0    50   ~ 0
RKBD1
Wire Wire Line
	5000 1750 4750 1750
Wire Wire Line
	5000 1850 4750 1850
Wire Wire Line
	5000 1950 4750 1950
Text Label 4750 1750 0    50   ~ 0
RCH9
Text Label 4750 1850 0    50   ~ 0
RCH8
Text Label 4750 1950 0    50   ~ 0
RCH10
Wire Wire Line
	5000 2250 4750 2250
Wire Wire Line
	5000 2350 4750 2350
Wire Wire Line
	5000 2450 4750 2450
Text Label 4750 2250 0    50   ~ 0
RCH4
Text Label 4750 2350 0    50   ~ 0
RCH5
Text Label 4750 2450 0    50   ~ 0
RCH12
Wire Wire Line
	5000 2550 4750 2550
Wire Wire Line
	5000 2650 4750 2650
Text Label 4750 2550 0    50   ~ 0
RCLK3
Text Label 4750 2650 0    50   ~ 0
RRST
Wire Wire Line
	5500 2750 5800 2750
Wire Wire Line
	5500 2650 5800 2650
Text Label 5800 2750 2    50   ~ 0
RINDC
Text Label 5800 2650 2    50   ~ 0
RDISP
Wire Wire Line
	5500 2550 5800 2550
Text Label 5800 2550 2    50   ~ 0
RCH15
Wire Wire Line
	5500 1350 5800 1350
Wire Wire Line
	5500 1250 5800 1250
Text Label 5800 1350 2    50   ~ 0
RCLK2
Text Label 5800 1250 2    50   ~ 0
RCH14
Wire Wire Line
	5500 1150 5800 1150
Text Label 5800 1150 2    50   ~ 0
RCH13
Wire Wire Line
	5500 2050 5800 2050
Wire Wire Line
	5500 1950 5800 1950
Text Label 5800 2050 2    50   ~ 0
RCH6
Text Label 5800 1950 2    50   ~ 0
RCH7
Wire Wire Line
	5500 1650 5800 1650
Wire Wire Line
	5500 1550 5800 1550
Text Label 5800 1650 2    50   ~ 0
RRPRO
Text Label 5800 1550 2    50   ~ 0
RKBSTR
Wire Wire Line
	5500 2350 5800 2350
Text Label 5800 2350 2    50   ~ 0
RCH11
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J?
U 1 1 6A2BDA61
P 5200 1750
AR Path="/60F989FD/6A2BDA61" Ref="J?"  Part="1" 
AR Path="/62ECFB9F/6A2BDA61" Ref="J?"  Part="1" 
AR Path="/6A27E71F/6A2BDA61" Ref="J?"  Part="1" 
F 0 "J?" H 5250 2867 50  0000 C CNN
F 1 "RPI_Connector" H 5250 2776 50  0000 C CNN
F 2 "" H 5200 1750 50  0001 C CNN
F 3 "~" H 5200 1750 50  0001 C CNN
	1    5200 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1450 4750 1450
Text Label 4750 1450 0    50   ~ 0
RPALM
Wire Wire Line
	5500 1850 5800 1850
Text Label 5800 1850 2    50   ~ 0
RSTBY
Entry Wire Line
	5900 1950 5800 1850
Entry Wire Line
	4650 1550 4750 1450
Entry Wire Line
	5900 2450 5800 2350
Entry Wire Line
	5900 1650 5800 1550
Entry Wire Line
	5900 1750 5800 1650
Entry Wire Line
	5900 2050 5800 1950
Entry Wire Line
	5900 2150 5800 2050
Entry Wire Line
	5900 1250 5800 1150
Entry Wire Line
	5900 1350 5800 1250
Entry Wire Line
	5900 1450 5800 1350
Entry Wire Line
	5900 2650 5800 2550
Entry Wire Line
	5900 2750 5800 2650
Entry Wire Line
	5900 2850 5800 2750
Entry Wire Line
	4650 2750 4750 2650
Entry Wire Line
	4650 2650 4750 2550
Entry Wire Line
	4650 2550 4750 2450
Entry Wire Line
	4650 2450 4750 2350
Entry Wire Line
	4650 2350 4750 2250
Entry Wire Line
	4650 2050 4750 1950
Entry Wire Line
	4650 1950 4750 1850
Entry Wire Line
	4650 1850 4750 1750
Entry Wire Line
	4650 1650 4750 1550
Entry Wire Line
	4650 1450 4750 1350
Entry Wire Line
	4650 1250 4750 1150
Entry Wire Line
	4650 1150 4750 1050
Entry Wire Line
	4650 1050 4750 950 
Wire Bus Line
	5350 7650 5350 6350
Wire Bus Line
	5350 6350 6500 6350
Wire Bus Line
	2600 7650 5350 7650
Wire Bus Line
	900  550  900  6400
Wire Bus Line
	2600 700  2600 7650
Wire Bus Line
	7750 3850 7750 6400
Wire Bus Line
	600  600  600  7650
Wire Bus Line
	2950 550  2950 7450
Wire Bus Line
	5900 550  5900 2900
Wire Bus Line
	6500 3850 6500 6350
Wire Bus Line
	4650 550  4650 4900
$EndSCHEMATC
