/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This enumeration class defines the interrupts that are implemented
            in this simulation.  Note that there are many interrupts that are
            not implemented in this simulation due to missing hardware or
            simply to reduce the complexity.

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

package enums;

public enum RuptNumber
{
  NO_RUPT,  // No interrupt pending
  T6RUPT,   // TIME6 decremented to 0, used by digital autopilot (not implemented)
  T5RUPT,   // TIME5 overflow, used by the autopilot (not implemented)
  T3RUPT,   // TIME3 overflow, used by the task scheduler (WAITLIST)
  T4RUPT,   // TIME4 overflow, used for various DSKY tasks
  KEYRUPT1 // Keystroke received from Main DSKY
//  KEYRUPT2  // Keystroke received from Navigation DSKY
//  UPRUPT,   // Uplink word available in INLINK register
//  DOWNRUPT  // Downlink shift register ready for new data
}
