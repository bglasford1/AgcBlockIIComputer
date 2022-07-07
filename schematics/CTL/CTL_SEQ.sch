EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 5 13
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
S 7750 800  1300 2600
U 5F8F2739
F0 "CTL_SEQ_SEQB" 50
F1 "CTL_SEQ_SEQB.sch" 50
F2 "W[1..16]" I L 7750 1000 50 
F3 "GENRST" I L 7750 1150 50 
F4 "NISQ" I L 7750 1250 50 
F5 "CLISQ" I L 7750 1350 50 
F6 "WSQ" I L 7750 1450 50 
F7 "SNI" O R 9050 1000 50 
F8 "SQ_RSTB" O L 7750 2450 50 
F9 "SQ0" O R 9050 1200 50 
F10 "SQ1" O R 9050 1300 50 
F11 "SQ2" O R 9050 1400 50 
F12 "SQ3" O R 9050 1500 50 
F13 "WBMZ" O L 7750 2050 50 
F14 "SQ_CLK2" O L 7750 2350 50 
F15 "CLK2" I L 7750 1550 50 
F16 "WB15" O L 7750 2150 50 
F17 "WB16" O L 7750 2250 50 
F18 "SQ4" O R 9050 1600 50 
F19 "SQ5" O R 9050 1700 50 
F20 "PINC" I L 7750 1650 50 
F21 "EXT" I L 7750 1750 50 
F22 "EXTEND" O R 9050 1800 50 
F23 "INTR" I L 7750 1850 50 
$EndSheet
Wire Wire Line
	6200 2150 7750 2150
Wire Wire Line
	7450 1150 7750 1150
Wire Wire Line
	7450 1250 7750 1250
Wire Wire Line
	7450 1350 7750 1350
Wire Wire Line
	7450 1450 7750 1450
Wire Wire Line
	9050 1000 9350 1000
Wire Wire Line
	7450 1550 7750 1550
Wire Wire Line
	6200 900  6500 900 
Wire Wire Line
	6200 1000 6500 1000
Wire Wire Line
	6200 1100 6500 1100
Wire Wire Line
	6200 1250 6500 1250
Wire Wire Line
	6200 1350 6500 1350
Wire Wire Line
	4600 900  4900 900 
Wire Wire Line
	4600 1000 4900 1000
Wire Wire Line
	4600 1100 4900 1100
Wire Wire Line
	4600 1200 4900 1200
Wire Wire Line
	4600 1300 4900 1300
Wire Wire Line
	4600 1400 4900 1400
Wire Wire Line
	4600 1500 4900 1500
Wire Wire Line
	4600 1600 4900 1600
Wire Wire Line
	4600 1700 4900 1700
Wire Wire Line
	4600 1800 4900 1800
Text HLabel 7450 1550 0    50   Input ~ 0
CLK2
Text HLabel 7450 1150 0    50   Input ~ 0
GENRST
Text HLabel 7450 1250 0    50   Input ~ 0
NISQ
Text HLabel 7450 1350 0    50   Input ~ 0
CLISQ
Text HLabel 7450 1450 0    50   Input ~ 0
WSQ
Text HLabel 9350 1200 2    50   Output ~ 0
SQ0
Text HLabel 9350 1300 2    50   Output ~ 0
SQ1
Text HLabel 9350 1400 2    50   Output ~ 0
SQ2
Text HLabel 9350 1500 2    50   Output ~ 0
SQ3
Text HLabel 9350 1000 2    50   Output ~ 0
SNI
Text HLabel 6500 900  2    50   Output ~ 0
STG1
Text HLabel 6500 1000 2    50   Output ~ 0
STG2
Text HLabel 6500 1100 2    50   Output ~ 0
STG3
Text HLabel 6500 1250 2    50   Output ~ 0
BR1
Text HLabel 6500 1350 2    50   Output ~ 0
BR2
Text HLabel 4600 900  0    50   Input ~ 0
L15
Text HLabel 4600 1000 0    50   Input ~ 0
U16
Text HLabel 4600 1100 0    50   Input ~ 0
RSTSTG
Text HLabel 4600 1200 0    50   Input ~ 0
TL15
Text HLabel 4600 1300 0    50   Input ~ 0
TSGU
Text HLabel 4600 1400 0    50   Input ~ 0
TPZG
Text HLabel 4600 1500 0    50   Input ~ 0
TSGN
Text HLabel 4600 1600 0    50   Input ~ 0
TOV
Text HLabel 4600 1700 0    50   Input ~ 0
TSGN2
Text HLabel 4600 1800 0    50   Input ~ 0
TMZ
Wire Wire Line
	9050 1200 9350 1200
