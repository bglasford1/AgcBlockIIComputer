EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 2 11
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
F3 "ID2[0..3]" O R 5000 2350 50 
F4 "ID3[0..3]" O R 5000 2500 50 
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
F5 "DSKYRST" I L 1850 3650 50 
F6 "DISP" I L 1850 3750 50 
F7 "INDC" I L 1850 3850 50 
F8 "CLK2" I L 1850 3550 50 
$EndSheet
Text HLabel 3800 4050 0    50   Input ~ 0
STBY
Text HLabel 3800 4150 0    50   Input ~ 0
PARALM
$Sheet
S 3950 3450 1050 1100
U 68A00B2E
F0 "DSKY_DSP_IND" 50
F1 "DSKY_DSP_IND.sch" 50
F2 "RWD[12..12]" I R 5000 3600 50 
F3 "OW[3..9]" I L 3950 3600 50 
F4 "STBY" I L 3950 4050 50 
F5 "PARALM" I L 3950 4150 50 
F6 "IND[2..7]" I L 3950 3900 50 
F7 "PROG" O L 3950 4250 50 
F8 "DSKYRST" I L 3950 4350 50 
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
	5000 2500 5150 2500
Wire Bus Line
	7200 4350 8450 4350
Wire Bus Line
	2950 3250 3550 3250
Wire Wire Line
	1850 3750 1700 3750
Text HLabel 1700 3650 0    50   Input ~ 0
DSKYRST
Wire Wire Line
	1700 3650 1850 3650
Wire Wire Line
	1850 3850 1700 3850
Text HLabel 1700 3750 0    50   Input ~ 0
DISP
Text HLabel 1700 3850 0    50   Input ~ 0
INDC
Wire Bus Line
	7200 4500 8450 4500
Connection ~ 3550 3250
Wire Bus Line
	3550 3250 3550 3600
Wire Wire Line
	7200 4850 8450 4850
Wire Bus Line
	7200 2600 8450 2600
Wire Bus Line
	7200 2450 8450 2450
Wire Bus Line
	7200 3500 7550 3500
Wire Bus Line
	7550 4150 7200 4150
Wire Bus Line
	5000 3600 5850 3600
Wire Bus Line
	2950 3900 3950 3900
Wire Bus Line
	5150 4300 5150 2500
Text Notes 6350 7150 0    100  ~ 0
DSKY-DSP:  Display \nCopyright 2021, William Glasford
Wire Wire Line
	3950 4250 3800 4250
Text HLabel 3800 4250 0    50   Output ~ 0
PROG
Wire Wire Line
	7200 2750 8450 2750
Wire Wire Line
	7200 2850 8450 2850
Wire Wire Line
	7200 3150 8450 3150
Wire Bus Line
	3550 3250 5500 3250
Wire Bus Line
	5500 3250 5500 5650
Connection ~ 5500 3250
Wire Bus Line
	5500 3250 5850 3250
Wire Wire Line
	5850 4450 5450 4450
Text HLabel 5450 4450 0    50   Input ~ 0
CLK2
Wire Bus Line
	5150 4300 5850 4300
Wire Bus Line
	5000 2350 5300 2350
Wire Bus Line
	5300 2350 5300 4200
Wire Bus Line
	5300 4200 5850 4200
Wire Bus Line
	8450 2300 7600 2300
Wire Bus Line
	7600 2300 7600 1850
Wire Bus Line
	5150 1850 5150 2500
Wire Bus Line
	5150 1850 7600 1850
Connection ~ 5150 2500
Wire Bus Line
	5300 1700 5300 2350
Connection ~ 5300 2350
Wire Bus Line
	8450 2150 7750 2150
Wire Bus Line
	7750 2150 7750 1700
Wire Bus Line
	5300 1700 7750 1700
