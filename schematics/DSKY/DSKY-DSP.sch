EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 2 10
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 4000 1900 1000 1050
U 63794472
F0 "DSKY_DSP_DCC" 50
F1 "DSKY_DSP_DCC.sch" 50
F2 "OW[1..10]" I L 4000 2750 50 
F3 "BI[1..8]" O R 5000 2500 50 
$EndSheet
Text HLabel 5600 2750 0    50   Input ~ 0
DISP
Wire Wire Line
	5850 2750 5600 2750
Wire Wire Line
	5850 2850 5600 2850
Wire Wire Line
	7200 2950 8450 2950
Wire Wire Line
	7200 3050 8450 3050
Wire Wire Line
	3950 4150 3800 4150
Wire Wire Line
	3950 4050 3800 4050
Text HLabel 5600 2850 0    50   Input ~ 0
CLK2
$Sheet
S 1850 2950 1100 1200
U 67D1D986
F0 "DSKY-DSP-CHN" 50
F1 "DSKY-DSP-CHN.sch" 50
F2 "OW[1..15]" O R 2950 3250 50 
F3 "IND[2..7]" O R 2950 3900 50 
F4 "CH[1..15]" I L 1850 3250 50 
F5 "GENRST" I R 2950 3450 50 
F6 "CLK2" I R 2950 3550 50 
F7 "DISP" I R 2950 3650 50 
F8 "INDC" I R 2950 3750 50 
$EndSheet
Text HLabel 3800 4050 0    50   Input ~ 0
STBY
Text HLabel 3800 4150 0    50   Input ~ 0
PARALM
$Sheet
S 3950 3450 1050 900 
U 68A00B2E
F0 "DSKY_DSP_IND" 50
F1 "DSKY_DSP_IND.sch" 50
F2 "RWD[12..12]" I R 5000 3600 50 
F3 "OW[1..9]" I L 3950 3600 50 
F4 "STBY" I L 3950 4050 50 
F5 "PARALM" I L 3950 4150 50 
F6 "IND[2..7]" I L 3950 3900 50 
F7 "PROG" O L 3950 4250 50 
$EndSheet
Wire Bus Line
	1650 3250 1850 3250
Text HLabel 1650 3250 0    50   Input ~ 0
CH[1..15]
Wire Bus Line
	3550 2750 3550 3250
Wire Bus Line
	3550 2750 4000 2750
Wire Bus Line
	3550 3600 3950 3600
Wire Bus Line
	3550 3250 5400 3250
Wire Bus Line
	5000 2500 5250 2500
Wire Bus Line
	7200 4350 8450 4350
Wire Bus Line
	7200 2150 8450 2150
Wire Bus Line
	2950 3250 3550 3250
Wire Wire Line
	3100 3550 2950 3550
Text HLabel 3100 3450 2    50   Input ~ 0
GENRST
Text HLabel 3100 3550 2    50   Input ~ 0
CLK2
Wire Wire Line
	2950 3450 3100 3450
Wire Wire Line
	3100 3650 2950 3650
Text HLabel 3100 3650 2    50   Input ~ 0
DISP
Wire Wire Line
	3100 3750 2950 3750
Text HLabel 3100 3750 2    50   Input ~ 0
INDC
Wire Bus Line
	7200 2300 8450 2300
Wire Bus Line
	7200 4500 8450 4500
Connection ~ 3550 3250
Wire Bus Line
	3550 3250 3550 3600
Wire Wire Line
	7200 5050 8450 5050
Wire Bus Line
	7200 2600 8450 2600
Wire Bus Line
	7200 2450 8450 2450
Wire Bus Line
	7200 3500 7400 3500
Wire Bus Line
	7400 3500 7400 4150
Wire Bus Line
	7400 4150 7200 4150
$Sheet
S 5850 2000 1350 1700
U 637944C1
F0 "DSKY_DSP_DCD2_3" 50
F1 "DSKY_DSP_DCD2_3.sch" 50
F2 "BI[1..8]" I L 5850 2500 50 
F3 "OW[11..15]" I L 5850 3250 50 
F4 "DISP" I L 5850 2750 50 
F5 "CLK2" I L 5850 2850 50 
F6 "RWD[12..12]" O L 5850 3600 50 
F7 "DA2[1..3]" O R 7200 2150 50 
F8 "DA3[1..3]" O R 7200 2300 50 
F9 "ID2[0..4]" O R 7200 2450 50 
F10 "ID3[0..4]" O R 7200 2600 50 
F11 "WRITE2" O R 7200 2950 50 
F12 "WRITE3" O R 7200 3050 50 
F13 "RWD[0..12]" O R 7200 3500 50 
$EndSheet
Wire Bus Line
	5000 3600 5850 3600
Wire Bus Line
	2950 3900 3950 3900
$Sheet
S 8450 2000 1150 3200
U 63794556
F0 "DSKY_DSP_LCD" 50
F1 "DSKY_DSP_LCD.sch" 50
F2 "DA1[1..3]" I L 8450 4350 50 
F3 "ID2[0..4]" I L 8450 2450 50 
F4 "WRITE1" I L 8450 5050 50 
F5 "WRITE2" I L 8450 2950 50 
F6 "WRITE3" I L 8450 3050 50 
F7 "ID1[0..4]" I L 8450 4500 50 
F8 "ID3[0..4]" I L 8450 2600 50 
F9 "DA2[1..3]" I L 8450 2150 50 
F10 "DA3[1..3]" I L 8450 2300 50 
F11 "ID2[0..4]" I L 8450 4650 50 
F12 "ID3[0..4]" I L 8450 4800 50 
$EndSheet
$Sheet
S 5850 3950 1350 1300
U 64844A8A
F0 "DSKY_DSP_DCD1" 50
F1 "DSKY_DSP_DCD1.sch" 50
F2 "DA1[1..3]" O R 7200 4350 50 
F3 "ID1[0..4]" O R 7200 4500 50 
F4 "WRITE1" O R 7200 5050 50 
F5 "RWD[0..12]" I R 7200 4150 50 
F6 "OW[11..11]" I L 5850 4050 50 
F7 "ID2[0..4]" O R 7200 4650 50 
F8 "ID3[0..4]" O R 7200 4800 50 
F9 "BI[1..8]" I L 5850 4250 50 
$EndSheet
Wire Bus Line
	5850 4050 5400 4050
Wire Bus Line
	5400 4050 5400 3250
Connection ~ 5400 3250
Wire Bus Line
	5400 3250 5850 3250
Wire Bus Line
	7200 4800 8450 4800
Wire Bus Line
	7200 4650 8450 4650
Wire Bus Line
	5850 4250 5250 4250
Wire Bus Line
	5250 4250 5250 2500
Connection ~ 5250 2500
Wire Bus Line
	5250 2500 5850 2500
Text Notes 6350 7150 0    100  ~ 0
DSKY-DSP:  Display \nCopyright 2021, William Glasford
Wire Wire Line
	3950 4250 3800 4250
Text HLabel 3800 4250 0    50   Input ~ 0
PROG
$EndSCHEMATC