Wire Wire Line
	9050 1300 9350 1300
Wire Wire Line
	9050 1400 9350 1400
Wire Wire Line
	9050 1500 9350 1500
Wire Wire Line
	6200 2250 7750 2250
Wire Wire Line
	6200 2050 7750 2050
Wire Bus Line
	7750 1000 7550 1000
Text HLabel 7550 1000 0    50   Input ~ 0
W[1..16]
Text HLabel 9350 1600 2    50   Output ~ 0
SQ4
Text HLabel 9350 1700 2    50   Output ~ 0
SQ5
Wire Wire Line
	9050 1600 9350 1600
Wire Wire Line
	9050 1700 9350 1700
Wire Wire Line
	6200 1450 6500 1450
Text HLabel 6500 1450 2    50   Output ~ 0
RB1F
Wire Wire Line
	4600 1900 4900 1900
Text HLabel 4600 1900 0    50   Input ~ 0
GMZ
Wire Wire Line
	4600 2000 4900 2000
Text HLabel 4600 2000 0    50   Input ~ 0
TRSM
Wire Wire Line
	4600 2100 4900 2100
Text HLabel 4600 2100 0    50   Input ~ 0
EQU17
Wire Wire Line
	4600 2200 4900 2200
Text HLabel 4600 2200 0    50   Input ~ 0
INTR
Wire Wire Line
	4600 2300 4900 2300
Text HLabel 4600 2300 0    50   Input ~ 0
DVST
$Sheet
S 4900 800  1300 2550
U 5F8F2707
F0 "CTL_SEQ_SEQA" 50
F1 "CTL_SEQ_SEQA.sch" 50
F2 "STG3" O R 6200 1100 50 
F3 "L15" I L 4900 900 50 
F4 "U16" I L 4900 1000 50 
F5 "RSTSTG" I L 4900 1100 50 
F6 "TL15" I L 4900 1200 50 
F7 "TSGU" I L 4900 1300 50 
F8 "TPZG" I L 4900 1400 50 
F9 "SQ_CLK2" I R 6200 2350 50 
F10 "SQ_RSTB" I R 6200 2450 50 
F11 "TSGN" I L 4900 1500 50 
F12 "TOV" I L 4900 1600 50 
F13 "TSGN2" I L 4900 1700 50 
F14 "TMZ" I L 4900 1800 50 
F15 "BR1" O R 6200 1250 50 
F16 "BR2" O R 6200 1350 50 
F17 "STG1" O R 6200 900 50 
F18 "STG2" O R 6200 1000 50 
F19 "WB15" I R 6200 2150 50 
F20 "WB16" I R 6200 2250 50 
F21 "WBMZ" I R 6200 2050 50 
F22 "RB1F" O R 6200 1450 50 
F23 "GMZ" I L 4900 1900 50 
F24 "TRSM" I L 4900 2000 50 
F25 "EQU17" I L 4900 2100 50 
F26 "INTR" I L 4900 2200 50 
F27 "DVST" I L 4900 2300 50 
F28 "ST1" I L 4900 2400 50 
F29 "ST2" I L 4900 2500 50 
F30 "STAGE" I L 4900 2600 50 
F31 "CLK1" I L 4900 2700 50 
F32 "PSTGZ" O R 6200 1600 50 
F33 "CLXC" O R 6200 1700 50 
$EndSheet
Wire Wire Line
	4600 2400 4900 2400
Text HLabel 4600 2400 0    50   Input ~ 0
ST1
Wire Wire Line
	4600 2500 4900 2500
Text HLabel 4600 2500 0    50   Input ~ 0
ST2
Wire Wire Line
	4600 2600 4900 2600
Text HLabel 4600 2600 0    50   Input ~ 0
STAGE
Wire Wire Line
	4600 2700 4900 2700
Text HLabel 4600 2700 0    50   Input ~ 0
CLK1
Wire Wire Line
	1100 4350 1300 4350
Wire Wire Line
	1100 4450 1300 4450
Wire Wire Line
	1100 4150 1300 4150
Wire Wire Line
	1100 4250 1300 4250
Wire Wire Line
	1100 3950 1300 3950
Wire Wire Line
	1100 4050 1300 4050