$Sheet
S 8450 2000 1150 3200
U 63794556
F0 "DSKY_DSP_LCD" 50
F1 "DSKY_DSP_LCD.sch" 50
F2 "DA1[1..3]" I L 8450 4350 50 
F3 "ID2[0..3]" I L 8450 2150 50 
F4 "WRITE1" I L 8450 4850 50 
F5 "WRITE2" I L 8450 3050 50 
F6 "WRITE3" I L 8450 3150 50 
F7 "ID1[0..3]" I L 8450 4500 50 
F8 "ID3[0..3]" I L 8450 2300 50 
F9 "DA2[1..3]" I L 8450 2450 50 
F10 "DA3[1..3]" I L 8450 2600 50 
F11 "MODE1" I L 8450 2750 50 
F12 "MODE2" I L 8450 2850 50 
F13 "MODE3" I L 8450 2950 50 
F14 "ID1[4..4]" I L 8450 4650 50 
$EndSheet
$Sheet
S 5850 2000 1350 1700
U 637944C1
F0 "DSKY_DSP_DCD2_3" 50
F1 "DSKY_DSP_DCD2_3.sch" 50
F2 "OW[12..15]" I L 5850 3250 50 
F3 "DISP" I L 5850 2750 50 
F4 "CLK2" I L 5850 2850 50 
F5 "RWD[12..12]" O L 5850 3600 50 
F6 "DA2[1..3]" O R 7200 2450 50 
F7 "DA3[1..3]" O R 7200 2600 50 
F8 "WRITE2" O R 7200 3050 50 
F9 "WRITE3" O R 7200 3150 50 
F10 "RWD[1..11]" O R 7200 3500 50 
F11 "MODE1" O R 7200 2750 50 
F12 "MODE2" O R 7200 2850 50 
F13 "MODE3" O R 7200 2950 50 
$EndSheet
Text HLabel 3800 4350 0    50   Input ~ 0
DSKYRST
Wire Wire Line
	3800 4350 3950 4350
Wire Wire Line
	1850 3550 1600 3550
Text HLabel 1600 3550 0    50   Input ~ 0
CLK2
Wire Bus Line
	5500 5650 5850 5650
Wire Bus Line
	8450 4650 7700 4650
Wire Bus Line
	7700 4650 7700 6100
Text HLabel 5700 5850 0    50   Input ~ 0
DSKYRST
Wire Wire Line
	5700 5850 5850 5850
Wire Bus Line
	7550 3500 7550 4150
Connection ~ 7550 4150
Wire Bus Line
	7550 4150 7550 5950
Wire Bus Line
	7550 5950 7200 5950
Wire Bus Line
	7700 6100 7200 6100
Wire Wire Line
	7200 5150 7300 5150
Wire Wire Line
	7300 5150 7300 5650
Wire Wire Line
	7300 5650 7200 5650
Wire Wire Line
	7200 5800 7450 5800
Wire Wire Line
	7450 5800 7450 5000
Wire Wire Line
	7450 5000 7200 5000
$Sheet
S 5850 3950 1350 1300
U 64844A8A
F0 "DSKY_DSP_DCD1" 50
F1 "DSKY_DSP_DCD1.sch" 50
F2 "DA1[1..3]" O R 7200 4350 50 
F3 "ID1[0..3]" O R 7200 4500 50 
F4 "WRITE1" O R 7200 4850 50 
F5 "RWD[1..11]" I R 7200 4150 50 
F6 "ID3[0..3]" I L 5850 4300 50 
F7 "CLK2" I L 5850 4450 50 
F8 "ID2[0..3]" I L 5850 4200 50 
F9 "DSPMINUS" I R 7200 5000 50 
F10 "DSPBLANK" I R 7200 5150 50 
$EndSheet
$Sheet
S 5850 5550 1350 850 
U 61C9EF7C
F0 "DSKY-DSP-SIGN" 50
F1 "DSKY-DSP-SIGN.sch" 50
F2 "OW[11..11]" I L 5850 5650 50 
F3 "ID1[4..4]" O R 7200 6100 50 
F4 "RWD[1..7]" I R 7200 5950 50 
F5 "DSKYRST" I L 5850 5850 50 
F6 "DSPBLANK" O R 7200 5650 50 
F7 "DSPMINUS" O R 7200 5800 50 
$EndSheet
$EndSCHEMATC
