/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This enumeration class defines a bus line designation.  These are
            used when moving the contents of a bus or register by shifting bits.
            This makes it easy to visualize how the hardware needs to be wired.

  Mods:		  07/15/21 Initial Release.
*/

package enums;

/**
 *   The index into the array corresponds to the bit position in
 *   the register, where the first parameter (index = 0) is bit 16 of the register (msb)
 *   and the last parameter (index = 15) is register bit 1 (lsb). The value of
 *   the parameter identifies the bus line assigned to that register bit.
 */
public enum BusLineDesignation
{
  BX(0), // ignore
  B1(1),
  B2(2),
  B3(3),
  B4(4),
  B5(5),
  B6(6),
  B7(7),
  B8(8),
  B9(9),
  B10(10),
  B11(11),
  B12(12),
  B13(13),
  B14(14),
  US(15), // uncorrected sign (S1; overflow), except in register G
  SG(16), // sign (S2; one's compliment)
  SGM(15), // sign bit in memory
  D0(17); // force bit to zero

  private final int value;

  BusLineDesignation(int value)
  {
    this.value = value;
  }

  public int getValue()
  {
    return this.value;
  }
}
