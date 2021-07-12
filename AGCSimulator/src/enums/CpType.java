/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This enumeration class defines the control pulses and their
            underlying numeric values, both from the control pulse matrix
            and internally generated.

  Mods:		  07/15/21 Initial Release.
*/

package enums;

public enum CpType
{
    NO_PULSE(0),

    // OUTPUTS FROM SUBSYSTEM A
    A2X    (1), // Copy A to X direct
    B15X   (2), // Set X15 bit
    CI     (3), // Carry In
    CLXC   (4), // Clear X reg if BR1=0
    DVST   (5), // Divide Staging
    EXT    (6), // Enter 1 in EXT bit of SQ register
    G2LS   (7), // G to L reg
    KRPT   (8), // Knock down RUPT priority
    L16    (9), // Set X16 bit
    L2GD   (10),// Copy L to G direct
    MONEX  (11),// Set X bits to 1, zero bit 1
    NEACOF (12),// Permit end around carry
    NEACON (13),// Inhibit end around carry
    NISQ   (14),// Load next instruction into SQ
    PIFL   (15),// Block writing into Y1 on WYD
    PONEX  (16),// Clear X reg and set bit 1
    PTWOX  (17),// Clear X reg and set bit 2
    R15    (18),// Octal 015 to write bus
    R1C    (19),// 1's compliment of 1 to write bus
    R6     (20),// Octal 6 to write bus
    RA     (21),// Read A reg
    RAD    (22),// Read address of next instruction
    RB     (23),// Read B
    RB1    (24),// Octal 1 to write bus
    RB1F   (25),// Octal 1 to write bus if BR1=1
    RB2    (26),// Octal 2 to Write bus
    RBBK   (27),// Read BB reg
    RC     (28),// Read C reg
    RCH    (29),// Read channel addressed by S
    RG     (30),// Read G
    RL     (31),// Read L
    RL10BB (32),// Read 10 bits of B
    RQ     (33),// Read Q
    RRPA   (34),// Read address of highest priority interrupt
    RSC    (35),// Read central register addressed by S
    RSCT   (36),// Read address of highest priority counter
    RSTRT  (37),// Octal 04000 to write bus
    RSTSTG (38),// Reset stage counter
    RU     (39),// Read U
    RUS    (40),// Read U with sign
    RZ     (41),// Read Z
    ST1    (42),// Set Stage 1
    ST2    (43),// Set Stage 2
    STAGE  (44),// Execute next instruction based on Stage
    TL15   (45),// Copy L15 to BR1
    TMZ    (46),// Test for -0
    TOV    (47),// Test for overflow
    TPZG   (48),// Test G for +0
    TRSM   (49),// Test for RESUME instruction
    TSGN   (50),// Test sign
    TSGN2  (51),// Test sign 2
    TSGU   (52),// Test sign of U reg.
    U2BBK  (53),// Copy U to BB reg.
    WA     (54),// Write to A reg.
    WALS   (55),// Write to A and L
    WB     (56),// Write to B
    WCH    (57),// Write to Channel
    WG     (58),// Write to G
    WL     (59),// Write to L
    WOVR   (60),// Test for overflow
    WQ     (61),// Write to Q
    WS     (62),// Write to S
    WSC    (63),// Write to Central Registers
    WSQ    (64),// Write to SQ
    WY     (65),// Write to Y
    WY12   (66),// Write to Y
    WYD    (67),// Write to Y shifted
    WZ     (68),// Write to Z
    Z15    (69),// Set bit 15 of Z
    Z16    (70),// Set bit 16 of Z
    ZAP    (71),// Generate RU, G2LS & WALS pulses
    ZIP    (72),// Gererate A2X, L2GD and other pulses

    // EXTERNAL OUTPUTS FROM SUBSYSTEM B
    RA0   (73),// Read register at address 0 (A)
    RA1   (74),// Read register at address 1 (L)
    RA2   (75),// Read register at address 2 (Q)
    RA3   (76),// Read register at address 3 (EB)
    RA4   (77),// Read register at address 4 (FB)
    RA5   (78),// Read register at address 5 (Z)
    RA6   (79),// Read register at address 6 (BB)
    WA0   (89),// Write register at address 0 (A)
    WA1   (90),// Write register at address 1 (L)
    WA2   (91),// Write register at address 2 (Q)
    WA3   (92),// Write register at address 3 (EB)
    WA4   (93),// Write register at address 4 (FB)
    WA5   (94),// Write register at address 5 (Z)
    WA6   (95),// Write register at address 6 (BB)
    W20   (102),// Write into CYR
    W21   (103),// Write into SR
    W22   (104),// Write into CYL
    W23   (105),// Write into EDOP

    // Misc pulses
    GENRST (106),// General Reset**
    RELINT (107),// RELINT instruction
    CLISQ  (108),// Clear SNI**
    CLRP   (109),// Clear RPCELL**
    INHINT (110),// INHINT instruction
    EXTEND (111),// EXTEND instruction
    RESUME (112),// Set for resume
    RPT    (113),// Read RUPT opcode **
    SBWG   (114),// Write G from memory
    MCRO   (115),// Used in Mutliply
    INTR   (116),// Setup to run RUPT0
    WE     (117),// Write E-MEM from G
    WTS    (118),// Move Temp S register to S register.
    WPCTR  (119),// Write PCTR (latch priority counter sequence)**
    WC1    (120),// Write to the L register from the channel bus
    WC2    (121),// Write to the Q register from the channel bus
    WC5    (122),// Write to various hardware devices.
    WC6    (123),// Write to various hardware devices.
    WC7    (124),// Write the Superbit from the channel bus
    WC10   (125),// Write to the DSKY display
    WC11   (126),// Write to the DSKY indicator lights
    WC12   (127),// Write to various hardware devices.
    WC13   (128),// Write to various hardware devices.
    WC14   (129),// Write to various hardware devices.
    WC77   (130),// Write the failure codes.
    RC1    (131),// Read the L register onto channel bus
    RC2    (132),// Read the Q register onto channel bus
    RC3    (133),// Read the high order time scalar onto channel bus
    RC4    (134),// Read the low order time scalar onto channel bus
    RC7    (135),// Read the superbit onto the channel bus
    RC15   (136),// Read the main keyboard
    RC30   (137),// Read various hardware devices.
    RC31   (138),// Read various hardware devices.
    RC32   (139),// Read various hardware devices.
    RC33   (140),// Read various hardware devices.
    DCDSUB (141),// Decode the sub-sequence.
    PINC   (142);// Run PINC.

  private final int value;

  CpType(int value)
  {
    this.value = value;
  }

  public int getValue()
  {
    return this.value;
  }
}