Text HLabel 1100 3950 0    50   Input ~ 0
STG1
Text HLabel 1100 4050 0    50   Input ~ 0
STG2
Text HLabel 1100 4150 0    50   Input ~ 0
STG3
Text HLabel 1100 4250 0    50   Input ~ 0
SQ0
Text HLabel 1100 4350 0    50   Input ~ 0
SQ1
Text HLabel 1100 4450 0    50   Input ~ 0
SQ2
Wire Wire Line
	4650 4450 4850 4450
Wire Wire Line
	1100 4850 1300 4850
Text HLabel 4650 4450 0    50   Input ~ 0
SQ5
Text HLabel 1100 4850 0    50   Input ~ 0
EXTEND
Text HLabel 2850 4200 2    50   Output ~ 0
READ0
Wire Wire Line
	2650 4200 2850 4200
Text HLabel 2850 4400 2    50   Output ~ 0
RAND0
Text HLabel 2850 4300 2    50   Output ~ 0
WRITE0
Wire Wire Line
	2650 4400 2850 4400
Wire Wire Line
	2650 4300 2850 4300
Text HLabel 2850 4600 2    50   Output ~ 0
ROR0
Text HLabel 2850 4500 2    50   Output ~ 0
WAND0
Wire Wire Line
	2650 4600 2850 4600
Wire Wire Line
	2650 4500 2850 4500
Text HLabel 2850 5900 2    50   Output ~ 0
MP3
Wire Wire Line
	2650 5900 2850 5900
Wire Wire Line
	2650 5500 2850 5500
Wire Wire Line
	2650 5600 2850 5600
Wire Wire Line
	2650 5200 2850 5200
Text HLabel 2850 5500 2    50   Output ~ 0
DV0
Text HLabel 2850 5600 2    50   Output ~ 0
DV1
Text HLabel 2850 5200 2    50   Output ~ 0
DCS0
Text HLabel 2850 5800 2    50   Output ~ 0
MP1
Text HLabel 2850 5700 2    50   Output ~ 0
MP0
Text HLabel 2850 5100 2    50   Output ~ 0
TS0
Text HLabel 2850 4800 2    50   Output ~ 0
RXOR0
Text HLabel 2850 4700 2    50   Output ~ 0
WOR0
Text HLabel 2850 4900 2    50   Output ~ 0
RSM3
Text HLabel 2850 5400 2    50   Output ~ 0
NDX1
Text HLabel 2850 5300 2    50   Output ~ 0
NDX0
Text HLabel 2850 5000 2    50   Output ~ 0
TC0
Wire Wire Line
	2650 5800 2850 5800
Wire Wire Line
	2650 5700 2850 5700
Wire Wire Line
	2650 5100 2850 5100
Wire Wire Line
	2650 4800 2850 4800
Wire Wire Line
	2650 4700 2850 4700
Wire Wire Line
	2650 4900 2850 4900
Wire Wire Line
	2650 5400 2850 5400
Wire Wire Line
	2650 5300 2850 5300
Wire Wire Line
	2650 5000 2850 5000
Wire Wire Line
	4650 5650 4850 5650
Wire Wire Line
	4650 5250 4850 5250
Wire Wire Line
	4650 5350 4850 5350
Wire Wire Line
	4650 4950 4850 4950
Wire Wire Line
	4650 5550 4850 5550
Wire Wire Line
	4650 5450 4850 5450
Wire Wire Line
	4650 4850 4850 4850
Wire Wire Line
	4650 4650 4850 4650
Wire Wire Line
	4650 5150 4850 5150
Wire Wire Line
	4650 5050 4850 5050
Wire Wire Line
	4650 4750 4850 4750
Text HLabel 4650 5650 0    50   Input ~ 0
MP3
Text HLabel 4650 5250 0    50   Input ~ 0
DV0
Text HLabel 4650 5350 0    50   Input ~ 0
DV1
Text HLabel 4650 4950 0    50   Input ~ 0
DCS0
Text HLabel 4650 5550 0    50   Input ~ 0
MP1
Text HLabel 4650 5450 0    50   Input ~ 0
MP0
Text HLabel 4650 4850 0    50   Input ~ 0
TS0
Text HLabel 4650 4650 0    50   Input ~ 0
RSM3
Text HLabel 4650 5150 0    50   Input ~ 0
NDX1
Text HLabel 4650 5050 0    50   Input ~ 0
NDX0
Text HLabel 4650 4750 0    50   Input ~ 0
TC0
Wire Wire Line
	4650 5850 4850 5850
Wire Wire Line
	4650 4550 4850 4550
Wire Wire Line
	4650 5750 4850 5750
