/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This enumeration class defines the Op Codes along with their
            underlying values and human readable strings.  The values are octal.
            This is only used by the ControlPulseMatrix Decoder.
*/

package enums;

public enum Instruction
{
  // The code in the SQ register is the same as the op code for these four instructions.
  TC     (0000, "TC"),    // TC K    Transfer Control             1 MCT
  STD2   (0000, "STD2"),  // STD2 is only valid if stage = 2
  CCS    (0010, "CCS"),   // CCS K   Count, Compare, and Skip     2 MCT
  TCF2   (0012, "TCF2"),  //
  TCF4   (0014, "TCF4"),  //
  TCF6   (0016, "TCF6"),  //
  DAS    (0020, "DAS"),   //
  LXCH   (0022, "LXCH"),  //
  INCR   (0024, "INCR"),  //
  ADS    (0026, "ADS"),   //
  CA     (0030, "CA"),    //
  CS     (0040, "CS"),    // CS K    Clear and Subtract           2 MCT
  NDX    (0050, "INDEX"), // NDX K   Index                        2 MCT
  DXCH   (0052, "DXCH"),  //
  TS     (0054, "TS"),    // TS K    Transfer to Storage          2 MCT
  XCH    (0056, "XCH"),   // XCH K   Exchange                     2 MCT
  AD     (0060, "AD"),    // AD K    Add                          2 or 3 MCT
  MASK   (0070, "MASK"),  // MASK K  Bitwise AND                  2 MCT
  READ   (0100, "READ"),  //
  WRITE  (0101, "WRITE"), //
  RAND   (0102, "RAND"),  //
  WAND   (0103, "WAND"),  //
  ROR    (0104, "ROR"),   //
  WOR    (0105, "WOR"),   //
  RXOR   (0106, "RXOR"),  //
  EDRUPT (0107, "EDRUPT"),//
  DV     (0110, "DV"),    // DV K    Divide                      18 MCT
  BZF2   (0112, "BZF2"),  //
  BZF4   (0114, "BZF4"),  //
  BZF6   (0116, "BZF6"),  //
  MSU    (0120, "MSU"),   //
  QXCH   (0122, "QXCH"),  //
  AUG    (0124, "AUG"),   //
  DIM    (0126, "DIM"),   //
  DCA    (0130, "DCA"),   //
  DCS    (0140, "DCS"),   //
  NDXX   (0150, "NDXX"),  //
  SU     (0160, "SU"),    // SU K     Subtract                    4 or 5 MCT
  BZMF2  (0162, "BZMF2"), //
  BZMF4  (0164, "BZMF4"), //
  BZMF6  (0166, "BZMF6"), //
  MP     (0170, "MP"),    // MP K     Multiply                   10 MCT
  PINC   (0177, "PINC");  // Pseudo instruction.

  private final int value;
  private final String name;

  Instruction(int value, String name)
  {
    this.value = value;
    this.name = name;
  }

  public int getValue()
  {
    return this.value;
  }

  public String getName()
  {
    return name;
  }

  public static Instruction getInstruction(int value)
  {
    for (Instruction nextInstruction : Instruction.values())
    {
      if (value == nextInstruction.value)
        return nextInstruction;
    }
    throw new ArrayIndexOutOfBoundsException();
  }
}
