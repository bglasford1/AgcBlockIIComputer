EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 15
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Entry Wire Line
	7350 3550 7450 3450
Wire Wire Line
	8100 3450 7450 3450
Text Label 7450 3450 0    50   ~ 0
DSKYRST
Text Label 7250 3400 2    50   ~ 0
DSKYRST
Wire Wire Line
	6600 3300 7250 3300
Entry Wire Line
	7250 3300 7350 3400
Text Label 7250 3300 2    50   ~ 0
CLK2
Wire Wire Line
	3550 3200 4100 3200
Entry Wire Line
	4100 3200 4200 3300
Text Label 4100 3400 2    50   ~ 0
INDC
Wire Wire Line
	6600 3200 7250 3200
Entry Wire Line
	7250 3200 7350 3300
Text Label 7250 3200 2    50   ~ 0
CLK1
Wire Wire Line
	6600 3400 7250 3400
Wire Wire Line
	6600 3500 7250 3500
Entry Wire Line
	7250 3400 7350 3500
Entry Wire Line
	7250 3500 7350 3600
Text Label 7250 3600 2    50   ~ 0
KB_STR
Text Label 7250 3700 2    50   ~ 0
DISP
Text Notes 6050 2700 2    80   ~ 0
Control Bus (1)
Text Notes 5900 5450 2    80   ~ 0
Channel Bus
Wire Bus Line
	4200 5500 7350 5500
Wire Wire Line
	6600 3600 7250 3600
Entry Wire Line
	7250 3600 7350 3700
Text Label 7250 3800 2    50   ~ 0
INDC
Text Label 4100 3200 2    50   ~ 0
STBY
Entry Wire Line
	4200 3200 4100 3100
Entry Wire Line
	4200 3100 4100 3000
Text Label 4100 3100 2    50   ~ 0
CLK2
Text Label 4100 3000 2    50   ~ 0
DSKYRST
Text Label 4100 3300 2    50   ~ 0
DISP
Wire Wire Line
	3550 3000 4100 3000
Wire Wire Line
	3550 3100 4100 3100
$Sheet
S 5600 3050 1000 2100
U 60F989FD
F0 "DSKY-IMI" 50
F1 "DSKY-IMI.sch" 50
F2 "CLK2" O R 6600 3300 50 
F3 "DSKYRST" O R 6600 3400 50 
F4 "CLK1" O R 6600 3200 50 
F5 "STBY" O R 6600 3500 50 
F6 "PARALM" O R 6600 4000 50 
F7 "KB_STR" I R 6600 3600 50 
F8 "CH[1..15]" B R 6600 4950 50 
F9 "KBD1" O R 6600 3900 50 
F10 "DISP" O R 6600 3700 50 
F11 "INDC" O R 6600 3800 50 
F12 "RPRO" O R 6600 4100 50 
F13 "CLK3" O R 6600 4200 50 
F14 "SGNRST" O R 6600 4300 50 
$EndSheet
Wire Wire Line
	6600 3700 7250 3700
Entry Wire Line
	7250 3700 7350 3800
Text Label 7250 3900 2    50   ~ 0
KBD1
Wire Wire Line
	6600 3800 7250 3800
Entry Wire Line
	7250 3800 7350 3900
Text Label 7250 4000 2    50   ~ 0
PARALM
Wire Wire Line
	8100 3550 7450 3550
Entry Wire Line
	7350 3650 7450 3550
Text Label 7450 3550 0    50   ~ 0
KB_STR
Text Label 7250 3500 2    50   ~ 0
STBY
Wire Wire Line
	8100 3650 7450 3650
Entry Wire Line
	7350 3750 7450 3650
Wire Bus Line
	4200 2750 7350 2750
Wire Bus Line
	3550 5100 4200 5100
Wire Bus Line
	4200 5100 4200 5500
Wire Bus Line
	7350 4950 7350 5500
Wire Bus Line
	6600 4950 7350 4950
