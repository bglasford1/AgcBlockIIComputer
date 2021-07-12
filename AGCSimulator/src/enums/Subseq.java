/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This enumeration class defines the sub-sequences.  Each
            sub-sequence has an assigned memory type which tells the
            software how to decode the address.
  Mods:		  07/15/21 Initial Release.
*/

package enums;

public enum Subseq
{
  NO_SEQ (MemoryType.NONE),     // 0
  STD2   (MemoryType.ALL),      // 1
  TC0    (MemoryType.ALL),      // 2
  CCS0   (MemoryType.ERASABLE), // 3
  TCF0   (MemoryType.FIXED),    // 4
  BZF0   (MemoryType.FIXED),    // 5
  BZMF0  (MemoryType.FIXED),    // 6
  CA0    (MemoryType.ALL),      // 7
  CS0    (MemoryType.ALL),      // 8
  DCA0   (MemoryType.ALL),      // 9
  DCA1   (MemoryType.ALL),      // 10
  DCS0   (MemoryType.ALL),      // 11
  DCS1   (MemoryType.ALL),      // 12
  TS0    (MemoryType.ERASABLE), // 13
  XCH0   (MemoryType.ERASABLE), // 14
  LXCH0  (MemoryType.ERASABLE), // 15
  QXCH0  (MemoryType.ERASABLE), // 16
  DXCH0  (MemoryType.ERASABLE), // 17
  DXCH1  (MemoryType.ERASABLE), // 18
  NDX0   (MemoryType.ERASABLE), // 19
  NDX1   (MemoryType.ERASABLE), // 20
  NDXX0  (MemoryType.ERASABLE), // 21
  NDXX1  (MemoryType.ERASABLE), // 22
  AD0    (MemoryType.ALL),      // 23
  SU0    (MemoryType.ERASABLE), // 24
  MP0    (MemoryType.ALL),      // 25
  MP1    (MemoryType.ALL),      // 26
  MP3    (MemoryType.ALL),      // 27
  DV0    (MemoryType.ERASABLE), // 28
  DV1    (MemoryType.ERASABLE), // 29
  DV3    (MemoryType.ERASABLE), // 30
  DV7    (MemoryType.ERASABLE), // 31
  DV6    (MemoryType.ERASABLE), // 32
  DV4    (MemoryType.ERASABLE), // 33
  ADS0   (MemoryType.ERASABLE), // 34
  DAS0   (MemoryType.ERASABLE), // 35
  DAS1   (MemoryType.ERASABLE), // 36
  INCR0  (MemoryType.ERASABLE), // 37
  AUG0   (MemoryType.ERASABLE), // 38
  DIM0   (MemoryType.ERASABLE), // 39
  MSU0   (MemoryType.ERASABLE), // 40
  MSK0   (MemoryType.ALL),      // 41
  READ0  (MemoryType.CHANNEL),  // 42
  WRITE0 (MemoryType.CHANNEL),  // 43
  RAND0  (MemoryType.CHANNEL),  // 44
  WAND0  (MemoryType.CHANNEL),  // 45
  ROR0   (MemoryType.CHANNEL),  // 46
  WOR0   (MemoryType.CHANNEL),  // 47
  RXOR0  (MemoryType.CHANNEL),  // 48
  RSM3   (MemoryType.ERASABLE), // 49
  RUPT0  (MemoryType.ERASABLE), // 50
  RUPT1  (MemoryType.ERASABLE), // 51
  GOJ1   (MemoryType.ALL),      // 52
  PINC   (MemoryType.NONE);     // 53

  private final MemoryType value;

  Subseq(MemoryType value)
  {
    this.value = value;
  }

  public MemoryType getMemoryType()
  {
    return this.value;
  }

  public static Subseq getSubseq(int ordinal)
  {
    for (Subseq nextSubseq : Subseq.values())
    {
      if (nextSubseq.ordinal() == ordinal)
        return nextSubseq;
    }
    throw new IllegalArgumentException("Subseq not found.");
  }
}
