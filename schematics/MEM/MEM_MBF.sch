EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 2 18
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	9150 3450 9400 3450
Wire Wire Line
	9150 3550 9400 3550
Wire Wire Line
	9150 3650 9400 3650
Text HLabel 9400 3450 2    50   Output ~ 0
EQU3
Text HLabel 9400 3550 2    50   Output ~ 0
EQU4
Text HLabel 9400 3650 2    50   Output ~ 0
EQU6
Text HLabel 1500 2850 0    50   BiDi ~ 0
W[1..16]
Wire Wire Line
	4500 3150 4200 3150
Text HLabel 4200 3150 0    50   Input ~ 0
SBWG
Text HLabel 4200 2700 0    50   BiDi ~ 0
LG[1..16]
$Sheet
S 1750 2600 1350 2150
U 6A6261F4
F0 "MEM_MBF_SFT" 50
F1 "MEM_MBF_SFT.sch" 50
F2 "W[1..16]" B L 1750 2850 50 
F3 "GMUX[1..16]" O R 3100 4450 50 
F4 "WG" I L 1750 3100 50 
F5 "W22" I L 1750 3400 50 
F6 "W23" I L 1750 3500 50 
F7 "W20" I L 1750 3200 50 
F8 "W21" I L 1750 3300 50 
$EndSheet
$Sheet
S 4500 2600 1450 2050
U 69BF3465
F0 "MEM_MBF_MBL" 50
F1 "MEM_MBF_MBL.sch" 50
F2 "SBWG" I L 4500 3150 50 
F3 "LG[1..16]" B L 4500 2700 50 
F4 "GM[1..16]" O R 5950 4450 50 
F5 "GMUX[1..16]" I L 4500 4450 50 
F6 "MB_CLK2" I L 4500 3250 50 
F7 "L2GD" I L 4500 3350 50 
F8 "M[1..16]" I L 4500 2900 50 
F9 "W20" I L 4500 3550 50 
F10 "W21" I L 4500 3650 50 
F11 "W22" I L 4500 3750 50 
F12 "W23" I L 4500 3850 50 
F13 "GENRST" I L 4500 3950 50 
F14 "WE" I L 4500 4050 50 
F15 "SBWG" I L 4500 4250 50 
F16 "MB_CLK2" I L 4500 4150 50 
F17 "WG" I L 4500 3050 50 
F18 "G1" O R 5950 2850 50 
F19 "G16" O R 5950 2950 50 
F20 "MCRO" I L 4500 3450 50 
$EndSheet
Wire Bus Line
	1750 2850 1500 2850
Wire Bus Line
	3100 4450 4500 4450
Wire Bus Line
	9150 2950 9400 2950
Wire Bus Line
	4500 2700 4200 2700
Wire Bus Line
	5950 4450 7600 4450
Wire Wire Line
	4500 3250 4200 3250
Text HLabel 4200 3250 0    50   Input ~ 0
MB_CLK2
Wire Wire Line
	4500 3350 4200 3350
Text HLabel 4200 3350 0    50   Input ~ 0
L2GD
Wire Wire Line
	1750 3100 1500 3100
Text HLabel 1500 3100 0    50   Input ~ 0
WG
Wire Wire Line
	1750 3400 1500 3400
Text HLabel 1500 3400 0    50   Input ~ 0
W22
Wire Wire Line
	1750 3500 1500 3500
Text HLabel 1500 3500 0    50   Input ~ 0
W23
Text HLabel 9400 2750 2    50   Output ~ 0
W[1..16]
Wire Bus Line
	9400 2750 9150 2750
Text HLabel 9400 3150 2    50   Output ~ 0
LG[1..16]
Wire Bus Line
	9400 3150 9150 3150
Wire Wire Line
	4500 3550 4200 3550
Text HLabel 4200 3550 0    50   Input ~ 0
W20
Wire Wire Line
	4500 3650 4200 3650
