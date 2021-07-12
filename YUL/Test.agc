#
#  Copyright 2021, William Glasford
#
#  This file is part of the AGC Simulator.  You can redistribute it
#  and/or modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 3 of the License,
#  or any later version. This software is distributed without any warranty
#  expressed or implied. See the GNU General Public License for more details.
#
#  Purpose:	This program tests the assembly instructions.  The more common
#           instructions are tested by the very nature of using them.
#           There are a number of lesser used instructions that are specifically
#           tested such as MP, DV, SU, MSU, AUG and DIM.
#
# Test Program:  This program tests the assembly instructions.
#                The more common instructions are tested by the
#                very nature of using them.  There are a number
#                of lesser used instructions that are specifically
#                tested such as MP, DV, SU, MSU, AUG and DIM.
#
# Output: The output of whether or not a specific sub-test passed
#         is sent to the DSKY display.  A 1 indicates success and
#         a 0 indicates the test failed.  Each sub-test is assigned
#         a specific 7-segment LED using the AGC designators.
#
#         R1D1 =
#         R1D2 =
#         R1D3 =
#         R1D4 =
#         R1D5 =
#         R2D1 =
#         R2D2 =
#         R2D3 =
#         R2D4 =
#         R2D5 = CYL, CYR, SR, EDOP
#         R3D1 = DCS
#         R3D2 = SU & MSU
#         R3D3 = AUG & DIM
#         R3D4 = Divide
#         R3D5 = Multiply
#
# The general structure of each sub-test is once a failure is
# detected, the entire sub-test stops and is flagged as failed.
#

		# Erasable memory definitions and constants.
		SETLOC	61

MPLOC		ERASE
DVLOC		ERASE
AUGLOC		ERASE
SULOC		ERASE
MSULOC		ERASE
DCS1LOC		ERASE
DCS2LOC		ERASE

# These are the relay words
DSPTAB		ERASE	+11D

# Various constants
OUT0            EQUALS  10 
A		EQUALS  0
L               EQUALS  1
Q		EQUALS	2
CYR		EQUALS	20
SR		EQUALS	21
CYL		EQUALS	22
EDOP		EQUALS	23

		# Program Start
		SETLOC	4000 

		# Setup Memory
		CAF	DSP10
		TS	DSPTAB	+10D
		CAF	DSP9
		TS	DSPTAB	+9D
		CAF	DSP8
		TS	DSPTAB	+8D
		CAF	AUGVAL
		TS	AUGLOC
		CAF	SUVAL
		TS	SULOC
		CAF	MSUVAL
		TS	MSULOC
		CAF	DCS1VAL
		TS	DCS1LOC
		CAF	DCS2VAL
		TS	DCS2LOC
		
# Test Multiply:  This tests both examples detailed in the 
#                 agcis_32_blk2_instructions.pdf manual.
#                 There are two examples; both operator and
#                 operand are positive and one is positive
#                 and the other is negative.  

		# Test Multiply #1: both positive
TESTMP1		CAF	MULTK1
		TS	MPLOC
		CAF	MULTA
		EXTEND
		MP	MPLOC

		# Verify Multiply #1
		COM
		MASK	ANSM1A
		EXTEND
		BZF	A1WORKED
		TC	MPFAILED
A1WORKED	XCH	L
		COM
		MASK	ANSM1L
		EXTEND
		BZF	TESTMP2
		TC	MPFAILED
		
		# Test Multiply #2: K is negative
TESTMP2		CAF	MULTK2
		TS	MPLOC
		CAF	MULTA
		EXTEND
		MP	MPLOC

		# Verify Multiply #2
		MASK	ANSM2A
		EXTEND
		BZF	A2WORKED
		TC	MPFAILED
A2WORKED	XCH	L
		MASK	ANSM2L
		EXTEND
		BZF	MPWORKED
		TC	MPFAILED