Text HLabel 4650 5850 0    50   Input ~ 0
GTR1777
Text HLabel 4650 4550 0    50   Input ~ 0
EXTEND
Text HLabel 4650 5750 0    50   Input ~ 0
GTR7
Wire Wire Line
	4650 4150 4850 4150
Wire Wire Line
	4650 3950 4850 3950
Wire Wire Line
	4650 4050 4850 4050
Text HLabel 4650 3950 0    50   Input ~ 0
STG1
Text HLabel 4650 4050 0    50   Input ~ 0
STG2
Text HLabel 4650 4150 0    50   Input ~ 0
STG3
Text HLabel 6300 4250 2    50   Output ~ 0
DOTP1
Wire Wire Line
	6100 4250 6300 4250
Text HLabel 6300 4650 2    50   Output ~ 0
DOTP10
Wire Wire Line
	6100 4650 6300 4650
Text HLabel 6300 4350 2    50   Output ~ 0
DOTP4
Wire Wire Line
	6100 4350 6300 4350
Text HLabel 6300 4450 2    50   Output ~ 0
DOTP6
Wire Wire Line
	6100 4450 6300 4450
Text HLabel 6300 4550 2    50   Output ~ 0
DOTP7
Wire Wire Line
	6100 4550 6300 4550
Text HLabel 6300 4750 2    50   Output ~ 0
DOTP12
Wire Wire Line
	6100 4750 6300 4750
Wire Wire Line
	1100 4750 1300 4750
Wire Wire Line
	1100 4550 1300 4550
Wire Wire Line
	1100 4650 1300 4650
Text HLabel 1100 4550 0    50   Input ~ 0
SQ3
Text HLabel 1100 4650 0    50   Input ~ 0
SQ4
Text HLabel 1100 4750 0    50   Input ~ 0
SQ5
Wire Wire Line
	2650 6150 4850 6150
Wire Wire Line
	2650 6250 4850 6250
Wire Wire Line
	2650 6350 4850 6350
Wire Wire Line
	2650 6450 4850 6450
Wire Wire Line
	2650 6550 4850 6550
Wire Wire Line
	2650 6650 4850 6650
Wire Wire Line
	2650 6750 4850 6750
Wire Wire Line
	2650 6850 4850 6850
Wire Wire Line
	2650 6950 4850 6950
Wire Wire Line
	2650 7050 4850 7050
Wire Wire Line
	2650 7150 4850 7150
Wire Wire Line
	2650 7250 4850 7250
Wire Wire Line
	2650 6050 4850 6050
Wire Wire Line
	2650 7350 4850 7350
$Sheet
S 1300 3850 1350 3600
U 9666ECB8
F0 "CTL_SEQ_DCD" 50
F1 "CTL_SEQ_DCD.sch" 50
F2 "STG1" I L 1300 3950 50 
F3 "STG2" I L 1300 4050 50 
F4 "STG3" I L 1300 4150 50 
F5 "SQ0" I L 1300 4250 50 
F6 "SQ1" I L 1300 4350 50 
F7 "SQ2" I L 1300 4450 50 
F8 "SQ3" I L 1300 4550 50 
F9 "SQ4" I L 1300 4650 50 
F10 "TC0" O R 2650 5000 50 
F11 "TCF0" O R 2650 6150 50 
F12 "DV3" O R 2650 6750 50 
F13 "NDX0" O R 2650 5300 50 
F14 "NDX1" O R 2650 5400 50 
F15 "BZF0" O R 2650 6050 50 
F16 "RXOR0" O R 2650 4800 50 
F17 "DCA0" O R 2650 6450 50 
F18 "TS0" O R 2650 5100 50 
F19 "ADS0" O R 2650 6350 50 
F20 "DAS1" O R 2650 6250 50 
F21 "MP0" O R 2650 5700 50 
F22 "MP1" O R 2650 5800 50 
F23 "DV0" O R 2650 5500 50 
F24 "DV1" O R 2650 5600 50 
F25 "DCS0" O R 2650 5200 50 
F26 "RUPT0" O R 2650 7150 50 
F27 "RSM3" O R 2650 4900 50 
F28 "WOR0" O R 2650 4700 50 
F29 "DV7" O R 2650 7050 50 
F30 "MP3" O R 2650 5900 50 
F31 "SQ5" I L 1300 4750 50 
F32 "EXTEND" I L 1300 4850 50 
F33 "NDXX0" O R 2650 6550 50 
F34 "NDXX1" O R 2650 6650 50 
F35 "DV4" O R 2650 6850 50 
F36 "DV6" O R 2650 6950 50 
F37 "ROR0" I R 2650 4600 50 
F38 "WAND0" I R 2650 4500 50 
F39 "RAND0" I R 2650 4400 50 
F40 "WRITE0" I R 2650 4300 50 
F41 "READ0" I R 2650 4200 50 
F42 "DXCH0" O R 2650 7250 50 
F43 "DXCH1" O R 2650 7350 50 
F44 "SQ_CLK2" I R 2650 3950 50 
F45 "DCDSUB" I L 1300 5000 50 
$EndSheet
Wire Wire Line
	6350 3650 3000 3650