Text HLabel 4200 3650 0    50   Input ~ 0
W21
Wire Wire Line
	4500 3750 4200 3750
Text HLabel 4200 3750 0    50   Input ~ 0
W22
Wire Wire Line
	4500 3850 4200 3850
Text HLabel 4200 3850 0    50   Input ~ 0
W23
Wire Wire Line
	7600 3550 7300 3550
Text HLabel 7300 3550 0    50   Input ~ 0
CLK1
Wire Wire Line
	7600 3650 7300 3650
Text HLabel 7300 3650 0    50   Input ~ 0
RG
Wire Wire Line
	4500 3950 4200 3950
Text HLabel 4200 3950 0    50   Input ~ 0
GENRST
Wire Wire Line
	4500 4050 4200 4050
Text HLabel 4200 4050 0    50   Input ~ 0
WE
Wire Wire Line
	7600 3850 7300 3850
Text HLabel 7300 3850 0    50   Input ~ 0
MANDATA
Wire Wire Line
	9150 3750 9400 3750
Text HLabel 9400 3750 2    50   Output ~ 0
GMZ
Text HLabel 7350 3350 0    50   Input ~ 0
CLK1
Text HLabel 7350 3450 0    50   Input ~ 0
G2LS
Wire Wire Line
	7350 3450 7600 3450
Wire Wire Line
	7350 3350 7600 3350
Wire Wire Line
	4500 4150 4200 4150
Text HLabel 4200 4150 0    50   Input ~ 0
MB_CLK2
Text HLabel 9400 2950 2    50   Output ~ 0
M[1..16]
$Sheet
S 7600 2600 1550 2050
U 69BF3423
F0 "MEM_MBF_GMB" 50
F1 "MEM_MBF_GMB.sch" 50
F2 "CLK1" I L 7600 3350 50 
F3 "EQU4" O R 9150 3550 50 
F4 "EQU6" O R 9150 3650 50 
F5 "G2LS" I L 7600 3450 50 
F6 "EQU3" O R 9150 3450 50 
F7 "GM[1..16]" I L 7600 4450 50 
F8 "W[1..16]" O R 9150 2750 50 
F9 "M[1..16]" O R 9150 2950 50 
F10 "LG[1..16]" O R 9150 3150 50 
F11 "GMZ" O R 9150 3750 50 
F12 "CLK1" I L 7600 3550 50 
F13 "RG" I L 7600 3650 50 
F14 "WE" I L 7600 3750 50 
F15 "MANDATA" I L 7600 3850 50 
$EndSheet
Text HLabel 4200 2900 0    50   Input ~ 0
M[1..16]
Wire Bus Line
	4500 2900 4200 2900
Wire Wire Line
	4500 4250 4200 4250
Text HLabel 4200 4250 0    50   Input ~ 0
SBWG
Wire Wire Line
	7600 3750 7300 3750
Text HLabel 7300 3750 0    50   Input ~ 0
WE
Wire Wire Line
	1750 3200 1500 3200
Text HLabel 1500 3200 0    50   Input ~ 0
W20
Wire Wire Line
	1750 3300 1500 3300
Text HLabel 1500 3300 0    50   Input ~ 0
W21
Wire Wire Line
	4500 3050 4200 3050
Text HLabel 4200 3050 0    50   Input ~ 0
WG
Wire Wire Line
	5950 2850 6100 2850
Wire Wire Line
	5950 2950 6100 2950
Text HLabel 6100 2850 2    50   Output ~ 0
G1
Text HLabel 6100 2950 2    50   Output ~ 0
G16
Wire Wire Line
	4500 3450 4200 3450
Text HLabel 4200 3450 0    50   Input ~ 0
MCRO
Text Notes 6350 7200 0    100  ~ 0
MEM-MBF:  Memory Buffer\nCopyright 2021, William Glasford
$EndSCHEMATC