MPWORKED	CA	DSPTAB	+10D
		MASK	RMASK
		AD	RTRUE
		TS	DSPTAB	+10D
		EXTEND
		WRITE	OUT0
		TC	TESTDV

		# Multiply failed
MPFAILED	CA	DSPTAB	+10D
		MASK	RMASK
		AD	RFALSE
		TS	DSPTAB	+10D
		EXTEND
		WRITE	OUT0

# Test Divide:  This tests the example detailed in the 
#               agcis_32_blk2_instructions.pdf manual.

TESTDV		CAF	DIVE
		TS	DVLOC
		CAF	DIVL
		XCH	L
		CAF	DIVA

		EXTEND
		DV	DVLOC

		# Verify Divide
		COM
		MASK	ANSDA1
		EXTEND
		BZF	A3WORKED
		TC	DVFAILED
A3WORKED	XCH	L
		COM
		MASK	ANSDL1
		EXTEND
		BZF	DVWORKED
		TC	DVFAILED

DVWORKED	CA	DSPTAB	+10D
		MASK	LMASK
		AD	LTRUE
		TS	DSPTAB	+10D
		EXTEND
		WRITE	OUT0
		TC	TESTAUG

DVFAILED	CA	DSPTAB	+10D
		MASK	LMASK
		AD	LFALSE
		TS	DSPTAB	+10D
		EXTEND
		WRITE	OUT0

# Test AUG & DIM: These instructions are very similar in that
#                 they increment or decrement based on the 
#                 sign of the operand.  

		# Test AUG
TESTAUG		EXTEND
		AUG	AUGLOC

		# Verify AUG
		CAE	AUGLOC
		COM
		MASK	AUGANS
		EXTEND
		BZF	TESTDIM
		TC	AUGFAILED

		# Test DIM
TESTDIM		EXTEND
		DIM	AUGLOC

		# Verify DIM
		CAE	AUGLOC
		COM
		MASK	DIMANS
		EXTEND
		BZF	AUGWORKED
		TC	AUGFAILED

AUGWORKED	CA	DSPTAB	+9D
		MASK	RMASK
		AD	RTRUE
		TS	DSPTAB	+9D
		EXTEND
		WRITE	OUT0
		TC	TESTSU

AUGFAILED	CA	DSPTAB  +9D
		MASK	RMASK
		AD	RFALSE
		TS	DSPTAB	+9D
		EXTEND
		WRITE	OUT0

# Test SU & MSU:  These instructions are very similar in that
#                 they both perform subtractions.  The MSU
#                 instruction is a special subtract that 
#                 subtracts two 2's compliment numbers, 
#                 producing a 1's compliment result.

		# Test SU
TESTSU		CAF	AUGVAL		# Load 11 into A
		EXTEND
		SU	SULOC		# Subtract 2 from A

		# Verify SU
		COM
		MASK	SUANS
		EXTEND
		BZF	TESTMSU
		TC	SUFAILED

		# Test MSU
TESTMSU		CAF	MSUAVAL
		COM			# The A value is 0143333
		EXTEND
		MSU	MSULOC

		# Verify MSU
		COM
		MASK	MSUANS
		EXTEND
		BZF	SUWORKED
		TC	SUFAILED

SUWORKED	CA	DSPTAB	+9D
		MASK	LMASK
		AD	LTRUE
		TS	DSPTAB	+9D
		EXTEND
		WRITE	OUT0
		TC	TESTDCS

SUFAILED	CA	DSPTAB	+9D
		MASK	LMASK
		AD	LFALSE
		TS	DSPTAB	+9D
		EXTEND
		WRITE	OUT0

# Test DCS:  This instruction moves the contents of K & K+1
#            into registers A & L. 

		# Test DCS
TESTDCS		EXTEND
		DCS	DCS1LOC

		# Verify DCS
		MASK	DCS1VAL
		EXTEND
		BZF	DCSAWORKED
		TC	DCSFAILED

