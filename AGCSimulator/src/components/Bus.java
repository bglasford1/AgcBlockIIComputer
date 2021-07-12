/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class defines a Bus structure.

  Mods:		  07/15/21 Initial Release.
*/

package components;

import enums.OverflowState;

public class Bus
{
  private int busValue = 0;

  public int read()
  {
    return busValue;
  }

  public void write(int value)
  {
    busValue = value;
  }

  public OverflowState testOverflow(int value)
  {
    if ((value & 0100000) == 1 && (value & 0040000) == 0)
      return OverflowState.NEG_OVF; // negative overflow
    else if ((value & 0100000) == 0 && (value & 0040000) == 1)
      return OverflowState.POS_OVF; // positive overflow
    else
      return OverflowState.NO_OVF;
  }
}
