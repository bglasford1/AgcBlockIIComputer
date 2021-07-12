/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This enumeration class defines the counters for this implementation.
            Note that not all of the AGC counters have been implemented
            because much of the external hardware has not been simulated.
            The underlying value of these enumerations are used as indexes
            into the priority cell.

  Mods:		  07/15/21 Initial Release.
*/

package enums;

public enum CtrNumber
{
  TIME2,  // Block II puts TIME2 first
  TIME1,
  TIME3,
  TIME4
}