DCSAWORKED	XCH	L
		MASK	DCS2VAL
		EXTEND
		BZF	DCSWORKED
		TC	DCSFAILED

DCSWORKED	CA	DSPTAB	+8D
		MASK	RMASK
		AD	RTRUE
		TS	DSPTAB	+8D
		EXTEND
		WRITE	OUT0
		TC	TESTCYCL

DCSFAILED	CA	DSPTAB  +8D
		MASK	RMASK
		AD	RFALSE
		TS	DSPTAB	+8D
		EXTEND
		WRITE	OUT0

# Test CYR, CYL, SR, EDOP:  These instructions shift
#            and/or rotate the contents of data stored
#            when using specific addresses. This code
#            was taken from actual Luminary code.

		# Test CYR, CYL, SR, EDOP
TESTCYCL	CA       CONC+S1                       	# 25252
		TS       CYR                           	# C(CYR) = 12525
		TS       CYL                           	# C(CYL) = 52524
		TS       SR                            	# C(SR) = 12525
		TS       EDOP                          	# C(EDOP) = 00125
		AD       CYR                           	# 37777         C(CYR) = 45252
		AD       CYL                           	# 00-12524      C(CYL) = 25251
		AD       SR                            	# 00-25251      C(SR) = 05252
		AD       EDOP                          	# 00-25376      C(EDOP) = +0
		AD       CONC+S2                       	# C(CONC+S2) = 52400
		TC       -1CHK                         	#
		AD       CYR                           	# 45252
		AD       CYL                           	# 72523
		AD       SR                            	# 77775
		AD       EDOP                          	# 77775
		AD       S+1                           	# 77776
		TC       -1CHK
		TC	 CYCLWORKED

-1CHK		CCS      A
		TCF      CYCLFAILED
		TCF      CYCLFAILED
		CCS      A
		TCF      CYCLFAILED
		TC       Q 

CYCLWORKED	CA	DSPTAB	+8D
		MASK	LMASK
		AD	LTRUE
		TS	DSPTAB	+8D
		EXTEND
		WRITE	OUT0
		TC	TESTEND

CYCLFAILED	CA	DSPTAB	+8D
		MASK	LMASK
		AD	LFALSE
		TS	DSPTAB	+8D
		EXTEND
		WRITE	OUT0

		# Test Complete
TESTEND		NOOP
		TC	TESTEND

RTRUE		OCT	34
RFALSE		OCT	5  
LTRUE		OCT	1600
LFALSE		OCT	240   
RMASK		OCT	77740
LMASK		OCT	76037

DSP11		OCT	24000
DSP10		OCT	73777
DSP9		OCT	67777
DSP8		OCT	63777
DSP7		OCT	57777
DSP6		OCT	53777
DSP5		OCT	47777
DSP4		OCT	43777
DSP3		OCT	37777
DSP2		OCT	33777
DSP1		OCT	27777
MULTA		OCT	16344
MULTK1		OCT	10101
MULTK2		OCT	67676
ANSM1A		OCT	03526
ANSM1L		OCT	12744
ANSM2A		OCT	03526	#1's compliment of answer
ANSM2L		OCT	52744 	#1's compliment of answer
DIVA		OCT	12345
DIVL		OCT	33400
DIVE		OCT	21212
ANSDA1		OCT	23271
ANSDL1		OCT	02506

AUGVAL		OCT	00011
AUGANS		OCT	00012
DIMANS		OCT	00011

SUVAL		OCT	00002
SUANS		OCT	00007

MSUVAL		OCT	35555
MSUAVAL		OCT	34444  # 1's compliment of A
MSUANS		OCT	05556

DCS1VAL		OCT	01234  # For these, the answer is the 1's complement of the results
DCS2VAL		OCT	00001

CONC+S1         OCTAL   25252 
CONC+S2         OCTAL   52400 
S+1             OCT     00001