Wire Wire Line
	3000 3650 3000 3950
Wire Wire Line
	3000 3950 2650 3950
Wire Wire Line
	1100 5000 1300 5000
Text HLabel 1100 5000 0    50   Input ~ 0
DCDSUB
Wire Wire Line
	6200 1600 6500 1600
Text HLabel 6500 1600 2    50   Output ~ 0
PSTGZ
Wire Wire Line
	6200 1700 6500 1700
Text HLabel 6500 1700 2    50   Output ~ 0
CLXC
Wire Wire Line
	7450 1650 7750 1650
Text HLabel 7450 1650 0    50   Input ~ 0
PINC
Wire Wire Line
	7450 1750 7750 1750
Text HLabel 7450 1750 0    50   Input ~ 0
EXT
Text HLabel 9350 1800 2    50   Output ~ 0
EXTEND
Wire Wire Line
	9050 1800 9350 1800
Wire Wire Line
	7450 1850 7750 1850
Text HLabel 7450 1850 0    50   Input ~ 0
INTR
Text Notes 6400 7200 0    100  ~ 0
CTL-SEQ: Sequence Generator\nCopyright 2021, William Glasford
$Sheet
S 4850 3850 1250 3600
U 9666ECE8
F0 "CTL_SEQ_CTL" 50
F1 "CTL_SEQ_CTL.sch" 50
F2 "RSM3" I L 4850 4650 50 
F3 "BZF0" I L 4850 6050 50 
F4 "TCF0" I L 4850 6150 50 
F5 "TC0" I L 4850 4750 50 
F6 "DAS1" I L 4850 6250 50 
F7 "TS0" I L 4850 4850 50 
F8 "ADS0" I L 4850 6350 50 
F9 "DCS0" I L 4850 4950 50 
F10 "DCA0" I L 4850 6450 50 
F11 "NDX0" I L 4850 5050 50 
F12 "NDX1" I L 4850 5150 50 
F13 "NDXX0" I L 4850 6550 50 
F14 "NDXX1" I L 4850 6650 50 
F15 "DV0" I L 4850 5250 50 
F16 "DV1" I L 4850 5350 50 
F17 "DV3" I L 4850 6750 50 
F18 "DV4" I L 4850 6850 50 
F19 "DV6" I L 4850 6950 50 
F20 "DV7" I L 4850 7050 50 
F21 "RUPT0" I L 4850 7150 50 
F22 "MP0" I L 4850 5450 50 
F23 "MP1" I L 4850 5550 50 
F24 "MP3" I L 4850 5650 50 
F25 "EXTEND" I L 4850 4550 50 
F26 "GTR7" I L 4850 5750 50 
F27 "GTR1777" I L 4850 5850 50 
F28 "STG3" I L 4850 4150 50 
F29 "STG1" I L 4850 3950 50 
F30 "STG2" I L 4850 4050 50 
F31 "DOTP1" O R 6100 4250 50 
F32 "WE" I L 4850 4250 50 
F33 "WG" I L 4850 4350 50 
F34 "SQ5" I L 4850 4450 50 
F35 "DOTP10" O R 6100 4650 50 
F36 "DOTP4" O R 6100 4350 50 
F37 "DOTP6" O R 6100 4450 50 
F38 "DOTP7" O R 6100 4550 50 
F39 "DOTP12" O R 6100 4750 50 
F40 "DXCH0" I L 4850 7250 50 
F41 "DXCH1" I L 4850 7350 50 
$EndSheet
Wire Wire Line
	4650 4350 4850 4350
Wire Wire Line
	4650 4250 4850 4250
Text HLabel 4650 4250 0    50   Input ~ 0
WE
Text HLabel 4650 4350 0    50   Input ~ 0
WG
Wire Wire Line
	6200 2350 6350 2350
Wire Wire Line
	6350 2350 6350 3650
Connection ~ 6350 2350
Wire Wire Line
	6350 2350 7750 2350
Wire Wire Line
	6200 2450 7750 2450
$EndSCHEMATC
