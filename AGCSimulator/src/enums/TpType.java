/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This enumeration class defines the states of the Timing Pulse
            Generator state machine.  Note that some pulses have been added
            to aid the debugging of the simulation.

  Mods:		  07/15/21 Initial Release.
*/

package enums;

public enum TpType
{
  STBY,
  PWRON,
  TP1,  // TIME PULSE 1: start of memory cycle time (MCT)
  TP2,
  TP3,
  TP4,
  TP5,
  TP6,  // EMEM is available in G register by TP6
  TP7,  // FMEM is available in G register by TP7
  TP8,
  TP9,
  TP10, // G register written to memory beginning at TP10
  TP11, // TIME PULSE 11: end of memory cycle time (MCT)
  TP12, // select new subsequence/select new instruction
  SRLSE, // step switch release
  WAIT
}