Connection ~ 7350 4950
Wire Bus Line
	7350 4950 7950 4950
Text Label 7450 3650 0    50   ~ 0
KBD1
$Sheet
S 8100 3150 950  2000
U 60F98A72
F0 "DSKY-KBD" 50
F1 "DSKY-KBD.sch" 50
F2 "DSKYRST" I L 8100 3450 50 
F3 "KB_STR" O L 8100 3550 50 
F4 "CH[1..5]" O L 8100 4950 50 
F5 "KBD1" I L 8100 3650 50 
F6 "CLK1" I L 8100 3250 50 
F7 "CH[14..14]" O L 8100 5050 50 
F8 "RPRO" I L 8100 3750 50 
$EndSheet
Entry Wire Line
	7350 3350 7450 3250
Text Label 7450 3250 0    50   ~ 0
CLK1
Wire Wire Line
	8100 3250 7450 3250
Entry Wire Line
	4200 3400 4100 3300
Text Label 4100 3500 2    50   ~ 0
PARALM
Wire Wire Line
	3550 3300 4100 3300
Wire Bus Line
	8100 5050 7950 5050
Wire Bus Line
	7950 5050 7950 4950
Connection ~ 7950 4950
Wire Bus Line
	7950 4950 8100 4950
Text Notes 6400 7150 0    100  ~ 0
DSKY Sub-System\nCopyright 2021, William Glasford
Wire Wire Line
	6600 3900 7250 3900
Entry Wire Line
	7250 3900 7350 4000
Entry Wire Line
	4200 3500 4100 3400
Wire Wire Line
	3550 3400 4100 3400
Wire Wire Line
	6600 4000 7250 4000
Entry Wire Line
	7250 4000 7350 4100
Text Label 7250 4100 2    50   ~ 0
RPRO
Entry Wire Line
	7350 3850 7450 3750
Text Label 7450 3750 0    50   ~ 0
RPRO
Wire Wire Line
	8100 3750 7450 3750
Wire Wire Line
	6600 4100 7250 4100
Entry Wire Line
	7250 4100 7350 4200
Entry Wire Line
	4200 3600 4100 3500
Wire Wire Line
	3550 3500 4100 3500
$Sheet
S 2400 2900 1150 2400
U 60F98A64
F0 "DSKY-DSP" 50
F1 "DSKY-DSP.sch" 50
F2 "DSKYRST" I R 3550 3000 50 
F3 "CLK2" I R 3550 3100 50 
F4 "CH[1..15]" I R 3550 5100 50 
F5 "STBY" I R 3550 3200 50 
F6 "PARALM" I R 3550 3500 50 
F7 "DISP" I R 3550 3300 50 
F8 "INDC" I R 3550 3400 50 
F9 "CLK3" I R 3550 3600 50 
F10 "SGNRST" I R 3550 3700 50 
$EndSheet
Wire Wire Line
	6600 4200 7250 4200
Entry Wire Line
	7250 4200 7350 4300
Text Label 7250 4200 2    50   ~ 0
CLK3
Entry Wire Line
	4200 3700 4100 3600
Text Label 4100 3600 2    50   ~ 0
CLK3
Wire Wire Line
	3550 3600 4100 3600
$Sheet
S 4400 5950 1200 900 
U 6A27E71F
F0 "DSKY-TEST" 50
F1 "DSKY-TEST.sch" 50
$EndSheet
Wire Wire Line
	6600 4300 7250 4300
Entry Wire Line
	7250 4300 7350 4400
Text Label 7250 4300 2    50   ~ 0
SGNRST
Entry Wire Line
	4200 3800 4100 3700
Text Label 4100 3700 2    50   ~ 0
SGNRST
Wire Wire Line
	3550 3700 4100 3700
Wire Bus Line
	4200 2750 4200 3900
Wire Bus Line
	7350 2750 7350 4500
$EndSCHEMATC
