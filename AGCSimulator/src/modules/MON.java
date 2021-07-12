/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the Monitor module.  This contains switches
            that control the debugging of the hardware.

  Mods:		  07/15/21 Initial Release.
*/

package modules;

public class MON
{
  public boolean PURST = true;    // power up reset: 0 = enabled, 1 = disabled
  public boolean RUN = false;     // run/step switch
  public boolean STEP = false;    // single step switch
  public boolean INST = false;    // instruction/sequence step select switch
  public boolean FCLK = false;    // clock mode
  public boolean PROG = false;    // "standby allowed" SW; 0=NO (full power), 1=YES (low power)
  public boolean SCL_ENAB = true; // "scaler enabled" SW; 0=NO (scaler halted), 1=YES (scaler running)
  public boolean ruptBreakpointEnabled = false;    // Used to set an interrupt breakpoint.
  public boolean counterBreakpointEnabled = false; // Used to set a counter breakpoint.
  public boolean breakpointEnabled = false;        // Whether or not a debug breakpoint is set.
  public int breakpointAddress = 0;                // The address of the breakpoint.
  public boolean displayDetails = false; // DO NOT IMPLIMENT in H/W
}
